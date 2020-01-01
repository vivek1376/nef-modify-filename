#!/bin/bash

# set -x
echo $#

dir="/media/vivek/NIKON D5300/DCIM/100D5300/"

pushd "$dir"

for filename in *.NEF; do
	# echo $filename

	# val1=`exiv2 -K Exif.Photo.DateTimeOriginal -pt $filename | awk '{$1=$1};1' | egrep -o '[[:digit:]]{4}:[[:digit:]]{2}:[[:digit:]]{2}' | tr ':' '-'`
	
	# echo $val1
	# filename1=`echo $filename | cut -d '.' -f 1`
	# new_filename="$filename1-$val1.NEF"
	# echo $new_filename
	# mv $filename $new_filename

	fname=${filename:0:8}

	mv $filename "$fname.NEF"

done

popd
