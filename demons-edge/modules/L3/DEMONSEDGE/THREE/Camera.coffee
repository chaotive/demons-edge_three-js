class L3.DEMONSEDGE.THREE.Camera extends THREE.PerspectiveCamera

  constructor: (a, b, c, d) ->
    super( a, b, c, d )
    #@camera.position.z = 150
    @translateX 0
    @translateY -45
    @translateZ 45

    #@position.x = 25
    #@lookAt(new THREE.Vector3(50,0,0))

#    @rotation.x = 90 * Math.PI / 180
#    @rotation.y = 90 * Math.PI / 180
#    @rotation.z = 90 * Math.PI / 180