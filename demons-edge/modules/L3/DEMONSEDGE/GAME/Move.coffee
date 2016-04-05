class L3.DEMONSEDGE.GAME.Move
  
  constructor: (@obj) ->
    @de = @obj.de
    @state = false
    
  set: (@state) ->
    if @state then @de.moving.add @
    else @de.moving.remove @

class L3.DEMONSEDGE.GAME.MoveGlobal

  constructor: () -> @objs = []
  
  add: (obj) -> @objs.push obj

  remove: (obj) ->
    i = @objs.indexOf(obj)
    @objs.splice(i, 1)

  is: () -> @objs.length == 0
