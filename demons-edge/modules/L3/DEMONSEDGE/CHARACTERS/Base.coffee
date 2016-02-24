class L3.DEMONSEDGE.CHARACTERS.Base

  addSprite: (g, row, col, id) ->
    #de.game.add.sprite(de.grid.getX(col), de.grid.getY(row), id);
    sprite = new L3.DEMONSEDGE.THREE.Sprite(id)
    sprite.position.setX(col * g.cellWidth)
    sprite.position.setY(row * g.cellHeight)
    sprite.position.setZ(config.floor.height)

    return sprite
