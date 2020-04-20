/**
 * DevExtreme (ui/file_manager/ui.file_manager.item_list.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var _extend = require("../../core/utils/extend");
var _double_click = require("../../events/double_click");
var _utils = require("../../events/utils");
var _events_engine = require("../../events/core/events_engine");
var _events_engine2 = _interopRequireDefault(_events_engine);
var _icon = require("../../core/utils/icon");
var _ui = require("../widget/ui.widget");
var _ui2 = _interopRequireDefault(_ui);

function _interopRequireDefault(obj) {
    return obj && obj.__esModule ? obj : {
        "default": obj
    }
}

function _typeof(obj) {
    "@babel/helpers - typeof";
    if ("function" === typeof Symbol && "symbol" === typeof Symbol.iterator) {
        _typeof = function(obj) {
            return typeof obj
        }
    } else {
        _typeof = function(obj) {
            return obj && "function" === typeof Symbol && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj
        }
    }
    return _typeof(obj)
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

function _get(target, property, receiver) {
    if ("undefined" !== typeof Reflect && Reflect.get) {
        _get = Reflect.get
    } else {
        _get = function(target, property, receiver) {
            var base = _superPropBase(target, property);
            if (!base) {
                return
            }
            var desc = Object.getOwnPropertyDescriptor(base, property);
            if (desc.get) {
                return desc.get.call(receiver)
            }
            return desc.value
        }
    }
    return _get(target, property, receiver || target)
}

function _superPropBase(object, property) {
    while (!Object.prototype.hasOwnProperty.call(object, property)) {
        object = _getPrototypeOf(object);
        if (null === object) {
            break
        }
    }
    return object
}

function _createSuper(Derived) {
    return function() {
        var result, Super = _getPrototypeOf(Derived);
        if (_isNativeReflectConstruct()) {
            var NewTarget = _getPrototypeOf(this).constructor;
            result = Reflect.construct(Super, arguments, NewTarget)
        } else {
            result = Super.apply(this, arguments)
        }
        return _possibleConstructorReturn(this, result)
    }
}

function _possibleConstructorReturn(self, call) {
    if (call && ("object" === _typeof(call) || "function" === typeof call)) {
        return call
    }
    return _assertThisInitialized(self)
}

function _assertThisInitialized(self) {
    if (void 0 === self) {
        throw new ReferenceError("this hasn't been initialised - super() hasn't been called")
    }
    return self
}

function _isNativeReflectConstruct() {
    if ("undefined" === typeof Reflect || !Reflect.construct) {
        return false
    }
    if (Reflect.construct.sham) {
        return false
    }
    if ("function" === typeof Proxy) {
        return true
    }
    try {
        Date.prototype.toString.call(Reflect.construct(Date, [], function() {}));
        return true
    } catch (e) {
        return false
    }
}

function _getPrototypeOf(o) {
    _getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf : function(o) {
        return o.__proto__ || Object.getPrototypeOf(o)
    };
    return _getPrototypeOf(o)
}

function _inherits(subClass, superClass) {
    if ("function" !== typeof superClass && null !== superClass) {
        throw new TypeError("Super expression must either be null or a function")
    }
    subClass.prototype = Object.create(superClass && superClass.prototype, {
        constructor: {
            value: subClass,
            writable: true,
            configurable: true
        }
    });
    if (superClass) {
        _setPrototypeOf(subClass, superClass)
    }
}

function _setPrototypeOf(o, p) {
    _setPrototypeOf = Object.setPrototypeOf || function(o, p) {
        o.__proto__ = p;
        return o
    };
    return _setPrototypeOf(o, p)
}
var FILE_MANAGER_FILES_VIEW_CLASS = "dx-filemanager-files-view";
var FILE_MANAGER_ITEM_LIST_ITEM_OPEN_EVENT_NAMESPACE = "dxFileManager_open";
var FileManagerItemListBase = function(_Widget) {
    _inherits(FileManagerItemListBase, _Widget);
    var _super = _createSuper(FileManagerItemListBase);

    function FileManagerItemListBase() {
        _classCallCheck(this, FileManagerItemListBase);
        return _super.apply(this, arguments)
    }
    _createClass(FileManagerItemListBase, [{
        key: "_initMarkup",
        value: function() {
            this._initActions();
            this.$element().addClass(FILE_MANAGER_FILES_VIEW_CLASS);
            var dblClickEventName = (0, _utils.addNamespace)(_double_click.name, FILE_MANAGER_ITEM_LIST_ITEM_OPEN_EVENT_NAMESPACE);
            _events_engine2.default.on(this.$element(), dblClickEventName, this._getItemSelector(), this._onItemDblClick.bind(this));
            _get(_getPrototypeOf(FileManagerItemListBase.prototype), "_initMarkup", this).call(this)
        }
    }, {
        key: "_initActions",
        value: function() {
            this._actions = {
                onError: this._createActionByOption("onError"),
                onSelectionChanged: this._createActionByOption("onSelectionChanged"),
                onSelectedItemOpened: this._createActionByOption("onSelectedItemOpened")
            }
        }
    }, {
        key: "_getDefaultOptions",
        value: function() {
            return (0, _extend.extend)(_get(_getPrototypeOf(FileManagerItemListBase.prototype), "_getDefaultOptions", this).call(this), {
                selectionMode: "single",
                contextMenu: null,
                getItems: null,
                getItemThumbnail: null,
                onError: null,
                onSelectionChanged: null,
                onSelectedItemOpened: null
            })
        }
    }, {
        key: "_optionChanged",
        value: function(args) {
            var name = args.name;
            switch (name) {
                case "selectionMode":
                case "contextMenu":
                case "getItems":
                case "getItemThumbnail":
                    this.repaint();
                    break;
                case "onError":
                case "onSelectedItemOpened":
                case "onSelectionChanged":
                    this._actions[name] = this._createActionByOption(name);
                    break;
                default:
                    _get(_getPrototypeOf(FileManagerItemListBase.prototype), "_optionChanged", this).call(this, args)
            }
        }
    }, {
        key: "_getItems",
        value: function() {
            var itemsGetter = this.option("getItems");
            return itemsGetter ? itemsGetter() : []
        }
    }, {
        key: "_raiseOnError",
        value: function(error) {
            this._actions.onError({
                error: error
            })
        }
    }, {
        key: "_raiseSelectionChanged",
        value: function() {
            this._actions.onSelectionChanged()
        }
    }, {
        key: "_raiseSelectedItemOpened",
        value: function(fileItemInfo) {
            this._actions.onSelectedItemOpened({
                fileItemInfo: fileItemInfo
            })
        }
    }, {
        key: "_getItemThumbnail",
        value: function(fileInfo) {
            var itemThumbnailGetter = this.option("getItemThumbnail");
            return itemThumbnailGetter ? itemThumbnailGetter(fileInfo) : {
                thumbnail: ""
            }
        }
    }, {
        key: "_getItemThumbnailContainer",
        value: function(fileInfo) {
            var _this$_getItemThumbna = this._getItemThumbnail(fileInfo),
                thumbnail = _this$_getItemThumbna.thumbnail,
                cssClass = _this$_getItemThumbna.cssClass;
            var $itemThumbnail = (0, _icon.getImageContainer)(thumbnail).addClass(this._getItemThumbnailCssClass());
            if (cssClass) {
                $itemThumbnail.addClass(cssClass)
            }
            return $itemThumbnail
        }
    }, {
        key: "_getItemThumbnailCssClass",
        value: function() {
            return ""
        }
    }, {
        key: "_getItemSelector",
        value: function() {}
    }, {
        key: "_onItemDblClick",
        value: function(e) {}
    }, {
        key: "_showContextMenu",
        value: function(items, element, offset) {
            this._contextMenu.showAt(items, element, offset)
        }
    }, {
        key: "refresh",
        value: function() {}
    }, {
        key: "getSelectedItems",
        value: function() {}
    }, {
        key: "clearSelection",
        value: function() {}
    }, {
        key: "selectItem",
        value: function() {}
    }, {
        key: "_contextMenu",
        get: function() {
            return this.option("contextMenu")
        }
    }]);
    return FileManagerItemListBase
}(_ui2.default);
module.exports = FileManagerItemListBase;
