window.ToDo =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    tasks = new ToDo.Collections.Tasks()
    tasks.once 'reset', ->
      view = new ToDo.Views.TasksIndex(collection: tasks).render()
      view = new ToDo.Views.CountView(collection: tasks).render()

    tasks.fetch()
$ ->
  ToDo.initialize()


