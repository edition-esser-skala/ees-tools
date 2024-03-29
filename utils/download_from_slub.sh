#!/bin/bash

if [ $# -eq 0 ]; then
  echo "usage:"
  echo "\$1 = SLUB ID"
  echo "\$2 = last page"
  echo ""
  echo "example:"
  echo "download_from_slub.sh sona-mu_314970908 16"
  exit 0
fi

img_url_left="https://digital.slub-dresden.de/data/kitodo/$1/$1_tif/jpegs/"
img_url_right=".tif.original.jpg"

for page in $(seq 1 $2); do
  img_url_page=`printf %8s $page | tr " " 0`
  wget --output-document $img_url_page.jpg "$img_url_left$img_url_page$img_url_right"
done

