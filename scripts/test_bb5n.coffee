jQuery ->

  Backbone.sync = (method, model, success, error) ->
    success()

  class Item extends Backbone.Model
    defaults:
      part1: 'hello'
      part2: 'world'

  class List extends Backbone.Collection
    model: Item


  class ItemView extends Backbone.View
    tagName: 'li'

    events:
      'click span.swap': 'swap'
      'click span.delete': 'remove'

    initialize: ->
      _.bindAll @, 'render', 'unrender', 'swap', 'remove'

      @model.bind 'change', @render
      @model.bind 'remove', @unrender

    render: ->
      $(@el).html '<span style="color:black;">'+@model.get('part1')+' '+@model.get('part2')+'</span> &nbsp; &nbsp; <span class="swap" style="font-family:sans-serif; color:blue; cursor:pointer;">[swap]</span> <span class="delete" style="cursor:pointer; color:red; font-family:sans-serif;">[delete]</span>'
      @

    unrender: ->
      $(@el).remove()

    swap: ->
      swapped =
        part1: this.model.get 'part2'
        part2: this.model.get 'part1'

      @model.set swapped

    remove: ->
      this.model.destroy()


  class ListView extends Backbone.View
    el: $('body')

    events:
      'click button#add': 'addItem'

    initialize: ->

      _.bindAll @, 'render', 'addItem', 'appendItem'

      @collection = new List

      # old way
      #@collection.bind 'add', @appendItem

      @listenTo @collection, 'add', @appendItem

      @counter = 0
      @render()

    render: ->
      $(@el).append "<button id='add'>Add list item</button>"
      $(@el).append "<ul></ul>"
      _(@collection.models).each (item) -> appendItem item, @

    addItem: ->
      @counter++
      item = new Item
      item.set part2: item.get('part2') + this.counter
      @collection.add item

    appendItem: (item) ->
      itemView = new ItemView model: item
      $('ul', @el).append itemView.render().el


  listView = new ListView

#$ ->
#
#  class Item extends Backbone.Model
#    defaults:
#      part1: "Hello"
#      part2: "World"
#
#  class List extends Backbone.Collection
#    model: Item
#
#  class ItemView extends Backbone.View
#    tagName: 'li'
#
#    initialize: ->
#      _.bindAll @
#
#    render: ->
#      $(@el).html "<a><span>#{@model.get 'part1'} #{@model.get 'part2'}</span></a>"
#      $(@el).find('a').attr("href", "http://www.google.com/")
#      @
#
#
#  class ListView extends Backbone.View
#
#    el: $ 'body'
#
#    initialize: ->
#      _.bindAll @
#
#      @collection = new List
#
#      # old way?
#      @collection.bind "add", @appenditem
#
#
#      #@listenTo @collection, "add", ()-> alert("hura!") #@appenditem
#
#      @counter = 0
#      @render()
#      @additem()
#
#
#
#    # this name is not important, render is just a convention
#    render: ->
#      $(@el).append '<button>Press me!</button>'
#      $(@el).append '<ul></ul>'
#
#    events:
#      "click button":"additem"
#
#    additem: ->
#      @counter++
#      item = new Item()
#      item.set part2: "#{item.get 'part2'} #{@counter}"
#      item.set part1: "#{@param} #{item.get 'part1'} #{Math.floor(Math.random() * 100)}"
#      @collection.add item
#      alert "add item"
#
#
#    appenditem: (item) ->
#      item_view = new ItemView model:item
#      $("ul").append item_view.render().el



#  list_view = new ListView()





