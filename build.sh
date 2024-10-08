#!/bin/bash

# based on https://discourse.gohugo.io/t/using-dart-sass-hugo-and-netlify/37099/7
# - thanks, @bep!

echo "Install Dart Sass Embedded..."

# This should be in the PATH.
BIN_DIR=/opt/buildhome/.binrc/bin

DARTSASS_VERSION=1.63.4

mkdir -p $BIN_DIR

curl -LJO https://github.com/sass/dart-sass/releases/download/${DARTSASS_VERSION}/dart-sass-${{DARTSASS_VERSION }}-linux-x64.tar.gz

tar -xvf dart-sass-${DARTSASS_VERSION}-linux-x64.tar.gz;

mv dart-sass $BIN_DIR

rm -rf dart-sass*;

sass --embedded --version

echo "Building..."

hugo --gc --minify -b $CF_PAGES_URL