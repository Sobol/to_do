class ToDo.Views.TasksIndex extends Backbone.View
  el: '#main'
  events:
    'submit #new_task'   : 'newTask'

  initialize: ->
    @listenTo(@collection, 'add reset', @render)
    @counters = new ToDo.Collections.TaskCounters()
    @counters.once 'reset', ->
      old_counters = new ToDo.Collections.TaskCounters()
      old_counters.storage.clear()

    @counters.fetch()

  render: ->
    @$('#tasks').html ''
    @collection.each @addOne
    @

  addOne: (task) =>
    view = new ToDo.Views.TasksShow({model: task, counters: @counters})
    $('#tasks').append view.render().el

  newTask: (event) ->
    event.preventDefault()
    if $.trim(@$('#task_name').val()).length > 0
      @collection.create { name: @$('#task_name').val() }, { success: => @$('#task_name').val('') }
    else
      @$('#task_name').addClass("error")
