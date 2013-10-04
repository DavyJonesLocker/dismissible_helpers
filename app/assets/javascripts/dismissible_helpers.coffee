(($) ->
  $.fn.dismissible = (options) ->
    options = {} if options == undefined
    options.closeSelector ?= '.close'
    options.openSelector ?= '.open'
    options.url ?= '/dismissed_helpers'


    @each ->
      $this = $ @
      $this.find(options.closeSelector).click (event) ->
        $target = $ event.target
        $helper = $target.parent()
        event.preventDefault()

        $helper.dismiss(options)

      $this.find(options.openSelector).click (event) ->
        $target = $ event.target
        $helper = $target.parent()
        event.preventDefault()

        $helper.restore(options)

  $.fn.dismiss = (options) ->
    restorable = @.attr('data-restorable') is 'true'
    $.rails.ajax
      url:       options.url
      type:      'POST'
      dataType:  'json'
      data:
        helper: @.attr('data-dismissible-name')
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
      url:       options.url + '/' + @.attr('data-dismissible-name')
      type:      'DELETE'
      dataType:  'json'
      success: =>
        if options? and options.show != undefined
          options.show(@)
        else
          $(@).children().each ->
            $(@).toggle()
)(jQuery)
