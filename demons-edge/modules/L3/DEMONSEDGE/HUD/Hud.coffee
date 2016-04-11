class L3.DEMONSEDGE.HUD.Hud

  constructor: (@g, w, h, options = {}) ->
    options.backgroundColor = 0x1099bb
    @renderer = new PIXI.CanvasRenderer(w, h, options)
    @renderer.autoResize = true
    @stage = new PIXI.Container()

    @create()
    @animate()

  create: () ->
    @character = new L3.DEMONSEDGE.HUD.Character(@stage, 12.5, 0)
    @endTurn = new L3.DEMONSEDGE.HUD.BUTTONS.EndTurn(@, 0, 0)

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
      top: new L3.DEMONSEDGE.HUD.BUTTONS.Arrow(@container, 25, @picture.height + 0, "top")
      left: new L3.DEMONSEDGE.HUD.BUTTONS.Arrow(@container, 0, @picture.height + 25, "left")
      down: new L3.DEMONSEDGE.HUD.BUTTONS.Arrow(@container, 25, @picture.height + 25, "down")
      right: new L3.DEMONSEDGE.HUD.BUTTONS.Arrow(@container, 50, @picture.height + 25, "right")

    @parent.addChild(@container)
