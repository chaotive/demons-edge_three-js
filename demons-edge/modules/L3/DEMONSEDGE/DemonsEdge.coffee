class DemonsEdge
  constructor: () ->
    console.log("Welcome to DemonsEdge")
    @grid = new L3.DEMONSEDGE.GAME.Grid(3, 2)
    @game = new Phaser.Game(@grid.width, @grid.height, Phaser.AUTO, 'game', @)

  preload: () ->
    @game.load.image('sample1', 'resources/img/dev/sample1.png');
    @game.load.image('enemy1', 'resources/img/dev/enemy1.png');

  create: () ->
    @addSprite(0, 0, 'sample1');
    @addSprite(1, 0, 'enemy1');

  addSprite: (col, row, id) ->
    @game.add.sprite(@grid.getX(col), @grid.getY(row), id);

namespace "L3.DEMONSEDGE", DemonsEdge