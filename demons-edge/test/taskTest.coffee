util = require '../modules/CHAOTIVE/util'
GLOBAL.namespace = util.namespace
console.log(namespace)

chai = require 'chai'
chai.should()

Grid = require '../modules/L3/DEMONSEDGE/GAME/Grid'
console.log(Grid)

describe 'Grid instance', ->
  task1 = task2 = null
  it 'should have correct dimensions', ->
    task1 = new Grid(1,1)
    task1.width.should.equal 60
