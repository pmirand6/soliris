/**
 * DevExtreme (viz/series/bar_series.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var extend = require("../../core/utils/extend").extend;
var each = require("../../core/utils/iterator").each;
var scatterSeries = require("./scatter_series");
var areaSeries = require("./area_series").chart.area;
var chartSeries = scatterSeries.chart;
var polarSeries = scatterSeries.polar;
var _extend = extend;
var _each = each;
exports.chart = {};
exports.polar = {};
var baseBarSeriesMethods = {
    _createLegendState: function(styleOptions, defaultColor) {
        return {
            fill: styleOptions.color || defaultColor,
            hatching: styleOptions.hatching
        }
    },
    _parsePointStyle: function(style, defaultColor, defaultBorderColor) {
        var color = style.color || defaultColor;
        var base = chartSeries._parsePointStyle.call(this, style, color, defaultBorderColor);
        base.fill = color;
        base.hatching = style.hatching;
        base.dashStyle = style.border && style.border.dashStyle || "solid";
        delete base.r;
        return base
    },
    _applyMarkerClipRect: function(settings) {
        settings["clip-path"] = null
    },
    _setGroupsSettings: function(animationEnabled, firstDrawing) {
        var that = this;
        var settings = {};
        chartSeries._setGroupsSettings.apply(that, arguments);
        if (animationEnabled && firstDrawing) {
            settings = this._getAffineCoordOptions()
        } else {
            if (!animationEnabled) {
                settings = {
                    scaleX: 1,
                    scaleY: 1,
                    translateX: 0,
                    translateY: 0
                }
            }
        }
        that._markersGroup.attr(settings)
    },
    _drawPoint: function(options) {
        options.hasAnimation = options.hasAnimation && !options.firstDrawing;
        options.firstDrawing = false;
        chartSeries._drawPoint.call(this, options)
    },
    _getMainColor: function() {
        return this._options.mainSeriesColor
    },
    _createPointStyles: function(pointOptions) {
        var that = this;
        var mainColor = pointOptions.color || that._getMainColor();
        return {
            normal: that._parsePointStyle(pointOptions, mainColor, mainColor),
            hover: that._parsePointStyle(pointOptions.hoverStyle || {}, mainColor, mainColor),
            selection: that._parsePointStyle(pointOptions.selectionStyle || {}, mainColor, mainColor)
        }
    },
    _updatePointsVisibility: function() {
        var visibility = this._options.visible;
        each(this._points, function(_, point) {
            point._options.visible = visibility
        })
    },
    _getOptionsForPoint: function() {
        return this._options
    },
    _animate: function(firstDrawing) {
        var that = this;
        var complete = function() {
            that._animateComplete()
        };
        var animateFunc = function(drawnPoints, complete) {
            var lastPointIndex = drawnPoints.length - 1;
            _each(drawnPoints || [], function(i, point) {
                point.animate(i === lastPointIndex ? complete : void 0, point.getMarkerCoords())
            })
        };
        that._animatePoints(firstDrawing, complete, animateFunc)
    },
    getValueRangeInitialValue: areaSeries.getValueRangeInitialValue,
    _patchMarginOptions: function(options) {
        options.checkInterval = true;
        return options
    },
    _defaultAggregator: "sum",
    _defineDrawingState: function() {},
    usePointsToDefineAutoHiding: function() {
        return false
    }
};
exports.chart.bar = _extend({}, chartSeries, baseBarSeriesMethods, {
    _getAffineCoordOptions: function() {
        var rotated = this._options.rotated;
        var direction = rotated ? "X" : "Y";
        var settings = {
            scaleX: rotated ? .001 : 1,
            scaleY: rotated ? 1 : .001
        };
        settings["translate" + direction] = this.getValueAxis().getTranslator().translate("canvas_position_default");
        return settings
    },
    _animatePoints: function(firstDrawing, complete, animateFunc) {
        var that = this;
        that._markersGroup.animate({
            scaleX: 1,
            scaleY: 1,
            translateY: 0,
            translateX: 0
        }, void 0, complete);
        if (!firstDrawing) {
            animateFunc(that._drawnPoints, complete)
        }
    },
    checkSeriesViewportCoord: function(axis, coord) {
        if (0 === this._points.length) {
            return false
        }
        if (axis.isArgumentAxis) {
            return true
        }
        var translator = axis.getTranslator();
        var range = this.getViewport();
        var min = translator.translate(range.categories ? range.categories[0] : range.min);
        var max = translator.translate(range.categories ? range.categories[range.categories.length - 1] : range.max);
        var rotated = this.getOptions().rotated;
        var inverted = axis.getOptions().inverted;
        return rotated && !inverted || !rotated && inverted ? coord >= min && coord <= max : coord >= max && coord <= min
    },
    getSeriesPairCoord: function(coord, isArgument) {
        var oppositeCoord = null;
        var rotated = this._options.rotated;
        var isOpposite = !isArgument && !rotated || isArgument && rotated;
        var coordName = isOpposite ? "vy" : "vx";
        var oppositeCoordName = isOpposite ? "vx" : "vy";
        var points = this.getPoints();
        for (var i = 0; i < points.length; i++) {
            var p = points[i];
            var tmpCoord = void 0;
            if (isArgument) {
                tmpCoord = p.getCenterCoord()[coordName[1]] === coord ? p[oppositeCoordName] : void 0
            } else {
                tmpCoord = p[coordName] === coord ? p[oppositeCoordName] : void 0
            }
            if (this.checkAxisVisibleAreaCoord(!isArgument, tmpCoord)) {
                oppositeCoord = tmpCoord;
                break
            }
        }
        return oppositeCoord
    }
});
exports.polar.bar = _extend({}, polarSeries, baseBarSeriesMethods, {
    _animatePoints: function(firstDrawing, complete, animateFunc) {
        animateFunc(this._drawnPoints, complete)
    },
    _setGroupsSettings: chartSeries._setGroupsSettings,
    _drawPoint: function(point, groups, animationEnabled) {
        chartSeries._drawPoint.call(this, point, groups, animationEnabled)
    },
    _parsePointStyle: function(style) {
        var base = baseBarSeriesMethods._parsePointStyle.apply(this, arguments);
        base.opacity = style.opacity;
        return base
    },
    _createGroups: chartSeries._createGroups,
    _setMarkerGroupSettings: function() {
        var that = this;
        var markersSettings = that._createPointStyles(that._getMarkerGroupOptions()).normal;
        var groupSettings;
        markersSettings.class = "dxc-markers";
        that._applyMarkerClipRect(markersSettings);
        groupSettings = _extend({}, markersSettings);
        delete groupSettings.opacity;
        that._markersGroup.attr(groupSettings)
    },
    _createLegendState: areaSeries._createLegendState
});
