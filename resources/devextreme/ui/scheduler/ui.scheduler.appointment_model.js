/**
 * DevExtreme (ui/scheduler/ui.scheduler.appointment_model.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var _config = require("../../core/config");
var _config2 = _interopRequireDefault(_config);
var _iterator = require("../../core/utils/iterator");
var _iterator2 = _interopRequireDefault(_iterator);
var _date_serialization = require("../../core/utils/date_serialization");
var _date_serialization2 = _interopRequireDefault(_date_serialization);
var _utils = require("./utils.recurrence");
var _utils2 = _interopRequireDefault(_utils);
var _date = require("../../core/utils/date");
var _date2 = _interopRequireDefault(_date);
var _common = require("../../core/utils/common");
var _type = require("../../core/utils/type");
var _type2 = _interopRequireDefault(_type);
var _array = require("../../core/utils/array");
var _array2 = _interopRequireDefault(_array);
var _extend = require("../../core/utils/extend");
var _query = require("../../data/query");
var _query2 = _interopRequireDefault(_query);
var _deferred = require("../../core/utils/deferred");

function _interopRequireDefault(obj) {
    return obj && obj.__esModule ? obj : {
        "default": obj
    }
}

function _classCallCheck(instance, Constructor) {
    if (!(instance instanceof Constructor)) {
        throw new TypeError("Cannot call a class as a function")
    }
}

function _defineProperties(target, props) {
    for (var i = 0; i < props.length; i++) {
        var descriptor = props[i];
        descriptor.enumerable = descriptor.enumerable || false;
        descriptor.configurable = true;
        if ("value" in descriptor) {
            descriptor.writable = true
        }
        Object.defineProperty(target, descriptor.key, descriptor)
    }
}

function _createClass(Constructor, protoProps, staticProps) {
    if (protoProps) {
        _defineProperties(Constructor.prototype, protoProps)
    }
    if (staticProps) {
        _defineProperties(Constructor, staticProps)
    }
    return Constructor
}
var toMs = _date2.default.dateToMilliseconds;
var DATE_FILTER_POSITION = 0;
var USER_FILTER_POSITION = 1;
var FilterMaker = function() {
    function FilterMaker(dataAccessors) {
        _classCallCheck(this, FilterMaker);
        this._filterRegistry = null;
        this._dataAccessors = dataAccessors
    }
    _createClass(FilterMaker, [{
        key: "isRegistered",
        value: function() {
            return !!this._filterRegistry
        }
    }, {
        key: "clearRegistry",
        value: function() {
            delete this._filterRegistry
        }
    }, {
        key: "make",
        value: function(type, args) {
            if (!this._filterRegistry) {
                this._filterRegistry = {}
            }
            this._make(type).apply(this, args)
        }
    }, {
        key: "_make",
        value: function(type) {
            var _this = this;
            switch (type) {
                case "date":
                    return function(min, max, useAccessors) {
                        var startDate = useAccessors ? _this._dataAccessors.getter.startDate : _this._dataAccessors.expr.startDateExpr;
                        var endDate = useAccessors ? _this._dataAccessors.getter.endDate : _this._dataAccessors.expr.endDateExpr;
                        var recurrenceRule = _this._dataAccessors.expr.recurrenceRuleExpr;
                        _this._filterRegistry.date = [
                            [
                                [endDate, ">", min],
                                [startDate, "<", max]
                            ], "or", [recurrenceRule, "startswith", "freq"], "or", [
                                [endDate, min],
                                [startDate, min]
                            ]
                        ];
                        if (!recurrenceRule) {
                            _this._filterRegistry.date.splice(1, 2)
                        }
                    };
                case "user":
                    return function(userFilter) {
                        _this._filterRegistry.user = userFilter
                    }
            }
        }
    }, {
        key: "combine",
        value: function() {
            var filter = [];
            this._filterRegistry.date && filter.push(this._filterRegistry.date);
            this._filterRegistry.user && filter.push(this._filterRegistry.user);
            return filter
        }
    }, {
        key: "dateFilter",
        value: function() {
            return this._filterRegistry.date
        }
    }]);
    return FilterMaker
}();
var compareDateWithStartDayHour = function(startDate, endDate, startDayHour, allDay, severalDays) {
    var startTime = _date2.default.dateTimeFromDecimal(startDayHour);
    var result = startDate.getHours() >= startTime.hours && startDate.getMinutes() >= startTime.minutes || endDate.getHours() === startTime.hours && endDate.getMinutes() > startTime.minutes || endDate.getHours() > startTime.hours || severalDays || allDay;
    return result
};
var compareDateWithEndDayHour = function(startDate, endDate, startDayHour, endDayHour, allDay, severalDays, max, min) {
    var hiddenInterval = (24 - endDayHour + startDayHour) * toMs("hour");
    var apptDuration = endDate.getTime() - startDate.getTime();
    var delta = (hiddenInterval - apptDuration) / toMs("hour");
    var apptStartHour = startDate.getHours();
    var apptStartMinutes = startDate.getMinutes();
    var result;
    var endTime = _date2.default.dateTimeFromDecimal(endDayHour);
    var startTime = _date2.default.dateTimeFromDecimal(startDayHour);
    result = apptStartHour < endTime.hours || apptStartHour === endTime.hours && apptStartMinutes < endTime.minutes || allDay && startDate <= max || severalDays && startDate < max && endDate > min && (apptStartHour < endTime.hours || 60 * endDate.getHours() + endDate.getMinutes() > 60 * startTime.hours);
    if (apptDuration < hiddenInterval) {
        if (apptStartHour > endTime.hours && apptStartMinutes > endTime.minutes && delta <= apptStartHour - endDayHour) {
            result = false
        }
    }
    return result
};
var AppointmentModel = function() {
    function AppointmentModel(dataSource, dataAccessors, baseAppointmentDuration) {
        _classCallCheck(this, AppointmentModel);
        this.setDataAccessors(dataAccessors);
        this.setDataSource(dataSource);
        this._updatedAppointmentKeys = [];
        this._filterMaker = new FilterMaker(dataAccessors);
        this._baseAppointmentDuration = baseAppointmentDuration
    }
    _createClass(AppointmentModel, [{
        key: "_createFilter",
        value: function(min, max, remoteFiltering, dateSerializationFormat) {
            this._filterMaker.make("date", [min, max]);
            var userFilterPosition = this._excessFiltering() ? this._dataSource.filter()[USER_FILTER_POSITION] : this._dataSource.filter();
            this._filterMaker.make("user", [userFilterPosition]);
            if (remoteFiltering) {
                this._dataSource.filter(this._combineRemoteFilter(dateSerializationFormat))
            }
        }
    }, {
        key: "_excessFiltering",
        value: function() {
            var dateFilter = this._filterMaker.dateFilter();
            var dataSourceFilter = this._dataSource.filter();
            return dataSourceFilter && ((0, _common.equalByValue)(dataSourceFilter, dateFilter) || dataSourceFilter.length && (0, _common.equalByValue)(dataSourceFilter[DATE_FILTER_POSITION], dateFilter))
        }
    }, {
        key: "_combineFilter",
        value: function() {
            return this._filterMaker.combine()
        }
    }, {
        key: "_getStoreKey",
        value: function(target) {
            var store = this._dataSource.store();
            return store.keyOf(target)
        }
    }, {
        key: "_filterAppointmentByResources",
        value: function(appointment, resources) {
            var _this2 = this;
            var result = false;
            var checkAppointmentResourceValues = function() {
                var resourceGetter = _this2._dataAccessors.getter.resources[resourceName];
                var resource;
                if (_type2.default.isFunction(resourceGetter)) {
                    resource = resourceGetter(appointment)
                }
                var appointmentResourceValues = _array2.default.wrapToArray(resource);
                var resourceData = _iterator2.default.map(resources[i].items, function(item) {
                    return item.id
                });
                for (var j = 0, itemDataCount = appointmentResourceValues.length; j < itemDataCount; j++) {
                    if ((0, _array.inArray)(appointmentResourceValues[j], resourceData) > -1) {
                        return true
                    }
                }
                return false
            };
            for (var i = 0, len = resources.length; i < len; i++) {
                var resourceName = resources[i].name;
                result = checkAppointmentResourceValues.call(this);
                if (!result) {
                    return false
                }
            }
            return result
        }
    }, {
        key: "_filterAppointmentByRRule",
        value: function(appointment, min, max, startDayHour, endDayHour, firstDayOfWeek) {
            var recurrenceRule = appointment.recurrenceRule;
            var recurrenceException = appointment.recurrenceException;
            var allDay = appointment.allDay;
            var result = true;
            var appointmentStartDate = appointment.startDate;
            var appointmentEndDate = appointment.endDate;
            if (allDay || this._appointmentPartInInterval(appointmentStartDate, appointmentEndDate, startDayHour, endDayHour)) {
                var trimmedDates = this._trimDates(min, max);
                min = trimmedDates.min;
                max = new Date(trimmedDates.max.getTime() - toMs("minute"))
            }
            if (recurrenceRule && !_utils2.default.getRecurrenceRule(recurrenceRule).isValid) {
                result = appointmentEndDate > min && appointmentStartDate <= max
            }
            if (result && _utils2.default.getRecurrenceRule(recurrenceRule).isValid) {
                result = _utils2.default.dateInRecurrenceRange({
                    rule: recurrenceRule,
                    exception: recurrenceException,
                    start: appointmentStartDate,
                    end: appointmentEndDate,
                    min: min,
                    max: max,
                    firstDayOfWeek: firstDayOfWeek
                })
            }
            return result
        }
    }, {
        key: "_appointmentPartInInterval",
        value: function(startDate, endDate, startDayHour, endDayHour) {
            var apptStartDayHour = startDate.getHours();
            var apptEndDayHour = endDate.getHours();
            return apptStartDayHour <= startDayHour && apptEndDayHour <= endDayHour && apptEndDayHour >= startDayHour || apptEndDayHour >= endDayHour && apptStartDayHour <= endDayHour && apptStartDayHour >= startDayHour
        }
    }, {
        key: "_createCombinedFilter",
        value: function(filterOptions, timeZoneProcessor) {
            var dataAccessors = this._dataAccessors;
            var startDayHour = filterOptions.startDayHour;
            var endDayHour = filterOptions.endDayHour;
            var min = new Date(filterOptions.min);
            var max = new Date(filterOptions.max);
            var resources = filterOptions.resources;
            var firstDayOfWeek = filterOptions.firstDayOfWeek;
            var getRecurrenceException = filterOptions.recurrenceException;
            var that = this;
            return [
                [function(appointment) {
                    var result = true;
                    var startDate = new Date(dataAccessors.getter.startDate(appointment));
                    var endDate = new Date(dataAccessors.getter.endDate(appointment));
                    var appointmentTakesAllDay = that.appointmentTakesAllDay(appointment, startDayHour, endDayHour);
                    var appointmentTakesSeveralDays = that.appointmentTakesSeveralDays(appointment);
                    var isAllDay = dataAccessors.getter.allDay(appointment);
                    var appointmentIsLong = appointmentTakesSeveralDays || appointmentTakesAllDay;
                    var useRecurrence = _type2.default.isDefined(dataAccessors.getter.recurrenceRule);
                    var recurrenceRule;
                    if (useRecurrence) {
                        recurrenceRule = dataAccessors.getter.recurrenceRule(appointment)
                    }
                    if (resources && resources.length) {
                        result = that._filterAppointmentByResources(appointment, resources)
                    }
                    if (appointmentTakesAllDay && false === filterOptions.allDay) {
                        result = false
                    }
                    var startDateTimeZone = dataAccessors.getter.startDateTimeZone(appointment);
                    var endDateTimeZone = dataAccessors.getter.endDateTimeZone(appointment);
                    var comparableStartDate = timeZoneProcessor(startDate, startDateTimeZone);
                    var comparableEndDate = timeZoneProcessor(endDate, endDateTimeZone);
                    if (result && useRecurrence) {
                        var recurrenceException = getRecurrenceException ? getRecurrenceException(appointment) : dataAccessors.getter.recurrenceException(appointment);
                        result = that._filterAppointmentByRRule({
                            startDate: comparableStartDate,
                            endDate: comparableEndDate,
                            recurrenceRule: recurrenceRule,
                            recurrenceException: recurrenceException,
                            allDay: appointmentTakesAllDay
                        }, min, max, startDayHour, endDayHour, firstDayOfWeek)
                    }
                    if (result && comparableEndDate < min && appointmentIsLong && !isAllDay && (!useRecurrence || useRecurrence && !recurrenceRule)) {
                        result = false
                    }
                    if (result && void 0 !== startDayHour) {
                        result = compareDateWithStartDayHour(comparableStartDate, comparableEndDate, startDayHour, appointmentTakesAllDay, appointmentTakesSeveralDays)
                    }
                    if (result && void 0 !== endDayHour) {
                        result = compareDateWithEndDayHour(comparableStartDate, comparableEndDate, startDayHour, endDayHour, appointmentTakesAllDay, appointmentTakesSeveralDays, max, min)
                    }
                    if (result && useRecurrence && !recurrenceRule) {
                        if (comparableEndDate < min && !isAllDay) {
                            result = false
                        }
                    }
                    return result
                }]
            ]
        }
    }, {
        key: "setDataSource",
        value: function(dataSource) {
            this._dataSource = dataSource;
            this.cleanModelState();
            this._initStoreChangeHandlers();
            this._filterMaker && this._filterMaker.clearRegistry()
        }
    }, {
        key: "_initStoreChangeHandlers",
        value: function() {
            var _this3 = this;
            this._dataSource && this._dataSource.store().on("updating", function(newItem) {
                _this3._updatedAppointment = newItem
            }.bind(this));
            this._dataSource && this._dataSource.store().on("push", function(items) {
                items.forEach(function(item) {
                    _this3._updatedAppointmentKeys.push({
                        key: _this3._dataSource.store().key(),
                        value: item.key
                    })
                }.bind(_this3))
            }.bind(this))
        }
    }, {
        key: "getUpdatedAppointment",
        value: function() {
            return this._updatedAppointment
        }
    }, {
        key: "getUpdatedAppointmentKeys",
        value: function() {
            return this._updatedAppointmentKeys
        }
    }, {
        key: "cleanModelState",
        value: function() {
            this._updatedAppointment = null;
            this._updatedAppointmentKeys = []
        }
    }, {
        key: "setDataAccessors",
        value: function(dataAccessors) {
            this._dataAccessors = dataAccessors;
            this._filterMaker = new FilterMaker(dataAccessors)
        }
    }, {
        key: "filterByDate",
        value: function(min, max, remoteFiltering, dateSerializationFormat) {
            if (!this._dataSource) {
                return
            }
            var trimmedDates = this._trimDates(min, max);
            if (!this._filterMaker.isRegistered()) {
                this._createFilter(trimmedDates.min, trimmedDates.max, remoteFiltering, dateSerializationFormat)
            } else {
                this._filterMaker.make("date", [trimmedDates.min, trimmedDates.max]);
                if (this._dataSource.filter() && this._dataSource.filter().length > 1) {
                    var userFilter = this._serializeRemoteFilter([this._dataSource.filter()[1]], dateSerializationFormat);
                    this._filterMaker.make("user", userFilter)
                }
                if (remoteFiltering) {
                    this._dataSource.filter(this._combineRemoteFilter(dateSerializationFormat))
                }
            }
        }
    }, {
        key: "_combineRemoteFilter",
        value: function(dateSerializationFormat) {
            var combinedFilter = this._filterMaker.combine();
            return this._serializeRemoteFilter(combinedFilter, dateSerializationFormat)
        }
    }, {
        key: "_serializeRemoteFilter",
        value: function(filter, dateSerializationFormat) {
            if (!Array.isArray(filter)) {
                return filter
            }
            filter = (0, _extend.extend)([], filter);
            var startDate = this._dataAccessors.expr.startDateExpr;
            var endDate = this._dataAccessors.expr.endDateExpr;
            if (_type2.default.isString(filter[0])) {
                if ((0, _config2.default)().forceIsoDateParsing && filter.length > 1) {
                    if (filter[0] === startDate || filter[0] === endDate) {
                        filter[filter.length - 1] = _date_serialization2.default.serializeDate(new Date(filter[filter.length - 1]), dateSerializationFormat)
                    }
                }
            }
            for (var i = 0; i < filter.length; i++) {
                filter[i] = this._serializeRemoteFilter(filter[i], dateSerializationFormat)
            }
            return filter
        }
    }, {
        key: "filterLoadedAppointments",
        value: function(filterOptions, timeZoneProcessor) {
            if (!_type2.default.isFunction(timeZoneProcessor)) {
                timeZoneProcessor = function(date) {
                    return date
                }
            }
            var combinedFilter = this._createCombinedFilter(filterOptions, timeZoneProcessor);
            if (this._filterMaker.isRegistered()) {
                this._filterMaker.make("user", void 0);
                var trimmedDates = this._trimDates(filterOptions.min, filterOptions.max);
                this._filterMaker.make("date", [trimmedDates.min, trimmedDates.max, true]);
                var dateFilter = this.customizeDateFilter(this._filterMaker.combine(), timeZoneProcessor);
                combinedFilter.push([dateFilter])
            }
            return (0, _query2.default)(this._dataSource.items()).filter(combinedFilter).toArray()
        }
    }, {
        key: "_trimDates",
        value: function(min, max) {
            var minCopy = _date2.default.trimTime(new Date(min));
            var maxCopy = _date2.default.trimTime(new Date(max));
            maxCopy.setDate(maxCopy.getDate() + 1);
            return {
                min: minCopy,
                max: maxCopy
            }
        }
    }, {
        key: "hasAllDayAppointments",
        value: function(items, startDayHour, endDayHour) {
            if (!items) {
                return false
            }
            var that = this;
            var result = false;
            _iterator2.default.each(items, function(index, item) {
                if (that.appointmentTakesAllDay(item, startDayHour, endDayHour)) {
                    result = true;
                    return false
                }
            });
            return result
        }
    }, {
        key: "appointmentTakesAllDay",
        value: function(appointment, startDayHour, endDayHour) {
            var dataAccessors = this._dataAccessors;
            var startDate = dataAccessors.getter.startDate(appointment);
            var endDate = dataAccessors.getter.endDate(appointment);
            var allDay = dataAccessors.getter.allDay(appointment);
            return allDay || this._appointmentHasAllDayDuration(startDate, endDate, startDayHour, endDayHour)
        }
    }, {
        key: "_appointmentHasAllDayDuration",
        value: function(startDate, endDate, startDayHour, endDayHour) {
            startDate = new Date(startDate);
            endDate = new Date(endDate);
            var dayDuration = 24;
            var appointmentDurationInHours = this._getAppointmentDurationInHours(startDate, endDate);
            return appointmentDurationInHours >= dayDuration || this._appointmentHasShortDayDuration(startDate, endDate, startDayHour, endDayHour)
        }
    }, {
        key: "_appointmentHasShortDayDuration",
        value: function(startDate, endDate, startDayHour, endDayHour) {
            var appointmentDurationInHours = this._getAppointmentDurationInHours(startDate, endDate);
            var shortDayDurationInHours = endDayHour - startDayHour;
            return appointmentDurationInHours >= shortDayDurationInHours && startDate.getHours() === startDayHour && endDate.getHours() === endDayHour
        }
    }, {
        key: "_getAppointmentDurationInHours",
        value: function(startDate, endDate) {
            return (endDate.getTime() - startDate.getTime()) / toMs("hour")
        }
    }, {
        key: "appointmentTakesSeveralDays",
        value: function(appointment) {
            var dataAccessors = this._dataAccessors;
            var startDate = new Date(dataAccessors.getter.startDate(appointment));
            var endDate = new Date(dataAccessors.getter.endDate(appointment));
            return !_date2.default.sameDate(startDate, endDate)
        }
    }, {
        key: "customizeDateFilter",
        value: function(dateFilter, timeZoneProcessor) {
            var _this4 = this;
            var currentFilter = (0, _extend.extend)(true, [], dateFilter);
            return function(appointment) {
                var startDate = new Date(_this4._dataAccessors.getter.startDate(appointment));
                var endDate = new Date(_this4._dataAccessors.getter.endDate(appointment));
                endDate = _this4.fixWrongEndDate(appointment, startDate, endDate);
                appointment = (0, _extend.extend)(true, {}, appointment);
                var startDateTimeZone = _this4._dataAccessors.getter.startDateTimeZone(appointment);
                var endDateTimeZone = _this4._dataAccessors.getter.endDateTimeZone(appointment);
                var comparableStartDate = timeZoneProcessor(startDate, startDateTimeZone);
                var comparableEndDate = timeZoneProcessor(endDate, endDateTimeZone);
                _this4._dataAccessors.setter.startDate(appointment, comparableStartDate);
                _this4._dataAccessors.setter.endDate(appointment, comparableEndDate);
                return (0, _query2.default)([appointment]).filter(currentFilter).toArray().length > 0
            }.bind(this)
        }
    }, {
        key: "fixWrongEndDate",
        value: function(appointment, startDate, endDate) {
            if (this._isEndDateWrong(appointment, startDate, endDate)) {
                if (this._dataAccessors.getter.allDay(appointment)) {
                    endDate = _date2.default.setToDayEnd(new Date(startDate))
                } else {
                    endDate = new Date(startDate.getTime() + this._baseAppointmentDuration * toMs("minute"))
                }
                this._dataAccessors.setter.endDate(appointment, endDate)
            }
            return endDate
        }
    }, {
        key: "_isEndDateWrong",
        value: function(appointment, startDate, endDate) {
            return !endDate || isNaN(endDate.getTime()) || startDate.getTime() > endDate.getTime()
        }
    }, {
        key: "add",
        value: function(data, tz) {
            var _this5 = this;
            return this._dataSource.store().insert(data).done(function() {
                _this5._dataSource.load()
            }.bind(this))
        }
    }, {
        key: "update",
        value: function(target, data) {
            var _this6 = this;
            var key = this._getStoreKey(target);
            var d = new _deferred.Deferred;
            this._dataSource.store().update(key, data).done(function() {
                _this6._dataSource.load().done(d.resolve).fail(d.reject)
            }).fail(d.reject);
            return d.promise()
        }
    }, {
        key: "remove",
        value: function(target) {
            var _this7 = this;
            var key = this._getStoreKey(target);
            return this._dataSource.store().remove(key).done(function() {
                _this7._dataSource.load()
            }.bind(this))
        }
    }]);
    return AppointmentModel
}();
module.exports = AppointmentModel;
