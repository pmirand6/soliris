/**
 * DevExtreme (ui/diagram/ui.diagram.toolbar.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var _renderer = require("../../core/renderer");
var _renderer2 = _interopRequireDefault(_renderer);
var _diagram = require("./diagram.panel");
var _diagram2 = _interopRequireDefault(_diagram);
var _toolbar = require("../toolbar");
var _toolbar2 = _interopRequireDefault(_toolbar);
var _context_menu = require("../context_menu");
var _context_menu2 = _interopRequireDefault(_context_menu);
var _uiDiagram = require("./ui.diagram.commands");
var _uiDiagram2 = _interopRequireDefault(_uiDiagram);
var _diagram_bar = require("./diagram_bar");
var _diagram_bar2 = _interopRequireDefault(_diagram_bar);
var _extend = require("../../core/utils/extend");
var _message = require("../../localization/message");
var _message2 = _interopRequireDefault(_message);
require("../select_box");
require("../color_box");
require("../check_box");

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
var ACTIVE_FORMAT_CLASS = "dx-format-active";
var TOOLBAR_CLASS = "dx-diagram-toolbar";
var WIDGET_COMMANDS = [{
    command: "options",
    icon: "preferences",
    hint: _message2.default.format("dxDiagram-commandProperties"),
    text: _message2.default.format("dxDiagram-commandProperties")
}];
var TOOLBAR_SEPARATOR_CLASS = "dx-diagram-toolbar-separator";
var TOOLBAR_MENU_SEPARATOR_CLASS = "dx-diagram-toolbar-menu-separator";
var DiagramToolbar = function(_DiagramPanel) {
    _inherits(DiagramToolbar, _DiagramPanel);
    var _super = _createSuper(DiagramToolbar);

    function DiagramToolbar() {
        _classCallCheck(this, DiagramToolbar);
        return _super.apply(this, arguments)
    }
    _createClass(DiagramToolbar, [{
        key: "_init",
        value: function() {
            this.bar = new ToolbarDiagramBar(this);
            this._itemHelpers = {};
            this._contextMenus = [];
            this._createOnWidgetCommand();
            _get(_getPrototypeOf(DiagramToolbar.prototype), "_init", this).call(this)
        }
    }, {
        key: "_initMarkup",
        value: function() {
            _get(_getPrototypeOf(DiagramToolbar.prototype), "_initMarkup", this).call(this);
            var $toolbar = (0, _renderer2.default)("<div>").addClass(TOOLBAR_CLASS).appendTo(this._$element);
            this._renderToolbar($toolbar)
        }
    }, {
        key: "_renderToolbar",
        value: function($toolbar) {
            var commands = _uiDiagram2.default.getToolbarCommands(this.option("commands"));
            var widgetCommandNames = this.option("widgetCommandNames") || [];
            var widgetCommands = WIDGET_COMMANDS.filter(function(c) {
                return widgetCommandNames.indexOf(c.command) > -1
            });
            var dataSource = this._prepareToolbarItems(commands, "before", this._execDiagramCommand);
            dataSource = dataSource.concat(this._prepareToolbarItems(widgetCommands, "after", this._execWidgetCommand));
            this._toolbarInstance = this._createComponent($toolbar, _toolbar2.default, {
                dataSource: dataSource
            })
        }
    }, {
        key: "_prepareToolbarItems",
        value: function(items, location, actionHandler) {
            var _this = this;
            return items.map(function(item) {
                return (0, _extend.extend)(true, {
                    location: location,
                    locateInMenu: "auto"
                }, _this._createItem(item, location, actionHandler), _this._createItemOptions(item), _this._createItemActionOptions(item, actionHandler))
            })
        }
    }, {
        key: "_createItem",
        value: function(item, location, actionHandler) {
            var _this2 = this;
            if ("separator" === item.widget) {
                return {
                    template: function(data, index, element) {
                        (0, _renderer2.default)(element).addClass(TOOLBAR_SEPARATOR_CLASS)
                    },
                    menuItemTemplate: function(data, index, element) {
                        (0, _renderer2.default)(element).addClass(TOOLBAR_MENU_SEPARATOR_CLASS)
                    }
                }
            }
            return {
                widget: item.widget || "dxButton",
                cssClass: item.cssClass,
                options: {
                    stylingMode: "text",
                    text: item.text,
                    hint: item.hint,
                    icon: item.icon,
                    onInitialized: function(e) {
                        return _this2._onItemInitialized(e.component, item)
                    },
                    onContentReady: function(e) {
                        return _this2._onItemContentReady(e.component, item, actionHandler)
                    }
                }
            }
        }
    }, {
        key: "_createItemOptions",
        value: function(_ref) {
            var widget = _ref.widget,
                items = _ref.items,
                valueExpr = _ref.valueExpr,
                displayExpr = _ref.displayExpr,
                showText = _ref.showText,
                hint = _ref.hint,
                icon = _ref.icon;
            if ("dxSelectBox" === widget) {
                return this._createSelectBoxItemOptions(hint, items, valueExpr, displayExpr)
            } else {
                if ("dxColorBox" === widget) {
                    return this._createColorBoxItemOptions(hint, icon)
                } else {
                    if (!widget || "dxButton" === widget) {
                        return {
                            showText: showText || "inMenu"
                        }
                    }
                }
            }
        }
    }, {
        key: "_createSelectBoxItemOptions",
        value: function(hint, items, valueExpr, displayExpr) {
            var options = this._createSelectBoxBaseItemOptions(hint);
            if (items) {
                options = (0, _extend.extend)(true, options, {
                    options: {
                        items: items,
                        displayExpr: displayExpr,
                        valueExpr: valueExpr
                    }
                })
            } else {
                options = (0, _extend.extend)(true, options, {
                    options: {
                        dataSource: items,
                        displayExpr: "title",
                        valueExpr: "value"
                    }
                })
            }
            var isSelectButton = items && items.every(function(i) {
                return void 0 !== i.icon
            });
            if (isSelectButton) {
                options = (0, _extend.extend)(true, options, {
                    options: {
                        fieldTemplate: function(data, container) {
                            (0, _renderer2.default)("<i>").addClass(data && data.icon).appendTo(container);
                            (0, _renderer2.default)("<div>").dxTextBox({
                                readOnly: true,
                                stylingMode: "outlined"
                            }).appendTo(container)
                        },
                        itemTemplate: function(data) {
                            return '<i class="'.concat(data.icon, '"').concat(data.hint && ' title="'.concat(data.hint), '"}></i>')
                        }
                    }
                })
            }
            return options
        }
    }, {
        key: "_createColorBoxItemOptions",
        value: function(hint, icon) {
            var options = this._createSelectBoxBaseItemOptions(hint);
            if (icon) {
                options = (0, _extend.extend)(true, options, {
                    options: {
                        openOnFieldClick: true,
                        fieldTemplate: function(data, container) {
                            (0, _renderer2.default)("<i>").addClass(icon).css("borderBottomColor", data).appendTo(container);
                            (0, _renderer2.default)("<div>").dxTextBox({
                                readOnly: true,
                                stylingMode: "outlined"
                            }).appendTo(container)
                        }
                    }
                })
            }
            return options
        }
    }, {
        key: "_createSelectBoxBaseItemOptions",
        value: function(hint) {
            return {
                options: {
                    stylingMode: "filled",
                    hint: hint
                }
            }
        }
    }, {
        key: "_createItemActionOptions",
        value: function(item, handler) {
            var _this3 = this;
            switch (item.widget) {
                case "dxSelectBox":
                case "dxColorBox":
                case "dxCheckBox":
                    return {
                        options: {
                            onValueChanged: function(e) {
                                var parameter = _this3._getExecCommandParameter(item, e.component.option("value"));
                                handler.call(_this3, item.command, parameter)
                            }
                        }
                    };
                default:
                    if (!item.items) {
                        return {
                            options: {
                                onClick: function(e) {
                                    var parameter = _this3._getExecCommandParameter(item);
                                    handler.call(_this3, item.command, parameter)
                                }
                            }
                        }
                    }
            }
        }
    }, {
        key: "_getExecCommandParameter",
        value: function(item, widgetValue) {
            if (item.getParameter) {
                return item.getParameter(this, widgetValue)
            }
            return widgetValue
        }
    }, {
        key: "_onItemInitialized",
        value: function(widget, item) {
            if (void 0 !== item.command) {
                this._itemHelpers[item.command] = new ToolbarItemHelper(widget)
            }
        }
    }, {
        key: "_onItemContentReady",
        value: function(widget, item, actionHandler) {
            var _this4 = this;
            if ("dxButton" === widget.NAME && item.items) {
                var $menuContainer = (0, _renderer2.default)("<div>").appendTo(this.$element());
                this._createComponent($menuContainer, _context_menu2.default, {
                    dataSource: item.items,
                    displayExpr: "text",
                    valueExpr: "command",
                    target: widget.$element(),
                    showEvent: "dxclick",
                    position: {
                        at: "left bottom"
                    },
                    onItemClick: function(_ref2) {
                        var itemData = _ref2.itemData;
                        if (void 0 !== itemData.command) {
                            var parameter = _this4._getExecCommandParameter(itemData);
                            actionHandler.call(_this4, itemData.command, parameter)
                        }
                    },
                    onInitialized: function(_ref3) {
                        var component = _ref3.component;
                        return _this4._onContextMenuInitialized(component, item, widget)
                    },
                    onDisposing: function(_ref4) {
                        var component = _ref4.component;
                        return _this4._onContextMenuDisposing(component, item)
                    }
                })
            }
        }
    }, {
        key: "_onContextMenuInitialized",
        value: function(widget, item, rootButton) {
            this._contextMenus.push(widget);
            this._addContextMenuHelper(item.items, widget, [], rootButton)
        }
    }, {
        key: "_addContextMenuHelper",
        value: function(items, widget, indexPath, rootButton) {
            var _this5 = this;
            if (items) {
                items.forEach(function(item, index) {
                    var itemIndexPath = indexPath.concat(index);
                    _this5._itemHelpers[item.command] = new ContextMenuItemHelper(widget, itemIndexPath, rootButton);
                    _this5._addContextMenuHelper(item.items, widget, itemIndexPath, rootButton)
                })
            }
        }
    }, {
        key: "_onContextMenuDisposing",
        value: function(widget, item) {
            this._contextMenus = this._contextMenus.filter(function(cm) {
                return cm !== widget
            })
        }
    }, {
        key: "_execDiagramCommand",
        value: function(command, value) {
            if (!this._updateLocked) {
                this.bar.raiseBarCommandExecuted(command, value)
            }
        }
    }, {
        key: "_execWidgetCommand",
        value: function(command) {
            if (!this._updateLocked) {
                this._onWidgetCommandAction({
                    name: command
                })
            }
        }
    }, {
        key: "_createOnWidgetCommand",
        value: function() {
            this._onWidgetCommandAction = this._createActionByOption("onWidgetCommand")
        }
    }, {
        key: "_setItemEnabled",
        value: function(command, enabled) {
            if (command in this._itemHelpers) {
                this._itemHelpers[command].setEnabled(enabled)
            }
        }
    }, {
        key: "_setEnabled",
        value: function(enabled) {
            this._toolbarInstance.option("disabled", !enabled);
            this._contextMenus.forEach(function(cm) {
                return cm.option("disabled", !enabled)
            })
        }
    }, {
        key: "_setItemValue",
        value: function(command, value) {
            try {
                this._updateLocked = true;
                if (command in this._itemHelpers) {
                    this._itemHelpers[command].setValue(value)
                }
            } finally {
                this._updateLocked = false
            }
        }
    }, {
        key: "_setItemSubItems",
        value: function(command, items) {
            this._updateLocked = true;
            if (command in this._itemHelpers) {
                this._itemHelpers[command].setItems(items)
            }
            this._updateLocked = false
        }
    }, {
        key: "_optionChanged",
        value: function(args) {
            switch (args.name) {
                case "onWidgetCommand":
                    this._createOnWidgetCommand();
                    break;
                case "commands":
                    this._invalidate();
                    break;
                case "export":
                    break;
                default:
                    _get(_getPrototypeOf(DiagramToolbar.prototype), "_optionChanged", this).call(this, args)
            }
        }
    }, {
        key: "_getDefaultOptions",
        value: function() {
            return (0, _extend.extend)(_get(_getPrototypeOf(DiagramToolbar.prototype), "_getDefaultOptions", this).call(this), {
                "export": {
                    fileName: "Diagram",
                    proxyUrl: void 0
                }
            })
        }
    }]);
    return DiagramToolbar
}(_diagram2.default);
var ToolbarDiagramBar = function(_DiagramBar) {
    _inherits(ToolbarDiagramBar, _DiagramBar);
    var _super2 = _createSuper(ToolbarDiagramBar);

    function ToolbarDiagramBar() {
        _classCallCheck(this, ToolbarDiagramBar);
        return _super2.apply(this, arguments)
    }
    _createClass(ToolbarDiagramBar, [{
        key: "getCommandKeys",
        value: function() {
            return this.getKeys(_uiDiagram2.default.getToolbarCommands())
        }
    }, {
        key: "getKeys",
        value: function(items) {
            var _this6 = this;
            return items.reduce(function(commands, item) {
                if (void 0 !== item.command) {
                    commands.push(item.command)
                }
                if (item.items) {
                    commands = commands.concat(_this6.getKeys(item.items))
                }
                return commands
            }, [])
        }
    }, {
        key: "setItemValue",
        value: function(key, value) {
            this._owner._setItemValue(key, value)
        }
    }, {
        key: "setItemEnabled",
        value: function(key, enabled) {
            this._owner._setItemEnabled(key, enabled)
        }
    }, {
        key: "setEnabled",
        value: function(enabled) {
            this._owner._setEnabled(enabled)
        }
    }, {
        key: "setItemSubItems",
        value: function(key, items) {
            this._owner._setItemSubItems(key, items)
        }
    }]);
    return ToolbarDiagramBar
}(_diagram_bar2.default);
var ToolbarItemHelper = function() {
    function ToolbarItemHelper(widget) {
        _classCallCheck(this, ToolbarItemHelper);
        this._widget = widget
    }
    _createClass(ToolbarItemHelper, [{
        key: "setEnabled",
        value: function(enabled) {
            this._widget.option("disabled", !enabled)
        }
    }, {
        key: "setValue",
        value: function(value) {
            if ("value" in this._widget.option()) {
                this._widget.option("value", value)
            } else {
                if (void 0 !== value) {
                    this._widget.$element().toggleClass(ACTIVE_FORMAT_CLASS, value)
                }
            }
        }
    }, {
        key: "setItems",
        value: function(items) {
            if ("items" in this._widget.option()) {
                this._widget.option("items", items.map(function(item) {
                    var value = "object" === _typeof(item.value) ? JSON.stringify(item.value) : item.value;
                    return {
                        value: value,
                        title: item.text
                    }
                }))
            }
        }
    }]);
    return ToolbarItemHelper
}();
var ContextMenuItemHelper = function(_ToolbarItemHelper) {
    _inherits(ContextMenuItemHelper, _ToolbarItemHelper);
    var _super3 = _createSuper(ContextMenuItemHelper);

    function ContextMenuItemHelper(widget, indexPath, rootButton) {
        var _this7;
        _classCallCheck(this, ContextMenuItemHelper);
        _this7 = _super3.call(this, widget);
        _this7._indexPath = indexPath;
        _this7._rootButton = rootButton;
        return _this7
    }
    _createClass(ContextMenuItemHelper, [{
        key: "setEnabled",
        value: function(enabled) {
            var optionText = this._indexPath.reduce(function(r, i) {
                return r + "items[".concat(i, "].")
            }, "") + "disabled";
            this._widget.option(optionText, !enabled);
            var rootEnabled = this._hasEnabledCommandItems(this._widget.option("items"));
            this._rootButton.option("disabled", !rootEnabled)
        }
    }, {
        key: "_hasEnabledCommandItems",
        value: function(items) {
            var _this8 = this;
            if (items) {
                return items.some(function(item) {
                    return void 0 !== item.command && !item.disabled || _this8._hasEnabledCommandItems(item.items)
                })
            }
            return false
        }
    }, {
        key: "setValue",
        value: function(value) {}
    }]);
    return ContextMenuItemHelper
}(ToolbarItemHelper);
module.exports = DiagramToolbar;
