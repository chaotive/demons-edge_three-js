describe 'Grid instance', ->

  it 'should create correct dimensions', ->

    grid = new L3.DEMONSEDGE.MAP.Grid(1,1)
    grid.width.should.equal 60
    grid.height.should.equal 60

    grid = new L3.DEMONSEDGE.MAP.Grid(3,15)
    grid.width.should.equal 180
    grid.height.should.equal 900
