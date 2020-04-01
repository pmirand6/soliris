/**
 * DevExtreme (ui/diagram/ui.diagram.rightpanel.js)
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
var _accordion = require("../accordion");
var _accordion2 = _interopRequireDefault(_accordion);
var _form = require("../form");
var _form2 = _interopRequireDefault(_form);
var _uiDiagram = require("./ui.diagram.commands");
var _uiDiagram2 = _interopRequireDefault(_uiDiagram);
var _extend = require("../../core/utils/extend");
var _message = require("../../localization/message");
var _message2 = _interopRequireDefault(_message);
var _diagram_bar = require("./diagram_bar");
var _diagram_bar2 = _interopRequireDefault(_diagram_bar);
var _scroll_view = require("../scroll_view");
var _scroll_view2 = _interopRequireDefault(_scroll_view);
var _deferred = require("../../core/utils/deferred");

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
var DIAGRAM_RIGHT_PANEL_CLASS = "dx-diagram-right-panel";
var DIAGRAM_RIGHT_PANEL_BEGIN_GROUP_CLASS = "dx-diagram-right-panel-begin-group";
var DiagramRightPanel = function(_DiagramPanel) {
    _inherits(DiagramRightPanel, _DiagramPanel);
    var _super = _createSuper(DiagramRightPanel);

    function DiagramRightPanel() {
        _classCallCheck(this, DiagramRightPanel);
        return _super.apply(this, arguments)
    }
    _createClass(DiagramRightPanel, [{
        key: "_init",
        value: function() {
            _get(_getPrototypeOf(DiagramRightPanel.prototype), "_init", this).call(this);
            this.bar = new OptionsDiagramBar(this);
            this._valueConverters = {}
        }
    }, {
        key: "_initMarkup",
        value: function() {
            _get(_getPrototypeOf(DiagramRightPanel.prototype), "_initMarkup", this).call(this);
            this.$element().addClass(DIAGRAM_RIGHT_PANEL_CLASS);
            var $scrollViewWrapper = (0, _renderer2.default)("<div>").appendTo(this.$element());
            this._scrollView = this._createComponent($scrollViewWrapper, _scroll_view2.default);
            var $accordion = (0, _renderer2.default)("<div>").appendTo(this._scrollView.content());
            this._renderAccordion($accordion)
        }
    }, {
        key: "_getAccordionDataSource",
        value: function() {
            return [{
                title: _message2.default.format("dxDiagram-commandProperties"),
                onTemplate: function(widget, $element) {
                    return widget._renderOptions($element)
                }
            }]
        }
    }, {
        key: "_renderAccordion",
        value: function($container) {
            var _this = this;
            this._accordionInstance = this._createComponent($container, _accordion2.default, {
                multiple: true,
                collapsible: true,
                displayExpr: "title",
                dataSource: this._getAccordionDataSource(),
                itemTemplate: function(data, index, $element) {
                    return data.onTemplate(_this, $element)
                },
                onContentReady: function(e) {
                    _this._updateScrollAnimateSubscription(e.component)
                }
            })
        }
    }, {
        key: "_updateScrollAnimateSubscription",
        value: function(component) {
            var _this2 = this;
            component._deferredAnimate = new _deferred.Deferred;
            component._deferredAnimate.done(function() {
                _this2._scrollView.update();
                _this2._updateScrollAnimateSubscription(component)
            })
        }
    }, {
        key: "_renderOptions",
        value: function($container) {
            var _this3 = this;
            var commands = _uiDiagram2.default.getPropertyPanelCommands(this.option("propertyGroups"));
            this._formInstance = this._createComponent($container, _form2.default, {
                items: commands.map(function(item) {
                    return (0, _extend.extend)(true, {
                        editorType: item.widget,
                        dataField: item.command.toString(),
                        cssClass: item.beginGroup && DIAGRAM_RIGHT_PANEL_BEGIN_GROUP_CLASS,
                        label: {
                            text: item.text
                        },
                        options: {
                            text: item.text,
                            hint: item.hint,
                            icon: item.icon,
                            onInitialized: function(e) {
                                return _this3._onToolbarItemInitialized(e.component, item.command)
                            }
                        }
                    }, _this3._createWidgetOptions(item))
                }),
                onFieldDataChanged: function(e) {
                    return _this3._onDiagramOptionChanged(e.dataField, e.value)
                }
            })
        }
    }, {
        key: "_createWidgetOptions",
        value: function(item) {
            if (item.getValue && item.setValue) {
                this._valueConverters[item.command] = {
                    getValue: item.getValue,
                    setValue: item.setValue
                }
            }
            if ("dxSelectBox" === item.widget) {
                return {
                    editorOptions: {
                        dataSource: item.items,
                        displayExpr: "title",
                        valueExpr: "value"
                    }
                }
            }
        }
    }, {
        key: "_onDiagramOptionChanged",
        value: function(key, value) {
            if (!this._updateLocked && void 0 !== value) {
                var valueConverter = this._valueConverters[key];
                if (valueConverter) {
                    value = valueConverter.getValue(value)
                }
                this.bar.raiseBarCommandExecuted(parseInt(key), value)
            }
        }
    }, {
        key: "_setItemValue",
        value: function(key, value) {
            var valueConverter = this._valueConverters[key];
            if (valueConverter) {
                value = valueConverter.setValue(value)
            }
            this._updateLocked = true;
            this._formInstance.updateData(key.toString(), value);
            this._updateLocked = false
        }
    }, {
        key: "_setItemSubItems",
        value: function(key, items) {
            this._updateLocked = true;
            var editorInstance = this._formInstance.getEditor(key.toString());
            if (editorInstance) {
                editorInstance.option("items", items.map(function(item) {
                    var value = "object" === _typeof(item.value) ? JSON.stringify(item.value) : item.value;
                    return {
                        value: value,
                        title: item.text
                    }
                }))
            }
            this._updateLocked = false
        }
    }, {
        key: "_setEnabled",
        value: function(enabled) {
            this._formInstance.option("disabled", !enabled)
        }
    }, {
        key: "_setItemEnabled",
        value: function(key, enabled) {
            var editorInstance = this._formInstance.getEditor(key.toString());
            if (editorInstance) {
                editorInstance.option("disabled", !enabled)
            }
        }
    }, {
        key: "_optionChanged",
        value: function(args) {
            switch (args.name) {
                case "propertyGroups":
                    this._invalidate();
                    break;
                default:
                    _get(_getPrototypeOf(DiagramRightPanel.prototype), "_optionChanged", this).call(this, args)
            }
        }
    }, {
        key: "_getDefaultOptions",
        value: function() {
            return (0, _extend.extend)(_get(_getPrototypeOf(DiagramRightPanel.prototype), "_getDefaultOptions", this).call(this), {
                container: null
            })
        }
    }]);
    return DiagramRightPanel
}(_diagram2.default);
var OptionsDiagramBar = function(_DiagramBar) {
    _inherits(OptionsDiagramBar, _DiagramBar);
    var _super2 = _createSuper(OptionsDiagramBar);

    function OptionsDiagramBar() {
        _classCallCheck(this, OptionsDiagramBar);
        return _super2.apply(this, arguments)
    }
    _createClass(OptionsDiagramBar, [{
        key: "getCommandKeys",
        value: function() {
            return _uiDiagram2.default.getPropertyPanelCommands().map(function(c) {
                return c.command
            })
        }
    }, {
        key: "setItemValue",
        value: function(key, value) {
            this._owner._setItemValue(key, value)
        }
    }, {
        key: "setEnabled",
        value: function(enabled) {
            this._owner._setEnabled(enabled)
        }
    }, {
        key: "setItemEnabled",
        value: function(key, enabled) {
            this._owner._setItemEnabled(key, enabled)
        }
    }, {
        key: "setItemSubItems",
        value: function(key, items) {
            this._owner._setItemSubItems(key, items)
        }
    }]);
    return OptionsDiagramBar
}(_diagram_bar2.default);
module.exports = DiagramRightPanel;
