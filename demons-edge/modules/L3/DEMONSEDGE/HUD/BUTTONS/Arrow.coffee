class L3.DEMONSEDGE.HUD.BUTTONS.Arrow extends L3.DEMONSEDGE.GUI.Button

  constructor: (@parent, x, y, @direction) ->
    @sprite = new L3.DEMONSEDGE.PIXI.Sprite("arrow")
    @sprite.width = 25
    @sprite.height = 25
    @sprite.position.x = x
    @sprite.position.y = y
    @sprite.rotate(@direction)

    @sprite.interactive = true;
    @sprite.on('mousedown', () => @action(@direction))
    @sprite.on('touchstart', () => @action(@direction))

    @parent.addChild(@sprite)

  action: (dir) ->
    switch dir
      when "left" then L3.de.player.moveRel(0,-1)
      when "right" then L3.de.player.moveRel(0,1)
      when "up" then L3.de.player.moveRel(1,0)
      when "down" then L3.de.player.moveRel(-1,0)
