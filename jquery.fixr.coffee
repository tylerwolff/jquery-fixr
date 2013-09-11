# jQuery Fixr v1.0.0
# by Tyler Wolff, tylerwolff.com
# Copyright (c) 2013 Tyler Wolff. All rights reserved.
do ($ = jQuery, window, document) ->

  defaults =
    fixedClass: 'fixed'
    offset: 0
    resize: false

  class Plugin
    constructor: (@element, options) ->
      @settings = $.extend {}, defaults, options
      @init()

    init: ->
      @el = $(@element)
      @el.width @el.width()
      @elOffset = @el.offset().top - @settings.offset
      @fixMenu()
      @setupSpacing()

      $(window).scroll => @fixMenu()

      if @settings.resize
        $(window).resize =>
          width = @el.css({ 'position': 'static', 'width': 'auto' }).width()
          @el.width width
          @fixMenu()

    setupSpacing: ->
      spacer = $('<div></div>').height @el.outerHeight()
      @el.after spacer

    fixMenu: ->
      scrollOffset = $(window).scrollTop()
      if scrollOffset >= @elOffset
        @el.css({ 'position': 'fixed', 'top': @settings.offset }).addClass @settings.fixedClass
      else
        @el.css({ 'position': 'absolute', 'top': (@elOffset + @settings.offset) }).removeClass @settings.fixedClass

  $.fn.fixr = (options) ->
    @each ->
      if !$.data(@, "plugin_fixr")
        $.data(@, "plugin_fixr", new Plugin(@, options))

