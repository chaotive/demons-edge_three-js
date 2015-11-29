#dependencies:
npm install -g mocha
npm install -g coffee-script
npm install -g uglify-js

npm install chai

#build:
coffee --join staging/chaotive.app.js --compile modules/CHAOTIVE/APP
uglifyjs staging/chaotive.app.js --compress --mangle --output js/bin/chaotive.app.min.js

coffee --join staging/l3.demonsedge.js --compile modules/L3/DEMONSEDGE
uglifyjs staging/l3.demonsedge.js --compress --mangle --output js/bin/l3.demonsedge.min.js

#test:
mocha --compilers coffee:coffee-script/register --recursive