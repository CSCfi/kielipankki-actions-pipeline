#!/bin/bash

if [ $# -ne 2 ]
then
  echo "Usage: batch-convert.sh input/directory output/dir"
  exit 1
fi

original_dir=`pwd`
source_dir=$1
destination_dir=$2

# We need to `cd` or the relative paths in the md files won't work
cd $source_dir

for mdfile in *.md; do
	convert.py --self-contained $mdfile
done

# This allows using relative path for the output directory
cd $original_dir
for htmlfile in $source_dir/*.html; do
	mv $htmlfile $destination_dir/
done
