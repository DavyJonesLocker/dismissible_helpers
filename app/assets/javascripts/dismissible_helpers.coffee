(($) ->
  $.fn.dismissible = (options) ->
    options = {} if options == undefined
    options.closeSelector ?= '.close'
    options.openSelector ?= '.open'
    options.name = @.attr('data-dismissible-name')

    @find(options.closeSelector).click (event) ->
      $target = $ event.target
      $helper = $target.parent()
      event.preventDefault()

      $helper.dismiss(options)

    @find(options.openSelector).click (event) ->
      $target = $ event.target
      $helper = $target.parent()
      event.preventDefault()

      $helper.restore(options)

  $.fn.dismiss = (options) ->
    restorable = @.attr('data-restorable') is 'true'
    $.rails.ajax
      url:       '/dismissed_helpers'
      type:      'POST'
      dataType:  'json'
      data:
        helper: options.name
      success: =>
        if options? and options.dismiss != undefined
          options.dismiss(@)
        else
          if restorable
            $(@).children().each ->
              $(@).toggle()
          else
            $(@).remove()


  $.fn.restore = (options) ->
    $.rails.ajax
      url:       '/dismissed_helpers/' + options.name
      type:      'DELETE'
      dataType:  'json'
      success: =>
        if options? and options.show != undefined
          options.show(@)
        else
          $(@).children().each ->
            $(@).toggle()
)(jQuery)
