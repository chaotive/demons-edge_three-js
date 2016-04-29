class L3.DEMONSEDGE.HUD.Hud

  constructor: (@g, w, h, options = {}) ->
    # options.backgroundColor = 0x1099bb
    options.transparent = true
    @renderer = new PIXI.CanvasRenderer(w, h, options)
    @renderer.autoResize = true
    @stage = new PIXI.Container()

    @create()
    @animate()

  create: () ->
    # draw a rounded rectangle
    @graphics = new PIXI.Graphics()
    @graphics.lineStyle(1, 0xFF0000, 1)
    @graphics.beginFill(0x3B0B0B, 0.25)
    @graphics.drawRoundedRect(0, 0, @renderer.width, @renderer.height, 5)
    @graphics.endFill()
    @stage.addChild(@graphics)

    @character = new L3.DEMONSEDGE.HUD.Character(@stage, 12.5, 0)
    @endTurn = new L3.DEMONSEDGE.HUD.BUTTONS.EndTurn(@stage, 5, 370)

  animate: () =>
    requestAnimationFrame(@animate)
    @renderer.render(@stage)


class L3.DEMONSEDGE.HUD.Character

  constructor: (@parent, x, y) ->
    @container = new PIXI.Container()
    @container.width = 75
    @container.position.x = x
    @container.position.y = y

    @picture = new L3.DEMONSEDGE.PIXI.Sprite("character")
    @picture.center(@container._width)
    @container.addChild(@picture)

    @arrows =
      up: new L3.DEMONSEDGE.HUD.BUTTONS.Arrow(@container, 25, @picture.height + 0, "up")
      left: new L3.DEMONSEDGE.HUD.BUTTONS.Arrow(@container, 0, @picture.height + 25, "left")
      down: new L3.DEMONSEDGE.HUD.BUTTONS.Arrow(@container, 25, @picture.height + 25, "down")
      right: new L3.DEMONSEDGE.HUD.BUTTONS.Arrow(@container, 50, @picture.height + 25, "right")

    @graphics = new PIXI.Graphics()
    @graphics.lineStyle(1, 0xFF0000, 1);
    @graphics.beginFill(0x3B0B0B, 0.25);
    @graphics.drawRoundedRect(0, 0, @container.width, @container.height, 5);
    @graphics.endFill();
    @container.addChild(@graphics)

    @parent.addChild(@container)
