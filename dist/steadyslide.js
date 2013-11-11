/* ===========================================================
# Steadyslide - v0.1.0
# ==============================================================
# Copyright (c) 2013 Nicola Molinari
# Licensed MIT.
*/
(function($) {
  return $.fn.steadyslide = function(options) {
    var filterActive, filterNonActive, getItems;
    if (options == null) {
      options = {};
    }
    $.extend(options, {
      duration: 200,
      easing: "linear",
      interval: 3000
    });
    filterActive = function(el) {
      return el.filter(function() {
        return $(this).hasClass("active");
      });
    };
    filterNonActive = function(el) {
      return el.filter(function() {
        return !$(this).hasClass("active");
      });
    };
    getItems = function(el) {
      return el.find("*[data-toggle=steady-item]");
    };
    this.each(function() {
      var activeItems, container, cycle, index, items, nonActiveItems, visible_items;
      container = $(this);
      items = getItems(container);
      activeItems = filterActive(items);
      visible_items = activeItems.length;
      if (visible_items > 1) {
        nonActiveItems = filterNonActive(items);
        nonActiveItems.hide();
        activeItems.each(function() {
          return $(this).prependTo(container);
        });
        index = 0;
        cycle = function() {
          var activeElementToChange, newElementToShow, updatedItems;
          updatedItems = getItems(container);
          nonActiveItems = filterNonActive(updatedItems);
          activeElementToChange = $(updatedItems.get(index));
          newElementToShow = $(nonActiveItems.get(0)).addClass("active");
          newElementToShow.insertAfter(activeElementToChange);
          activeElementToChange.fadeOut(options.duration, options.easing, function() {
            activeElementToChange.removeClass("active").appendTo(container);
            return newElementToShow.fadeIn(options.duration, options.easing);
          });
          if (index === visible_items - 1) {
            return index = 0;
          } else {
            return index++;
          }
        };
        return setInterval(cycle, options.interval);
      }
    });
    return this;
  };
})(jQuery);
