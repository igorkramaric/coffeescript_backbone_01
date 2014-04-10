jQuery ->

  class ListView extends Backbone.View

    el: $ 'body'

    initialize: (@param)->
      _.bindAll @
      @counter = 0
      @Customrender()

    # this name is not important, just convenience
    Customrender: ->
      $(@el).append '<button>Press me!</button>'
      $(@el).append '<ul></ul>'

    additem: ->
      @counter++
      $("ul").append "<li>Some item #{@param} #{@counter}</li>"

    events: "click":"additem"

  list_view = new ListView("Strasni vuuuk")





