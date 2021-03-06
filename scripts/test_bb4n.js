// Generated by CoffeeScript 1.7.1
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  jQuery(function() {
    var Item, ItemView, List, ListView, list_view;
    Backbone.sync = function(method, model, success, error) {
      return success();
    };
    Item = (function(_super) {
      __extends(Item, _super);

      function Item() {
        return Item.__super__.constructor.apply(this, arguments);
      }

      Item.prototype.defaults = {
        part1: "Hello",
        part2: "World"
      };

      return Item;

    })(Backbone.Model);
    List = (function(_super) {
      __extends(List, _super);

      function List() {
        return List.__super__.constructor.apply(this, arguments);
      }

      List.prototype.model = Item;

      return List;

    })(Backbone.Collection);
    ItemView = (function(_super) {
      __extends(ItemView, _super);

      function ItemView() {
        return ItemView.__super__.constructor.apply(this, arguments);
      }

      ItemView.prototype.tagName = 'li';

      ItemView.prototype.initialize = function() {
        return _.bindAll(this, 'render');
      };

      ItemView.prototype.render = function() {
        $(this.el).html("<a><span>" + (this.model.get('part1')) + " " + (this.model.get('part2')) + "</span></a>");
        $(this.el).find('a').attr("href", "http://www.google.com/");
        return this;
      };

      return ItemView;

    })(Backbone.View);
    ListView = (function(_super) {
      __extends(ListView, _super);

      function ListView() {
        return ListView.__super__.constructor.apply(this, arguments);
      }

      ListView.prototype.el = $('body');

      ListView.prototype.events = {
        "click button": "additem"
      };

      ListView.prototype.initialize = function() {
        var e;
        try {
          _.bindAll(this, 'additem', 'render', 'appenditem');
        } catch (_error) {
          e = _error;
          alert("error is" + e);
        }
        this.collection = new List;
        this.listenTo(this.collection, "add", this.appenditem);
        this.counter = 0;
        return this.render();
      };

      ListView.prototype.render = function() {
        $(this.el).append('<button>Press me!</button>');
        return $(this.el).append('<ul></ul>');
      };

      ListView.prototype.additem = function() {
        var item;
        this.counter++;
        item = new Item;
        item.set({
          part2: "" + (item.get('part2')) + " " + this.counter
        });
        item.set({
          part1: "" + this.param + " " + (item.get('part1')) + " " + (Math.floor(Math.random() * 100))
        });
        return this.collection.add(item);
      };

      ListView.prototype.appenditem = function(item) {
        var item_view;
        item_view = new ItemView({
          model: item
        });
        return $("ul").append(item_view.render().el);
      };

      return ListView;

    })(Backbone.View);
    alert("estoy aqui");
    return list_view = new ListView;
  });

}).call(this);
