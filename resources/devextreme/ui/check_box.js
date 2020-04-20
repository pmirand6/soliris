/**
 * DevExtreme (ui/check_box.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var $ = require("../core/renderer");
var eventsEngine = require("../events/core/events_engine");
var devices = require("../core/devices");
var extend = require("../core/utils/extend").extend;
var inkRipple = require("./widget/utils.ink_ripple");
var Editor = require("./editor/editor");
var registerComponent = require("../core/component_registrator");
var eventUtils = require("../events/utils");
var clickEvent = require("../events/click");
var CHECKBOX_CLASS = "dx-checkbox";
var CHECKBOX_ICON_CLASS = "dx-checkbox-icon";
var CHECKBOX_CHECKED_CLASS = "dx-checkbox-checked";
var CHECKBOX_CONTAINER_CLASS = "dx-checkbox-container";
var CHECKBOX_TEXT_CLASS = "dx-checkbox-text";
var CHECKBOX_HAS_TEXT_CLASS = "dx-checkbox-has-text";
var CHECKBOX_INDETERMINATE_CLASS = "dx-checkbox-indeterminate";
var CHECKBOX_FEEDBACK_HIDE_TIMEOUT = 100;
var CheckBox = Editor.inherit({
    _supportedKeys: function() {
        var click = function(e) {
            e.preventDefault();
            this._clickAction({
                event: e
            })
        };
        return extend(this.callBase(), {
            space: click
        })
    },
    _getDefaultOptions: function() {
        return extend(this.callBase(), {
            hoverStateEnabled: true,
            activeStateEnabled: true,
            value: false,
            text: "",
            useInkRipple: false
        })
    },
    _defaultOptionsRules: function() {
        return this.callBase().concat([{
            device: function() {
                return "desktop" === devices.real().deviceType && !devices.isSimulator()
            },
            options: {
                focusStateEnabled: true
            }
        }])
    },
    _canValueBeChangedByClick: function() {
        return true
    },
    _feedbackHideTimeout: CHECKBOX_FEEDBACK_HIDE_TIMEOUT,
    _initMarkup: function() {
        this._renderSubmitElement();
        this._$container = $("<div>").addClass(CHECKBOX_CONTAINER_CLASS);
        this.setAria("role", "checkbox");
        this.$element().addClass(CHECKBOX_CLASS);
        this._renderValue();
        this._renderIcon();
        this._renderText();
        this.option("useInkRipple") && this._renderInkRipple();
        this.$element().append(this._$container);
        this.callBase()
    },
    _render: function() {
        this._renderClick();
        this.callBase()
    },
    _renderSubmitElement: function() {
        this._$submitElement = $("<input>").attr("type", "hidden").appendTo(this.$element())
    },
    _getSubmitElement: function() {
        return this._$submitElement
    },
    _renderInkRipple: function() {
        this._inkRipple = inkRipple.render({
            waveSizeCoefficient: 2.5,
            useHoldAnimation: false,
            wavesNumber: 2,
            isCentered: true
        })
    },
    _renderInkWave: function(element, dxEvent, doRender, waveIndex) {
        if (!this._inkRipple) {
            return
        }
        var config = {
            element: element,
            event: dxEvent,
            wave: waveIndex
        };
        if (doRender) {
            this._inkRipple.showWave(config)
        } else {
            this._inkRipple.hideWave(config)
        }
    },
    _updateFocusState: function(e, value) {
        this.callBase.apply(this, arguments);
        this._renderInkWave(this._$icon, e, value, 0)
    },
    _toggleActiveState: function($element, value, e) {
        this.callBase.apply(this, arguments);
        this._renderInkWave(this._$icon, e, value, 1)
    },
    _renderIcon: function() {
        this._$icon = $("<span>").addClass(CHECKBOX_ICON_CLASS).prependTo(this._$container)
    },
    _renderText: function() {
        var textValue = this.option("text");
        if (!textValue) {
            if (this._$text) {
                this._$text.remove();
                this.$element().removeClass(CHECKBOX_HAS_TEXT_CLASS)
            }
            return
        }
        if (!this._$text) {
            this._$text = $("<span>").addClass(CHECKBOX_TEXT_CLASS)
        }
        this._$text.text(textValue);
        this._$container.append(this._$text);
        this.$element().addClass(CHECKBOX_HAS_TEXT_CLASS)
    },
    _renderClick: function() {
        var that = this;
        var eventName = eventUtils.addNamespace(clickEvent.name, that.NAME);
        that._clickAction = that._createAction(that._clickHandler);
        eventsEngine.off(that.$element(), eventName);
        eventsEngine.on(that.$element(), eventName, function(e) {
            that._clickAction({
                event: e
            })
        })
    },
    _clickHandler: function(args) {
        var that = args.component;
        that._saveValueChangeEvent(args.event);
        that.option("value", !that.option("value"))
    },
    _renderValue: function() {
        var $element = this.$element();
        var checked = this.option("value");
        var indeterminate = void 0 === checked;
        $element.toggleClass(CHECKBOX_CHECKED_CLASS, Boolean(checked));
        $element.toggleClass(CHECKBOX_INDETERMINATE_CLASS, indeterminate);
        this._getSubmitElement().val(checked);
        this.setAria("checked", indeterminate ? "mixed" : checked || "false")
    },
    _optionChanged: function(args) {
        switch (args.name) {
            case "useInkRipple":
                this._invalidate();
                break;
            case "value":
                this._renderValue();
                this.callBase(args);
                break;
            case "text":
                this._renderText();
                this._renderDimensions();
                break;
            default:
                this.callBase(args)
        }
    },
    _clean: function() {
        delete this._inkRipple;
        this.callBase()
    }
});
registerComponent("dxCheckBox", CheckBox);
module.exports = CheckBox;
module.exports.default = module.exports;
