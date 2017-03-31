#!/bin/bash

npm install babel-loader webpack --save-dev
echo "var path = require('path');\nvar webpack = require('webpack');\n\nmodule.exports = {\n\tentry: './js/main.js',\n\toutput: {\n\t\tpath: path.resolve(__dirname, 'build'),\n\t\tfilename: 'main.bundle.js'\n\t},\n\tmodule: {\n\t\tloaders: [\n\t\t\t{\n\t\t\t\ttest: /\.js$/,\n\t\t\t\tloader: 'babel-loader',\n\t\t\t\tquery: {\n\t\t\t\t\tpresets: ['es2015']\n\t\t\t\t}\n\t\t\t}\n\t\t]\n\t},\n\tstats: {\n\t\tcolors: true\n\t},\n\tdevtool: 'source-map'\n};" > webpack.config.js
npm run webpack