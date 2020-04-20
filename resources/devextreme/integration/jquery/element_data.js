/**
 * DevExtreme (integration/jquery/element_data.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var jQuery = require("jquery");
var dataUtils = require("../../core/element_data");
var useJQuery = require("./use_jquery")();
if (useJQuery) {
    dataUtils.setDataStrategy(jQuery)
}
