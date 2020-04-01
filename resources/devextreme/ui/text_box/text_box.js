/**
 * DevExtreme (ui/text_box/text_box.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var $ = require("../../core/renderer");
var windowUtils = require("../../core/utils/window");
var window = windowUtils.getWindow();
var navigator = windowUtils.getNavigator();
var browser = require("../../core/utils/browser");
var eventsEngine = require("../../events/core/events_engine");
var devices = require("../../core/devices");
var inArray = require("../../core/utils/array").inArray;
var extend = require("../../core/utils/extend").extend;
var registerComponent = require("../../core/component_registrator");
var TextEditor = require("./ui.text_editor");
var eventUtils = require("../../events/utils");
var ua = navigator.userAgent;
var ignoreKeys = ["backspace", "tab", "enter", "pageUp", "pageDown", "end", "home", "leftArrow", "rightArrow", "downArrow", "upArrow", "del"];
var TEXTBOX_CLASS = "dx-textbox";
var SEARCHBOX_CLASS = "dx-searchbox";
var ICON_CLASS = "dx-icon";
var SEARCH_ICON_CLASS = "dx-icon-search";
var TextBox = TextEditor.inherit({
    ctor: function(element, options) {
        if (options) {
            this._showClearButton = options.showClearButton
        }
        this.callBase.apply(this, arguments)
    },
    _getDefaultOptions: function() {
        return extend(this.callBase(), {
            value: "",
            mode: "text",
            maxLength: null
        })
    },
    _initMarkup: function() {
        this.$element().addClass(TEXTBOX_CLASS);
        this.callBase();
        this.setAria("role", "textbox")
    },
    _renderContentImpl: function() {
        this._renderMaxLengthHandlers();
        this.callBase()
    },
    _renderInputType: function() {
        this.callBase();
        this._renderSearchMode()
    },
    _renderMaxLengthHandlers: function() {
        if (this._isAndroidOrIE()) {
            eventsEngine.on(this._input(), eventUtils.addNamespace("keydown", this.NAME), this._onKeyDownCutOffHandler.bind(this));
            eventsEngine.on(this._input(), eventUtils.addNamespace("change", this.NAME), this._onChangeCutOffHandler.bind(this))
        }
    },
    _renderProps: function() {
        this.callBase();
        this._toggleMaxLengthProp()
    },
    _toggleMaxLengthProp: function() {
        var maxLength = this._getMaxLength();
        if (maxLength && maxLength > 0) {
            this._input().attr("maxLength", maxLength)
        } else {
            this._input().removeAttr("maxLength")
        }
    },
    _renderSearchMode: function() {
        var $element = this._$element;
        if ("search" === this.option("mode")) {
            $element.addClass(SEARCHBOX_CLASS);
            this._renderSearchIcon();
            if (void 0 === this._showClearButton) {
                this._showClearButton = this.option("showClearButton");
                this.option("showClearButton", true)
            }
        } else {
            $element.removeClass(SEARCHBOX_CLASS);
            this._$searchIcon && this._$searchIcon.remove();
            this.option("showClearButton", void 0 === this._showClearButton ? this.option("showClearButton") : this._showClearButton);
            delete this._showClearButton
        }
    },
    _renderSearchIcon: function() {
        var $searchIcon = $("<div>").addClass(ICON_CLASS).addClass(SEARCH_ICON_CLASS);
        $searchIcon.prependTo(this._input().parent());
        this._$searchIcon = $searchIcon
    },
    _optionChanged: function(args) {
        switch (args.name) {
            case "maxLength":
                this._toggleMaxLengthProp();
                this._renderMaxLengthHandlers();
                break;
            case "mask":
                this.callBase(args);
                this._toggleMaxLengthProp();
                break;
            default:
                this.callBase(args)
        }
    },
    _onKeyDownCutOffHandler: function(e) {
        var actualMaxLength = this._getMaxLength();
        if (actualMaxLength) {
            var $input = $(e.target);
            var key = eventUtils.normalizeKeyName(e);
            this._cutOffExtraChar($input);
            return $input.val().length < actualMaxLength || inArray(key, ignoreKeys) !== -1 || "" !== window.getSelection().toString()
        } else {
            return true
        }
    },
    _onChangeCutOffHandler: function(e) {
        var $input = $(e.target);
        if (this.option("maxLength")) {
            this._cutOffExtraChar($input)
        }
    },
    _cutOffExtraChar: function($input) {
        var actualMaxLength = this._getMaxLength();
        var textInput = $input.val();
        if (actualMaxLength && textInput.length > actualMaxLength) {
            $input.val(textInput.substr(0, actualMaxLength))
        }
    },
    _getMaxLength: function() {
        var isMaskSpecified = !!this.option("mask");
        return isMaskSpecified ? null : this.option("maxLength")
    },
    _isAndroidOrIE: function() {
        var realDevice = devices.real();
        var version = realDevice.version.join(".");
        return browser.msie || "android" === realDevice.platform && version && /^(2\.|4\.1)/.test(version) && !/chrome/i.test(ua)
    }
});
registerComponent("dxTextBox", TextBox);
module.exports = TextBox;
