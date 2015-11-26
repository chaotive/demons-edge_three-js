class Grid
  cellWidth: 60
  cellHeight: 60

  constructor: (cols, rows) ->
    @width = @cellWidth * cols
    @height = @cellHeight * rows

  getX: (col) -> col * @cellWidth
  getY: (row) -> row * @cellHeight

namespace "L3.DEMONSEDGE.GAME", Grid

#exports.Grid=Grid
#namespace "L3.DEMONSEDGE.GAME", (exports) ->
#  exports.Grid = Grid
