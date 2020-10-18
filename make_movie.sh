#!/bin/sh

x=1

for i in $(ls -r -t ./images/*png); do
  counter=$(printf %03d $x)
  ln -s ../"$i" ./tmp/img"$counter".png
  x=$(($x+1))
done

FRAME_RATE=0.5
VIDEO_FILENAME=timelapse_`date +%s`.mov

# compile video
ffmpeg -r $FRAME_RATE -i ./tmp/img%03d.png -b 15000k $VIDEO_FILENAME

# compress video
HandBrakeCLI -i $VIDEO_FILENAME -o $VIDEO_FILENAME.mkv
