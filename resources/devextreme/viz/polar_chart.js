/**
 * DevExtreme (viz/polar_chart.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var _noop = require("../core/utils/common").noop;
var registerComponent = require("../core/component_registrator");
var extend = require("../core/utils/extend").extend;
var vizUtils = require("./core/utils");
var AdvancedChart = require("./chart_components/advanced_chart").AdvancedChart;
var DEFAULT_PANE_NAME = "default";
var dxPolarChart = AdvancedChart.inherit({
    _themeSection: "polar",
    _createPanes: function() {
        this.callBase();
        return [{
            name: DEFAULT_PANE_NAME
        }]
    },
    _checkPaneName: function() {
        return true
    },
    _getAxisRenderingOptions: function(typeSelector) {
        var isArgumentAxis = "argumentAxis" === typeSelector;
        var type = isArgumentAxis ? "circular" : "linear";
        var useSpiderWeb = this.option("useSpiderWeb");
        if (useSpiderWeb) {
            type += "Spider"
        }
        return {
            axisType: "polarAxes",
            drawingType: type
        }
    },
    _prepareAxisOptions: function(typeSelector, axisOptions) {
        var isArgumentAxis = "argumentAxis" === typeSelector;
        var themeManager = this._themeManager;
        var axisUserOptions = this.option("argumentAxis");
        var argumentAxisOptions = themeManager.getOptions("argumentAxis", axisUserOptions) || {};
        var startAngle = isFinite(argumentAxisOptions.startAngle) ? vizUtils.normalizeAngle(argumentAxisOptions.startAngle) : 0;
        return {
            type: this.option("useSpiderWeb") && isArgumentAxis ? "discrete" : axisOptions.type,
            isHorizontal: true,
            showCustomBoundaryTicks: isArgumentAxis,
            startAngle: startAngle,
            endAngle: startAngle + 360
        }
    },
    _optionChangesMap: {
        useSpiderWeb: "AXES_AND_PANES"
    },
    _getExtraOptions: function() {
        return {
            spiderWidget: this.option("useSpiderWeb")
        }
    },
    _prepareToRender: function() {
        this._appendAxesGroups();
        return {}
    },
    _calcCanvas: function() {
        var canvas = extend({}, this._canvas);
        var argumentAxis = this.getArgumentAxis();
        var margins = argumentAxis.getMargins();
        Object.keys(margins).forEach(function(margin) {
            return canvas[margin] = canvas["original".concat(margin[0].toUpperCase()).concat(margin.slice(1))] + margins[margin]
        });
        return canvas
    },
    _renderAxes: function(drawOptions) {
        var that = this;
        var valueAxis = that._getValueAxis();
        var argumentAxis = that.getArgumentAxis();
        argumentAxis.draw(that._canvas);
        valueAxis.setSpiderTicks(argumentAxis.getSpiderTicks());
        var canvas = that._calcCanvas();
        argumentAxis.updateSize(canvas);
        valueAxis.draw(canvas);
        return canvas
    },
    _getValueAxis: function() {
        return this._valueAxes[0]
    },
    _shrinkAxes: function(sizeStorage) {
        var valueAxis = this._getValueAxis();
        var argumentAxis = this.getArgumentAxis();
        if (sizeStorage && (sizeStorage.width || sizeStorage.height)) {
            argumentAxis.hideOuterElements();
            var canvas = this._calcCanvas();
            argumentAxis.updateSize(canvas);
            valueAxis.updateSize(canvas)
        }
    },
    checkForMoreSpaceForPanesCanvas: function() {
        return this.layoutManager.needMoreSpaceForPanesCanvas([{
            canvas: this.getArgumentAxis().getCanvas()
        }], this._isRotated())
    },
    _getLayoutTargets: function() {
        return [{
            canvas: this._canvas
        }]
    },
    _getSeriesForPane: function() {
        return this.series
    },
    _applyClipRects: function() {
        var canvasClipRectID = this._getCanvasClipRectID();
        this._createClipPathForPane();
        this.getArgumentAxis().applyClipRects(this._getElementsClipRectID(), canvasClipRectID);
        this._getValueAxis().applyClipRects(this._getElementsClipRectID(), canvasClipRectID)
    },
    _createClipPathForPane: function() {
        var that = this;
        var valueAxis = that._getValueAxis();
        var center = valueAxis.getCenter();
        var radius = valueAxis.getRadius();
        var panesClipRects = that._panesClipRects;
        center = {
            x: Math.round(center.x),
            y: Math.round(center.y)
        };
        that._createClipCircle(panesClipRects.fixed, center.x, center.y, radius);
        that._createClipCircle(panesClipRects.base, center.x, center.y, radius);
        if (that.series.some(function(s) {
                return s.areErrorBarsVisible()
            })) {
            that._createClipCircle(panesClipRects.wide, center.x, center.y, radius)
        } else {
            panesClipRects.wide[0] = null
        }
    },
    _createClipCircle: function(clipArray, left, top, radius) {
        var that = this;
        var clipCircle = clipArray[0];
        if (!clipCircle) {
            clipCircle = that._renderer.clipCircle(left, top, radius);
            clipArray[0] = clipCircle
        } else {
            clipCircle.attr({
                cx: left,
                cy: top,
                r: radius
            })
        }
    },
    _applyExtraSettings: function(series) {
        var wideClipRect = this._panesClipRects.wide[0];
        series.setClippingParams(this._panesClipRects.base[0].id, wideClipRect && wideClipRect.id, false, false)
    },
    _applyPointMarkersAutoHiding: _noop,
    _createScrollBar: _noop,
    _isRotated: _noop,
    _getCrosshairOptions: _noop,
    _isLegendInside: _noop
});
registerComponent("dxPolarChart", dxPolarChart);
module.exports = dxPolarChart;
module.exports.default = module.exports;
