/**
 * DevExtreme (viz/series/bubble_series.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";

function _defineProperty(obj, key, value) {
    if (key in obj) {
        Object.defineProperty(obj, key, {
            value: value,
            enumerable: true,
            configurable: true,
            writable: true
        })
    } else {
        obj[key] = value
    }
    return obj
}
var lineSeries = require("./line_series").chart.line;
var scatterSeries = require("./scatter_series").chart;
var areaSeries = require("./area_series").chart.area;
var barSeries = require("./bar_series");
var chartBarSeries = barSeries.chart.bar;
var polarBarSeries = barSeries.polar.bar;
var extend = require("../../core/utils/extend").extend;
var each = require("../../core/utils/iterator").each;
var _extend = extend;
var _each = each;
var _noop = require("../../core/utils/common").noop;
exports.chart = {};
exports.chart.bubble = _extend({}, scatterSeries, {
    _calculateErrorBars: _noop,
    _getMainColor: chartBarSeries._getMainColor,
    _createPointStyles: chartBarSeries._createPointStyles,
    _updatePointsVisibility: chartBarSeries._updatePointsVisibility,
    _getOptionsForPoint: chartBarSeries._getOptionsForPoint,
    _applyMarkerClipRect: lineSeries._applyElementsClipRect,
    _parsePointStyle: polarBarSeries._parsePointStyle,
    _createLegendState: areaSeries._createLegendState,
    _setMarkerGroupSettings: polarBarSeries._setMarkerGroupSettings,
    areErrorBarsVisible: _noop,
    _createErrorBarGroup: _noop,
    _checkData: function(data, skippedFields) {
        return scatterSeries._checkData.call(this, data, skippedFields, {
            value: this.getValueFields()[0],
            size: this.getSizeField()
        })
    },
    _getPointDataSelector: function(data, options) {
        var sizeField = this.getSizeField();
        var baseGetter = scatterSeries._getPointDataSelector.call(this);
        return function(data) {
            var pointData = baseGetter(data);
            pointData.size = data[sizeField];
            return pointData
        }
    },
    _aggregators: {
        avg: function(_ref, series) {
            var _ref2;
            var data = _ref.data,
                intervalStart = _ref.intervalStart;
            if (!data.length) {
                return
            }
            var valueField = series.getValueFields()[0];
            var sizeField = series.getSizeField();
            var aggregate = data.reduce(function(result, item) {
                result[0] += item[valueField];
                result[1] += item[sizeField];
                result[2]++;
                return result
            }, [0, 0, 0]);
            return _ref2 = {}, _defineProperty(_ref2, valueField, aggregate[0] / aggregate[2]), _defineProperty(_ref2, sizeField, aggregate[1] / aggregate[2]), _defineProperty(_ref2, series.getArgumentField(), intervalStart), _ref2
        }
    },
    getValueFields: function() {
        return [this._options.valueField || "val"]
    },
    getSizeField: function() {
        return this._options.sizeField || "size"
    },
    _animate: function() {
        var that = this;
        var lastPointIndex = that._drawnPoints.length - 1;
        var labelsGroup = that._labelsGroup;
        var labelAnimFunc = function() {
            labelsGroup && labelsGroup.animate({
                opacity: 1
            }, {
                duration: that._defaultDuration
            })
        };
        _each(that._drawnPoints || [], function(i, p) {
            p.animate(i === lastPointIndex ? labelAnimFunc : void 0, {
                r: p.bubbleSize,
                translateX: p.x,
                translateY: p.y
            })
        })
    },
    _patchMarginOptions: function(options) {
        options.processBubbleSize = true;
        return options
    }
});
