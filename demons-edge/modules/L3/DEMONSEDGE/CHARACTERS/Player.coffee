class L3.DEMONSEDGE.CHARACTERS.Player extends L3.DEMONSEDGE.CHARACTERS.Base

  constructor: (@de, col, row, id) ->
    @sprite = @addSprite(@de, col, row, id)
    #@sprite.inputEnabled = true
    #@sprite.events.onInputUp.add(@onClick)
    console.log(@sprite)

  onClick: (e) =>
    console.log(e)
    @createMenu()

  createMenu: () ->
    console.log("creating menu...")
#    r = new Phaser.Rectangle(0,0,100,100)
#    @de.game.debug.geom(r, 'rgba(200,0,0,0.5)')
#    console.log(r)
#    @sprite.addChild(@de.game.make.sprite(r))
