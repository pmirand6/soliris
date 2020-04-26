/**
 * DevExtreme (integration/knockout/utils.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var ko = require("knockout");
var getClosestNodeWithContext = function getClosestNodeWithContext(node) {
    var context = ko.contextFor(node);
    if (!context && node.parentNode) {
        return getClosestNodeWithContext(node.parentNode)
    }
    return node
};
module.exports.getClosestNodeWithContext = getClosestNodeWithContext;
