class L3.DEMONSEDGE.DemonsEdge

  constructor: () ->
    console.log("Welcome to DemonsEdge")
    loadJSON("resources/config/dev/test.json", ["config"], @preload)

  preload: () =>
    console.log("Preloading three.js...")
    preloader = new L3.DEMONSEDGE.THREE.Preload( => console.log("... preload finished!"); @preloadPixi() )
    @ress = preloader.ress

    preloader.load({
      'sample1': 'resources/img/dev/sample1.png'
      'enemy1': 'resources/img/dev/enemy1.png'
    }, "textures")
    preloader.load({
      'background': 'resources/img/dev/background.png'
    }, "imgs")

  preloadPixi: () =>
    console.log("Preloading pixi.js...")
    loader = PIXI.loader
    imgs =
      'arrow': 'resources/img/dev/hud/key-board-arrow-border.png'
      'endTurn': 'resources/img/dev/hud/end-turn.png'
      'character': 'resources/img/dev/sample1.png'
    for id, url of imgs
      console.log(id)
      loader.add(id, url)
    loader.once('complete',  => console.log("... preload finished!"); @create() )
    loader.load()

  create: () =>
    @createConfig(config)
    @createEnvironment()
    @moving = new L3.DEMONSEDGE.GAME.MoveGlobal()
    @turns = new L3.DEMONSEDGE.GAME.Turn(@)

  createConfig: (config) ->
    RDG.Dungeon.Generate()
    config.map.rooms = RDG.Dungeon.rooms.map (r) -> {r: r.x, c: r.y, rows: r.w, cols: r.h}
    @config = config

  createEnvironment: () ->
    @hud = new L3.DEMONSEDGE.HUD.Hud(@, 100, 430, {view: document.getElementById("game-hud")})
    @env = new L3.DEMONSEDGE.THREE.Environment(true, 'game-scene')
    @map = new L3.DEMONSEDGE.MAP.Map(@)
    @player = new L3.DEMONSEDGE.CHARACTERS.Player(@, 0, 0, 'sample1')
    @enemy = new L3.DEMONSEDGE.CHARACTERS.Enemy(@, 1, 2, 'enemy1')
    @createGroups()

  createGroups: () ->
    @sg1 = new L3.DEMONSEDGE.THREE.Group(@, (r.sprite for r in @map.rooms).concat [@player.sprite, @enemy.sprite])
    #@sg1 = new L3.DEMONSEDGE.THREE.Group(@, [@player.sprite, @enemy.sprite])
    #@sg1.translateX(@grid.width / -2)
    @sg1.translateX(0)
    @sg1.translateZ(-15)
