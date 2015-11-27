/**
 * Created by leo on 12-11-2015.
 */

//SPACES
CHAOTIVE = {
    APP: {
        worksheet: {},
        fullscreen: {}
    }
};
L3 = {
    DEMONSEDGE: {
        GAME: {}
    }
};

//ALIASES
APP = CHAOTIVE.APP;
DE = L3.DEMONSEDGE;

//MAIN FUNCTIONS
function init() {
    try {
        console.log("Attempting game start...");
        game();
    } catch(err) {
        console.log("Still loading: " + err.message);
        setTimeout(init, 200);
    }
}

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
