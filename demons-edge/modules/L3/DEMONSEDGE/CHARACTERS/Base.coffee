class L3.DEMONSEDGE.CHARACTERS.Base

  addSprite: (de, col, row, id) ->
    #de.game.add.sprite(de.grid.getX(col), de.grid.getY(row), id);
    new L3.DEMONSEDGE.THREE.Sprite(de, id)