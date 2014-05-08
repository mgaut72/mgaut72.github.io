#! /bin/bash

# from the root of this repo, (ie. the folder containing _drafts)
# call ./publish _drafts/blog.md
# this will result in the blog being published with today's date

name=$(basename "$1")
date=$(date +%F)
mv "$1" "_posts/$date-$name"
