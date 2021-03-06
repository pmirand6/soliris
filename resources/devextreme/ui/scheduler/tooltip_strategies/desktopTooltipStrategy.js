/**
 * DevExtreme (ui/scheduler/tooltip_strategies/desktopTooltipStrategy.js)
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
exports.DesktopTooltipStrategy = void 0;
var _tooltipStrategyBase = require("./tooltipStrategyBase");
var _tooltip = require("../../tooltip");
var _tooltip2 = _interopRequireDefault(_tooltip);
var _support = require("../../../core/utils/support");

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
var APPOINTMENT_TOOLTIP_WRAPPER_CLASS = "dx-scheduler-appointment-tooltip-wrapper";
var MAX_TOOLTIP_HEIGHT = 200;
var DesktopTooltipStrategy = exports.DesktopTooltipStrategy = function(_TooltipStrategyBase) {
    _inherits(DesktopTooltipStrategy, _TooltipStrategyBase);
    var _super = _createSuper(DesktopTooltipStrategy);

    function DesktopTooltipStrategy(options) {
        var _this;
        _classCallCheck(this, DesktopTooltipStrategy);
        _this = _super.call(this, options);
        _this._skipHidingOnScroll = false;
        return _this
    }
    _createClass(DesktopTooltipStrategy, [{
        key: "_showCore",
        value: function(target, dataList) {
            _get(_getPrototypeOf(DesktopTooltipStrategy.prototype), "_showCore", this).call(this, target, dataList);
            this._tooltip.option("position", {
                my: "bottom",
                at: "top",
                boundary: this._getBoundary(dataList),
                offset: this._extraOptions.offset,
                collision: "fit flipfit"
            })
        }
    }, {
        key: "_getBoundary",
        value: function(dataList) {
            return this._options.isAppointmentInAllDayPanel(dataList[0].data) ? this._options.container : this._options.getScrollableContainer()
        }
    }, {
        key: "_onShown",
        value: function() {
            _get(_getPrototypeOf(DesktopTooltipStrategy.prototype), "_onShown", this).call(this);
            if (this._extraOptions.isButtonClick) {
                this._list.focus();
                this._list.option("focusedElement", null)
            }
        }
    }, {
        key: "_createListOption",
        value: function(target, dataList) {
            var result = _get(_getPrototypeOf(DesktopTooltipStrategy.prototype), "_createListOption", this).call(this, target, dataList);
            result.showScrollbar = _support.touch ? "always" : "onHover";
            return result
        }
    }, {
        key: "_createTooltip",
        value: function(target, dataList) {
            var _this2 = this;
            var tooltip = this._createTooltipElement(APPOINTMENT_TOOLTIP_WRAPPER_CLASS);
            return this._options.createComponent(tooltip, _tooltip2.default, {
                target: target,
                onShowing: this._onTooltipShowing.bind(this),
                closeOnTargetScroll: function() {
                    return _this2._skipHidingOnScroll
                },
                maxHeight: MAX_TOOLTIP_HEIGHT,
                rtlEnabled: this._extraOptions.rtlEnabled,
                onShown: this._onShown.bind(this),
                contentTemplate: this._getContentTemplate(dataList)
            })
        }
    }, {
        key: "_onListRender",
        value: function(e) {
            return this._extraOptions.dragBehavior && this._extraOptions.dragBehavior(e)
        }
    }, {
        key: "dispose",
        value: function() {
            clearTimeout(this._skipHidingOnScrollTimeId)
        }
    }, {
        key: "_onTooltipShowing",
        value: function() {
            var _this3 = this;
            clearTimeout(this._skipHidingOnScrollTimeId);
            this._skipHidingOnScroll = true;
            this._skipHidingOnScrollTimeId = setTimeout(function() {
                _this3._skipHidingOnScroll = false;
                clearTimeout(_this3._skipHidingOnScrollTimeId)
            }, 0)
        }
    }]);
    return DesktopTooltipStrategy
}(_tooltipStrategyBase.TooltipStrategyBase);
