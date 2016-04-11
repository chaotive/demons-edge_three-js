class L3.DEMONSEDGE.HUD.Hud

  constructor: (@g, w, h, options = {}) ->
    options.backgroundColor = 0x1099bb
    @renderer = new PIXI.CanvasRenderer(w, h, options)
    @renderer.autoResize = true
    @stage = new PIXI.Container()

    @create()
    @animate()

  create: () ->
    @arrows =
      left: new L3.DEMONSEDGE.HUD.BUTTONS.Arrow(@, 0, 0, "left")
      right: new L3.DEMONSEDGE.HUD.BUTTONS.Arrow(@, 0, 0, "right")
      top: new L3.DEMONSEDGE.HUD.BUTTONS.Arrow(@, 0, 0, "top")
      down: new L3.DEMONSEDGE.HUD.BUTTONS.Arrow(@, 0, 0, "down")
    @endTurn = new L3.DEMONSEDGE.HUD.BUTTONS.EndTurn(@, 0, 0)

  animate: () =>
    requestAnimationFrame(@animate)
    @renderer.render(@stage)
