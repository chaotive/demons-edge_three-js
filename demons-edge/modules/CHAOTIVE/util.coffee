gr = exports ? window

#gr.namespace = (target, name, block) ->
#  [target, name, block] = [(if typeof exports isnt 'undefined' then exports else window), arguments...] if arguments.length < 3
#  top    = target
#  target = target[item] or= {} for item in name.split '.'
#  console.log("[GROUP] Namespace:")
#  console.dir(top); console.dir(target); console.dir(name); console.dir(block)
#  console.log("[GROUPEND]")
#  block target, top

gr.namespace = (nsName, className) ->
  top = if typeof exports isnt 'undefined' then GLOBAL else window
  for item in nsName.split '.'
    console.log(item)
    target = target[item] or= {}
  console.log(target)

#if (typeof gr == "exports") GLOBAL.namespace = namespace
#else window.namespace = namespace
