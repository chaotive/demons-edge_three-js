class L3.DEMONSEDGE.THREE.Sprite

  constructor: (de, textureId) ->
    texture = L3.DEMONSEDGE.THREE.textures[textureId]
    material = new THREE.SpriteMaterial( { map: texture, color: 0xffffff, fog: true } )
    sprite = new THREE.Sprite( material )
    de.env.scene.add( sprite )
