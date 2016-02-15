/**
 * Created by leo on 15-02-2016.
 *
 * To be used with node.js as:
 * node startServer.js
 *
 * And then access it on the browser as, for example:
 * http://localhost:6969/test.html
 * http://localhost:6969/index.dev.html
 */

var connect = require('connect');
var serveStatic = require('serve-static');
connect().use(serveStatic(__dirname+"/..")).listen(6969);