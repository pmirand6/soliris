/**
 * DevExtreme (ui/scheduler/ui.loading.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var $ = require("../../core/renderer");
var viewPortUtils = require("../../core/utils/view_port");
var LoadPanel = require("../load_panel");
var Deferred = require("../../core/utils/deferred").Deferred;
var loading = null;
var createLoadPanel = function(options) {
    return new LoadPanel($("<div>").appendTo(options && options.container || viewPortUtils.value()), options)
};
var removeLoadPanel = function() {
    if (!loading) {
        return
    }
    loading.$element().remove();
    loading = null
};
exports.show = function(options) {
    removeLoadPanel();
    loading = createLoadPanel(options);
    return loading.show()
};
exports.hide = function() {
    if (!loading) {
        return (new Deferred).resolve()
    }
    return loading.hide().done(removeLoadPanel).promise()
};
