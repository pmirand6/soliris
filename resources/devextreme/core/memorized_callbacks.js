/**
 * DevExtreme (core/memorized_callbacks.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var each = require("../core/utils/iterator").each;
var Callbacks = require("./utils/callbacks");
var MemorizedCallbacks = function() {
    var memory = [];
    var callbacks = Callbacks();
    this.add = function(fn) {
        each(memory, function(_, item) {
            fn.apply(fn, item)
        });
        callbacks.add(fn)
    };
    this.remove = function(fn) {
        callbacks.remove(fn)
    };
    this.fire = function() {
        memory.push(arguments);
        callbacks.fire.apply(callbacks, arguments)
    }
};
module.exports = MemorizedCallbacks;
