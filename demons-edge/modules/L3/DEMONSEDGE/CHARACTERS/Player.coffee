class L3.DEMONSEDGE.CHARACTERS.Player extends L3.DEMONSEDGE.CHARACTERS.Base

  constructor: (@de, row, col, id) ->
    @sprite = @addSprite(@de.grid, row, col, id)
    @de.env.scene.add( @sprite )
    #@sprite.inputEnabled = true
    #@sprite.events.onInputUp.add(@onClick)
    #console.log(@sprite)

  onClick: (e) =>
    console.log(e)
    @createMenu()

  move: (row, col) ->
    position = { x : @sprite.position.x, y: @sprite.position.y }
    console.log(@de)
    target = { x : @de.grid.getX(col), y: @de.grid.getY(row) }
    console.log(target)
    @tween = new TWEEN.Tween(position).to(target, 500)
    @tween.onUpdate(() =>
      #console.log(position.x)
      #console.log(position.y)
      @sprite.position.x = position.x
      @sprite.position.y = position.y;
    )
    @tween.start();

  createMenu: () ->
    console.log("creating menu...")
#    r = new Phaser.Rectangle(0,0,100,100)
#    @de.game.debug.geom(r, 'rgba(200,0,0,0.5)')
#    console.log(r)
#    @sprite.addChild(@de.game.make.sprite(r))
