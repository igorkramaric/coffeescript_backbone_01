jQuery ->

  class Item extends Backbone.Model
    defaults:
      part1: "Hello"
      part2: "World"

  class List extends Backbone.Collection
    model: Item

  class ListView extends Backbone.View

    el: $ 'body'

    initialize: (@param)->
      _.bindAll @


      @collection = new List
      @collection.bind "add", @appenditem

      @counter = 0
      @render()

    # this name is not important, render is just a convention
    render: ->
      $(@el).append '<button>Press me!</button>'
      $(@el).append '<ul></ul>'
      @additem()

    additem: ->

      @counter++
      item = new Item()
      item.set part2: "#{item.get 'part2'} #{@counter}"
      item.set part1: "#{item.get 'part1'} #{Math.floor(Math.random() * 100)}"
      @collection.add item

    appenditem: (item) ->
      $("ul").append "Len:#{@.length } <li>#{item.get 'part1'} #{item.get 'part2'} !</li>"
#    works great too - notice fat arrow
#    appenditem: (item) =>
#      $("ul").append "Len:#{@collection.length } <li>#{item.get 'part1'} #{item.get 'part2'} !</li>"

    # add here click button later
    events: "click":"additem"

  alert "hey"
  list_view = new ListView("Divlja svinja")





