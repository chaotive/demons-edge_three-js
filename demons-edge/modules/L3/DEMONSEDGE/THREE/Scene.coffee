class L3.DEMONSEDGE.THREE.Scene extends THREE.Scene
  addFromArray: (os) ->
    console.log("Adding " + os.length + " objects.")
    @add(o) for o in os