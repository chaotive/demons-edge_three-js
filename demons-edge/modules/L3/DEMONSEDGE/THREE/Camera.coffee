class L3.DEMONSEDGE.THREE.Camera extends THREE.PerspectiveCamera

  constructor: (a, b, c, d) ->
    super( a, b, c, d )
    #@camera.position.z = 150
    @position.z = 50;
    @position.y = 50;
    @position.x = 50;