#
# steadyslide
# https://github.com/emmenko/jquery-steadyslide
#
# Copyright (c) 2013 Nicola Molinari
# Licensed under the MIT license.
#

(($)->

  # Collection method.
  $.fn.steadyslide = ->
    return @.each (i)->
      # Do something awesome to each selected element.
      $(@).html("awesome#{i}")

  # Static method.
  $.steadyslide = (options)->
    # Override default options with passed-in options.
    options = $.extend({}, $.steadyslide.options, options)
    # Return something awesome.
    return "awesome#{options.punctuation}"

  # Static method default options.
  $.steadyslide.options =
    punctuation: "."

  # Custom selector.
  $.expr[":"].steadyslide = (elem)->
    # Is this element awesome?
    return $(elem).text().indexOf("awesome") isnt -1

)(jQuery)
