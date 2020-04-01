/**
 * DevExtreme (ui/widget/selectors.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var $ = require("../../core/renderer");
var domAdapter = require("../../core/dom_adapter");
var _focusable = function(element, tabIndex) {
    if (!visible(element)) {
        return false
    }
    var nodeName = element.nodeName.toLowerCase();
    var isTabIndexNotNaN = !isNaN(tabIndex);
    var isDisabled = element.disabled;
    var isDefaultFocus = /^(input|select|textarea|button|object|iframe)$/.test(nodeName);
    var isHyperlink = "a" === nodeName;
    var isFocusable = true;
    var isContentEditable = element.isContentEditable;
    if (isDefaultFocus || isContentEditable) {
        isFocusable = !isDisabled
    } else {
        if (isHyperlink) {
            isFocusable = element.href || isTabIndexNotNaN
        } else {
            isFocusable = isTabIndexNotNaN
        }
    }
    return isFocusable
};
var visible = function(element) {
    var $element = $(element);
    return $element.is(":visible") && "hidden" !== $element.css("visibility") && "hidden" !== $element.parents().css("visibility")
};
module.exports = {
    focusable: function(index, element) {
        return _focusable(element, $(element).attr("tabIndex"))
    },
    tabbable: function(index, element) {
        var tabIndex = $(element).attr("tabIndex");
        return (isNaN(tabIndex) || tabIndex >= 0) && _focusable(element, tabIndex)
    },
    focused: function($element) {
        var element = $($element).get(0);
        return domAdapter.getActiveElement() === element
    }
};
