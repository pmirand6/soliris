/**
 * DevExtreme (core/utils/extend.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var isPlainObject = require("./type").isPlainObject;
var extendFromObject = function(target, source, overrideExistingValues) {
    target = target || {};
    for (var prop in source) {
        if (Object.prototype.hasOwnProperty.call(source, prop)) {
            var value = source[prop];
            if (!(prop in target) || overrideExistingValues) {
                target[prop] = value
            }
        }
    }
    return target
};
var extend = function extend(target) {
    target = target || {};
    var i = 1;
    var deep = false;
    if ("boolean" === typeof target) {
        deep = target;
        target = arguments[1] || {};
        i++
    }
    for (; i < arguments.length; i++) {
        var source = arguments[i];
        if (null == source) {
            continue
        }
        for (var key in source) {
            var targetValue = target[key];
            var sourceValue = source[key];
            var sourceValueIsArray = false;
            var clone;
            if ("__proto__" === key || target === sourceValue) {
                continue
            }
            if (deep && sourceValue && (isPlainObject(sourceValue) || (sourceValueIsArray = Array.isArray(sourceValue)))) {
                if (sourceValueIsArray) {
                    clone = targetValue && Array.isArray(targetValue) ? targetValue : []
                } else {
                    clone = targetValue && isPlainObject(targetValue) ? targetValue : {}
                }
                target[key] = extend(deep, clone, sourceValue)
            } else {
                if (void 0 !== sourceValue) {
                    target[key] = sourceValue
                }
            }
        }
    }
    return target
};
exports.extend = extend;
exports.extendFromObject = extendFromObject;