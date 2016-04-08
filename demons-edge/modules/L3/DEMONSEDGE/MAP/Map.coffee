class L3.DEMONSEDGE.MAP.Map

  constructor: (@de) ->
    @cell = @de.config.map.cell
    @rooms = (new L3.DEMONSEDGE.MAP.Room(@, f) for f in @de.config.map.rooms)

  getX: (col) -> x = col * @cell.width
  getY: (row) -> y = row * @cell.height