/**
 * DevExtreme (ui/diagram/ui.diagram.leftpanel.js)
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
var DIAGRAM_LEFT_PANEL_CLASS = "dx-diagram-left-panel";
var DiagramLeftPanel = function(_DiagramPanel) {
    _inherits(DiagramLeftPanel, _DiagramPanel);
    var _super = _createSuper(DiagramLeftPanel);

    function DiagramLeftPanel() {
        _classCallCheck(this, DiagramLeftPanel);
        return _super.apply(this, arguments)
    }
    _createClass(DiagramLeftPanel, [{
        key: "_init",
        value: function() {
            _get(_getPrototypeOf(DiagramLeftPanel.prototype), "_init", this).call(this);
            this._onShapeCategoryRenderedAction = this._createActionByOption("onShapeCategoryRendered", {
                excludeValidators: ["disabled"]
            })
        }
    }, {
        key: "_initMarkup",
        value: function() {
            _get(_getPrototypeOf(DiagramLeftPanel.prototype), "_initMarkup", this).call(this);
            this.$element().addClass(DIAGRAM_LEFT_PANEL_CLASS);
            var $scrollViewWrapper = (0, _renderer2.default)("<div>").appendTo(this.$element());
            this._scrollView = this._createComponent($scrollViewWrapper, _scroll_view2.default);
            var $accordion = (0, _renderer2.default)("<div>").appendTo(this._scrollView.content());
            this._renderAccordion($accordion)
        }
    }, {
        key: "_getAccordionDataSource",
        value: function() {
            var _this = this;
            var result = [];
            var toolboxGroups = this.option("toolboxGroups");
            for (var i = 0; i < toolboxGroups.length; i++) {
                var category = toolboxGroups[i].category;
                var title = toolboxGroups[i].title;
                var groupObj = {
                    category: category,
                    title: title || category,
                    expanded: toolboxGroups[i].expanded,
                    displayMode: toolboxGroups[i].displayMode,
                    shapes: toolboxGroups[i].shapes,
                    onTemplate: function(widget, $element, data) {
                        _this._onShapeCategoryRenderedAction({
                            category: data.category,
                            displayMode: data.displayMode,
                            shapes: data.shapes,
                            $element: $element
                        })
                    }
                };
                result.push(groupObj)
            }
            return result
        }
    }, {
        key: "_renderAccordion",
        value: function($container) {
            var _this2 = this;
            var data = this._getAccordionDataSource();
            this._accordionInstance = this._createComponent($container, _accordion2.default, {
                multiple: true,
                collapsible: true,
                displayExpr: "title",
                dataSource: data,
                disabled: this.option("disabled"),
                itemTemplate: function(data, index, $element) {
                    return data.onTemplate(_this2, $element, data)
                },
                onContentReady: function(e) {
                    _this2._updateScrollAnimateSubscription(e.component)
                }
            });
            for (var i = 0; i < data.length; i++) {
                if (false === data[i].expanded) {
                    this._accordionInstance.collapseItem(i)
                } else {
                    if (true === data[i].expanded) {
                        this._accordionInstance.expandItem(i)
                    }
                }
            }
        }
    }, {
        key: "_updateScrollAnimateSubscription",
        value: function(component) {
            var _this3 = this;
            component._deferredAnimate = new _deferred.Deferred;
            component._deferredAnimate.done(function() {
                _this3._scrollView.update();
                _this3._updateScrollAnimateSubscription(component)
            })
        }
    }, {
        key: "_optionChanged",
        value: function(args) {
            switch (args.name) {
                case "disabled":
                    this._accordionInstance.option("disabled", args.value);
                    break;
                case "toolboxGroups":
                    this._invalidate();
                    break;
                default:
                    _get(_getPrototypeOf(DiagramLeftPanel.prototype), "_optionChanged", this).call(this, args)
            }
        }
    }]);
    return DiagramLeftPanel
}(_diagram2.default);
module.exports = DiagramLeftPanel;
