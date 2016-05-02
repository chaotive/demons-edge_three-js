class L3.DEMONSEDGE.THREE.Controls extends THREE.OrbitControls

  constructor: (object, domElement) ->
    super(object, domElement)
    @enableDamping = true
    @dampingFactor = .25
    @enableZoom = true
    