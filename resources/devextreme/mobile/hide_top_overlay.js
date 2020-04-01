/**
 * DevExtreme (mobile/hide_top_overlay.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var inArray = require("../core/utils/array").inArray;
var hideCallback = function() {
    var callbacks = [];
    return {
        add: function(callback) {
            var indexOfCallback = inArray(callback, callbacks);
            if (indexOfCallback === -1) {
                callbacks.push(callback)
            }
        },
        remove: function(callback) {
            var indexOfCallback = inArray(callback, callbacks);
            if (indexOfCallback !== -1) {
                callbacks.splice(indexOfCallback, 1)
            }
        },
        fire: function() {
            var callback = callbacks.pop();
            var result = !!callback;
            if (result) {
                callback()
            }
            return result
        },
        hasCallback: function() {
            return callbacks.length > 0
        }
    }
}();
module.exports = function() {
    return hideCallback.fire()
};
module.exports.hideCallback = hideCallback;
module.exports.default = module.exports;
