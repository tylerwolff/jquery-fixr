# jQuery Fixr v1.0.0
# by Tyler Wolff, tylerwolff.com
# Copyright (c) 2013 Tyler Wolff. All rights reserved.
do ($ = jQuery, window, document) ->

  pluginName = "fixr"
  defaults =
    fixedClass: 'fixed'
    offset: 0

  class Plugin
    constructor: (@element, options) ->
      @settings = $.extend {}, defaults, options
      @init()

    init: ->
      @el = $(@element)
      @el.css 'width', @el.width()
      @elOffset = @el.offset().top
      @fixMenu()
      @setupSpacing()
      $(window).scroll => @fixMenu()

    setupSpacing: ->
      spacer = $('<div></div>').height @el.outerHeight()
      @el.after spacer

    fixMenu: ->
      scrollOffset = $(window).scrollTop()
      if scrollOffset >= @elOffset
        @el.css({ 'position': 'fixed', 'top': @settings.offset }).addClass @settings.fixedClass
      else
        @el.css({ 'position': 'absolute', 'top': @elOffset }).removeClass @settings.fixedClass

  $.fn[pluginName] = (options) ->
    @each ->
      if !$.data(@, "plugin_#{pluginName}")
        $.data(@, "plugin_#{pluginName}", new Plugin(@, options))

