(($) ->
  $myAjax = if $.rails? then $.rails.ajax else $.ajax

  $.fn.dismissible = (options) ->
    options = {} if options == undefined
    options.closeSelector ?= '.close'
    options.openSelector ?= '.open'


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
    $myAjax
      url:       '/dismissed_helpers'
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
    $myAjax
      url:       '/dismissed_helpers/' + @.attr('data-dismissible-name')
      type:      'DELETE'
      dataType:  'json'
      success: =>
        if options? and options.show != undefined
          options.show(@)
        else
          $(@).children().each ->
            $(@).toggle()
)(jQuery)
