/**
 * DevExtreme (ui/speed_dial_action/speed_dial_action.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var _component_registrator = require("../../core/component_registrator");
var _component_registrator2 = _interopRequireDefault(_component_registrator);
var _extend = require("../../core/utils/extend");
var _guid = require("../../core/guid");
var _guid2 = _interopRequireDefault(_guid);
var _ready_callbacks = require("../../core/utils/ready_callbacks");
var _ready_callbacks2 = _interopRequireDefault(_ready_callbacks);
var _ui = require("../widget/ui.widget");
var _ui2 = _interopRequireDefault(_ui);
var _speed_dial_main_item = require("./speed_dial_main_item");
var _swatch_container = require("../widget/swatch_container");

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
var ready = _ready_callbacks2.default.add;
var SpeedDialAction = function(_Widget) {
    _inherits(SpeedDialAction, _Widget);
    var _super = _createSuper(SpeedDialAction);

    function SpeedDialAction() {
        _classCallCheck(this, SpeedDialAction);
        return _super.apply(this, arguments)
    }
    _createClass(SpeedDialAction, [{
        key: "_getDefaultOptions",
        value: function() {
            return (0, _extend.extend)(_get(_getPrototypeOf(SpeedDialAction.prototype), "_getDefaultOptions", this).call(this), {
                icon: "",
                onClick: null,
                label: "",
                visible: true,
                index: 0,
                onContentReady: null,
                activeStateEnabled: true,
                hoverStateEnabled: true,
                animation: {
                    show: {
                        type: "pop",
                        duration: 200,
                        easing: "cubic-bezier(0.4, 0, 0.2, 1)",
                        from: {
                            scale: 0,
                            opacity: 0
                        },
                        to: {
                            scale: 1,
                            opacity: 1
                        }
                    },
                    hide: {
                        type: "pop",
                        duration: 200,
                        easing: "cubic-bezier(0.4, 0, 0.2, 1)",
                        from: {
                            scale: 1,
                            opacity: 1
                        },
                        to: {
                            scale: 0,
                            opacity: 0
                        }
                    }
                },
                id: new _guid2.default
            })
        }
    }, {
        key: "_optionChanged",
        value: function(args) {
            switch (args.name) {
                case "onClick":
                case "icon":
                case "label":
                case "visible":
                case "index":
                case "onInitializing":
                    (0, _speed_dial_main_item.initAction)(this);
                    break;
                case "animation":
                case "id":
                    break;
                default:
                    _get(_getPrototypeOf(SpeedDialAction.prototype), "_optionChanged", this).call(this, args)
            }
        }
    }, {
        key: "_render",
        value: function() {
            var _this = this;
            this._toggleVisibility(false);
            if (!(0, _swatch_container.getSwatchContainer)(this.$element())) {
                ready(function() {
                    return (0, _speed_dial_main_item.initAction)(_this)
                })
            } else {
                (0, _speed_dial_main_item.initAction)(this)
            }
        }
    }, {
        key: "_dispose",
        value: function() {
            (0, _speed_dial_main_item.disposeAction)(this._options.id);
            _get(_getPrototypeOf(SpeedDialAction.prototype), "_dispose", this).call(this)
        }
    }]);
    return SpeedDialAction
}(_ui2.default);
(0, _component_registrator2.default)("dxSpeedDialAction", SpeedDialAction);
module.exports = SpeedDialAction;
