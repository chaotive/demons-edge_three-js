class L3.DEMONSEDGE.HUD.BUTTONS.Arrow extends L3.DEMONSEDGE.GUI.Button

  constructor: (@parent, x, y, direction) ->
    @sprite = new L3.DEMONSEDGE.PIXI.Sprite("arrow")
    @sprite.height = 25
    @sprite.width = 25
    @sprite.position.x = x
    @sprite.position.y = y
    @sprite.rotate(direction)

    @parent.addChild(@sprite)
