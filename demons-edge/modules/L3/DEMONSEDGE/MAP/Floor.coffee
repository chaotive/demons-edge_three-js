class L3.DEMONSEDGE.MAP.Floor

  constructor: (@map, @r, @c, @rows, @cols) ->
    @sprite = new THREE.Object3D()
    @cells = []
    #console.log(g)
    for r in [0...@rows]
      for c in [0...@cols]
        cell = new L3.DEMONSEDGE.MAP.Cell(@map, r, c)
        @sprite.add(cell.sprite)
        @cells.push cell
    @map.de.env.scene.add( @sprite )
    @sprite.add(new THREE.AxisHelper( 150 ))

    for c in @cells
      edges = new THREE.EdgesHelper( c.sprite, 0x00ff00 )
      @map.de.env.scene.add(edges)

class L3.DEMONSEDGE.MAP.Cell

  constructor: (map, @row, @col) ->
    #console.log(@row + ", " + @col)
    @sprite = new L3.DEMONSEDGE.THREE.SHAPES.Box(map.cell.width, map.cell.height, map.cell.depth)
    @sprite.position.setX(@col * map.cell.width)
    @sprite.position.setY(@row * map.cell.height)
