/**
 * DevExtreme (ui/form/ui.form.items_runtime_info.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
Object.defineProperty(exports, "__esModule", {
    value: true
});
exports.default = void 0;
var _guid = require("../../core/guid");
var _guid2 = _interopRequireDefault(_guid);
var _iterator = require("../../core/utils/iterator");
var _extend = require("../../core/utils/extend");
var _type = require("../../core/utils/type");

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
var FormItemsRunTimeInfo = function() {
    function FormItemsRunTimeInfo() {
        _classCallCheck(this, FormItemsRunTimeInfo);
        this._map = {}
    }
    _createClass(FormItemsRunTimeInfo, [{
        key: "_findWidgetInstance",
        value: function(condition) {
            var result;
            (0, _iterator.each)(this._map, function(guid, _ref) {
                var widgetInstance = _ref.widgetInstance,
                    item = _ref.item;
                if (condition(item)) {
                    result = widgetInstance;
                    return false
                }
            });
            return result
        }
    }, {
        key: "_findFieldByCondition",
        value: function(callback, valueExpr) {
            var result;
            (0, _iterator.each)(this._map, function(key, value) {
                if (callback(value)) {
                    result = "guid" === valueExpr ? key : value[valueExpr];
                    return false
                }
            });
            return result
        }
    }, {
        key: "clear",
        value: function() {
            this._map = {}
        }
    }, {
        key: "removeItemsByItems",
        value: function(itemsRunTimeInfo) {
            var _this = this;
            (0, _iterator.each)(itemsRunTimeInfo.getItems(), function(guid) {
                return _this.removeItemByKey(guid)
            })
        }
    }, {
        key: "removeItemByKey",
        value: function(key) {
            delete this._map[key]
        }
    }, {
        key: "add",
        value: function(options) {
            var key = options.guid || new _guid2.default;
            this._map[key] = options;
            return key
        }
    }, {
        key: "addItemsOrExtendFrom",
        value: function(itemsRunTimeInfo) {
            var _this2 = this;
            itemsRunTimeInfo.each(function(key, itemRunTimeInfo) {
                if (_this2._map[key]) {
                    if (itemRunTimeInfo.widgetInstance) {
                        _this2._map[key].widgetInstance = itemRunTimeInfo.widgetInstance
                    }
                    _this2._map[key].$itemContainer = itemRunTimeInfo.$itemContainer
                } else {
                    _this2.add({
                        item: itemRunTimeInfo.item,
                        widgetInstance: itemRunTimeInfo.widgetInstance,
                        guid: key,
                        $itemContainer: itemRunTimeInfo.$itemContainer
                    })
                }
            })
        }
    }, {
        key: "extendRunTimeItemInfoByKey",
        value: function(key, options) {
            if (this._map[key]) {
                this._map[key] = (0, _extend.extend)(this._map[key], options)
            }
        }
    }, {
        key: "findWidgetInstanceByItem",
        value: function(item) {
            return this._findWidgetInstance(function(storedItem) {
                return storedItem === item
            })
        }
    }, {
        key: "getGroupOrTabLayoutManagerByPath",
        value: function(targetPath) {
            return this._findFieldByCondition(function(_ref2) {
                var path = _ref2.path;
                return path === targetPath
            }, "layoutManager")
        }
    }, {
        key: "getKeyByPath",
        value: function(targetPath) {
            return this._findFieldByCondition(function(_ref3) {
                var path = _ref3.path;
                return path === targetPath
            }, "guid")
        }
    }, {
        key: "getPathFromItem",
        value: function(targetItem) {
            return this._findFieldByCondition(function(_ref4) {
                var item = _ref4.item;
                return item === targetItem
            }, "path")
        }
    }, {
        key: "findWidgetInstanceByName",
        value: function(name) {
            return this._findWidgetInstance(function(item) {
                return name === item.name
            })
        }
    }, {
        key: "findWidgetInstanceByDataField",
        value: function(dataField) {
            return this._findWidgetInstance(function(item) {
                return dataField === ((0, _type.isString)(item) ? item : item.dataField)
            })
        }
    }, {
        key: "findItemContainerByItem",
        value: function(item) {
            for (var key in this._map) {
                if (this._map[key].item === item) {
                    return this._map[key].$itemContainer
                }
            }
            return null
        }
    }, {
        key: "findItemIndexByItem",
        value: function(targetItem) {
            return this._findFieldByCondition(function(_ref5) {
                var item = _ref5.item;
                return item === targetItem
            }, "itemIndex")
        }
    }, {
        key: "getItems",
        value: function() {
            return this._map
        }
    }, {
        key: "each",
        value: function(handler) {
            (0, _iterator.each)(this._map, function(key, itemRunTimeInfo) {
                handler(key, itemRunTimeInfo)
            })
        }
    }, {
        key: "removeItemsByPathStartWith",
        value: function(path) {
            var _this3 = this;
            var keys = Object.keys(this._map);
            var filteredKeys = keys.filter(function(key) {
                return _this3._map[key].path.indexOf(path, 0) > -1
            });
            filteredKeys.forEach(function(key) {
                return _this3.removeItemByKey(key)
            })
        }
    }]);
    return FormItemsRunTimeInfo
}();
exports.default = FormItemsRunTimeInfo;
