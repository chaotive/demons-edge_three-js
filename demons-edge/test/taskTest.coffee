chai = require 'chai'
chai.should()

{Grid} = require '../modules/L3/DEMONSEDGE/GAME/Grid'

describe 'Grid instance', ->
  task1 = task2 = null
  it 'should have correct dimensions', ->
    task1 = new Grid(1,1)
    task1.width.should.equal 60