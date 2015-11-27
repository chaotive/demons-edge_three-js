top = if typeof exports isnt 'undefined' then global else window

top.namespace = (nsTarget, classRef) ->
  nsPath = nsTarget.split '.'
  target = top
  target = target[item] or= {} for item in nsPath
  target[classRef.name] = classRef
  # console.log(top[nsPath[0]])
