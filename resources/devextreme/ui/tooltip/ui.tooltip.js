/**
 * DevExtreme (ui/tooltip/ui.tooltip.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var $ = require("../../core/renderer");
var Tooltip = require("./tooltip");
var extend = require("../../core/utils/extend").extend;
var Deferred = require("../../core/utils/deferred").Deferred;
var viewPortUtils = require("../../core/utils/view_port");
var tooltip = null;
var removeTooltipElement = null;
var createTooltip = function(options) {
    options = extend({
        position: "top"
    }, options);
    var content = options.content;
    delete options.content;
    var $tooltip = $("<div>").html(content).appendTo(viewPortUtils.value());
    removeTooltipElement = function() {
        $tooltip.remove()
    };
    tooltip = new Tooltip($tooltip, options)
};
var removeTooltip = function() {
    if (!tooltip) {
        return
    }
    removeTooltipElement();
    tooltip = null
};
exports.show = function(options) {
    removeTooltip();
    createTooltip(options);
    return tooltip.show()
};
exports.hide = function() {
    if (!tooltip) {
        return (new Deferred).resolve()
    }
    return tooltip.hide().done(removeTooltip).promise()
};
