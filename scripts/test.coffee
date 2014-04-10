$ ->
  alert("ok this is doc load")
  imready( "Some text" )

imready = (to_show)-> alert "Using anonymous function to show: " + to_show

a = (c) -> c=1

