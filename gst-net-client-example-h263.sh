#!/bin/sh

# h263pdepay is very picky about the application/x-rtp string
#   (but 1998 vs 2000 is not a big deal)
# avdec_h263 is picky about format, again

gst-launch-1.0 \
	udpsrc port=5000 !\
	application/x-rtp,clock-rate=90000,encoding-name="H263-2000" !\
		rtph263pdepay !\
		avdec_h263  !\
		autovideosink

# not needed any more:
# output of avdec
# ! video/x-raw,format=I420 !\
# input to osxvideosink
# videoconvert ! video/x-raw,format=UYVY !\

