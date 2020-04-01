/**
 * DevExtreme (viz/translators/datetime_translator.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";

function parse(value) {
    return null !== value ? new Date(value) : value
}
module.exports = {
    _fromValue: parse,
    _toValue: parse,
    _add: require("../../core/utils/date").addDateInterval
};
