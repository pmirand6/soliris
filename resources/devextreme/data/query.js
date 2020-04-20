/**
 * DevExtreme (data/query.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var arrayQueryImpl = require("./array_query");
var remoteQueryImpl = require("./remote_query");
var queryImpl = {
    array: arrayQueryImpl,
    remote: remoteQueryImpl
};
var query = function() {
    var impl = Array.isArray(arguments[0]) ? "array" : "remote";
    return queryImpl[impl].apply(this, arguments)
};
module.exports = query;
module.exports.queryImpl = queryImpl;
module.exports.default = module.exports;
