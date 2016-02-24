class L3.DEMONSEDGE.MAP.Floor

  constructor: (@de) ->
    @cells = []
    @sprite = new THREE.Object3D()
    g = @de.grid
    #console.log(g)
    for r in [0...g.rows]
      for c in [0...g.cols]
        cell = new L3.DEMONSEDGE.MAP.Cell(g, r, c)
        @sprite.add(cell.sprite)
        @cells.push cell
    @de.env.scene.add( @sprite )
    @sprite.add(new THREE.AxisHelper( 150 ))

    for c in @cells
      edges = new THREE.EdgesHelper( c.sprite, 0x00ff00 )
      @de.env.scene.add(edges)

class L3.DEMONSEDGE.MAP.Cell

  constructor: (g, @row, @col) ->
    console.log(@row + ", " + @col)
    @sprite = new L3.DEMONSEDGE.THREE.SHAPES.Box(g.cellWidth, g.cellHeight, config.floor.height)
    @sprite.position.setX(@col * g.cellWidth)
    @sprite.position.setY(@row * g.cellHeight)
