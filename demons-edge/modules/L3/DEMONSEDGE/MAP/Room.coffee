class L3.DEMONSEDGE.MAP.Room

  constructor: (@map, {@r, @c, @rows, @cols}) ->
    @sprite = new THREE.Object3D()
    @cells = []
    for r in [0...@rows]
      for c in [0...@cols]
        cell = new L3.DEMONSEDGE.MAP.Cell(@map, @r + r, @c + c)
        @sprite.add(cell.sprite)
        @cells.push cell
    @map.de.env.scene.add( @sprite )
    # @sprite.add(new THREE.AxisHelper( 150 ))

    for c in @cells
      edges = new THREE.EdgesHelper( c.sprite, 0x00ff00 )
      @map.de.env.scene.add(edges)

class L3.DEMONSEDGE.MAP.Cell

  constructor: (map, @r, @c) ->
    #console.log(@row + ", " + @col)
    @sprite = new L3.DEMONSEDGE.THREE.SHAPES.Box(map.cell.width, map.cell.height, map.cell.depth)
    @sprite.position.setX(@c * map.cell.width)
    @sprite.position.setY(@r * map.cell.height)
