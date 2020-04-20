/**
 * DevExtreme (viz/series/financial_series.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var scatterSeries = require("./scatter_series").chart;
var barSeries = require("./bar_series").chart.bar;
var _extend = require("../../core/utils/extend").extend;
var _isDefined = require("../../core/utils/type").isDefined;
var _normalizeEnum = require("../core/utils").normalizeEnum;
var _noop = require("../../core/utils/common").noop;
var DEFAULT_FINANCIAL_POINT_SIZE = 10;
exports.stock = _extend({}, scatterSeries, {
    _animate: _noop,
    _applyMarkerClipRect: function(settings) {
        settings["clip-path"] = this._forceClipping ? this._paneClipRectID : this._widePaneClipRectID
    },
    _updatePointsVisibility: barSeries._updatePointsVisibility,
    _getOptionsForPoint: barSeries._getOptionsForPoint,
    _createErrorBarGroup: _noop,
    areErrorBarsVisible: _noop,
    _createGroups: scatterSeries._createGroups,
    _setMarkerGroupSettings: function() {
        var that = this;
        var markersGroup = that._markersGroup;
        var styles = that._createPointStyles(that._getMarkerGroupOptions());
        var defaultStyle = _extend(styles.normal, {
            "class": "default-markers"
        });
        var defaultPositiveStyle = _extend(styles.positive.normal, {
            "class": "default-positive-markers"
        });
        var reductionStyle = _extend(styles.reduction.normal, {
            "class": "reduction-markers"
        });
        var reductionPositiveStyle = _extend(styles.reductionPositive.normal, {
            "class": "reduction-positive-markers"
        });
        var markerSettings = {
            "class": "dxc-markers"
        };
        that._applyMarkerClipRect(markerSettings);
        markersGroup.attr(markerSettings);
        that._createGroup("defaultMarkersGroup", markersGroup, markersGroup, defaultStyle);
        that._createGroup("reductionMarkersGroup", markersGroup, markersGroup, reductionStyle);
        that._createGroup("defaultPositiveMarkersGroup", markersGroup, markersGroup, defaultPositiveStyle);
        that._createGroup("reductionPositiveMarkersGroup", markersGroup, markersGroup, reductionPositiveStyle)
    },
    _setGroupsSettings: function() {
        scatterSeries._setGroupsSettings.call(this, false)
    },
    _getCreatingPointOptions: function() {
        var that = this;
        var defaultPointOptions;
        var creatingPointOptions = that._predefinedPointOptions;
        if (!creatingPointOptions) {
            defaultPointOptions = this._getPointOptions();
            that._predefinedPointOptions = creatingPointOptions = _extend(true, {
                styles: {}
            }, defaultPointOptions);
            creatingPointOptions.styles.normal = creatingPointOptions.styles.positive.normal = creatingPointOptions.styles.reduction.normal = creatingPointOptions.styles.reductionPositive.normal = {
                "stroke-width": defaultPointOptions.styles && defaultPointOptions.styles.normal && defaultPointOptions.styles.normal["stroke-width"]
            }
        }
        return creatingPointOptions
    },
    _checkData: function(data, skippedFields) {
        var valueFields = this.getValueFields();
        return scatterSeries._checkData.call(this, data, skippedFields, {
            openValue: valueFields[0],
            highValue: valueFields[1],
            lowValue: valueFields[2],
            closeValue: valueFields[3]
        }) && data.highValue === data.highValue && data.lowValue === data.lowValue
    },
    _getPointDataSelector: function(data, options) {
        var _this = this;
        var that = this;
        var level;
        var valueFields = that.getValueFields();
        var argumentField = that.getArgumentField();
        var openValueField = valueFields[0];
        var highValueField = valueFields[1];
        var lowValueField = valueFields[2];
        var closeValueField = valueFields[3];
        that.level = that._options.reduction.level;
        switch (_normalizeEnum(that.level)) {
            case "open":
                level = openValueField;
                break;
            case "high":
                level = highValueField;
                break;
            case "low":
                level = lowValueField;
                break;
            default:
                level = closeValueField;
                that.level = "close"
        }
        var prevLevelValue;
        return function(data) {
            var reductionValue = data[level];
            var isReduction = false;
            if (_isDefined(reductionValue)) {
                if (_isDefined(prevLevelValue)) {
                    isReduction = reductionValue < prevLevelValue
                }
                prevLevelValue = reductionValue
            }
            return {
                argument: data[argumentField],
                highValue: _this._processEmptyValue(data[highValueField]),
                lowValue: _this._processEmptyValue(data[lowValueField]),
                closeValue: _this._processEmptyValue(data[closeValueField]),
                openValue: _this._processEmptyValue(data[openValueField]),
                reductionValue: reductionValue,
                tag: data[that.getTagField()],
                isReduction: isReduction,
                data: data
            }
        }
    },
    _parsePointStyle: function(style, defaultColor, innerColor) {
        return {
            stroke: style.color || defaultColor,
            "stroke-width": style.width,
            fill: style.color || innerColor
        }
    },
    _getDefaultStyle: function(options) {
        var that = this;
        var mainPointColor = options.color || that._options.mainSeriesColor;
        return {
            normal: that._parsePointStyle(options, mainPointColor, mainPointColor),
            hover: that._parsePointStyle(options.hoverStyle, mainPointColor, mainPointColor),
            selection: that._parsePointStyle(options.selectionStyle, mainPointColor, mainPointColor)
        }
    },
    _getReductionStyle: function(options) {
        var that = this;
        var reductionColor = options.reduction.color;
        return {
            normal: that._parsePointStyle({
                color: reductionColor,
                width: options.width,
                hatching: options.hatching
            }, reductionColor, reductionColor),
            hover: that._parsePointStyle(options.hoverStyle, reductionColor, reductionColor),
            selection: that._parsePointStyle(options.selectionStyle, reductionColor, reductionColor)
        }
    },
    _createPointStyles: function(pointOptions) {
        var that = this;
        var innerColor = that._options.innerColor;
        var styles = that._getDefaultStyle(pointOptions);
        var positiveStyle;
        var reductionStyle;
        var reductionPositiveStyle;
        positiveStyle = _extend(true, {}, styles);
        reductionStyle = that._getReductionStyle(pointOptions);
        reductionPositiveStyle = _extend(true, {}, reductionStyle);
        positiveStyle.normal.fill = positiveStyle.hover.fill = positiveStyle.selection.fill = innerColor;
        reductionPositiveStyle.normal.fill = reductionPositiveStyle.hover.fill = reductionPositiveStyle.selection.fill = innerColor;
        styles.positive = positiveStyle;
        styles.reduction = reductionStyle;
        styles.reductionPositive = reductionPositiveStyle;
        return styles
    },
    _endUpdateData: function() {
        delete this._predefinedPointOptions
    },
    _defaultAggregator: "ohlc",
    _aggregators: {
        ohlc: function(_ref, series) {
            var intervalStart = _ref.intervalStart,
                data = _ref.data;
            if (!data.length) {
                return
            }
            var result = {};
            var valueFields = series.getValueFields();
            var highValueField = valueFields[1];
            var lowValueField = valueFields[2];
            result[highValueField] = -(1 / 0);
            result[lowValueField] = 1 / 0;
            result = data.reduce(function(result, item) {
                if (null !== item[highValueField]) {
                    result[highValueField] = Math.max(result[highValueField], item[highValueField])
                }
                if (null !== item[lowValueField]) {
                    result[lowValueField] = Math.min(result[lowValueField], item[lowValueField])
                }
                return result
            }, result);
            result[valueFields[0]] = data[0][valueFields[0]];
            result[valueFields[3]] = data[data.length - 1][valueFields[3]];
            if (!isFinite(result[highValueField])) {
                result[highValueField] = null
            }
            if (!isFinite(result[lowValueField])) {
                result[lowValueField] = null
            }
            result[series.getArgumentField()] = intervalStart;
            return result
        }
    },
    getValueFields: function() {
        var options = this._options;
        return [options.openValueField || "open", options.highValueField || "high", options.lowValueField || "low", options.closeValueField || "close"]
    },
    getArgumentField: function() {
        return this._options.argumentField || "date"
    },
    _patchMarginOptions: function(options) {
        var pointOptions = this._getCreatingPointOptions();
        var styles = pointOptions.styles;
        var border = [styles.normal, styles.hover, styles.selection].reduce(function(max, style) {
            return Math.max(max, style["stroke-width"])
        }, 0);
        options.size = DEFAULT_FINANCIAL_POINT_SIZE + border;
        options.sizePointNormalState = DEFAULT_FINANCIAL_POINT_SIZE;
        return options
    },
    getSeriesPairCoord: function(coord, isArgument) {
        var oppositeCoord = null;
        var points = this.getVisiblePoints();
        for (var i = 0; i < points.length; i++) {
            var p = points[i];
            var tmpCoord = void 0;
            if (isArgument) {
                tmpCoord = p.vx === coord ? (p.openY + p.closeY) / 2 : void 0
            } else {
                var coords = [Math.min(p.lowY, p.highY), Math.max(p.lowY, p.highY)];
                tmpCoord = coord >= coords[0] && coord <= coords[1] ? p.vx : void 0
            }
            if (this.checkAxisVisibleAreaCoord(!isArgument, tmpCoord)) {
                oppositeCoord = tmpCoord;
                break
            }
        }
        return oppositeCoord
    },
    usePointsToDefineAutoHiding: function() {
        return false
    }
});
exports.candlestick = _extend({}, exports.stock, {
    _parsePointStyle: function(style, defaultColor, innerColor) {
        var color = style.color || innerColor;
        var base = exports.stock._parsePointStyle.call(this, style, defaultColor, color);
        base.fill = color;
        base.hatching = style.hatching;
        return base
    }
});
