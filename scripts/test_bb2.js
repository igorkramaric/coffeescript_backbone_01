// Generated by CoffeeScript 1.7.1
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  jQuery(function() {
    var ListView, list_view;
    ListView = (function(_super) {
      __extends(ListView, _super);

      function ListView() {
        return ListView.__super__.constructor.apply(this, arguments);
      }

      ListView.prototype.el = $('body');

      ListView.prototype.initialize = function(param) {
        this.param = param;
        _.bindAll(this);
        this.counter = 0;
        return this.Customrender();
      };

      ListView.prototype.Customrender = function() {
        $(this.el).append('<button>Press me!</button>');
        return $(this.el).append('<ul></ul>');
      };

      ListView.prototype.additem = function() {
        this.counter++;
        return $("ul").append("<li>Some item " + this.param + " " + this.counter + "</li>");
      };

      ListView.prototype.events = {
        "click": "additem"
      };

      return ListView;

    })(Backbone.View);
    return list_view = new ListView("Strasni vuuuk");
  });

}).call(this);