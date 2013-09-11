/*
 * jQuery Fixr v1.0.0
 * by Tyler Wolff, tylerwolff.com
 * Copyright (c) 2013 Tyler Wolff. All rights reserved.
 */
(function() {
  (function($, window, document) {
    var Plugin, defaults;
    defaults = {
      fixedClass: 'fixed',
      offset: 0,
      resize: false
    };
    Plugin = (function() {
      function Plugin(element, options) {
        this.element = element;
        this.settings = $.extend({}, defaults, options);
        this.init();
      }

      Plugin.prototype.init = function() {
        var _this = this;
        this.el = $(this.element);
        this.el.width(this.el.width());
        this.elOffset = this.el.offset().top - this.settings.offset;
        this.fixMenu();
        this.setupSpacing();
        $(window).scroll(function() {
          return _this.fixMenu();
        });
        if (this.settings.resize) {
          return $(window).resize(function() {
            var width;
            width = _this.el.css({
              'position': 'static',
              'width': 'auto'
            }).width();
            _this.el.width(width);
            return _this.fixMenu();
          });
        }
      };

      Plugin.prototype.setupSpacing = function() {
        var spacer;
        spacer = $('<div></div>').height(this.el.outerHeight());
        return this.el.after(spacer);
      };

      Plugin.prototype.fixMenu = function() {
        var scrollOffset;
        scrollOffset = $(window).scrollTop();
        if (scrollOffset >= this.elOffset) {
          return this.el.css({
            'position': 'fixed',
            'top': this.settings.offset
          }).addClass(this.settings.fixedClass);
        } else {
          return this.el.css({
            'position': 'absolute',
            'top': this.elOffset + this.settings.offset
          }).removeClass(this.settings.fixedClass);
        }
      };

      return Plugin;

    })();
    return $.fn.fixr = function(options) {
      return this.each(function() {
        if (!$.data(this, "plugin_fixr")) {
          return $.data(this, "plugin_fixr", new Plugin(this, options));
        }
      });
    };
  })(jQuery, window, document);

}).call(this);
