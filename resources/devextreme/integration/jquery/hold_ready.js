/**
 * DevExtreme (integration/jquery/hold_ready.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var jQuery = require("jquery");
var themes_callback = require("../../ui/themes_callback");
var ready = require("../../core/utils/ready_callbacks").add;
if (jQuery && !themes_callback.fired()) {
    var holdReady = jQuery.holdReady || jQuery.fn.holdReady;
    holdReady(true);
    themes_callback.add(function() {
        ready(function() {
            holdReady(false)
        })
    })
}
