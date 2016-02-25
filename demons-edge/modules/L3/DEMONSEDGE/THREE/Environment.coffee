class L3.DEMONSEDGE.THREE.Environment

  constructor: (renderAlpha, parentId) ->
    @container = @createContainer(parentId)
    @init(renderAlpha)
    @render()

  createContainer: (parentId) ->
    container = document.createElement( 'div' )
    container.setAttribute("id", "container");
    parent = document.getElementById(parentId)
    parent.appendChild( container )
    console.log(container)
    container

  init: (renderAlpha) ->
    @scene = new L3.DEMONSEDGE.THREE.Scene()
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

    @controls = new L3.DEMONSEDGE.THREE.Controls(@camera, @renderer.domElement)
    #@controls.enabled = false

    #window behaviours listeners
    window.addEventListener( 'resize', @onWindowResize, false )

  render: () ->
    requestAnimationFrame => @render()
    @renderer.render( @scene, @camera )

  onWindowResize: () =>
    @camera.aspect = window.innerWidth / window.innerHeight
    @camera.updateProjectionMatrix()
    @renderer.setSize( window.innerWidth, window.innerHeight )
