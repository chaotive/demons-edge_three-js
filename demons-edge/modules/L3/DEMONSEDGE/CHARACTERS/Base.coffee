class L3.DEMONSEDGE.CHARACTERS.Base

  constructor: (@de, @row, @col, id) ->
    @sprite = @addSprite(@de.map, @row, @col, id)
    @de.env.scene.add( @sprite )
    @moving = new L3.DEMONSEDGE.GAME.Move(@)
    @actionsPerTurn = 1
    @actions = @actionsPerTurn
    @speed = 1 #number of cells to move, always use an Int!

  addSprite: (m, row, col, id) ->
    sprite = new L3.DEMONSEDGE.THREE.Sprite(id)
    sprite.position.setX(col * m.cell.width)
    sprite.position.setY(row * m.cell.height)
    sprite.position.setZ(m.cell.depth)

    return sprite

  moveRel: (rowOffset, colOffset) ->
    console.log("Attempting move: " + rowOffset + " " + colOffset)
    @move(@row + rowOffset * @speed, @col + colOffset * @speed)

  move: (row, col) ->
    if !@moving.is() && @actions
      @moving.set(true)
      @row = row
      @col = col
      @actions--
      position = { x : @sprite.position.x, y: @sprite.position.y }
      target = { x : @de.map.getX(col), y: @de.map.getY(row) }
      tween = new TWEEN.Tween(position).to(target, 500)
      tween.onUpdate(() =>
        @sprite.position.x = position.x
        @sprite.position.y = position.y;
      )
      tween.onComplete(() =>
        @moving.set(false)
        console.log("Finished move: " + @row + " " + @col)
      )
      tween.start();
    else if !@actions then console.warn("No actions available!")
    else console.warn("Can't move, already moving?")

  turnReset: () ->
    @actions = @actionsPerTurn
    console.log(@actions + " " + @actionsPerTurn)

