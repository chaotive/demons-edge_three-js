class L3.DEMONSEDGE.MAP.Grid

  constructor: (@rows, @cols) ->
    @cellWidth = config.cells.width
    @cellHeight = config.cells.height
    @width = @cellWidth * @cols
    @height = @cellHeight * @rows

  getX: (col) -> col * @cellWidth
  getY: (row) -> row * @cellHeight
