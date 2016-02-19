class L3.DEMONSEDGE.THREE.Preload

  constructor: (loadCb) ->
    @manager = new THREE.LoadingManager()
    @manager.onLoad = loadCb

    @textureLoader = new THREE.TextureLoader(@manager);

  loadTextures: (textureImgs) ->
    for textureId, imgUrl of textureImgs
      console.log(textureId + " ...")
      @loadTexture(textureId, imgUrl)

  loadTexture: (textureId, imgUrl) ->
    L3.DEMONSEDGE.THREE.textures = {}
    @textureLoader.load(
      imgUrl,
      (texture) ->
        console.log("... " + imgUrl)
        L3.DEMONSEDGE.THREE.textures[textureId] = texture
    )