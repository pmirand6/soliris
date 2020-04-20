/**
 * DevExtreme (core/utils/window.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var domAdapter = require("../dom_adapter");
var _hasWindow = "undefined" !== typeof window;
var windowObject = _hasWindow && window;
if (!windowObject) {
    windowObject = {};
    windowObject.window = windowObject
}
module.exports = {
    hasWindow: function() {
        return _hasWindow
    },
    getWindow: function() {
        return windowObject
    },
    hasProperty: function(prop) {
        return this.hasWindow() && prop in windowObject
    },
    defaultScreenFactorFunc: function(width) {
        if (width < 768) {
            return "xs"
        } else {
            if (width < 992) {
                return "sm"
            } else {
                if (width < 1200) {
                    return "md"
                } else {
                    return "lg"
                }
            }
        }
    },
    getCurrentScreenFactor: function(screenFactorCallback) {
        var screenFactorFunc = screenFactorCallback || this.defaultScreenFactorFunc;
        var windowWidth = domAdapter.getDocumentElement().clientWidth;
        return screenFactorFunc(windowWidth)
    },
    getNavigator: function() {
        return this.hasWindow() ? windowObject.navigator : {
            userAgent: ""
        }
    }
};
