class ToDo.Views.TasksIndex extends Backbone.View
  el: '#main'
  events:
    'submit #new_task'   : 'newTask'

  initialize: ->
    @listenTo(@collection, 'add reset', @render)

  render: ->
    @$('#tasks').html ''
    @collection.each @addOne
    @

  addOne: (task) =>
    view = new ToDo.Views.TasksShow(model: task)
    $('#tasks').append view.render().el

  newTask: (event) ->
    event.preventDefault()
    @collection.create { name: @$('#task_name').val() }, { success: => @$('#task_name').val('') }

