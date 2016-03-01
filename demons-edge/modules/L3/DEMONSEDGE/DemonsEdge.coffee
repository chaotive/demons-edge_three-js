class L3.DEMONSEDGE.DemonsEdge

  constructor: () ->
    console.log("Welcome to DemonsEdge")
    @grid = new L3.DEMONSEDGE.MAP.Grid(9, 16)
    @env = new L3.DEMONSEDGE.THREE.Environment(true, 'game')
    @preload()

    position = { x : 0, y: 300 };
    target = { x : 400, y: 50 };
    @tween = new TWEEN.Tween(position).to(target, 2000);
    @tween.onUpdate(() ->
      console.log(position.x)
      console.log(position.y)
#      mesh.position.x = position.x;
#      mesh.position.y = position.y;
    )
    @tween.start();

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
    @enemy = new L3.DEMONSEDGE.CHARACTERS.Enemy(@, 1, 2, 'enemy1')
    @createGroups()

  createGroups: () ->
    @sg1 = new L3.DEMONSEDGE.THREE.Group(@, [@floor.sprite, @player.sprite, @enemy.sprite])
    @sg1.translateX(@grid.width / -2)
    @sg1.translateZ(-15)
