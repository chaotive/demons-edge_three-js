class L3.DEMONSEDGE.THREE.Preload

  constructor: (cb) ->
    @ress = {}
    @manager = new THREE.LoadingManager()
    @manager.onLoad = cb
    @loader = new THREE.TextureLoader(@manager);

  load: (ress, group) ->
    for id, url of ress
      console.log(id + " ...")
      @loadResource(id , url, group)

  loadResource: (id, url, group) ->
    @ress[group] = {}
    @loader.load(
      url,
      (res) =>
        console.log("... " + url)
        @ress[group][id] = res
    )