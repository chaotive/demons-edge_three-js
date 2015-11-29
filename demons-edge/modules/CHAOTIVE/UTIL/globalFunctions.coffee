top = if typeof exports isnt 'undefined' then global else window

#top.namespace = (target, name, block) ->
#  [target, name, block] = [(if typeof module.exports isnt 'undefined' then module.exports else window), arguments...] if arguments.length < 3
#  top    = target
#  target = target[item] or= {} for item in name.split '.'
#  block target, top

top.namespace = (nsTarget, classRef) ->
  nsPath = nsTarget.split '.'
  target = top
  target = target[item] or= {} for item in nsPath
  target[classRef.name] = classRef
  #console.log(top[nsPath[0]])

top.loadJSON = (url, objs, cb) -> $.getJSON(url, (data) ->
  (top[obj] = data[obj]) for obj in objs
  cb()
)
