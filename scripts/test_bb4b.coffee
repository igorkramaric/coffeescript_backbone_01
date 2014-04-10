jQuery ->

  class Item extends Backbone.Model
    defaults:
      part1: "Hello"
      part2: "World"

  class List extends Backbone.Collection
    model: Item

  class ItemView extends Backbone.View
    tagName: 'li'

    initialize: ->
      _.bindAll @

    render: ->
      $(@el).html "<a><span>#{@model.get 'part1'} #{@model.get 'part2'}</span></a>"
      $(@el).find('a').attr("href", "http://www.google.com/")
      @

  class ListView extends Backbone.View

    el: $ 'body'

    initialize: (@param)->
      _.bindAll @

      @collection = new List

      # old way?
      @collection.bind "add", @appenditem


      #@listenTo @collection, "add", ()-> alert("hura!") #@appenditem
      alert "estoy aqui"

      @counter = 0
      @render()
      @additem()


    # this name is not important, render is just a convention
    render: ->
      $(@el).append '<button>Press me!</button>'
      $(@el).append '<ul></ul>'


    additem: ->
      @counter++
      item = new Item()
      item.set part2: "#{item.get 'part2'} #{@counter}"
      item.set part1: "#{@param} #{item.get 'part1'} #{Math.floor(Math.random() * 100)}"
      @collection.add item


    appenditem: (item) ->

      item_view = new ItemView model:item
      $("ul").append item_view.render().el


    # without the button it would be triggered from elsewhere
    events: "click button":"additem"

  list_view = new ListView("Divlja svinja")





