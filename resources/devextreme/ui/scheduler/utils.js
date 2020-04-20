/**
 * DevExtreme (ui/scheduler/utils.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var _date = require("../../core/utils/date");
var _date2 = _interopRequireDefault(_date);
var _uiScheduler = require("./timezones/ui.scheduler.timezones");
var _uiScheduler2 = _interopRequireDefault(_uiScheduler);

function _interopRequireDefault(obj) {
    return obj && obj.__esModule ? obj : {
        "default": obj
    }
}
var toMs = _date2.default.dateToMilliseconds;
var getTimezoneOffsetChangeInMinutes = function(startDate, endDate, updatedStartDate, updatedEndDate) {
    return getDaylightOffset(updatedStartDate, updatedEndDate) - getDaylightOffset(startDate, endDate)
};
var getTimezoneOffsetChangeInMs = function(startDate, endDate, updatedStartDate, updatedEndDate) {
    return getTimezoneOffsetChangeInMinutes(startDate, endDate, updatedStartDate, updatedEndDate) * toMs("minute")
};
var getDaylightOffset = function(startDate, endDate) {
    return new Date(startDate).getTimezoneOffset() - new Date(endDate).getTimezoneOffset()
};
var getDaylightOffsetInMs = function(startDate, endDate) {
    return getDaylightOffset(startDate, endDate) * toMs("minute")
};
var calculateTimezoneByValue = function(timezone, date) {
    if ("string" === typeof timezone) {
        date = date || new Date;
        var dateUtc = Date.UTC(date.getUTCFullYear(), date.getUTCMonth(), date.getUTCDate(), date.getUTCHours(), date.getUTCMinutes());
        timezone = _uiScheduler2.default.getTimezoneOffsetById(timezone, dateUtc)
    }
    return timezone
};
var _getDaylightOffsetByTimezone = function(startDate, endDate, timeZone) {
    return calculateTimezoneByValue(timeZone, startDate) - calculateTimezoneByValue(timeZone, endDate)
};
var getCorrectedDateByDaylightOffsets = function(convertedOriginalStartDate, convertedDate, date, timeZone, startDateTimezone) {
    var daylightOffsetByCommonTimezone = _getDaylightOffsetByTimezone(convertedOriginalStartDate, convertedDate, timeZone);
    var daylightOffsetByAppointmentTimezone = _getDaylightOffsetByTimezone(convertedOriginalStartDate, convertedDate, startDateTimezone);
    var diff = daylightOffsetByCommonTimezone - daylightOffsetByAppointmentTimezone;
    return new Date(date.getTime() - diff * toMs("hour"))
};
var isTimezoneChangeInDate = function(date) {
    var startDayDate = new Date(new Date(date).setHours(0, 0, 0, 0));
    var endDayDate = new Date(new Date(date).setHours(23, 59, 59, 0));
    return startDayDate.getTimezoneOffset() - endDayDate.getTimezoneOffset() !== 0
};
var isSameAppointmentDates = function(startDate, endDate) {
    endDate = new Date(endDate.getTime() - 1);
    return _date2.default.sameDate(startDate, endDate)
};
var utils = {
    getDaylightOffset: getDaylightOffset,
    getDaylightOffsetInMs: getDaylightOffsetInMs,
    getTimezoneOffsetChangeInMinutes: getTimezoneOffsetChangeInMinutes,
    getTimezoneOffsetChangeInMs: getTimezoneOffsetChangeInMs,
    calculateTimezoneByValue: calculateTimezoneByValue,
    getCorrectedDateByDaylightOffsets: getCorrectedDateByDaylightOffsets,
    isTimezoneChangeInDate: isTimezoneChangeInDate,
    isSameAppointmentDates: isSameAppointmentDates
};
module.exports = utils;
