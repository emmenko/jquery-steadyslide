(($)->

  $.fn.steadyslide = (options = {})->
    $.extend options,
      visible_items: 1
      duration: 200
      easing: "linear"
      interval: 3000

    filterActive = (el)-> el.filter -> $(@).hasClass("active")
    filterNonActive = (el)-> el.filter -> not $(@).hasClass("active")
    getItems = (el)-> el.find("steady-item")

    # TODO: check that active elements are defined

    if options.visible_items > 1
      @.each ->
        container = @
        items = getItems container

        nonActiveItems = filterNonActive items
        nonActiveItems.hide()

        index = 0 # which active element should be changed
        cycle = ->
          updatedItems = getItems container
          # filter non-active items
          nonActiveItems = filterNonActive updatedItems
          activeElementToChange = $(updatedItems.get(index))
          newElementToShow = $(nonActiveItems.get(0)).addClass("active")
          newElementToShow.insertAfter(activeElementToChange)
          activeElementToChange.fadeOut options.duration, options.easing, ->
            # move it to the end of the list
            activeElementToChange.removeClass("active").appendTo(container)
            newElementToShow.fadeIn options.duration, options.easing
          if index is visible_items - 1
            index = 0
          else
            index++

        setInterval cycle, options.interval
    @

)(jQuery)
