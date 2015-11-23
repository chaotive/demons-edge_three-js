<?php
require 'vendor/autoload.php';

$app = new \Slim\Slim();

//Home
$app->get("/", function() use ($app) {
    var_dump("home");
});

//Version
$app->get("/version", function() use ($app) {
    var_dump(\Lib\Config::VERSION);
});

$app->run();