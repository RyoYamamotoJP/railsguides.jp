#!/bin/sh

set -ex

# Update HTMLs using 'archive.zip' downloaded by GTT

if [ -n "$GTT_DOWNLOADER" ]; then
    bundle exec gtt-downloader
fi
bundle exec ruby allocate.rb
bundle exec ruby replacer.rb
rm -rf output/ja
bundle exec rake guides:generate:html GUIDES_LANGUAGE=ja --trace
cp ./source/ja/favicon.ico ./output/ja
cp ./source/ja/404.html    ./output/ja
cp ./source/ja/humans.txt  ./output/ja

# Then, manually type these commands:
#   $ git add .
#   $ git commit -m "Publish foo bar"
#   $ git push origin japanese
#   $ git push heroku japanese:master
