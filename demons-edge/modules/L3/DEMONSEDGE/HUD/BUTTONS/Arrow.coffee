class L3.DEMONSEDGE.HUD.BUTTONS.Arrow extends L3.DEMONSEDGE.GUI.Button

  constructor: (@parent, x, y, @direction) ->
    @sprite = new L3.DEMONSEDGE.PIXI.Sprite("arrow")
    @sprite.width = 25
    @sprite.height = 25
    @sprite.position.x = x
    @sprite.position.y = y
    @sprite.rotate(@direction)

    @sprite.interactive = true;
    @sprite.on('mousedown', () => alert(@direction))
    @sprite.on('touchstart', () => alert(@direction))

    @parent.addChild(@sprite)
