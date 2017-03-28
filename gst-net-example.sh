#!/bin/sh
# the libav encoder only takes raw,I420
# doesn't really matter how the h263p payload is build 97,127, no matter
# demo mentions not using sync but it makes output jitter

#src="filesrc location=original.webm ! matroskademux name=d d.video_0 ! video/x-vp8"
src="videotestsrc pattern=$1"

gst-launch-1.0 \
	${src} !\
		videoconvert ! video/x-raw,format=I420 !\
		avenc_h263 ! video/x-h263 !\
	   	rtph263ppay pt=96 !\
		udpsink host=192.168.2.124 port=5000

#sync=false

