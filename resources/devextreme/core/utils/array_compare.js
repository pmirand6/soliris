/**
 * DevExtreme (core/utils/array_compare.js)
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
exports.findChanges = void 0;
var _type = require("./type");
var getKeyWrapper = function(item, getKey) {
    var key = getKey(item);
    if ((0, _type.isObject)(key)) {
        try {
            return JSON.stringify(key)
        } catch (e) {
            return key
        }
    }
    return key
};
var getSameNewByOld = function(oldItem, newItems, newIndexByKey, getKey) {
    var key = getKeyWrapper(oldItem, getKey);
    return newItems[newIndexByKey[key]]
};
var findChanges = exports.findChanges = function(oldItems, newItems, getKey, isItemEquals) {
    var oldIndexByKey = {};
    var newIndexByKey = {};
    var addedCount = 0;
    var removeCount = 0;
    var result = [];
    oldItems.forEach(function(item, index) {
        var key = getKeyWrapper(item, getKey);
        oldIndexByKey[key] = index
    });
    newItems.forEach(function(item, index) {
        var key = getKeyWrapper(item, getKey);
        newIndexByKey[key] = index
    });
    var itemCount = Math.max(oldItems.length, newItems.length);
    for (var index = 0; index < itemCount + addedCount; index++) {
        var newItem = newItems[index];
        var oldNextIndex = index - addedCount + removeCount;
        var nextOldItem = oldItems[oldNextIndex];
        var isRemoved = !newItem || nextOldItem && !getSameNewByOld(nextOldItem, newItems, newIndexByKey, getKey);
        if (isRemoved) {
            if (nextOldItem) {
                result.push({
                    type: "remove",
                    key: getKey(nextOldItem),
                    index: index,
                    oldItem: nextOldItem
                });
                removeCount++;
                index--
            }
        } else {
            var key = getKeyWrapper(newItem, getKey);
            var oldIndex = oldIndexByKey[key];
            var oldItem = oldItems[oldIndex];
            if (!oldItem) {
                addedCount++;
                result.push({
                    type: "insert",
                    data: newItem,
                    index: index
                })
            } else {
                if (oldIndex === oldNextIndex) {
                    if (!isItemEquals(oldItem, newItem)) {
                        result.push({
                            type: "update",
                            data: newItem,
                            key: getKey(newItem),
                            index: index,
                            oldItem: oldItem
                        })
                    }
                } else {
                    return
                }
            }
        }
    }
    return result
};