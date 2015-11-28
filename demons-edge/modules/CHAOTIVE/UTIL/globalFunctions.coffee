top = if typeof exports isnt 'undefined' then global else window

top.namespace = (nsTarget, classRef) ->
  nsPath = nsTarget.split '.'
  target = top
  target = target[item] or= {} for item in nsPath
  target[classRef.name] = classRef
  # console.log(top[nsPath[0]])

top.loadJSON = (url, objs, cb) -> $.getJSON(url, (data) ->
  (top[obj] = data[obj]) for obj in objs
  cb()
)
