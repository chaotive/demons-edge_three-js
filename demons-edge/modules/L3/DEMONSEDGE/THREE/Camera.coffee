class L3.DEMONSEDGE.THREE.Camera extends THREE.PerspectiveCamera

  constructor: (fov, aspect, near, far) ->
    super( fov, aspect, near, far )
    @translateX 0
    @translateY -45
    @translateZ 45
    @zoom = 2
