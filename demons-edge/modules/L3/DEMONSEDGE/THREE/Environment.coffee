class L3.DEMONSEDGE.THREE.Environment

  constructor: (renderAlpha, canvasId) ->
    @init(renderAlpha, canvasId)
    @render()

  init: (renderAlpha, canvasId) ->
    @canvas = document.getElementById(canvasId);
    @parent = @canvas.parentNode.parentNode
    @scene = new L3.DEMONSEDGE.THREE.Scene()

    @renderer = new THREE.WebGLRenderer( { canvas: @canvas, alpha: renderAlpha, antialiasing: true } )
    #@camera = new L3.DEMONSEDGE.THREE.ControlCamera(@renderer, 0, -45, 45, 2)
    @camera = new L3.DEMONSEDGE.THREE.SimpleCamera()
    @scene.add( @camera )

    @updateRendererSize()

    # lights
    ambient = new THREE.AmbientLight( 0x444444 );
    @scene.add( ambient );

    @applyExtraHtml()

    #window behaviours listeners
    window.addEventListener( 'resize', @updateRendererSize, false )

  render: () ->
    requestAnimationFrame => @render()
    TWEEN.update()
    @renderer.render( @scene, @camera )

  updateRendererSize: () =>
    @size =
      width: @parent.offsetWidth-150
      #height: @parent.offsetHeight-50
      height: 430
    @camera.aspect = @size.width / @size.height
    @camera.updateProjectionMatrix()
    @renderer.setSize( @size.width, @size.height )

  applyExtraHtml: () ->
    @canvas.style.backgroundImage = "url('resources/img/dev/background.png')";