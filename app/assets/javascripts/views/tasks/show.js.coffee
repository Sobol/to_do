class ToDo.Views.TasksShow extends Backbone.View
  tagName:   'li'
  className: 'panel task'
  events:
    'click'           : 'select'
    'click .plus-one' : 'plusOne'
    'click .minus-one': 'minusOne'
    'click .destroy'  : 'destroy'
    'keydown'         : 'checkDestroy'
    'change input'    : 'save'

  initialize: (options) ->
    @listenTo(@model, 'change', @render)
    @listenTo(@model, 'destroy', @remove)
    @taskCounters = options.counters

  minusOne:(e) ->
    e.preventDefault()
    counter = new ToDo.Models.TaskCounter()
    counter.set("task_id", @model.get('sid'))
    counter.set("task_counter_modifier", -1)
    @taskCounters.add(counter)
    counter.save()

    current_counter = parseInt($("#counter-"+@model.get('id')).text())
    $("#counter-"+@model.get('id')).text(current_counter-1)

  plusOne:(e) ->
    e.preventDefault()
    counter = new ToDo.Models.TaskCounter()
    counter.set("task_id", @model.get('sid'))
    counter.set("task_counter_modifier", 1)
    @taskCounters.add(counter)
    counter.save()

    current_counter = parseInt($("#counter-"+@model.get('id')).text())
    $("#counter-"+@model.get('id')).text(current_counter+1)

  render: ->
    @$el.html '<input type="text" class="input-text" value="'+@model.get("name")+'"><a href="" class="destroy">Delete</a></input><a href="" class="minus-one"></a><a href="" class="plus-one"></a><span class="counter" id="counter-'+@model.get("id")+'">'+@model.get("counter")+'</span>'
    @$el.attr 'id', @model.id
    @

  save: ->
    if $.trim(@$('#task_name').val()).length > 0
      @model.save name: @$('input').val()

  destroy: ->
    @model.destroy()

  select: ->
    @$el.addClass('active')
    @$('input').focus()

  checkDestroy: (event) ->
    if event.keyCode is 8 and (_.isEmpty(@$('input').val()) or event.ctrlKey)
      @destroy()
