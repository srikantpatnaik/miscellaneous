#!/bin/bash

# sudo apt-get install libavcodec-extra-53 ffmpeg ffmpeg2theora

# first convert ogv to avi to extract audio
#ffmpeg -i Ubuntu-Desktop-Bengali.ogv -vcodec mpeg4 -sameq -acodec libmp3lame B.avi

# extract audio as mp3 from avi file
#mplayer -dumpaudio -dumpfile B.mp3 B.avi

#ffmpeg -y -i Ubuntu-Desktop-Bengali.ogv -vcodec copy B.mkv

#reduce the size of original audio file by restricting it to mono and bitrate
ffmpeg -i Ubuntu-Desktop-Telugu.ogv -y -b 14k -ac 1 -ar 11500 T.mp3
ffmpeg -i Ubuntu-Desktop-Bengali.ogv -y -b 14k -ac 1 -ar 11500 B.mp3  #or use below one to convert to ogg
ffmpeg -i Ubuntu-Desktop-Telugu.ogv -y -b 12k -ac 1 -ar 11500 -vn -acodec libvorbis T.ogg

#ffmpeg -y -i B.mkv -i B.mp3 -i T.mp3 -map 0.0 -map 1.0 -map 2.0 -b 200k -vcodec copy -acodec copy out.mkv -newaudio

 mkvmerge -o "linux-all-lang.ogv" -A Ubuntu-Desktop-English.ogv E.mp3 B.mp3 T.mp3 G.mp3 K.mp3 MM.mp3 M.mp3 U.mp3

#convert ogv to webm, and reduce size upto 50%, reduce audio channel and others
ffmpeg -y -i  Ubuntu-Desktop-English.ogv -acodec libvorbis -ac 1 -ar 11500 output.webm

# Convert mov to ogv 
ffmpeg -y -i intro-R-final.mov -b 20k -acodec libvorbis -ac 1 -ar 11500 -ab 12k output.ogv
