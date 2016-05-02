class L3.DEMONSEDGE.THREE.SimpleCamera extends THREE.PerspectiveCamera

  constructor: (@g, x, y, z, zoom, cameraOptions = {}) ->
    super( cameraOptions.fov, cameraOptions.aspect, cameraOptions.near, cameraOptions.far )
    @position.x = -20
    @position.y = -20
    @position.z = 20

    #@rotation.y = 90 * Math.PI / 180

    @lookAt(new THREE.Vector3(0,0,1))
    #@zoom = 2



class L3.DEMONSEDGE.THREE.ControlCamera extends THREE.PerspectiveCamera

  constructor: (@renderer, x, y, z, zoom, cameraOptions = {}) ->
    super( cameraOptions.fov, cameraOptions.aspect, cameraOptions.near, cameraOptions.far )
    @translateX x
    @translateY y
    @translateZ z
    @zoom = zoom
    pointLight = new THREE.PointLight( 0xffffff, 1, 100 )
    @add(pointLight)

    @controls = new L3.DEMONSEDGE.THREE.Controls(@, @renderer.domElement)
    @controls.enabled = true