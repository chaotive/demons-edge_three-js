class L3.DEMONSEDGE.DemonsEdge

  constructor: () ->
    console.log("Welcome to DemonsEdge")
    @grid = new L3.DEMONSEDGE.MAP.Grid(3, 2)
    @env = new L3.DEMONSEDGE.THREE.Environment(true, 'container')
    #@game = new Phaser.Game(@grid.width, @grid.height, Phaser.AUTO, 'game', @)

  #phaser:
  preload: () ->
    @game.load.image('sample1', 'resources/img/dev/sample1.png');
    @game.load.image('enemy1', 'resources/img/dev/enemy1.png');

  create: () ->
    @player = new L3.DEMONSEDGE.CHARACTERS.Player(@, 0, 0, 'sample1')
    @enemy = new L3.DEMONSEDGE.CHARACTERS.Enemy(@, 1, 0, 'enemy1')
