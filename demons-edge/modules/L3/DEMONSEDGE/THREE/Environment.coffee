class L3.DEMONSEDGE.THREE.Environment

  constructor: (renderAlpha, containerId) ->
    console.log("Environment: " +  renderAlpha + " " + containerId)
    @init(renderAlpha, containerId)
    @render()

  clearContainer: (id) ->
    c = document.getElementById(id)
    console.log(c)
    if c then document.body.removeChild(c)

  init: (renderAlpha, containerId) ->
    #container
    @clearContainer(containerId)
    @container = document.createElement( 'div' )
    @container.setAttribute("id", containerId);
    document.body.appendChild( @container )

    # scene
    @scene = new L3.DEMONSEDGE.THREE.Scene()

    #camera
    @camera = new L3.DEMONSEDGE.THREE.Camera( 45, window.innerWidth / window.innerHeight, 1, 2000 )

    # lights
    ambient = new THREE.AmbientLight( 0x444444 );
    @scene.add( ambient );

    pointLight = new THREE.PointLight( 0xffffff, 1, 100 )
    @scene.add( @camera )
    @camera.add(pointLight)


    #renderer
    @renderer = new THREE.WebGLRenderer( { alpha: renderAlpha, antialiasing: true } )
    #@renderer.setPixelRatio( window.devicePixelRatio )
    @renderer.setSize( window.innerWidth, window.innerHeight )
    @container.appendChild( @renderer.domElement )

    #controls
    @controls = new L3.DEMONSEDGE.THREE.Controls(@camera, @renderer.domElement)

    #window behaviours listeners
    window.addEventListener( 'resize', @onWindowResize, false )

  render: () ->
    requestAnimationFrame => @render()
    @renderer.render( @scene, @camera )

  onWindowResize: () =>
    @camera.aspect = window.innerWidth / window.innerHeight
    @camera.updateProjectionMatrix()
    @renderer.setSize( window.innerWidth, window.innerHeight )

  onDocumentMouseDown: () ->
    @raycaster = new THREE.Raycaster()
    @mouse = new THREE.Vector2()
    event.preventDefault()

    @mouse.x = ( event.clientX / window.innerWidth ) * 2 - 1
    @mouse.y = - ( event.clientY / window.innerHeight ) * 2 + 1

    @raycaster.setFromCamera( @mouse, APP.env.camera)

    intersects = @raycaster.intersectObjects( APP.env.scene.children, true )
    #console.log(intersects)

    if intersects.length > 0
      intersects[ 0 ].object.material.color.setHex( Math.random() * 0xffffff )
      if intersects[ 0 ].object.name == "text"
        value = prompt("Enter a new Value: ",0)
        eval("intersects[ 0 ].object.parent.parent.parent."+eval("intersects[ 0 ].object.parent.parent.varName")+"="+ value)
        item =intersects[ 0 ].object.parent.parent.parent
        item.drawObject()
        item.displayAnnotations()
