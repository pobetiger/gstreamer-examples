#!/bin/sh

# demonstrates how to split a stream into two using a tee and do some 
# simple ops on the video
gst-launch-1.0 videotestsrc ! tee name=t \
	t. ! queue ! videoscale ! video/x-raw,width=640,height=480 !\
		videoconvert ! autovideosink \
	t. ! queue ! videoscale ! video/x-raw,width=320,height=240 !\
		videoconvert ! autovideosink
	
