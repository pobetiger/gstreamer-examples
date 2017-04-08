#!/bin/sh


gst-launch-1.0 \
	udpsrc port=5000 !\
	application/x-rtp,clock-rate=90000 !\
		queue !\
		rtph264depay ! avdec_h264 ! autovideosink \
	udpsrc port=5001 !\
	application/x-rtp,pt=96,clock-rate=90000,encoding-name=MPA !\
		queue !\
		rtpmpadepay ! audio/mpeg,mpegversion=1,layer=2 ! avdec_mp2float !\
			audioconvert ! decodebin ! autoaudiosink 



# not needed any more:
# output of avdec
# ! video/x-raw,format=I420 !\
# input to osxvideosink
# videoconvert ! video/x-raw,format=UYVY !\


