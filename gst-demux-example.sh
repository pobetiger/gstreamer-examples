#!/bin/sh

# combining tutorial: https://gstreamer.freedesktop.org/documentation/tutorials/basic/gstreamer-tools.html
# and
# discussion thread: http://gstreamer-devel.966125.n4.nabble.com/Good-example-to-show-usage-of-tee-td4656821.html

#src="souphttpsrc location=https://www.freedesktop.org/software/gstreamer-sdk/data/media/sintel_trailer-480p.webm"
# local cached copy
src="filesrc location=original.webm"

# had to combine the tee-example
#   Using a queue to split the demux into 2 threads
#   also choose specific pads from the demuxer
#   also note that we are using cap filters to tell the muxer which pad we want
gst-launch-1.0 \
	${src} !\
	matroskademux name=d \
   		 d.video_0 ! queue ! video/x-vp8 ! matroskamux ! filesink location=sintel.mkv \
   		 d.audio_0 ! queue ! audio/x-vorbis ! matroskamux ! filesink location=sintel.mka




