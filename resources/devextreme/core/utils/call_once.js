/**
 * DevExtreme (core/utils/call_once.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var callOnce = function(handler) {
    var result;
    var _wrappedHandler = function() {
        result = handler.apply(this, arguments);
        _wrappedHandler = function() {
            return result
        };
        return result
    };
    return function() {
        return _wrappedHandler.apply(this, arguments)
    }
};
module.exports = callOnce;
