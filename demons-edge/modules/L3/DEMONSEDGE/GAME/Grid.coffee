class Grid

  constructor: (cols, rows) ->
    @cellWidth = config.cells.width
    @cellHeight = config.cells.height
    @width = @cellWidth * cols
    @height = @cellHeight * rows

  getX: (col) -> col * @cellWidth
  getY: (row) -> row * @cellHeight

namespace "L3.DEMONSEDGE.GAME", Grid
