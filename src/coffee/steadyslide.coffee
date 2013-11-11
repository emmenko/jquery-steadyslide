(($)->

  $.fn.steadyslide = (options = {})->
    $.extend options,
      duration: 200
      easing: "linear"
      interval: 3000

    filterActive = (el)-> el.filter -> $(@).hasClass("active")
    filterNonActive = (el)-> el.filter -> not $(@).hasClass("active")
    getItems = (el)-> el.find("*[data-toggle=steady-item]")

    # TODO: check that active elements are defined
    @.each ->
      container = $(@)
      items = getItems container
      activeItems = filterActive(items)
      visible_items = activeItems.length
      if visible_items > 1
        nonActiveItems = filterNonActive items
        nonActiveItems.hide()
        # move active items at the beginning of the list
        activeItems.each -> $(@).prependTo(container)

        index = 0 # which active element should be changed
        cycle = ->
          updatedItems = getItems container
          # filter non-active items
          nonActiveItems = filterNonActive updatedItems
          # we assume that the active items are at the top of the list
          activeElementToChange = $(updatedItems.get(index))
          newElementToShow = $(nonActiveItems.get(0)).addClass("active")
          # TODO: add option to pick it random
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
