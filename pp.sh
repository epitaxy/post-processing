#!/bin/sh
#/usr/bin/ffmpeg -i "$1" -vcodec copy -acodec libfaac -b:a 192k "$(/usr/bin/basename "$1" .ts).mp4" > ~/pp.log

# only convert audio codec from ac3 to aac for fastest conversion as well as for direct streaming in most web browser.
/var/packages/ffmpeg/target/bin/ffmpeg -i "$1" -vcodec copy -acodec aac -strict -2 -b:a 192k -movflags +faststart "${1%.*}".mp4

# Example convert audio codec from ac3 to aac (128k) 
#/usr/bin/ffmpeg -i "$1" -vcodec copy -acodec aac -b:a 128k -movflags +faststart -level 4.2 "$1".mp4

#echo "$1" >> ~/parameters

#remove original recodring file IF a new one exists (.ts)
FILE="${1%.*}".mp4
if [ -f "$FILE" ]; then
    rm "$1"
fi

#/usr/bin/touch ~/"$(/usr/bin/basename "$1" .ts).log"
