// includes, system
#include <stdio.h>
#include <thrust/device_vector.h>
#include <thrust/transform.h>
#include <thrust/sequence.h>
#include <thrust/copy.h>
#include <thrust/fill.h>
#include <thrust/replace.h>
#include <thrust/functional.h>
#include <thrust/window_2d.h>
#include <stdlib.h>
// includes, kernels
#include "srad_kernel.cu"

extern "C" {
#include "ffmpeg.c"
}

int runTest( int argc, char** argv);
void usage(int argc, char **argv)
{
	fprintf(stderr, "Usage: %s <frames> <lambda> <niter> <in video> <out video>\n", argv[0]);
	exit(1);
}

////////////////////////////////////////////////////////////////////////////////
// Program main
////////////////////////////////////////////////////////////////////////////////
int
main( int argc, char** argv)
{
	time_t t;
	srand((unsigned) time(&t));

  runTest( argc, argv);
  return EXIT_SUCCESS;
}


int runTest( int argc, char** argv)
{
  unsigned int rows, cols, size_I, size_R, niter = 10, iter,nErode;
  float lambda, q0sqr, sum, sum2,meanROI,varROI,threshold,maxThreshold ;
	unsigned int r1, r2, c1, c2;
	int ret;
	AVPacket packet;
	AVFrame *frame = NULL;
	enum AVMediaType type;
	unsigned int stream_index;
	unsigned int i;
	int got_frame;
	int (*dec_func)(AVCodecContext *, AVFrame *, int *, const AVPacket *);

	char *in,*out;

	if (argc == 8)
	{
		threshold = atof(argv[1]);
		maxThreshold = atof(argv[2]);
		lambda = atof(argv[3]); //Lambda value
		niter = atoi(argv[4]); //number of iterations
		nErode = atoi(argv[5]);
		in = argv[6];
		out = argv[7];
	}
  else
	{
		usage(argc, argv);
  }

	printf(" %s Threshold = %f \n",argv[1],threshold);
	av_register_all();
	ret = open_input_file(in);
	printf("Input File Opened\n");
	ret = open_output_file(out);
	printf("Output File Opened - %d\n",ret);
	/* read all packets */
	while (1) {
			printf("Beginning of Loop\n");
			if ((ret = av_read_frame(ifmt_ctx, &packet)) < 0)
					break;
			stream_index = packet.stream_index;
			printf("Stream Index =%d",stream_index);
			type = ifmt_ctx->streams[packet.stream_index]->codec->codec_type;
			rows = ifmt_ctx->streams[packet.stream_index]->codec->height;
			cols = ifmt_ctx->streams[packet.stream_index]->codec->width;
			r1 = 0;
			r2 = rows - 1;
			c1 = 0;
			c2 = cols - 1;

			size_R = (r2-r1+1)*(c2-c1+1);

			size_I = cols * rows;
			av_log(NULL, AV_LOG_DEBUG, "Demuxer gave frame of stream_index %u\n",stream_index);
			frame = av_frame_alloc();
			if (!frame) {
					ret = AVERROR(ENOMEM);
					break;
			}
			ifmt_ctx->streams[stream_index]->codec->refcounted_frames = 1;
			av_packet_rescale_ts(&packet,ifmt_ctx->streams[stream_index]->time_base,ifmt_ctx->streams[stream_index]->codec->time_base);
			dec_func = avcodec_decode_video2;
			ret = dec_func(ifmt_ctx->streams[stream_index]->codec, frame,&got_frame, &packet);
			printf(" Got Frame = %d\n",got_frame);
			ret = av_frame_make_writable (frame);
			if (ret < 0) {
					// av_frame_free(&frame);
					av_log(NULL, AV_LOG_ERROR, "Decoding failed - Make Writable\n");
					break;
			}
			if (got_frame) {
					frame->pts = av_frame_get_best_effort_timestamp(frame);
					AVPixelFormat tempFormat = (AVPixelFormat)frame->format;
					const AVPixFmtDescriptor *x =  av_pix_fmt_desc_get(tempFormat);
					printf("Pixel Format = %s\n",av_pix_fmt_desc_get(tempFormat)->name);
					thrust::block_2d<int> J_cuda (cols,rows);
					thrust::block_2d<float> J_square(cols,rows);
					thrust::block_2d<float> d_c(cols,rows);
					thrust::block_2d<float> J_floatcuda(cols,rows);
					thrust::fill(d_c.begin(),d_c.end(),0.0f);
					J_cuda.assign(&frame->data[0][0],&frame->data[0][size_I]);
					thrust::transform(J_cuda.begin(),J_cuda.end(),J_floatcuda.begin(),extractFunctor());





					printf("Start the SRAD main loop\n");
						for (iter=0; iter< niter; iter++)
					{
						thrust::copy(J_floatcuda.begin(),J_floatcuda.end(),J_square.begin());
						thrust::for_each(J_square.begin(),J_square.end(),square());
						sum = thrust::reduce(J_floatcuda.begin(),J_floatcuda.end());
						sum2 = thrust::reduce(J_square.begin(),J_square.end());
					  meanROI = sum / size_R;
					  varROI  = (sum2 / size_R) - meanROI*meanROI;
					  q0sqr   = varROI / (meanROI*meanROI);
						SRADFunctor1 functor1(cols,rows,q0sqr);
						SRADFunctor2 functor2(cols,rows,lambda,q0sqr);
						thrust::window_vector<float> wv = thrust::window_vector<float>(&(J_floatcuda),3,3,1,1);
						thrust::window_vector<float> d_cwv = thrust::window_vector<float>(&(d_c),3,3,1,1);
						thrust::transform(wv.begin(),wv.end(),d_cwv.begin(),J_square.begin(),functor1);
						thrust::transform(wv.begin(),wv.end(),d_cwv.begin(),J_square.begin(),functor2);
					}
					printf("Binarize\n");
					thrust::transform(J_floatcuda.begin(),J_floatcuda.end(),J_cuda.begin(),binarizeFunctor(threshold,maxThreshold));
					printf("Erode And Dilate\n");
					thrust::window_vector<int> erodeInputWindow = thrust::window_vector<int>(&(J_cuda),3,3,1,1);
					for(int erodeTimes = 0; erodeTimes < nErode ; erodeTimes++)
					{
						//Erode
							thrust::for_each(erodeInputWindow.begin(),erodeInputWindow.end(),erodeFunctor());
							thrust::for_each(erodeInputWindow.begin(),erodeInputWindow.end(),dilateFunctor());
					}
					for(int erodeTimes = 0; erodeTimes < nErode ; erodeTimes++)
					{
						//Erode
							thrust::for_each(erodeInputWindow.begin(),erodeInputWindow.end(),erodeFunctor());
					}
					for(int erodeTimes = 0; erodeTimes < nErode ; erodeTimes++)
					{
						//Dilate
							thrust::for_each(erodeInputWindow.begin(),erodeInputWindow.end(),dilateFunctor());
					}

					printf("Computation Done\n");
					thrust::for_each(J_cuda.begin(),J_cuda.end(),compressFunctor());
					int *temp = (int *) malloc(size_I * sizeof(int));
					cudaMemcpy(temp,thrust::raw_pointer_cast(J_cuda.data()),size_I*sizeof(int),cudaMemcpyDeviceToHost);
					for (int i = 0; i<size_I; i++)
						frame->data[0][i] = temp[i];
					AVPacket enc_pkt;
			    int (*enc_func)(AVCodecContext *, AVPacket *, const AVFrame *, int *) =
			        (ifmt_ctx->streams[stream_index]->codec->codec_type ==
			         AVMEDIA_TYPE_VIDEO) ? avcodec_encode_video2 : avcodec_encode_audio2;
			    // av_log(NULL, AV_LOG_INFO, "Encoding frame\n");
			    /* encode filtered frame */
			    enc_pkt.data = NULL;
			    enc_pkt.size = 0;
			    av_init_packet(&enc_pkt);
			    ret = enc_func(ofmt_ctx->streams[stream_index]->codec, &enc_pkt,
			            frame, &got_frame);
			    av_frame_free(&frame);

			    if (ret < 0)
			        return ret;
			    if (!(got_frame))
			        return 0;
			    /* prepare packet for muxing */
			    enc_pkt.stream_index = stream_index;
			    av_packet_rescale_ts(&enc_pkt,
			                         ofmt_ctx->streams[stream_index]->codec->time_base,
			                         ofmt_ctx->streams[stream_index]->time_base);
			    // av_log(NULL, AV_LOG_DEBUG, "Muxing frame\n");
			    /* mux encoded frame */
					ret = av_write_frame(ofmt_ctx, &enc_pkt);

			}
			av_frame_unref(frame);
	}
	av_write_trailer(ofmt_ctx);

	av_packet_unref(&packet);
	av_frame_free(&frame);
	for (i = 0; i < ifmt_ctx->nb_streams; i++) {
			avcodec_close(ifmt_ctx->streams[i]->codec);
			if (ofmt_ctx && ofmt_ctx->nb_streams > i && ofmt_ctx->streams[i] && ofmt_ctx->streams[i]->codec)
					avcodec_close(ofmt_ctx->streams[i]->codec);
	}
	avformat_close_input(&ifmt_ctx);
	if (ofmt_ctx && !(ofmt_ctx->oformat->flags & AVFMT_NOFILE))
			avio_closep(&ofmt_ctx->pb);
	avformat_free_context(ofmt_ctx);
	return 0;

}
