class L3.DEMONSEDGE.CHARACTERS.Player extends L3.DEMONSEDGE.CHARACTERS.Base

  constructor: (@de, @row, @col, id) ->
    super(@de, @row, @col, id)
    @actionsPerTurn = 2
    @actions = @actionsPerTurn
    @speed = 2

  onClick: (e) =>
    console.log(e)
    @createMenu()

  createMenu: () ->
    console.log("creating menu...")
#    r = new Phaser.Rectangle(0,0,100,100)
#    @de.game.debug.geom(r, 'rgba(200,0,0,0.5)')
#    console.log(r)
#    @sprite.addChild(@de.game.make.sprite(r))
