#!/bin/bash

#Setup an ES6 project

echo "Building basic structure ..."
mkdir build css js
cd js
js main
cd ../css
css style
cd ../
touch README.md
html index -e
echo "Adding NPM base ..."
npm init
echo "Setting up Babel"
setupBabel
echo "Setting up Webpack"
setupWebpack
echo "Done"