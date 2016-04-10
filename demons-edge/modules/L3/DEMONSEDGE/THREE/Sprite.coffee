class L3.DEMONSEDGE.THREE.Sprite

  constructor: (texture) ->
    material = new THREE.SpriteMaterial( { map: texture, color: 0xffffff, fog: true } )
    sprite = new THREE.Sprite( material )

    return sprite