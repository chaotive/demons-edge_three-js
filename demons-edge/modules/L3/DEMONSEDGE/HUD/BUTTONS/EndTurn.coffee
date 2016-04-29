class L3.DEMONSEDGE.HUD.BUTTONS.EndTurn extends L3.DEMONSEDGE.GUI.Button

  constructor: (@parent, x, y) ->
    @sprite = new L3.DEMONSEDGE.PIXI.Sprite("endTurn")
    @sprite.width = 90
    @sprite.height = 60
    @sprite.position.x = x
    @sprite.position.y = y

    @sprite.interactive = true;
    @sprite.on('mousedown', () => @action())
    @sprite.on('touchstart', () => @action())

    @parent.addChild(@sprite)

  action: () -> L3.de.turns.advance()