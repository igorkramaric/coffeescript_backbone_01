window.ListView = Backbone.View.extend
  el: "body"

  initialize: ->
    alert "hiyak"
    _.bindAll @
    @render()

  render: ->
    a = "tatek"
    $(@el).append '<ul><li>Hello, Backbone:' + @param + '!</li></ul>'
    $(@el).append "<ul><li>Hello, Backbone: #{a}!</li></ul>"
    alert "Backbone: #{a} and #{@param}"

$ ->
  some_var = new ListView
  alert "hey!"

somefunc: () ->
  alert("ok this is doc load BB")
  $("body").append("<ul><li>Some text within li</li></ul>")
  $("body ul").append("<li>Some text added again in li</li>")
  $("body ul").prepend("<li>Some text added in li FIRST</li>")

#alert "YES, im first!"



