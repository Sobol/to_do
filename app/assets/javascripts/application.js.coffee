//= require jquery
//= require jquery_ujs
//= require underscore
//= require backbone
//= require backbone.offline
//= require sprockets/commonjs
//= require to_do
//= require_tree ../templates
//= require_tree ./models
//= require_tree ./collections
//= require_tree ./views
//= require_tree ./routers
//= require_self

$ ->
  ToDo.initialize()
