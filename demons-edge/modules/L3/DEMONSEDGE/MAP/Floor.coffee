class L3.DEMONSEDGE.MAP.Floor

  constructor: (@de) ->
    g = @de.grid
    console.log(g)
    @sprite = new L3.DEMONSEDGE.THREE.SHAPES.Box(@de, g.width/10, g.height/10, config.floor.height)
    #@sprite = new L3.DEMONSEDGE.THREE.SHAPES.Box(@de, 15, 15, 15)
    @sprite.add(new THREE.AxisHelper( g.width ));
    console.log(@sprite)