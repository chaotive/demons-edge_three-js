class L3.DEMONSEDGE.MAP.Floor

  constructor: (@de) ->
    g = @de.grid
    console.log(g)
    @sprite = new L3.DEMONSEDGE.THREE.SHAPES.Box(@de, g.width/100, g.height/100, config.floor.height/10)
    #@sprite = new L3.DEMONSEDGE.THREE.SHAPES.Box(@de, 15, 15, 15)
    @sprite.add(new THREE.AxisHelper( 15 ));
    console.log(@sprite)