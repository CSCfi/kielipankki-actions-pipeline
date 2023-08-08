#!/bin/bash

if [ $# -ne 3 ]
then
  echo "Usage: convert-tutorials.sh input/directory output/dir https://homepage.link"
  exit 1
fi

original_dir=`pwd`
source_dir=$1
destination_dir=$2
homepage_link=$3

# We need to `cd` or the relative paths in the md files won't work
cd $source_dir

for mdfile in *.md; do
  ~/convert-single-page.sh $mdfile $original_dir/$destination_dir/"${mdfile%.md}.html" $homepage_link
done
