/**
 * DevExtreme (integration/jquery/element.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var setPublicElementWrapper = require("../../core/utils/dom").setPublicElementWrapper;
var useJQuery = require("./use_jquery")();
var getPublicElement = function($element) {
    return $element
};
if (useJQuery) {
    setPublicElementWrapper(getPublicElement)
}
