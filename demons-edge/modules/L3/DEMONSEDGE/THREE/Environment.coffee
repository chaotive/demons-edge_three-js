class L3.DEMONSEDGE.THREE.Environment

  constructor: (renderAlpha, canvasId) ->
    @init(renderAlpha, canvasId)
    @render()

  init: (renderAlpha, canvasId) ->
    @canvas = document.getElementById(canvasId);
    @parent = @canvas.parentNode.parentNode
    @scene = new L3.DEMONSEDGE.THREE.Scene()
    @camera = new L3.DEMONSEDGE.THREE.Camera()

    # lights
    ambient = new THREE.AmbientLight( 0x444444 );
    @scene.add( ambient );
    pointLight = new THREE.PointLight( 0xffffff, 1, 100 )
    @scene.add( @camera )
    @camera.add(pointLight)

    #renderer
    @renderer = new THREE.WebGLRenderer( { canvas: @canvas, alpha: renderAlpha, antialiasing: true } )
    #@renderer.setPixelRatio( window.devicePixelRatio )
    @updateRendererSize()

    @controls = new L3.DEMONSEDGE.THREE.Controls(@camera, @renderer.domElement)
    #@controls.enabled = false

    #window behaviours listeners
    window.addEventListener( 'resize', @updateRendererSize, false )

  render: () ->
    requestAnimationFrame => @render()
    TWEEN.update()
    @renderer.render( @scene, @camera )

  updateRendererSize: () =>
    @size =
      width: @parent.offsetWidth-150
      height: @parent.offsetHeight-50
    #@camera.aspect = window.innerWidth / window.innerHeight
    @camera.aspect = @size.width / @size.height
    @camera.updateProjectionMatrix()
    @renderer.setSize( @size.width, @size.height )

