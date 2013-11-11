/* ===========================================================
# Steadyslide - v0.1.0
# ==============================================================
# Copyright (c) 2013 Nicola Molinari
# Licensed MIT.
*/
(function($) {
  $.fn.steadyslide = function() {
    return this.each(function(i) {
      return $(this).html("awesome" + i);
    });
  };
  $.steadyslide = function(options) {
    options = $.extend({}, $.steadyslide.options, options);
    return "awesome" + options.punctuation;
  };
  $.steadyslide.options = {
    punctuation: "."
  };
  return $.expr[":"].steadyslide = function(elem) {
    return $(elem).text().indexOf("awesome") !== -1;
  };
})(jQuery);
