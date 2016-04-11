class L3.DEMONSEDGE.HUD.BUTTONS.Arrow extends L3.DEMONSEDGE.GUI.Button

  constructor: (hud, x, y, type) ->
    @sprite = new L3.DEMONSEDGE.PIXI.Sprite("arrow")
    @sprite.position.x = x
    @sprite.position.y = y
    hud.stage.addChild(@sprite)