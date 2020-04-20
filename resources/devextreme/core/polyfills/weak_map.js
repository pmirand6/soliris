/**
 * DevExtreme (core/polyfills/weak_map.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var inArray = require("../../core/utils/array").inArray;
var windowUtils = require("../../core/utils/window");
var weakMap = windowUtils.hasWindow() ? windowUtils.getWindow().WeakMap : WeakMap;
if (!weakMap) {
    weakMap = function() {
        var keys = [];
        var values = [];
        this.set = function(key, value) {
            var index = inArray(key, keys);
            if (index === -1) {
                keys.push(key);
                values.push(value)
            } else {
                values[index] = value
            }
        };
        this.get = function(key) {
            var index = inArray(key, keys);
            if (index === -1) {
                return
            }
            return values[index]
        };
        this.has = function(key) {
            var index = inArray(key, keys);
            if (index === -1) {
                return false
            }
            return true
        };
        this.delete = function(key) {
            var index = inArray(key, keys);
            if (index === -1) {
                return
            }
            keys.splice(index, 1);
            values.splice(index, 1)
        }
    }
}
module.exports = weakMap;
