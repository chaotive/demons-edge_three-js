class L3.DEMONSEDGE.PIXI.Sprite

  constructor: () ->
    texture = PIXI.Texture.fromImage('resources/img/dev/hud/key-board-arrow-border.png')
    bunny = new PIXI.Sprite(texture)
    bunny.position.x = 50
    bunny.position.y = 150
    @stage.addChild(bunny)