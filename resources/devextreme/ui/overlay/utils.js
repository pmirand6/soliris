/**
 * DevExtreme (ui/overlay/utils.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
Object.defineProperty(exports, "__esModule", {
    value: true
});
exports.getElementMaxHeightByWindow = void 0;
var _renderer = require("../../core/renderer");
var _renderer2 = _interopRequireDefault(_renderer);
var _window = require("../../core/utils/window");

function _interopRequireDefault(obj) {
    return obj && obj.__esModule ? obj : {
        "default": obj
    }
}
var WINDOW_HEIGHT_PERCENT = .9;
var getElementMaxHeightByWindow = exports.getElementMaxHeightByWindow = function($element) {
    var window = (0, _window.getWindow)();
    var offsetTop = $element.offset().top - (0, _renderer2.default)(window).scrollTop();
    var offsetBottom = (0, _renderer2.default)(window).innerHeight() - offsetTop - $element.outerHeight();
    return Math.max(offsetTop, offsetBottom) * WINDOW_HEIGHT_PERCENT
};
