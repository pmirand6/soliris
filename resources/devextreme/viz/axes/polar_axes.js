/**
 * DevExtreme (viz/axes/polar_axes.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var vizUtils = require("../core/utils");
var isDefined = require("../../core/utils/type").isDefined;
var extend = require("../../core/utils/extend").extend;
var constants = require("./axes_constants");
var circularAxes;
var xyAxesLinear = require("./xy_axes").linear;
var tick = require("./tick").tick;
var polarAxes;
var _map = vizUtils.map;
var baseAxisModule = require("./base_axis");
var _math = Math;
var _abs = _math.abs;
var _round = _math.round;
var convertPolarToXY = vizUtils.convertPolarToXY;
var _extend = extend;
var _noop = require("../../core/utils/common").noop;
var HALF_PI_ANGLE = 90;

function getPolarQuarter(angle) {
    var quarter;
    angle = vizUtils.normalizeAngle(angle);
    if (angle >= 315 && angle <= 360 || angle < 45 && angle >= 0) {
        quarter = 1
    } else {
        if (angle >= 45 && angle < 135) {
            quarter = 2
        } else {
            if (angle >= 135 && angle < 225) {
                quarter = 3
            } else {
                if (angle >= 225 && angle < 315) {
                    quarter = 4
                }
            }
        }
    }
    return quarter
}
polarAxes = exports;
circularAxes = polarAxes.circular = {
    _calculateValueMargins: function(ticks) {
        var _this$_getViewportRan = this._getViewportRange(),
            minVisible = _this$_getViewportRan.minVisible,
            maxVisible = _this$_getViewportRan.maxVisible;
        if (ticks && ticks.length > 1) {
            minVisible = minVisible < ticks[0].value ? minVisible : ticks[0].value;
            maxVisible = minVisible > ticks[ticks.length - 1].value ? maxVisible : ticks[ticks.length - 1].value
        }
        return {
            minValue: minVisible,
            maxValue: maxVisible
        }
    },
    applyMargins: function() {
        var margins = this._calculateValueMargins(this._majorTicks);
        var br = this._translator.getBusinessRange();
        br.addRange({
            minVisible: margins.minValue,
            maxVisible: margins.maxValue,
            interval: this._calculateRangeInterval(br.interval)
        });
        this._translator.updateBusinessRange(br)
    },
    _getTranslatorOptions: function() {
        return {
            isHorizontal: true,
            conversionValue: true,
            addSpiderCategory: this._getSpiderCategoryOption(),
            stick: this._getStick()
        }
    },
    getCenter: function() {
        return this._center
    },
    getRadius: function() {
        return this._radius
    },
    getAngles: function() {
        var options = this._options;
        return [options.startAngle, options.endAngle]
    },
    _updateRadius: function(canvas) {
        var rad = Math.min(canvas.width - canvas.left - canvas.right, canvas.height - canvas.top - canvas.bottom) / 2;
        this._radius = rad < 0 ? 0 : rad
    },
    _updateCenter: function(canvas) {
        this._center = {
            x: canvas.left + (canvas.width - canvas.right - canvas.left) / 2,
            y: canvas.top + (canvas.height - canvas.top - canvas.bottom) / 2
        }
    },
    _processCanvas: function(canvas) {
        this._updateRadius(canvas);
        this._updateCenter(canvas);
        return {
            left: 0,
            right: 0,
            width: this._getScreenDelta()
        }
    },
    _createAxisElement: function() {
        return this._renderer.circle()
    },
    _updateAxisElementPosition: function() {
        var center = this.getCenter();
        this._axisElement.attr({
            cx: center.x,
            cy: center.y,
            r: this.getRadius()
        })
    },
    _boundaryTicksVisibility: {
        min: true
    },
    _getSpiderCategoryOption: function() {
        return this._options.firstPointOnStartAngle
    },
    _validateOptions: function(options) {
        var that = this;
        var originValue = options.originValue;
        var wholeRange = options.wholeRange = {};
        var period = options.period;
        if (isDefined(originValue)) {
            originValue = that.validateUnit(originValue)
        }
        if (period > 0 && options.argumentType === constants.numeric) {
            originValue = originValue || 0;
            wholeRange.endValue = originValue + period;
            that._viewport = vizUtils.getVizRangeObject([originValue, wholeRange.endValue])
        }
        if (isDefined(originValue)) {
            wholeRange.startValue = originValue
        }
    },
    getMargins: function() {
        var tickOptions = this._options.tick;
        var tickOuterLength = Math.max(tickOptions.visible ? tickOptions.length / 2 + tickOptions.shift : 0, 0);
        var radius = this.getRadius();
        var _this$_center = this._center,
            x = _this$_center.x,
            y = _this$_center.y;
        var labelBoxes = this._majorTicks.map(function(t) {
            return t.label && t.label.getBBox()
        }).filter(function(b) {
            return b
        });
        var canvas = extend({}, this._canvas, {
            left: x - radius,
            top: y - radius,
            right: this._canvas.width - (x + radius),
            bottom: this._canvas.height - (y + radius)
        });
        var margins = baseAxisModule.calculateCanvasMargins(labelBoxes, canvas);
        Object.keys(margins).forEach(function(k) {
            return margins[k] = margins[k] < tickOuterLength ? tickOuterLength : margins[k]
        });
        return margins
    },
    updateSize: function() {
        var that = this;
        baseAxisModule.Axis.prototype.updateSize.apply(that, arguments);
        baseAxisModule.measureLabels(that._majorTicks);
        that._adjustLabelsCoord(0, 0, true);
        this._checkBoundedLabelsOverlapping(this._majorTicks, this._majorTicks.map(function(t) {
            return t.labelBBox
        }))
    },
    _setVisualRange: _noop,
    applyVisualRangeSetter: _noop,
    allowToExtendVisualRange: function(isEnd) {
        return true
    },
    _getStick: function() {
        return this._options.firstPointOnStartAngle || this._options.type !== constants.discrete
    },
    _getTranslatedCoord: function(value, offset) {
        return this._translator.translate(value, offset) - HALF_PI_ANGLE
    },
    _getCanvasStartEnd: function() {
        return {
            start: 0 - HALF_PI_ANGLE,
            end: 360 - HALF_PI_ANGLE
        }
    },
    _getStripGraphicAttributes: function(fromAngle, toAngle) {
        var center = this.getCenter();
        var angle = this.getAngles()[0];
        var r = this.getRadius();
        return {
            x: center.x,
            y: center.y,
            innerRadius: 0,
            outerRadius: r,
            startAngle: -toAngle - angle,
            endAngle: -fromAngle - angle
        }
    },
    _createStrip: function(coords) {
        return this._renderer.arc(coords.x, coords.y, coords.innerRadius, coords.outerRadius, coords.startAngle, coords.endAngle)
    },
    _getStripLabelCoords: function(from, to) {
        var that = this;
        var coords = that._getStripGraphicAttributes(from, to);
        var angle = coords.startAngle + (coords.endAngle - coords.startAngle) / 2;
        var cosSin = vizUtils.getCosAndSin(angle);
        var halfRad = that.getRadius() / 2;
        var center = that.getCenter();
        var x = _round(center.x + halfRad * cosSin.cos);
        var y = _round(center.y - halfRad * cosSin.sin);
        return {
            x: x,
            y: y,
            align: constants.center
        }
    },
    _getConstantLineGraphicAttributes: function(value) {
        var center = this.getCenter();
        var r = this.getRadius();
        return {
            points: [center.x, center.y, center.x + r, center.y]
        }
    },
    _createConstantLine: function(value, attr) {
        return this._createPathElement(this._getConstantLineGraphicAttributes(value).points, attr)
    },
    _rotateConstantLine: function(line, value) {
        var _this$getCenter = this.getCenter(),
            x = _this$getCenter.x,
            y = _this$getCenter.y;
        line.rotate(value + this.getAngles()[0], x, y)
    },
    _getConstantLineLabelsCoords: function(value) {
        var that = this;
        var cosSin = vizUtils.getCosAndSin(-value - that.getAngles()[0]);
        var halfRad = that.getRadius() / 2;
        var center = that.getCenter();
        var x = _round(center.x + halfRad * cosSin.cos);
        var y = _round(center.y - halfRad * cosSin.sin);
        return {
            x: x,
            y: y
        }
    },
    _checkAlignmentConstantLineLabels: _noop,
    _adjustDivisionFactor: function(val) {
        return 180 * val / (this.getRadius() * Math.PI)
    },
    _getScreenDelta: function() {
        var angles = this.getAngles();
        return _math.abs(angles[0] - angles[1])
    },
    _getTickMarkPoints: function(coords, length, _ref) {
        var _ref$shift = _ref.shift,
            shift = void 0 === _ref$shift ? 0 : _ref$shift;
        var center = this.getCenter();
        var corrections = {
            inside: -1,
            center: -.5,
            outside: 0
        };
        var radiusWithTicks = this.getRadius() + length * corrections[this._options.tickOrientation || "center"];
        return [center.x + radiusWithTicks + shift, center.y, center.x + radiusWithTicks + length + shift, center.y]
    },
    _getLabelAdjustedCoord: function(tick, _offset, _maxWidth, checkCanvas) {
        var that = this;
        var labelCoords = tick.labelCoords;
        var labelY = labelCoords.y;
        var labelAngle = labelCoords.angle;
        var cosSin = vizUtils.getCosAndSin(labelAngle);
        var cos = cosSin.cos;
        var sin = cosSin.sin;
        var box = tick.labelBBox;
        var halfWidth = box.width / 2;
        var halfHeight = box.height / 2;
        var indentFromAxis = that._options.label.indentFromAxis || 0;
        var x = labelCoords.x + indentFromAxis * cos;
        var y = labelY + (labelY - box.y - halfHeight) + indentFromAxis * sin;
        var shiftX = 0;
        var shiftY = 0;
        switch (getPolarQuarter(labelAngle)) {
            case 1:
                shiftX = halfWidth;
                shiftY = halfHeight * sin;
                break;
            case 2:
                shiftX = halfWidth * cos;
                shiftY = halfHeight;
                break;
            case 3:
                shiftX = -halfWidth;
                shiftY = halfHeight * sin;
                break;
            case 4:
                shiftX = halfWidth * cos;
                shiftY = -halfHeight
        }
        if (checkCanvas) {
            var canvas = that._canvas;
            var boxShiftX = x - labelCoords.x + shiftX;
            var boxShiftY = y - labelCoords.y + shiftY;
            if (box.x + boxShiftX < canvas.originalLeft) {
                shiftX -= box.x + boxShiftX - canvas.originalLeft
            }
            if (box.x + box.width + boxShiftX > canvas.width - canvas.originalRight) {
                shiftX -= box.x + box.width + boxShiftX - (canvas.width - canvas.originalRight)
            }
            if (box.y + boxShiftY < canvas.originalTop) {
                shiftY -= box.y + boxShiftY - canvas.originalTop
            }
            if (box.y + box.height + boxShiftY > canvas.height - canvas.originalBottom) {
                shiftY -= box.y + box.height + boxShiftY - (canvas.height - canvas.originalBottom)
            }
        }
        return {
            x: x + shiftX,
            y: y + shiftY
        }
    },
    _getGridLineDrawer: function() {
        var that = this;
        return function(tick, gridStyle) {
            var center = that.getCenter();
            return that._createPathElement(that._getGridPoints().points, gridStyle).rotate(tick.coords.angle, center.x, center.y)
        }
    },
    _getGridPoints: function() {
        var r = this.getRadius();
        var center = this.getCenter();
        return {
            points: [center.x, center.y, center.x + r, center.y]
        }
    },
    _getTranslatedValue: function(value, offset) {
        var startAngle = this.getAngles()[0];
        var angle = this._translator.translate(value, -offset);
        var coords = convertPolarToXY(this.getCenter(), startAngle, angle, this.getRadius());
        return {
            x: coords.x,
            y: coords.y,
            angle: angle + startAngle - HALF_PI_ANGLE
        }
    },
    _getAdjustedStripLabelCoords: function(strip) {
        var box = strip.labelBBox;
        return {
            translateY: strip.label.attr("y") - box.y - box.height / 2
        }
    },
    coordsIn: function(x, y) {
        return vizUtils.convertXYToPolar(this.getCenter(), x, y).r > this.getRadius()
    },
    _rotateTick: function(element, coords) {
        var center = this.getCenter();
        element.rotate(coords.angle, center.x, center.y)
    },
    _validateOverlappingMode: function(mode) {
        return constants.validateOverlappingMode(mode)
    },
    _validateDisplayMode: function() {
        return "standard"
    },
    _getStep: function(boxes) {
        var that = this;
        var radius = that.getRadius() + (that._options.label.indentFromAxis || 0);
        var maxLabelBox = boxes.reduce(function(prevValue, box) {
            var curValue = prevValue;
            if (prevValue.width < box.width) {
                curValue.width = box.width
            }
            if (prevValue.height < box.height) {
                curValue.height = box.height
            }
            return curValue
        }, {
            width: 0,
            height: 0
        });
        var angle1 = _abs(2 * _math.atan(maxLabelBox.height / (2 * radius - maxLabelBox.width)) * 180 / _math.PI);
        var angle2 = _abs(2 * _math.atan(maxLabelBox.width / (2 * radius - maxLabelBox.height)) * 180 / _math.PI);
        return constants.getTicksCountInRange(that._majorTicks, "angle", _math.max(angle1, angle2))
    },
    _checkBoundedLabelsOverlapping: function(majorTicks, boxes, mode) {
        var labelOpt = this._options.label;
        mode = mode || this._validateOverlappingMode(labelOpt.overlappingBehavior);
        if ("hide" !== mode) {
            return
        }
        var lastVisibleLabelIndex = majorTicks.reduce(function(lastVisibleLabelIndex, tick, index) {
            return tick.label ? index : lastVisibleLabelIndex
        }, null);
        if (!lastVisibleLabelIndex) {
            return
        }
        if (constants.areLabelsOverlap(boxes[0], boxes[lastVisibleLabelIndex], labelOpt.minSpacing, constants.center)) {
            "first" === labelOpt.hideFirstOrLast ? majorTicks[0].label.remove() : majorTicks[lastVisibleLabelIndex].label.remove()
        }
    },
    shift: function(margins) {
        this._axisGroup.attr({
            translateX: margins.right,
            translateY: margins.bottom
        })
    }
};
polarAxes.circularSpider = _extend({}, circularAxes, {
    _createAxisElement: function() {
        return this._renderer.path([], "area")
    },
    _updateAxisElementPosition: function() {
        this._axisElement.attr({
            points: _map(this.getSpiderTicks(), function(tick) {
                return {
                    x: tick.coords.x,
                    y: tick.coords.y
                }
            })
        })
    },
    _getStick: function() {
        return true
    },
    _getSpiderCategoryOption: function() {
        return true
    },
    getSpiderTicks: function() {
        var that = this;
        var ticks = that.getFullTicks();
        that._spiderTicks = ticks.map(tick(that, that.renderer, {}, {}, that._getSkippedCategory(ticks), true));
        that._spiderTicks.forEach(function(tick) {
            tick.initCoords()
        });
        return that._spiderTicks
    },
    _getStripGraphicAttributes: function(fromAngle, toAngle) {
        var center = this.getCenter();
        var spiderTicks = this.getSpiderTicks();
        var firstTick;
        var lastTick;
        var nextTick;
        var tick;
        var points = [];
        var i = 0;
        var len = spiderTicks.length;
        while (i < len) {
            tick = spiderTicks[i].coords;
            if (tick.angle >= fromAngle && tick.angle <= toAngle) {
                if (!firstTick) {
                    firstTick = (spiderTicks[i - 1] || spiderTicks[spiderTicks.length - 1]).coords;
                    points.push((tick.x + firstTick.x) / 2, (tick.y + firstTick.y) / 2)
                }
                points.push(tick.x, tick.y);
                nextTick = (spiderTicks[i + 1] || spiderTicks[0]).coords;
                lastTick = {
                    x: (tick.x + nextTick.x) / 2,
                    y: (tick.y + nextTick.y) / 2
                }
            }
            i++
        }
        points.push(lastTick.x, lastTick.y);
        points.push(center.x, center.y);
        return {
            points: points
        }
    },
    _createStrip: function(_ref2) {
        var points = _ref2.points;
        return this._renderer.path(points, "area")
    },
    _getTranslatedCoord: function(value, offset) {
        return this._translator.translate(value, offset) - HALF_PI_ANGLE
    },
    _setTickOffset: function() {
        this._tickOffset = false
    }
});
polarAxes.linear = {
    _resetMargins: function() {
        this._reinitTranslator(this._getViewportRange())
    },
    _getStick: xyAxesLinear._getStick,
    _getSpiderCategoryOption: _noop,
    _getTranslatorOptions: function() {
        return {
            isHorizontal: true,
            stick: this._getStick()
        }
    },
    getRadius: circularAxes.getRadius,
    getCenter: circularAxes.getCenter,
    getAngles: circularAxes.getAngles,
    _updateRadius: circularAxes._updateRadius,
    _updateCenter: circularAxes._updateCenter,
    _processCanvas: function(canvas) {
        this._updateRadius(canvas);
        this._updateCenter(canvas);
        return {
            left: 0,
            right: 0,
            startPadding: canvas.startPadding,
            endPadding: canvas.endPadding,
            width: this.getRadius()
        }
    },
    _createAxisElement: xyAxesLinear._createAxisElement,
    _updateAxisElementPosition: function() {
        var centerCoord = this.getCenter();
        this._axisElement.attr({
            points: [centerCoord.x, centerCoord.y, centerCoord.x + this.getRadius(), centerCoord.y]
        }).rotate(this.getAngles()[0] - HALF_PI_ANGLE, centerCoord.x, centerCoord.y)
    },
    _getScreenDelta: function() {
        return this.getRadius()
    },
    _getTickMarkPoints: function(coords, length) {
        return [coords.x - length / 2, coords.y, coords.x + length / 2, coords.y]
    },
    _getLabelAdjustedCoord: function(tick) {
        var that = this;
        var labelCoords = tick.labelCoords;
        var labelY = labelCoords.y;
        var cosSin = vizUtils.getCosAndSin(labelCoords.angle);
        var indentFromAxis = that._options.label.indentFromAxis || 0;
        var box = tick.labelBBox;
        var x;
        var y;
        x = labelCoords.x - _abs(indentFromAxis * cosSin.sin) + _abs(box.width / 2 * cosSin.cos) - box.width / 2;
        y = labelY + (labelY - box.y) - _abs(box.height / 2 * cosSin.sin) + _abs(indentFromAxis * cosSin.cos);
        return {
            x: x,
            y: y
        }
    },
    _getGridLineDrawer: function() {
        var that = this;
        return function(tick, gridStyle) {
            var grid = that._getGridPoints(tick.coords);
            return that._renderer.circle(grid.cx, grid.cy, grid.r).attr(gridStyle).sharp()
        }
    },
    _getGridPoints: function(coords) {
        var pos = this.getCenter();
        var radius = vizUtils.getDistance(pos.x, pos.y, coords.x, coords.y);
        if (radius > this.getRadius()) {
            return {
                cx: null,
                cy: null,
                r: null
            }
        }
        return {
            cx: pos.x,
            cy: pos.y,
            r: radius
        }
    },
    _getTranslatedValue: function(value, offset) {
        var startAngle = this.getAngles()[0];
        var xy = convertPolarToXY(this.getCenter(), startAngle, 0, this._translator.translate(value, offset));
        return {
            x: xy.x,
            y: xy.y,
            angle: startAngle - HALF_PI_ANGLE
        }
    },
    _getTranslatedCoord: function(value, offset) {
        return this._translator.translate(value, offset)
    },
    _getCanvasStartEnd: function() {
        var invert = this.getTranslator().getBusinessRange().invert;
        var coords = [0, this.getRadius()];
        invert && coords.reverse();
        return {
            start: coords[0],
            end: coords[1]
        }
    },
    _getStripGraphicAttributes: function(fromPoint, toPoint) {
        var center = this.getCenter();
        return {
            x: center.x,
            y: center.y,
            innerRadius: fromPoint,
            outerRadius: toPoint
        }
    },
    _createStrip: function(attrs) {
        return this._renderer.arc(attrs.x, attrs.y, attrs.innerRadius, attrs.outerRadius, 0, 360)
    },
    _getAdjustedStripLabelCoords: circularAxes._getAdjustedStripLabelCoords,
    _getStripLabelCoords: function(from, to) {
        var that = this;
        var labelPos = from + (to - from) / 2;
        var center = that.getCenter();
        var y = _round(center.y - labelPos);
        return {
            x: center.x,
            y: y,
            align: constants.center
        }
    },
    _getConstantLineGraphicAttributes: function(value) {
        var center = this.getCenter();
        return {
            cx: center.x,
            cy: center.y,
            r: value
        }
    },
    _createConstantLine: function(value, attr) {
        var attrs = this._getConstantLineGraphicAttributes(value);
        return this._renderer.circle(attrs.cx, attrs.cy, attrs.r).attr(attr).sharp()
    },
    _getConstantLineLabelsCoords: function(value) {
        var that = this;
        var center = that.getCenter();
        var y = _round(center.y - value);
        return {
            x: center.x,
            y: y
        }
    },
    _checkAlignmentConstantLineLabels: _noop,
    _rotateTick: function(element, coords, isGridLine) {
        !isGridLine && element.rotate(coords.angle + HALF_PI_ANGLE, coords.x, coords.y)
    },
    _validateOverlappingMode: circularAxes._validateOverlappingMode,
    _validateDisplayMode: circularAxes._validateDisplayMode,
    _getStep: function(boxes) {
        var quarter = getPolarQuarter(this.getAngles()[0]);
        var spacing = this._options.label.minSpacing;
        var func = 2 === quarter || 4 === quarter ? function(box) {
            return box.width + spacing
        } : function(box) {
            return box.height
        };
        var maxLabelLength = boxes.reduce(function(prevValue, box) {
            return _math.max(prevValue, func(box))
        }, 0);
        return constants.getTicksCountInRange(this._majorTicks, 2 === quarter || 4 === quarter ? "x" : "y", maxLabelLength)
    }
};
polarAxes.linearSpider = _extend({}, polarAxes.linear, {
    _createPathElement: function(points, attr) {
        return this._renderer.path(points, "area").attr(attr).sharp()
    },
    setSpiderTicks: function(ticks) {
        this._spiderTicks = ticks
    },
    _getGridLineDrawer: function() {
        var that = this;
        return function(tick, gridStyle, element) {
            return that._createPathElement(that._getGridPoints(tick.coords).points, gridStyle)
        }
    },
    _getGridPoints: function(coords) {
        var pos = this.getCenter();
        var radius = vizUtils.getDistance(pos.x, pos.y, coords.x, coords.y);
        return this._getGridPointsByRadius(radius)
    },
    _getGridPointsByRadius: function(radius) {
        var pos = this.getCenter();
        if (radius > this.getRadius()) {
            return {
                points: null
            }
        }
        return {
            points: _map(this._spiderTicks, function(tick) {
                var cosSin = vizUtils.getCosAndSin(tick.coords.angle);
                return {
                    x: _round(pos.x + radius * cosSin.cos),
                    y: _round(pos.y + radius * cosSin.sin)
                }
            })
        }
    },
    _getStripGraphicAttributes: function(fromPoint, toPoint) {
        var innerPoints = this._getGridPointsByRadius(toPoint).points;
        var outerPoints = this._getGridPointsByRadius(fromPoint).points;
        return {
            points: [outerPoints, innerPoints.reverse()]
        }
    },
    _createStrip: polarAxes.circularSpider._createStrip,
    _getConstantLineGraphicAttributes: function(value) {
        return this._getGridPointsByRadius(value)
    },
    _createConstantLine: function(value, attr) {
        return this._createPathElement(this._getConstantLineGraphicAttributes(value).points, attr)
    }
});
