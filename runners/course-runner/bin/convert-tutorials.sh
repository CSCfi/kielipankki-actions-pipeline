#!/bin/bash

if [ $# -ne 2 ]
then
  echo "Usage: convert-tutorials.sh input/directory output/dir"
  exit 1
fi

original_dir=`pwd`
source_dir=$1
destination_dir=$2

# We need to `cd` or the relative paths in the md files won't work
cd $source_dir

for mdfile in *.md; do
  ~/convert-single-page.sh $mdfile $original_dir/$destination_dir/"${mdfile%.md}.html"
done

