#!/bin/bash


dir="/media/vivek/NIKON D5300/DCIM/100D5300/"

if [[ $# -eq 1 ]]; then
	dir=$1
fi

# check empty
[[ -z "${dir// }" ]] && exit 1

pushd "$dir" || exit 1


for filename in *.NEF; do
	# echo $filename

	# regex='^DSC_[[:digit:]]+\.NEF$'

	# [[ $filename =~ $regex ]] || continue
	
	val1=`exiv2 -K Exif.Photo.DateTimeOriginal -pt $filename | awk '{$1=$1};1' | egrep -o '[[:digit:]]{4}:[[:digit:]]{2}:[[:digit:]]{2}' | tr ':' '-'`
	
	newfname=`echo $filename | sed "s/^\(DSC_[0-9]\+\)\.NEF$/\1-$val1.NEF/"`

	[[ $filename == $newfname ]] && continue

	# echo $val1
	# filename1=`echo $filename | cut -d '.' -f 1`
	# new_filename="$filename1-$val1.NEF"
	# echo $new_filename
	mv $filename $newfname
done

popd
