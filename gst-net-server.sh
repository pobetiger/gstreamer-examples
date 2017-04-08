#!/bin/sh
# demo mentions not using sync but it makes output jitter

#vid_src="videotestsrc pattern=$1"
vid_src="v4l2src device=/dev/video0"
audio_src="alsasrc device=hw:1,0"
audio_enc="avenc_mp2 ! rtpmpapay pt=96"

gst-launch-1.0 \
	${vid_src} !\
		omxh264enc ! rtph264pay pt=96 !\
		queue !\
		udpsink host=192.168.2.124 port=5000 \
	${audio_src} !\
		decodebin ! audioconvert !\
		${audio_enc} !\
		queue ! application/x-rtp !\
		udpsink host=192.168.2.124 port=5001 \




## switched to omxh264enc, cpu @ ~60-70%
## using libav (cpu @ ~100%) 
#		videoconvert ! video/x-raw,format=I420 !\
#		avenc_h263 ! video/x-h263 !\

# taken off from tutorial
#sync=false

