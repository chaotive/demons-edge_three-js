class L3.DEMONSEDGE.PIXI.Sprite extends PIXI.Sprite

  constructor: (textureId) ->
    texture = PIXI.loader.resources[textureId].texture
    super(texture)

  rotate: (direction) ->
    @anchor.y = 1 if direction in ["right", "down"]
    @anchor.x = 1 if direction in ["down", "left"]
    @rotation = switch direction
      when "right" then 1.57
      when "down" then 3.14
      when "left" then 4.71
      else 0

  center: (otherWidth) -> @position.x = (otherWidth - @width) / 2
