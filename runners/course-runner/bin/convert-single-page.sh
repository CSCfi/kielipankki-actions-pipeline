#!/bin/bash

if [ $# -lt 2 ]
then
  echo "Usage: convert-single-page.sh file.md output/file.html [http://homepage.link]"
  exit 1
fi

source_file=$1
destination_file=$2

if [ $# -eq 3 ]
then
  pandoc --template=GitHub.html5 --self-contained $source_file -o $destination_file -V homepage-link:$3
else
  pandoc --template=GitHub.html5 --self-contained $source_file -o $destination_file
fi
