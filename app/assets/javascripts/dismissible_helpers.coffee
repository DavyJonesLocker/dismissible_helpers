(($) ->
  $.fn.dismissible = (options) ->
    options = {} if options == undefined
    if options.closeSelector?
      closeSelector = options.closeSelector
    else
      closeSelector = '.close'

    @find(closeSelector).click (event)  ->
      $target = $ event.target
      $helper = $target.parent()
      event.preventDefault()

      $helper.dismiss(options)

  $.fn.dismiss = (options) ->
    name = @.attr('data-dismissible-name') 
    $.ajax
      url:       '/dismissed_helpers'
      type:      'POST'
      dataType:  'json'
      data:
        helper: name
      success: =>
        if options? and options.success != undefined
          options.success(@)
        else
          @.remove()
)(jQuery)
