class L3.DEMONSEDGE.CHARACTERS.Base

  constructor: (@de, @row, @col, id) ->
    @sprite = @addSprite(@de.grid, @row, @col, id)
    @de.env.scene.add( @sprite )
    @moving = false
    @actionsPerTurn = 1
    @actions = @actionsPerTurn
    @speed = 1 #number of cells to move, always use an Int!

  addSprite: (g, row, col, id) ->
    #de.game.add.sprite(de.grid.getX(col), de.grid.getY(row), id);
    sprite = new L3.DEMONSEDGE.THREE.Sprite(id)
    sprite.position.setX(col * g.cellWidth)
    sprite.position.setY(row * g.cellHeight)
    sprite.position.setZ(config.floor.height)

    return sprite

  moveRel: (rowOffset, colOffset) ->
    console.log("Attempting move: " + @row + " " + @col)
    @move(@row + rowOffset * @speed, @col + colOffset * @speed)

  move: (row, col) ->
    if !@moving && @actions
      @moving = true
      position = { x : @sprite.position.x, y: @sprite.position.y }
      target = { x : @de.grid.getX(col), y: @de.grid.getY(row) }
      tween = new TWEEN.Tween(position).to(target, 500)
      tween.onUpdate(() =>
        @sprite.position.x = position.x
        @sprite.position.y = position.y;
      )
      tween.onComplete(() =>
        @row = row
        @col = col
        @actions--
        @moving = false
        console.log("Finished move: " + @row + " " + @col)
      )
      tween.start();

