/**
 * DevExtreme (core/http_request.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var windowUtils = require("./utils/window");
var window = windowUtils.getWindow();
var injector = require("./utils/dependency_injector");
var nativeXMLHttpRequest = {
    getXhr: function() {
        return new window.XMLHttpRequest
    }
};
module.exports = injector(nativeXMLHttpRequest);
