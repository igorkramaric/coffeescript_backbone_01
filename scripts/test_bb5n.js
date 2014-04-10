// Generated by CoffeeScript 1.7.1
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  jQuery(function() {
    var Item, ItemView, List, ListView, listView;
    Backbone.sync = function(method, model, success, error) {
      return success();
    };
    Item = (function(_super) {
      __extends(Item, _super);

      function Item() {
        return Item.__super__.constructor.apply(this, arguments);
      }

      Item.prototype.defaults = {
        part1: 'hello',
        part2: 'world'
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

      ItemView.prototype.events = {
        'click span.swap': 'swap',
        'click span.delete': 'remove'
      };

      ItemView.prototype.initialize = function() {
        _.bindAll(this, 'render', 'unrender', 'swap', 'remove');
        this.model.bind('change', this.render);
        return this.model.bind('remove', this.unrender);
      };

      ItemView.prototype.render = function() {
        $(this.el).html('<span style="color:black;">' + this.model.get('part1') + ' ' + this.model.get('part2') + '</span> &nbsp; &nbsp; <span class="swap" style="font-family:sans-serif; color:blue; cursor:pointer;">[swap]</span> <span class="delete" style="cursor:pointer; color:red; font-family:sans-serif;">[delete]</span>');
        return this;
      };

      ItemView.prototype.unrender = function() {
        return $(this.el).remove();
      };

      ItemView.prototype.swap = function() {
        var swapped;
        swapped = {
          part1: this.model.get('part2'),
          part2: this.model.get('part1')
        };
        return this.model.set(swapped);
      };

      ItemView.prototype.remove = function() {
        return this.model.destroy();
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
        'click button#add': 'addItem'
      };

      ListView.prototype.initialize = function() {
        _.bindAll(this, 'render', 'addItem', 'appendItem');
        this.collection = new List;
        this.listenTo(this.collection, 'add', this.appendItem);
        this.counter = 0;
        return this.render();
      };

      ListView.prototype.render = function() {
        $(this.el).append("<button id='add'>Add list item</button>");
        $(this.el).append("<ul></ul>");
        return _(this.collection.models).each(function(item) {
          return appendItem(item, this);
        });
      };

      ListView.prototype.addItem = function() {
        var item;
        this.counter++;
        item = new Item;
        item.set({
          part2: item.get('part2') + this.counter
        });
        return this.collection.add(item);
      };

      ListView.prototype.appendItem = function(item) {
        var itemView;
        itemView = new ItemView({
          model: item
        });
        return $('ul', this.el).append(itemView.render().el);
      };

      return ListView;

    })(Backbone.View);
    return listView = new ListView;
  });

}).call(this);