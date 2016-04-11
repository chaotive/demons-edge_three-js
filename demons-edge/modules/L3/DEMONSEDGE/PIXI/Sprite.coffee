class L3.DEMONSEDGE.PIXI.Sprite extends PIXI.Sprite

  constructor: (textureId) ->
    texture = PIXI.loader.resources[textureId].texture
    super(texture)
