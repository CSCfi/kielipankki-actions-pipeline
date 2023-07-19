#!/bin/bash

if [ $# -ne 2 ]
then
  echo "Usage: convert-single-page.sh file.md output/file.html"
  exit 1
fi

source_file=$1
destination_file=$2

pandoc --template=GitHub.html5 --self-contained $source_file -o $destination_file
