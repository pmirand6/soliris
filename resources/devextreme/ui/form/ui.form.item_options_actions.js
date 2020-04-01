/**
 * DevExtreme (ui/form/ui.form.item_options_actions.js)
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
var _uiForm = require("./ui.form.item_option_action");
var _uiForm2 = _interopRequireDefault(_uiForm);
var _element_data = require("../../core/element_data");
var _extend = require("../../core/utils/extend");
var _uiForm3 = require("./ui.form.utils");

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
var WidgetOptionItemOptionAction = function(_ItemOptionAction) {
    _inherits(WidgetOptionItemOptionAction, _ItemOptionAction);
    var _super = _createSuper(WidgetOptionItemOptionAction);

    function WidgetOptionItemOptionAction() {
        _classCallCheck(this, WidgetOptionItemOptionAction);
        return _super.apply(this, arguments)
    }
    _createClass(WidgetOptionItemOptionAction, [{
        key: "tryExecute",
        value: function() {
            var value = this._options.value;
            var instance = this.findInstance();
            if (instance) {
                instance.option(value);
                return true
            }
            return false
        }
    }]);
    return WidgetOptionItemOptionAction
}(_uiForm2.default);
var TabOptionItemOptionAction = function(_ItemOptionAction2) {
    _inherits(TabOptionItemOptionAction, _ItemOptionAction2);
    var _super2 = _createSuper(TabOptionItemOptionAction);

    function TabOptionItemOptionAction() {
        _classCallCheck(this, TabOptionItemOptionAction);
        return _super2.apply(this, arguments)
    }
    _createClass(TabOptionItemOptionAction, [{
        key: "tryExecute",
        value: function() {
            var tabPanel = this.findInstance();
            if (tabPanel) {
                var _this$_options = this._options,
                    optionName = _this$_options.optionName,
                    item = _this$_options.item,
                    value = _this$_options.value;
                var itemIndex = this._itemsRunTimeInfo.findItemIndexByItem(item);
                if (itemIndex >= 0) {
                    tabPanel.option((0, _uiForm3.getFullOptionName)("items[".concat(itemIndex, "]"), optionName), value);
                    return true
                }
            }
            return false
        }
    }]);
    return TabOptionItemOptionAction
}(_uiForm2.default);
var TabsOptionItemOptionAction = function(_ItemOptionAction3) {
    _inherits(TabsOptionItemOptionAction, _ItemOptionAction3);
    var _super3 = _createSuper(TabsOptionItemOptionAction);

    function TabsOptionItemOptionAction() {
        _classCallCheck(this, TabsOptionItemOptionAction);
        return _super3.apply(this, arguments)
    }
    _createClass(TabsOptionItemOptionAction, [{
        key: "tryExecute",
        value: function() {
            var tabPanel = this.findInstance();
            if (tabPanel) {
                var value = this._options.value;
                tabPanel.option("dataSource", value);
                return true
            }
            return false
        }
    }]);
    return TabsOptionItemOptionAction
}(_uiForm2.default);
var ValidationRulesItemOptionAction = function(_ItemOptionAction4) {
    _inherits(ValidationRulesItemOptionAction, _ItemOptionAction4);
    var _super4 = _createSuper(ValidationRulesItemOptionAction);

    function ValidationRulesItemOptionAction() {
        _classCallCheck(this, ValidationRulesItemOptionAction);
        return _super4.apply(this, arguments)
    }
    _createClass(ValidationRulesItemOptionAction, [{
        key: "tryExecute",
        value: function() {
            var item = this._options.item;
            var instance = this.findInstance();
            var validator = instance && (0, _element_data.data)(instance.$element()[0], "dxValidator");
            if (validator && item) {
                var filterRequired = function(item) {
                    return "required" === item.type
                };
                var oldContainsRequired = (validator.option("validationRules") || []).some(filterRequired);
                var newContainsRequired = (item.validationRules || []).some(filterRequired);
                if (!oldContainsRequired && !newContainsRequired || oldContainsRequired && newContainsRequired) {
                    validator.option("validationRules", item.validationRules);
                    return true
                }
            }
            return false
        }
    }]);
    return ValidationRulesItemOptionAction
}(_uiForm2.default);
var CssClassItemOptionAction = function(_ItemOptionAction5) {
    _inherits(CssClassItemOptionAction, _ItemOptionAction5);
    var _super5 = _createSuper(CssClassItemOptionAction);

    function CssClassItemOptionAction() {
        _classCallCheck(this, CssClassItemOptionAction);
        return _super5.apply(this, arguments)
    }
    _createClass(CssClassItemOptionAction, [{
        key: "tryExecute",
        value: function() {
            var $itemContainer = this.findItemContainer();
            var _this$_options2 = this._options,
                previousValue = _this$_options2.previousValue,
                value = _this$_options2.value;
            if ($itemContainer) {
                $itemContainer.removeClass(previousValue).addClass(value);
                return true
            }
            return false
        }
    }]);
    return CssClassItemOptionAction
}(_uiForm2.default);
var tryCreateItemOptionAction = function(optionName, itemActionOptions) {
    switch (optionName) {
        case "editorOptions":
        case "buttonOptions":
            return new WidgetOptionItemOptionAction(itemActionOptions);
        case "validationRules":
            return new ValidationRulesItemOptionAction(itemActionOptions);
        case "cssClass":
            return new CssClassItemOptionAction(itemActionOptions);
        case "badge":
        case "disabled":
        case "icon":
        case "template":
        case "tabTemplate":
        case "title":
            return new TabOptionItemOptionAction((0, _extend.extend)(itemActionOptions, {
                optionName: optionName
            }));
        case "tabs":
            return new TabsOptionItemOptionAction(itemActionOptions);
        default:
            return null
    }
};
exports.default = tryCreateItemOptionAction;
