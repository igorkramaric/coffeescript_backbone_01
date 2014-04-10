jQuery ->

  class ListView extends Backbone.View

    el: $ 'body'

    initialize: (@param)->
      _.bindAll @
      @render()

    render: ->
      a = "tatek"
      $(@el).append '<ul><li>Hello, Backbone:' + @param + '!</li></ul>'
      $(@el).append "<ul><li>Hello, Backbone: #{a}!</li></ul>"
      alert "Backbone: #{a} and #{@param}"

  alert "hey!"
  list_view = new ListView("Konjek")


somefunc: () ->
  alert("ok this is doc load BB")
  $("body").append("<ul><li>Some text within li</li></ul>")
  $("body ul").append("<li>Some text added again in li</li>")
  $("body ul").prepend("<li>Some text added in li FIRST</li>")

#alert "YES, im first!"



