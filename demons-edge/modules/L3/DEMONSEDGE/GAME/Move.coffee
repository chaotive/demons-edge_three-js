class L3.DEMONSEDGE.GAME.Move
  
  constructor: (@obj) ->
    @g = @obj.g
    @state = false
    
  set: (@state) ->
    if @state then @g.moving.add @
    else @g.moving.remove @

  is: -> @state

class L3.DEMONSEDGE.GAME.MoveGlobal

  constructor: -> @objs = []
  
  add: (obj) -> @objs.push obj

  remove: (obj) ->
    i = @objs.indexOf(obj)
    @objs.splice(i, 1)

  is: -> @objs.length == 0
