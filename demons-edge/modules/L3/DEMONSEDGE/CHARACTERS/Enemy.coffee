class L3.DEMONSEDGE.CHARACTERS.Enemy extends L3.DEMONSEDGE.CHARACTERS.Base

  constructor: (@de, row, col, id) ->
    @sprite = @addSprite(@de.grid, row, col, id)
    @de.env.scene.add( @sprite )