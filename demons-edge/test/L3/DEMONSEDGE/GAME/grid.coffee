path = "../../../../"
global.config = (require path+'resources/config/dev/test.json').config
require path+'modules/CHAOTIVE/UTIL/test'
require path+'modules/L3/DEMONSEDGE/GAME/Grid'

describe 'Grid instance', ->
  it 'should create correct dimensions', ->
    grid = new L3.DEMONSEDGE.GAME.Grid(1,1)
    grid.width.should.equal 60
    grid.height.should.equal 60

    grid = new L3.DEMONSEDGE.GAME.Grid(3,15)
    grid.width.should.equal 180
    grid.height.should.equal 900
