/**
 * Created by leo on 12-11-2015.
 */
console.log("Starting APP...");

function init() {
    try {
        console.log("Attempting start...");
        loadJSON("resources/config/dev/test.json", ["config"], game);
        console.log("... application started! :)");
    } catch(err) {
        console.log("Still loading: " + err.message);
        setTimeout(init, 200);
    }
}

/*
APP.debug = true;
DE.stages = [
    "resources/stages/test/stage1.json",
    "resources/stages/test/stage2.json",
    "resources/stages/test/stage3.json"
];
*/