class L3.DEMONSEDGE.MAP.Grid

  constructor: (@rows, @cols) ->
    @cellWidth = config.cells.width
    @cellHeight = config.cells.height
    @width = @cellWidth * @cols
    @height = @cellHeight * @rows

  getX: (col) ->
    console.log(col + " " + @cellWidth)
    x = col * @cellWidth
    console.log(x)
    x
  getY: (row) ->
    console.log(row + " " + @cellHeight)
    y = row * @cellHeight
    console.log(y)
    y

