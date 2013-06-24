class ToDo.Collections.Tasks extends Backbone.Collection
  model: ToDo.Models.Task
  url: '/api/tasks'

  initialize: ->
    @storage = new Offline.Storage('tasks', @, autoPush: true)

