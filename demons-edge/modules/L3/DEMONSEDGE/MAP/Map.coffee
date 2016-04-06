class L3.DEMONSEDGE.MAP.Map

  constructor: (@de) ->
    @cell = @de.config.cell
    @floor = new L3.DEMONSEDGE.MAP.Floor(@, 0, 0, 9, 16) #0,0

  getX: (col) -> x = col * @cell.width
  getY: (row) -> y = row * @cell.height