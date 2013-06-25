class ToDo.Collections.TaskCounters extends Backbone.Collection
  model: ToDo.Models.TaskCounter
  url: '/api/task_counters'

  initialize: ->
    @storage = new Offline.Storage('task_counters', @, autoPush: true)


