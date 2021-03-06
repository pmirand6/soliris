/**
 * DevExtreme (ui/scheduler/rendering_strategies/ui.scheduler.appointmentsPositioning.strategy.adaptive.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var _uiSchedulerAppointmentsPositioningStrategy = require("./ui.scheduler.appointmentsPositioning.strategy.base");
var _uiSchedulerAppointmentsPositioningStrategy2 = _interopRequireDefault(_uiSchedulerAppointmentsPositioningStrategy);

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
var COLLECTOR_ADAPTIVE_SIZE = 28;
var COLLECTOR_ADAPTIVE_BOTTOM_OFFSET = 40;
var ADAPTIVE_APPOINTMENT_DEFAULT_OFFSET = 35;
var ADAPTIVE_APPOINTMENT_DEFAULT_WIDTH = 30;
var AdaptivePositioningStrategy = function(_BasePositioningStrat) {
    _inherits(AdaptivePositioningStrategy, _BasePositioningStrat);
    var _super = _createSuper(AdaptivePositioningStrategy);

    function AdaptivePositioningStrategy() {
        _classCallCheck(this, AdaptivePositioningStrategy);
        return _super.apply(this, arguments)
    }
    _createClass(AdaptivePositioningStrategy, [{
        key: "getDropDownAppointmentWidth",
        value: function(intervalCount, isAllDay) {
            return this.getDropDownButtonAdaptiveSize()
        }
    }, {
        key: "getDropDownButtonAdaptiveSize",
        value: function() {
            return COLLECTOR_ADAPTIVE_SIZE
        }
    }, {
        key: "getCompactAppointmentTopOffset",
        value: function(allDay) {
            var renderingStrategy = this.getRenderingStrategy();
            if (renderingStrategy.hasAllDayAppointments() && allDay) {
                return (renderingStrategy.getDefaultAllDayCellHeight() - renderingStrategy.getDropDownButtonAdaptiveSize()) / 2
            } else {
                return this.getRenderingStrategy().getDefaultCellHeight() - COLLECTOR_ADAPTIVE_BOTTOM_OFFSET
            }
        }
    }, {
        key: "getCompactAppointmentLeftOffset",
        value: function() {
            return (this.getRenderingStrategy().getDefaultCellWidth() - COLLECTOR_ADAPTIVE_SIZE) / 2
        }
    }, {
        key: "getAppointmentDefaultOffset",
        value: function() {
            return ADAPTIVE_APPOINTMENT_DEFAULT_OFFSET
        }
    }, {
        key: "getDynamicAppointmentCountPerCell",
        value: function() {
            var renderingStrategy = this.getRenderingStrategy();
            if (renderingStrategy.hasAllDayAppointments()) {
                return {
                    allDay: 0,
                    simple: this._calculateDynamicAppointmentCountPerCell() || this._getAppointmentMinCount()
                }
            } else {
                return 0
            }
        }
    }, {
        key: "getDropDownAppointmentHeight",
        value: function() {
            return COLLECTOR_ADAPTIVE_SIZE
        }
    }, {
        key: "_getAppointmentMinCount",
        value: function() {
            return 0
        }
    }, {
        key: "_getAppointmentDefaultWidth",
        value: function() {
            var renderingStrategy = this.getRenderingStrategy();
            if (renderingStrategy.hasAllDayAppointments()) {
                return ADAPTIVE_APPOINTMENT_DEFAULT_WIDTH
            }
            return _get(_getPrototypeOf(AdaptivePositioningStrategy.prototype), "_getAppointmentDefaultWidth", this).call(this)
        }
    }, {
        key: "_calculateDynamicAppointmentCountPerCell",
        value: function() {
            return Math.floor(this.getRenderingStrategy()._getAppointmentMaxWidth() / this.getRenderingStrategy()._getAppointmentDefaultWidth())
        }
    }]);
    return AdaptivePositioningStrategy
}(_uiSchedulerAppointmentsPositioningStrategy2.default);
module.exports = AdaptivePositioningStrategy;
