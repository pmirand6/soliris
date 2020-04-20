/**
 * DevExtreme (integration/jquery/easing.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var jQuery = require("jquery");
var easing = require("../../animation/easing");
if (jQuery) {
    easing.setEasing(jQuery.easing)
}
