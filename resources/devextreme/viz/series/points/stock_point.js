/**
 * DevExtreme (viz/series/points/stock_point.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var extend = require("../../../core/utils/extend").extend;
var isNumeric = require("../../../core/utils/type").isNumeric;
var candlestickPoint = require("./candlestick_point");
var _extend = extend;
var _isNumeric = isNumeric;
module.exports = _extend({}, candlestickPoint, {
    _getPoints: function() {
        var that = this;
        var createPoint = that._options.rotated ? function(x, y) {
            return [y, x]
        } : function(x, y) {
            return [x, y]
        };
        var openYExist = _isNumeric(that.openY);
        var closeYExist = _isNumeric(that.closeY);
        var x = that.x;
        var width = that.width;
        var points;
        points = [].concat(createPoint(x, that.highY));
        openYExist && (points = points.concat(createPoint(x, that.openY)));
        openYExist && (points = points.concat(createPoint(x - width / 2, that.openY)));
        openYExist && (points = points.concat(createPoint(x, that.openY)));
        closeYExist && (points = points.concat(createPoint(x, that.closeY)));
        closeYExist && (points = points.concat(createPoint(x + width / 2, that.closeY)));
        closeYExist && (points = points.concat(createPoint(x, that.closeY)));
        points = points.concat(createPoint(x, that.lowY));
        return points
    },
    _drawMarkerInGroup: function(group, attributes, renderer) {
        this.graphic = renderer.path(this._getPoints(), "line").attr({
            "stroke-linecap": "square"
        }).attr(attributes).data({
            "chart-data-point": this
        }).sharp().append(group)
    },
    _getMinTrackerWidth: function() {
        var width = 2 + this._styles.normal["stroke-width"];
        return width + width % 2
    }
});
