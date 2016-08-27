// includes, system
extern "C"
{
#include "ffmpeg.h"
}
#include <stdio.h>
#include <stdlib.h>
#include "primary.h"

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
  float lambda, q0sqr, sum, sum2,meanROI,varROI,threshold;
	int ret;
	AVPacket packet;
	AVFrame *frame = NULL;
	enum AVMediaType type;
	unsigned int stream_index;
	unsigned int i;
	int got_frame;
	int (*dec_func)(AVCodecContext *, AVFrame *, int *, const AVPacket *);

	char *in,*out;

	if (argc == 7)
	{
		threshold = atof(argv[1]);
		lambda = atof(argv[2]); //Lambda value
		niter = atoi(argv[3]); //number of iterations
		nErode = atoi(argv[4]);
		in = argv[5];
		out = argv[6];
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
			type = ifmt_ctx->streams[packet.stream_index]->codec->codec_type;
			rows = ifmt_ctx->streams[packet.stream_index]->codec->height;
			cols = ifmt_ctx->streams[packet.stream_index]->codec->width;


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
					printf("Key Frame = %d\n",frame->key_frame);


					//MAIN CALCULATION
					int *temp = (int *) malloc(size_I * sizeof(int));
					for (int i = 0; i<size_I; i++)
						temp[i] = frame->data[0][i];

					frame_calculate(temp,rows,cols,niter,nErode,threshold,lambda);


					for (int i = 0; i<size_I; i++)
						frame->data[0][i] = 255;



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
