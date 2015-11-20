class L3.DEMONSEDGE.DemonsEdge
  constructor: () ->
    console.log("Welcome to DemonsEdge")
    @game = new Phaser.Game(840, 480, Phaser.AUTO, 'game', @)

  preload: () ->
    @game.load.image('sample1', 'resources/img/test/sample1.png');

  create: () ->
    @game.add.sprite(0, 0, 'sample1');
