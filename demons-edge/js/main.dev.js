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

//MAIN FUNCTIONS
function play() {
    //if (APP.game) APP.game.stop();
    $("#loading").slideUp();
    $("#game").slideUp();
    //$("#play").slideDown();
}

function game() {
    L3.de = new L3.DEMONSEDGE.DemonsEdge();
    //$("#play").slideUp();
    $("#loading").slideUp();
    $("#game").slideDown();
}

function fullscreen() {
    APP.fullscreen.enter(APP.game.game.renderer.view);
}