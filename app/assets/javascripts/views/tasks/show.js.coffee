class ToDo.Views.TasksShow extends Backbone.View
  tagName:   'li'
  className: 'panel task'
  events:
    'click'          : 'select'
    'click .destroy' : 'destroy'
    'keydown'        : 'checkDestroy'
    'change input'   : 'save'

  initialize: (options) ->
    @listenTo(@model, 'change', @render)
    @listenTo(@model, 'destroy', @remove)

  render: ->
    @$el.html '<input type="text" class="input-text" value='+@model.get("name")+'></input><a href="" class="destroy">Delete</a>'
    @$el.attr 'id', @model.id
    @

  save: ->
    @model.save name: @$('input').val()

  destroy: ->
    @model.destroy()

  select: ->
    @$el.addClass('active')
    @$('input').focus()

  checkDestroy: (event) ->
    if event.keyCode is 8 and (_.isEmpty(@$('input').val()) or event.ctrlKey)
      @destroy()
