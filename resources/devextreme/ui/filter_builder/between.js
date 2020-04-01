/**
 * DevExtreme (ui/filter_builder/between.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var $ = require("../../core/renderer");
var extend = require("../../core/utils/extend").extend;
var FILTER_BUILDER_RANGE_CLASS = "dx-filterbuilder-range";
var FILTER_BUILDER_RANGE_START_CLASS = FILTER_BUILDER_RANGE_CLASS + "-start";
var FILTER_BUILDER_RANGE_END_CLASS = FILTER_BUILDER_RANGE_CLASS + "-end";
var FILTER_BUILDER_RANGE_SEPARATOR_CLASS = FILTER_BUILDER_RANGE_CLASS + "-separator";
var SEPARATOR = "\u2013";

function editorTemplate(conditionInfo, container) {
    var $editorStart = $("<div>").addClass(FILTER_BUILDER_RANGE_START_CLASS);
    var $editorEnd = $("<div>").addClass(FILTER_BUILDER_RANGE_END_CLASS);
    var values = conditionInfo.value || [];
    var getStartValue = function(values) {
        return values && values.length > 0 ? values[0] : null
    };
    var getEndValue = function(values) {
        return values && 2 === values.length ? values[1] : null
    };
    container.append($editorStart);
    container.append($("<span>").addClass(FILTER_BUILDER_RANGE_SEPARATOR_CLASS).text(SEPARATOR));
    container.append($editorEnd);
    container.addClass(FILTER_BUILDER_RANGE_CLASS);
    this._editorFactory.createEditor.call(this, $editorStart, extend({}, conditionInfo.field, conditionInfo, {
        value: getStartValue(values),
        parentType: "filterBuilder",
        setValue: function(value) {
            values = [value, getEndValue(values)];
            conditionInfo.setValue(values)
        }
    }));
    this._editorFactory.createEditor.call(this, $editorEnd, extend({}, conditionInfo.field, conditionInfo, {
        value: getEndValue(values),
        parentType: "filterBuilder",
        setValue: function(value) {
            values = [getStartValue(values), value];
            conditionInfo.setValue(values)
        }
    }))
}

function getConfig(caption) {
    return {
        name: "between",
        caption: caption,
        icon: "range",
        valueSeparator: SEPARATOR,
        dataTypes: ["number", "date", "datetime"],
        editorTemplate: editorTemplate
    }
}
exports.getConfig = getConfig;
