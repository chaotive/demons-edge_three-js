/**
 * Created by leo on 12-11-2015.
 */

//SPACES
var APP = {
    fullscreen: {}
};
var L3 = { DEMONSEDGE: {}};

//MAIN FUNCTIONS
function play() {
    //if (APP.game) APP.game.stop();
    $("#loading").slideUp();
    $("#game").slideUp();
    $("#play").slideDown();
}

function game() {
    APP.game = new L3.DEMONSEDGE.DemonsEdge();
    //$("#play").slideUp();
    $("#loading").slideUp();
    $("#game").slideDown();
}

function fullscreen() {
    APP.fullscreen.enter(APP.game.game.renderer.view);
}