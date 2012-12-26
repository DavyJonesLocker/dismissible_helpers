#= require jquery
#= require jquery_ujs
#= require dismissible_helpers
#= require_tree .
$ ->
  $('.dismissible').dismissible
    success: (helper) ->
      helper.slideUp()
