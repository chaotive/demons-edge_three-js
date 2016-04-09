#DEPENDENCIES INSTALLATION

#build
npm install -g coffee-script
npm install -g uglify-js

#app web server:
npm install connect serve-static

#for node.js based testing, deprecated:
npm install -g mocha
npm install chai

#test, deprecated:
mocha --compilers coffee:coffee-script/register --recursive