/**
 * DevExtreme (ui/date_box/ui.date_box.strategy.native.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var noop = require("../../core/utils/common").noop;
var DateBoxStrategy = require("./ui.date_box.strategy");
var support = require("../../core/utils/support");
var inArray = require("../../core/utils/array").inArray;
var dateUtils = require("./ui.date_utils");
var dateSerialization = require("../../core/utils/date_serialization");
var NativeStrategy = DateBoxStrategy.inherit({
    NAME: "Native",
    popupConfig: noop,
    getParsedText: function(text) {
        if (!text) {
            return null
        }
        if ("datetime" === this.dateBox.option("type")) {
            return new Date(text.replace(/-/g, "/").replace("T", " ").split(".")[0])
        }
        return dateUtils.fromStandardDateFormat(text)
    },
    renderPopupContent: noop,
    _getWidgetName: noop,
    _getWidgetOptions: noop,
    _getDateBoxType: function() {
        var type = this.dateBox.option("type");
        if (inArray(type, dateUtils.SUPPORTED_FORMATS) === -1) {
            type = "date"
        } else {
            if ("datetime" === type && !support.inputType(type)) {
                type = "datetime-local"
            }
        }
        return type
    },
    customizeButtons: function() {
        var dropDownButton = this.dateBox.getButton("dropDown");
        if (dropDownButton) {
            dropDownButton.on("click", function() {
                this.dateBox._input().get(0).click()
            }.bind(this))
        }
    },
    getDefaultOptions: function() {
        return {
            mode: this._getDateBoxType()
        }
    },
    getDisplayFormat: function(displayFormat) {
        var type = this._getDateBoxType();
        return displayFormat || dateUtils.FORMATS_MAP[type]
    },
    renderInputMinMax: function($input) {
        $input.attr({
            min: dateSerialization.serializeDate(this.dateBox.dateOption("min"), "yyyy-MM-dd"),
            max: dateSerialization.serializeDate(this.dateBox.dateOption("max"), "yyyy-MM-dd")
        })
    }
});
module.exports = NativeStrategy;
