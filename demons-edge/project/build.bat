REM build:

call coffee --join staging/namespaces.js --compile modules/namespaces.coffee
call uglifyjs staging/namespaces.js --compress --mangle --output js/bin/namespaces.min.js

call coffee --join staging/chaotive.app.js --compile modules/CHAOTIVE/APP
call uglifyjs staging/chaotive.app.js --compress --mangle --output js/bin/chaotive.app.min.js

call coffee --join staging/chaotive.util.js --compile modules/CHAOTIVE/UTIL
call uglifyjs staging/chaotive.util.js --compress --mangle --output js/bin/chaotive.util.min.js

call coffee --join staging/l3.demonsedge.js --compile modules/L3/DEMONSEDGE
call uglifyjs staging/l3.demonsedge.js --compress --mangle --output js/bin/l3.demonsedge.min.js
