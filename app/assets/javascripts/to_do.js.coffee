window.ToDo =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    tasks = new ToDo.Collections.Tasks()
    tasks.once 'reset', ->
      view = new ToDo.Views.TasksIndex(collection: tasks).render()

    tasks.fetch()
