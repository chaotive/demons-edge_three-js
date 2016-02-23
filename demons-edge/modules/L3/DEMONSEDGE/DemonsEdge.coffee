class L3.DEMONSEDGE.DemonsEdge

  constructor: () ->
    console.log("Welcome to DemonsEdge")
    @grid = new L3.DEMONSEDGE.MAP.Grid(3, 2)
    @env = new L3.DEMONSEDGE.THREE.Environment(true, 'game')
    @preload()

  preload: () ->
    console.log("Preloading ...")
    @preloader = new L3.DEMONSEDGE.THREE.Preload(@create)

    textureImgs =
      'sample1': 'resources/img/dev/sample1.png'
      'enemy1': 'resources/img/dev/enemy1.png'
    @preloader.loadTextures(textureImgs)

  create: () =>
    console.log("... preload finished!")
    @floor = new L3.DEMONSEDGE.MAP.Floor(@)
    @player = new L3.DEMONSEDGE.CHARACTERS.Player(@, 0, 0, 'sample1')
    @enemy = new L3.DEMONSEDGE.CHARACTERS.Enemy(@, 1, 0, 'enemy1')
