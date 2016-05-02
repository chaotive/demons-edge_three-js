class L3.DEMONSEDGE.THREE.Camera extends THREE.PerspectiveCamera

  constructor: (@renderer, fov, aspect, near, far) ->
    super( fov, aspect, near, far )
    @translateX 0
    @translateY -45
    @translateZ 45
    @zoom = 2
    pointLight = new THREE.PointLight( 0xffffff, 1, 100 )
    @add(pointLight)

    @controls = new L3.DEMONSEDGE.THREE.Controls(@, @renderer.domElement)
    @controls.enabled = true