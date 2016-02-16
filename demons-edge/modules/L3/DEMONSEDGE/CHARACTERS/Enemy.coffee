class L3.DEMONSEDGE.CHARACTERS.Enemy extends L3.DEMONSEDGE.CHARACTERS.Base

  constructor: (@de, col, row, id) ->
    @addSprite(@de, col, row, id)