#!/bin/bash

set -e

if [ -d target/doc ]; then
	rm -r target/doc
fi

cargo doc --no-deps
git checkout gh-pages
rm -rv *.woff *.svg *.js *.txt *.css src/ubend implementors ubend
cp -r target/doc/* .
git add ubend src/ubend implementors
git commit -a -m "updated documentation"
git push
