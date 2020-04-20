/**
 * DevExtreme (ui/notify.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var $ = require("../core/renderer");
var Action = require("../core/action");
var viewPortUtils = require("../core/utils/view_port");
var extend = require("../core/utils/extend").extend;
var isPlainObject = require("../core/utils/type").isPlainObject;
var Toast = require("./toast");
var $notify = null;
var notify = function(message, type, displayTime) {
    var options = isPlainObject(message) ? message : {
        message: message
    };
    var userHiddenAction = options.onHidden;
    extend(options, {
        type: type,
        displayTime: displayTime,
        onHidden: function(args) {
            $(args.element).remove();
            new Action(userHiddenAction, {
                context: args.model
            }).execute(arguments)
        }
    });
    $notify = $("<div>").appendTo(viewPortUtils.value());
    new Toast($notify, options).show()
};
module.exports = notify;
module.exports.default = module.exports;
