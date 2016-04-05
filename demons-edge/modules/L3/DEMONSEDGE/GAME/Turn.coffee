class L3.DEMONSEDGE.GAME.Turn

  constructor: (@de) ->
    @number = 0
    @newTurn()

  advance: () ->
    if(@de.moving.is())
      @moveEnemies()
      @newTurn()
    else console.warn("Still moving!")

  moveEnemies: () ->
    random = CHAOTIVE.UTIL.Random
    @de.enemy.moveRel(random.number(1,-1),random.number(1,-1))

  newTurn: () ->
    @de.player.turnReset()
    @de.enemy.turnReset()
    @number++
    console.log("Beginning turn " + @number)
