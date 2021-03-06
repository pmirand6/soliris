/**
 * DevExtreme (ui/gantt/ui.gantt.contextmenu.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var _context_menu = require("../context_menu");
var _context_menu2 = _interopRequireDefault(_context_menu);

function _interopRequireDefault(obj) {
    return obj && obj.__esModule ? obj : {
        "default": obj
    }
}

function _classCallCheck(instance, Constructor) {
    if (!(instance instanceof Constructor)) {
        throw new TypeError("Cannot call a class as a function")
    }
}

function _defineProperties(target, props) {
    for (var i = 0; i < props.length; i++) {
        var descriptor = props[i];
        descriptor.enumerable = descriptor.enumerable || false;
        descriptor.configurable = true;
        if ("value" in descriptor) {
            descriptor.writable = true
        }
        Object.defineProperty(target, descriptor.key, descriptor)
    }
}

function _createClass(Constructor, protoProps, staticProps) {
    if (protoProps) {
        _defineProperties(Constructor.prototype, protoProps)
    }
    if (staticProps) {
        _defineProperties(Constructor, staticProps)
    }
    return Constructor
}
var GanttContextMenuBar = function() {
    function GanttContextMenuBar(element, owner) {
        _classCallCheck(this, GanttContextMenuBar);
        this._element = element;
        this._owner = owner;
        this._createControl()
    }
    _createClass(GanttContextMenuBar, [{
        key: "_createControl",
        value: function() {
            var _this = this;
            this._createItems();
            this._menu = this._owner._createComponent(this._element, _context_menu2.default, {
                showEvent: void 0,
                items: this._items,
                onItemClick: function(e) {
                    var commandId = e.itemData.commandId;
                    if (void 0 !== commandId) {
                        _this._owner._executeCoreCommand(e.itemData.commandId)
                    }
                }
            })
        }
    }, {
        key: "_createItems",
        value: function() {
            var commandIds = {
                createTask: 0,
                createSubTask: 1,
                removeTask: 2,
                removeDependency: 3,
                showTasksDialog: 4,
                addTask: 5
            };
            this._items = [{
                text: "Add",
                commandId: commandIds.addTask,
                items: [{
                    text: "New Task",
                    commandId: commandIds.createTask
                }, {
                    text: "New Subtask",
                    commandId: commandIds.createSubTask
                }]
            }, {
                text: "Task Details...",
                commandId: commandIds.showTasksDialog
            }, {
                text: "Remove Task",
                commandId: commandIds.removeTask
            }, {
                text: "Remove Dependency",
                commandId: commandIds.removeDependency
            }]
        }
    }, {
        key: "getCommandKeys",
        value: function() {
            var itemsCache = this._getItemsCache();
            var result = [];
            for (var itemKey in itemsCache) {
                result.push(parseInt(itemKey))
            }
            return result
        }
    }, {
        key: "setItemEnabled",
        value: function(key, enabled) {
            var itemsCache = this._getItemsCache();
            itemsCache[key].forEach(function(item) {
                item.disabled = !enabled
            })
        }
    }, {
        key: "setItemVisible",
        value: function(key, visible) {
            var itemsCache = this._getItemsCache();
            itemsCache[key].forEach(function(item) {
                item.visible = visible
            })
        }
    }, {
        key: "setItemValue",
        value: function(_key, _value) {}
    }, {
        key: "setEnabled",
        value: function(enabled) {
            this._menu.option("disabled", !enabled)
        }
    }, {
        key: "updateItemsList",
        value: function() {}
    }, {
        key: "isVisible",
        value: function() {
            return true
        }
    }, {
        key: "isContextMenu",
        value: function() {
            return true
        }
    }, {
        key: "show",
        value: function(point) {
            this._menu.option("items", this._items);
            this._menu.option("position.offset", {
                x: point.x,
                y: point.y
            });
            this._menu.show()
        }
    }, {
        key: "_getItemsCache",
        value: function() {
            if (!this._cache) {
                this._cache = {};
                this._fillCache(this._items)
            }
            return this._cache
        }
    }, {
        key: "_fillCache",
        value: function(items) {
            var _this2 = this;
            items.forEach(function(item) {
                var key = item.commandId;
                if (void 0 !== key) {
                    if (!_this2._cache[key]) {
                        _this2._cache[key] = []
                    }
                    _this2._cache[key].push(item)
                }
                if (item.items) {
                    _this2._fillCache(item.items)
                }
            })
        }
    }]);
    return GanttContextMenuBar
}();
module.exports = GanttContextMenuBar;
