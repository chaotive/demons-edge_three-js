class L3.DEMONSEDGE.GAME.Grid
  cellWidth: 60
  cellHeight: 60

  constructor: (cols, rows) ->
    @width = @cellWidth * cols
    @height = @cellHeight * rows

  getX: (col) -> col * @cellWidth
  getY: (row) -> row * @cellHeight