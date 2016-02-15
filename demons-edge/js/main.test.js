/**
 * Created by leo on 12-11-2015.
 */
console.log("Starting test suite...");

function init() {
    try {
        console.log("Attempting start...");
        loadJSON("resources/config/dev/test.json", ["config"], testMocha);
        console.log("... application started! :)");
    } catch(err) {
        console.log("Still loading: " + err.message);
        setTimeout(init, 200);
    }
}

function testMocha() {
    window.expect = chai.expect;
    window.should = chai.should();
    var runner = mocha.run();
}
