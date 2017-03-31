#!/bin/bash

#npm init
npm install babel-cli babel-core --save-dev
npm install babel-preset-es2015 --save-dev
npm install http-server --save-dev
echo -e "Make sure you have:\n\"scripts\": {\n\t\"babel\": \"babel --presets es2015 js/main.js -o build/main.bundle.js\",\n\t\"start\": \"http-server\"\n}\nin package.json"
if [ ! -d "build" ]; then
	mkdir build
fi

#Build and run
npm run babel
echo "Make sure your HTML gets the build/main.bundle.js script\!\!"
#npm start
#xdg-open http://localhost:8080
