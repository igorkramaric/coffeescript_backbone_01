// Generated by CoffeeScript 1.7.1
(function() {
  var a, imready;

  $(function() {
    alert("ok this is doc load");
    return imready("Some text");
  });

  imready = function(to_show) {
    return alert("Using anonymous function to show: " + to_show);
  };

  a = function(c) {
    return c = 1;
  };

}).call(this);
