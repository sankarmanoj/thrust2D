#include <libavcodec/avcodec.h>
#include <libavformat/avformat.h>
#include <libavfilter/avfiltergraph.h>
#include <libavfilter/buffersink.h>
#include <libavfilter/buffersrc.h>
#include <libavutil/opt.h>
#include <libavutil/pixdesc.h>
#include <libavutil/frame.h>

AVFormatContext *ifmt_ctx;
AVFormatContext *ofmt_ctx;
extern int open_input_file(const char *filename);
extern int open_output_file(const char *filename);
