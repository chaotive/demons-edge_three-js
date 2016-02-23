class L3.DEMONSEDGE.THREE.SHAPES.Box

  constructor: (de, x, y, z) ->
    geometry = new THREE.BoxGeometry( x, y, z )
    material = new THREE.MeshBasicMaterial( {color: 0xff0000} )
    mesh = new THREE.Mesh( geometry, material )

    edges = new THREE.EdgesHelper( mesh, 0x00ff00 );
    mesh.add(edges)

    de.env.scene.add( mesh )
    return mesh
