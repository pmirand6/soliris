/**
 * DevExtreme (ui/scheduler/ui.scheduler.subscribes.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var _renderer = require("../../core/renderer");
var _renderer2 = _interopRequireDefault(_renderer);
var _array = require("../../core/utils/array");
var _array2 = _interopRequireDefault(_array);
var _utils = require("./utils.recurrence");
var _utils2 = _interopRequireDefault(_utils);
var _type = require("../../core/utils/type");
var _type2 = _interopRequireDefault(_type);
var _date = require("../../core/utils/date");
var _date2 = _interopRequireDefault(_date);
var _iterator = require("../../core/utils/iterator");
var _translator = require("../../animation/translator");
var _translator2 = _interopRequireDefault(_translator);
var _common = require("../../core/utils/common");
var _extend = require("../../core/utils/extend");
var _uiScheduler = require("./timezones/ui.scheduler.timezones");
var _uiScheduler2 = _interopRequireDefault(_uiScheduler);
var _deferred = require("../../core/utils/deferred");
var _date3 = require("../../localization/date");
var _date4 = _interopRequireDefault(_date3);
var _utils3 = require("./utils");
var _utils4 = _interopRequireDefault(_utils3);

function _interopRequireDefault(obj) {
    return obj && obj.__esModule ? obj : {
        "default": obj
    }
}
var MINUTES_IN_HOUR = 60;
var toMs = _date2.default.dateToMilliseconds;
var subscribes = {
    isCurrentViewAgenda: function() {
        return "agenda" === this.option("currentView")
    },
    currentViewUpdated: function(currentView) {
        this.option("currentView", currentView)
    },
    currentDateUpdated: function(date) {
        this.option("currentDate", date)
    },
    setCellDataCacheAlias: function(appointment, geometry) {
        this._workSpace.setCellDataCacheAlias(appointment, geometry)
    },
    needCoordinates: function(options) {
        var _this = this;
        var appointmentData = options.appointmentData;
        var startDate = options.startDate;
        var endDate = this._getEndDate(appointmentData);
        var recurrenceRule = this.fire("getField", "recurrenceRule", appointmentData);
        var recurrenceException = this._getRecurrenceException(appointmentData);
        var dateRange = this._workSpace.getDateRange();
        var allDay = this.appointmentTakesAllDay(appointmentData);
        var startViewDate = this.appointmentTakesAllDay(appointmentData) ? _date2.default.trimTime(new Date(dateRange[0])) : dateRange[0];
        var originalStartDate = options.originalStartDate || startDate;
        var renderingStrategy = this.getLayoutManager().getRenderingStrategyInstance();
        var firstDayOfWeek = this.getFirstDayOfWeek();
        var recurrenceOptions = {
            rule: recurrenceRule,
            exception: recurrenceException,
            start: originalStartDate,
            end: endDate,
            min: startViewDate,
            max: dateRange[1],
            firstDayOfWeek: firstDayOfWeek
        };
        var dates = _utils2.default.getDatesByRecurrence(recurrenceOptions);
        var initialDates;
        if (!dates.length) {
            dates.push(startDate);
            initialDates = dates
        } else {
            dates = this.getCorrectedDatesByDaylightOffsets(originalStartDate, dates, appointmentData);
            initialDates = dates;
            dates = dates.map(function(date) {
                return _date2.default.roundDateByStartDayHour(date, _this._getCurrentViewOption("startDayHour"))
            })
        }
        if (renderingStrategy.needSeparateAppointment(allDay)) {
            var datesLength = dates.length;
            var longParts = [];
            var resultDates = [];
            var _loop = function(i) {
                var endDateOfPart = renderingStrategy.endDate(appointmentData, {
                    startDate: dates[i]
                }, !!recurrenceRule);
                longParts = _date2.default.getDatesOfInterval(dates[i], endDateOfPart, {
                    milliseconds: _this.getWorkSpace().getIntervalDuration(allDay)
                });
                var maxDate = new Date(dateRange[1]);
                resultDates = resultDates.concat(longParts.filter(function(el) {
                    return new Date(el) < maxDate
                }))
            };
            for (var i = 0; i < datesLength; i++) {
                _loop(i)
            }
            dates = resultDates
        }
        var itemResources = this._resourcesManager.getResourcesFromItem(appointmentData);
        allDay = this.appointmentTakesAllDay(appointmentData) && this._workSpace.supportAllDayRow();
        return this._getCoordinates(initialDates, dates, itemResources, allDay)
    },
    isGroupedByDate: function() {
        return this.getWorkSpace().isGroupedByDate()
    },
    showAppointmentTooltip: function(options) {
        var appointmentData = options.data;
        var targetedData = this.fire("getTargetedAppointmentData", appointmentData, (0, _renderer2.default)(options.target));
        this.showAppointmentTooltip(appointmentData, options.target, targetedData)
    },
    hideAppointmentTooltip: function() {
        this.hideAppointmentTooltip()
    },
    showAddAppointmentPopup: function(appointmentData) {
        var processedData = {};
        (0, _iterator.each)(["startDate", "endDate", "allDay"], function(_, field) {
            if (void 0 !== appointmentData[field]) {
                this.fire("setField", field, processedData, appointmentData[field]);
                delete appointmentData[field]
            }
        }.bind(this));
        this.showAppointmentPopup((0, _extend.extend)(processedData, appointmentData), true)
    },
    showEditAppointmentPopup: function(options) {
        var appointmentData = options.data;
        options.$appointment = (0, _renderer2.default)(options.target);
        options.skipHoursProcessing = true;
        var targetedData = this._getAppointmentData(appointmentData, options);
        var startDate = this.fire("getField", "startDate", targetedData);
        this.showAppointmentPopup(appointmentData, false, targetedData, startDate)
    },
    updateAppointmentAfterResize: function(options) {
        var targetAppointment = options.target;
        options.isAppointmentResized = true;
        var targetedData = this._getAppointmentData(targetAppointment, options);
        var startDate = this.fire("getField", "startDate", targetedData);
        var updatedData = (0, _extend.extend)(true, {}, options.data);
        this._convertDatesByTimezoneBack(true, updatedData);
        this._checkRecurringAppointment(targetAppointment, targetedData, startDate, function() {
            this._updateAppointment(targetAppointment, updatedData, function() {
                this._appointments.moveAppointmentBack()
            })
        }.bind(this))
    },
    getUpdatedData: function(options) {
        return this._getUpdatedData({
            data: options.data
        })
    },
    updateAppointmentAfterDrag: function(options) {
        var target = options.data;
        var updatedData = this._getUpdatedData(options);
        var newCellIndex = this._workSpace.getDroppableCellIndex();
        var oldCellIndex = this._workSpace.getCellIndexByCoordinates(options.coordinates);
        var becomeAllDay = this.fire("getField", "allDay", updatedData);
        var wasAllDay = this.fire("getField", "allDay", target);
        var dragEvent = options.event;
        var appointment = (0, _extend.extend)({}, target, updatedData);
        var movedToAllDay = this._workSpace.supportAllDayRow() && becomeAllDay;
        var cellData = this._workSpace.getCellDataByCoordinates(options.coordinates, movedToAllDay);
        var movedBetweenAllDayAndSimple = this._workSpace.supportAllDayRow() && (wasAllDay && !becomeAllDay || !wasAllDay && becomeAllDay);
        if (newCellIndex !== oldCellIndex || movedBetweenAllDayAndSimple) {
            this._checkRecurringAppointment(target, appointment, cellData.startDate, function() {
                this._convertDatesByTimezoneBack(true, updatedData, appointment);
                this._updateAppointment(target, appointment, function() {
                    this._appointments.moveAppointmentBack(dragEvent)
                }, dragEvent)
            }.bind(this), void 0, void 0, dragEvent)
        } else {
            this._appointments.moveAppointmentBack(dragEvent)
        }
    },
    deleteAppointment: function(options) {
        options.$appointment = (0, _renderer2.default)(options.target);
        var appointmentData = options.data;
        var targetedData = this._getAppointmentData(appointmentData, options);
        this.checkAndDeleteAppointment(appointmentData, targetedData)
    },
    getAppointmentColor: function(options) {
        var resourcesManager = this._resourcesManager;
        var resourceForPainting = resourcesManager.getResourceForPainting(this._getCurrentViewOption("groups"));
        var response = (new _deferred.Deferred).resolve().promise();
        if (resourceForPainting) {
            var field = resourcesManager.getField(resourceForPainting);
            var groupIndex = options.groupIndex;
            var groups = this._workSpace._getCellGroups(groupIndex);
            var resourceValues = _array2.default.wrapToArray(resourcesManager.getDataAccessors(field, "getter")(options.itemData));
            var groupId = resourceValues.length ? resourceValues[0] : void 0;
            for (var i = 0; i < groups.length; i++) {
                if (groups[i].name === field) {
                    groupId = groups[i].id;
                    break
                }
            }
            response = resourcesManager.getResourceColor(field, groupId)
        }
        return response
    },
    getHeaderHeight: function() {
        return this._header._$element && parseInt(this._header._$element.outerHeight(), 10)
    },
    getResourcesFromItem: function(itemData) {
        return this._resourcesManager.getResourcesFromItem(itemData)
    },
    getBoundOffset: function() {
        return {
            top: -this.getWorkSpaceAllDayHeight()
        }
    },
    appointmentTakesSeveralDays: function(appointment) {
        return this._appointmentModel.appointmentTakesSeveralDays(appointment)
    },
    getTextAndFormatDate: function(data, currentData, format) {
        var fields = ["startDate", "endDate", "startDateTimeZone", "endDateTimeZone", "allDay", "text"];
        var appointmentFields = this.fire("_getAppointmentFields", (0, _extend.extend)({}, data, currentData), fields);
        var startDate = appointmentFields.startDate;
        var endDate = appointmentFields.endDate;
        var formatType = format || this.fire("_getTypeFormat", startDate, endDate, appointmentFields.allDay);
        return {
            text: this.fire("_createAppointmentTitle", appointmentFields),
            formatDate: this.fire("_formatDates", startDate, endDate, formatType)
        }
    },
    _getAppointmentFields: function(data, arrayOfFields) {
        var _this2 = this;
        return arrayOfFields.reduce(function(accumulator, field) {
            accumulator[field] = _this2.fire("getField", field, data);
            return accumulator
        }, {})
    },
    _getTypeFormat: function(startDate, endDate, isAllDay) {
        if (isAllDay) {
            return "DATE"
        }
        if ("month" !== this.option("currentView") && _date2.default.sameDate(startDate, endDate)) {
            return "TIME"
        }
        return "DATETIME"
    },
    _createAppointmentTitle: function(data) {
        if (_type2.default.isPlainObject(data)) {
            return data.text
        }
        return String(data)
    },
    _formatDates: function(startDate, endDate, formatType) {
        var dateFormat = "monthandday";
        var timeFormat = "shorttime";
        var isSameDate = startDate.getDate() === endDate.getDate();
        var isDurationLessThanDay = endDate.getTime() - startDate.getTime() <= toMs("day");
        switch (formatType) {
            case "DATETIME":
                return [_date4.default.format(startDate, dateFormat), " ", _date4.default.format(startDate, timeFormat), " - ", isSameDate ? "" : _date4.default.format(endDate, dateFormat) + " ", _date4.default.format(endDate, timeFormat)].join("");
            case "TIME":
                return "".concat(_date4.default.format(startDate, timeFormat), " - ").concat(_date4.default.format(endDate, timeFormat));
            case "DATE":
                return "".concat(_date4.default.format(startDate, dateFormat)).concat(isDurationLessThanDay || isSameDate ? "" : " - " + _date4.default.format(endDate, dateFormat))
        }
    },
    getResizableAppointmentArea: function(options) {
        var allDay = options.allDay;
        var groups = this._getCurrentViewOption("groups");
        if (groups && groups.length) {
            if (allDay || this.getLayoutManager().getRenderingStrategyInstance()._needHorizontalGroupBounds()) {
                var horizontalGroupBounds = this._workSpace.getGroupBounds(options.coordinates);
                return {
                    left: horizontalGroupBounds.left,
                    right: horizontalGroupBounds.right,
                    top: 0,
                    bottom: 0
                }
            }
            if (this.getLayoutManager().getRenderingStrategyInstance()._needVerticalGroupBounds(allDay) && this._workSpace._isVerticalGroupedWorkSpace()) {
                var verticalGroupBounds = this._workSpace.getGroupBounds(options.coordinates);
                return {
                    left: 0,
                    right: 0,
                    top: verticalGroupBounds.top,
                    bottom: verticalGroupBounds.bottom
                }
            }
        }
    },
    needRecalculateResizableArea: function() {
        return this.getWorkSpace().needRecalculateResizableArea()
    },
    getAppointmentGeometry: function(settings) {
        return this.getLayoutManager().getRenderingStrategyInstance().getAppointmentGeometry(settings)
    },
    isAllDay: function(appointmentData) {
        return this.getLayoutManager().getRenderingStrategyInstance().isAllDay(appointmentData)
    },
    getDeltaTime: function(e, initialSize, itemData) {
        return this.getLayoutManager().getRenderingStrategyInstance().getDeltaTime(e, initialSize, itemData)
    },
    getDropDownAppointmentWidth: function(isAllDay) {
        return this.getLayoutManager().getRenderingStrategyInstance().getDropDownAppointmentWidth(this._getViewCountConfig().intervalCount, isAllDay)
    },
    getDropDownAppointmentHeight: function() {
        return this.getLayoutManager().getRenderingStrategyInstance().getDropDownAppointmentHeight()
    },
    getStartDate: function(appointmentData, skipNormalize) {
        return this._getStartDate(appointmentData, skipNormalize)
    },
    getCellWidth: function() {
        return this._cellWidth
    },
    getCellHeight: function() {
        return this._cellHeight
    },
    getResizableStep: function() {
        var cellWidth = this._cellWidth;
        var workSpace = this.getWorkSpace();
        if (workSpace.isGroupedByDate()) {
            return workSpace._getGroupCount() * cellWidth
        }
        return cellWidth
    },
    getEndDate: function(appointmentData, skipNormalize) {
        return this._getEndDate(appointmentData, skipNormalize)
    },
    getRenderingStrategy: function() {
        return this._getAppointmentsRenderingStrategy()
    },
    getMaxAppointmentCountPerCellByType: function(isAllDay) {
        return this.getRenderingStrategyInstance()._getMaxAppointmentCountPerCellByType(isAllDay)
    },
    needCorrectAppointmentDates: function() {
        return this.getRenderingStrategyInstance().needCorrectAppointmentDates()
    },
    getRenderingStrategyDirection: function() {
        return this.getRenderingStrategyInstance().getDirection()
    },
    getWorkSpaceDateTableOffset: function() {
        return this.getWorkSpaceDateTableOffset()
    },
    getFullWeekAppointmentWidth: function(options) {
        var groupIndex = options.groupIndex;
        return this._workSpace.getGroupWidth(groupIndex)
    },
    getMaxAppointmentWidth: function(options) {
        var workSpace = this._workSpace;
        return workSpace.getCellCountToLastViewDate(options.date) * workSpace.getCellWidth()
    },
    updateAppointmentStartDate: function(options) {
        var appointment = options.appointment;
        var firstViewDate = this._workSpace.getStartViewDate();
        var startDate = new Date(options.startDate);
        var startDayHour = this._getCurrentViewOption("startDayHour");
        var updatedStartDate;
        if (this.appointmentTakesAllDay(appointment)) {
            updatedStartDate = _date2.default.normalizeDate(startDate, firstViewDate)
        } else {
            if (startDate < firstViewDate) {
                startDate = firstViewDate
            }
            updatedStartDate = _date2.default.normalizeDate(options.startDate, new Date(startDate))
        }
        return _date2.default.roundDateByStartDayHour(updatedStartDate, startDayHour)
    },
    updateAppointmentEndDate: function(options) {
        var endDate = options.endDate;
        var endDayHour = this._getCurrentViewOption("endDayHour");
        var startDayHour = this._getCurrentViewOption("startDayHour");
        var updatedEndDate = endDate;
        if (endDate.getHours() >= endDayHour) {
            updatedEndDate.setHours(endDayHour, 0, 0, 0)
        } else {
            if (!options.isSameDate && startDayHour > 0 && 60 * endDate.getHours() + endDate.getMinutes() < 60 * startDayHour) {
                updatedEndDate = new Date(updatedEndDate.getTime() - toMs("day"));
                updatedEndDate.setHours(endDayHour, 0, 0, 0)
            }
        }
        return updatedEndDate
    },
    renderCompactAppointments: function(options) {
        this._compactAppointmentsHelper.render(options)
    },
    clearCompactAppointments: function() {
        this._compactAppointmentsHelper.clear()
    },
    supportCompactDropDownAppointments: function() {
        return this._workSpace._supportCompactDropDownAppointments()
    },
    isApplyCompactAppointmentOffset: function() {
        return this._workSpace._isApplyCompactAppointmentOffset()
    },
    getGroupCount: function() {
        return this._workSpace._getGroupCount()
    },
    mapAppointmentFields: function(config) {
        var targetedData = this.fire("getTargetedAppointmentData", config.itemData, config.itemElement, true);
        return {
            appointmentData: config.itemData,
            appointmentElement: config.itemElement,
            targetedAppointmentData: targetedData
        }
    },
    getOffsetByAllDayPanel: function(groupIndex) {
        return this._workSpace._getOffsetByAllDayPanel(groupIndex)
    },
    getGroupTop: function(groupIndex) {
        return this._workSpace._getGroupTop(groupIndex)
    },
    updateResizableArea: function() {
        var $allResizableElements = this.$element().find(".dx-scheduler-appointment.dx-resizable");
        var horizontalResizables = (0, _common.grep)($allResizableElements, function(el) {
            var $el = (0, _renderer2.default)(el);
            var resizableInst = $el.dxResizable("instance");
            var area = resizableInst.option("area");
            return (0, _array.inArray)(resizableInst.option("handles"), ["right left", "left right"]) > -1 && _type2.default.isPlainObject(area)
        });
        (0, _iterator.each)(horizontalResizables, function(_, el) {
            var $el = (0, _renderer2.default)(el);
            var position = _translator2.default.locate($el);
            var appointmentData = this._appointments._getItemData($el);
            var area = this._appointments._calculateResizableArea({
                left: position.left
            }, appointmentData);
            $el.dxResizable("instance").option("area", area)
        }.bind(this))
    },
    recurrenceEditorVisibilityChanged: function(visible) {
        this.recurrenceEditorVisibilityChanged(visible)
    },
    resizePopup: function() {
        this.resizePopup()
    },
    getField: function(field, obj) {
        if (!_type2.default.isDefined(this._dataAccessors.getter[field])) {
            return
        }
        return this._dataAccessors.getter[field](obj)
    },
    setField: function(field, obj, value) {
        if (!_type2.default.isDefined(this._dataAccessors.setter[field])) {
            return
        }
        var splitExprStr = this.option(field + "Expr").split(".");
        var rootField = splitExprStr[0];
        if (void 0 === obj[rootField] && splitExprStr.length > 1) {
            var emptyChain = function(arr) {
                var result = {};
                var tmp = result;
                var arrLength = arr.length - 1;
                for (var i = 1; i < arrLength; i++) {
                    tmp = tmp[arr[i]] = {}
                }
                return result
            }(splitExprStr);
            obj[rootField] = emptyChain
        }
        this._dataAccessors.setter[field](obj, value);
        return obj
    },
    prerenderFilter: function() {
        var dateRange = this.getWorkSpace().getDateRange();
        var resources = this._resourcesManager.getResourcesData();
        var allDay;
        if (!this.option("showAllDayPanel") && this._workSpace.supportAllDayRow()) {
            allDay = false
        }
        return this._appointmentModel.filterLoadedAppointments({
            startDayHour: this._getCurrentViewOption("startDayHour"),
            endDayHour: this._getCurrentViewOption("endDayHour"),
            min: dateRange[0],
            max: dateRange[1],
            resources: resources,
            allDay: allDay,
            firstDayOfWeek: this.getFirstDayOfWeek(),
            recurrenceException: this._getRecurrenceException.bind(this)
        }, this._subscribes.convertDateByTimezone.bind(this))
    },
    dayHasAppointment: function(day, appointment, trimTime) {
        return this.dayHasAppointment(day, appointment, trimTime)
    },
    createResourcesTree: function() {
        return this._resourcesManager.createResourcesTree(this._loadedResources)
    },
    getResourceTreeLeaves: function(tree, appointmentResources) {
        return this._resourcesManager.getResourceTreeLeaves(tree, appointmentResources)
    },
    createReducedResourcesTree: function() {
        var tree = this._resourcesManager.createResourcesTree(this._loadedResources);
        return this._resourcesManager.reduceResourcesTree(tree, this.getFilteredItems())
    },
    groupAppointmentsByResources: function(appointments) {
        var result = {
            0: appointments
        };
        var groups = this._getCurrentViewOption("groups");
        if (groups && groups.length && this._resourcesManager.getResourcesData().length) {
            result = this._resourcesManager.groupAppointmentsByResources(appointments, this._loadedResources)
        }
        var totalResourceCount = 0;
        (0, _iterator.each)(this._loadedResources, function(i, resource) {
            if (!i) {
                totalResourceCount = resource.items.length
            } else {
                totalResourceCount *= resource.items.length
            }
        });
        for (var j = 0; j < totalResourceCount; j++) {
            var index = j.toString();
            if (result[index]) {
                continue
            }
            result[index] = []
        }
        return result
    },
    getAgendaRows: function(options) {
        var renderingStrategy = this._layoutManager.getRenderingStrategyInstance();
        var calculateRows = renderingStrategy.calculateRows.bind(renderingStrategy);
        var d = new _deferred.Deferred;

        function rowsCalculated(appointments) {
            var result = calculateRows(appointments, options.agendaDuration, options.currentDate);
            this._dataSourceLoadedCallback.remove(rowsCalculated);
            d.resolve(result)
        }
        this._dataSourceLoadedCallback.add(rowsCalculated);
        return d.promise()
    },
    getAgendaVerticalStepHeight: function() {
        return this.getWorkSpace().getAgendaVerticalStepHeight()
    },
    getAgendaDuration: function() {
        return this._getCurrentViewOption("agendaDuration")
    },
    getStartViewDate: function() {
        return this.getStartViewDate()
    },
    getEndViewDate: function() {
        return this.getEndViewDate()
    },
    getMaxAppointmentsPerCell: function() {
        return this.getMaxAppointmentsPerCell()
    },
    forceMaxAppointmentPerCell: function() {
        return this.forceMaxAppointmentPerCell()
    },
    agendaIsReady: function(rows, innerRowOffset, outerRowOffset) {
        var $appts = this.getAppointmentsInstance()._itemElements();
        var total = 0;
        $appts.css("marginBottom", innerRowOffset);
        var applyOffset = function(_, count) {
            var index = count + total - 1;
            $appts.eq(index).css("marginBottom", outerRowOffset);
            total += count
        };
        for (var i = 0; i < rows.length; i++) {
            (0, _iterator.each)(rows[i], applyOffset)
        }
    },
    getTimezone: function() {
        return this._getTimezoneOffsetByOption()
    },
    getClientTimezoneOffset: function(date) {
        date = date || new Date;
        return _uiScheduler2.default.getClientTimezoneOffset(date)
    },
    convertDateByTimezone: function(date, appointmentTimezone) {
        date = new Date(date);
        var tzOffsets = this._subscribes.getComplexOffsets(this, date, appointmentTimezone);
        date = this._subscribes.translateDateToAppointmentTimeZone(date, tzOffsets);
        date = this._subscribes.translateDateToCommonTimeZone(date, tzOffsets);
        return date
    },
    convertDateByTimezoneBack: function(date, appointmentTimezone) {
        date = new Date(date);
        var tzOffsets = this._subscribes.getComplexOffsets(this, date, appointmentTimezone);
        date = this._subscribes.translateDateToAppointmentTimeZone(date, tzOffsets, true);
        date = this._subscribes.translateDateToCommonTimeZone(date, tzOffsets, true);
        return date
    },
    translateDateToAppointmentTimeZone: function(date, offsets, back) {
        var operation = back ? -1 : 1;
        var dateInUTC = date.getTime() - operation * offsets.client * toMs("hour");
        return new Date(dateInUTC + operation * offsets.appointment * toMs("hour"))
    },
    translateDateToCommonTimeZone: function(date, offsets, back) {
        var operation = back ? -1 : 1;
        if ("number" === typeof offsets.common) {
            var offset = offsets.common - offsets.appointment;
            var hoursOffset = (offset < 0 ? -1 : 1) * Math.floor(Math.abs(offset));
            var minutesOffset = offset % 1;
            date.setHours(date.getHours() + operation * hoursOffset);
            date.setMinutes(date.getMinutes() + operation * minutesOffset * MINUTES_IN_HOUR)
        }
        return date
    },
    getComplexOffsets: function(scheduler, date, appointmentTimezone) {
        var clientTimezoneOffset = -this.getClientTimezoneOffset(date) / toMs("hour");
        var commonTimezoneOffset = scheduler._getTimezoneOffsetByOption(date);
        var appointmentTimezoneOffset = _utils4.default.calculateTimezoneByValue(appointmentTimezone, date);
        if ("number" !== typeof appointmentTimezoneOffset) {
            appointmentTimezoneOffset = clientTimezoneOffset
        }
        return {
            client: clientTimezoneOffset,
            common: commonTimezoneOffset,
            appointment: appointmentTimezoneOffset
        }
    },
    getTimezonesDisplayName: function() {
        return _uiScheduler2.default.getTimezonesDisplayName()
    },
    getTimezoneDisplayNameById: function(id) {
        return _uiScheduler2.default.getTimezoneDisplayNameById(id)
    },
    getSimilarTimezones: function(id) {
        return _uiScheduler2.default.getSimilarTimezones(id)
    },
    getTimezonesIdsByDisplayName: function(displayName) {
        return _uiScheduler2.default.getTimezonesIdsByDisplayName(displayName)
    },
    getTargetedAppointmentData: function(appointmentData, appointmentElement, needConvertByTimezones) {
        var $appointmentElement = (0, _renderer2.default)(appointmentElement);
        var appointmentIndex = $appointmentElement.data(this._appointments._itemIndexKey());
        var targetedData = this._getAppointmentData(appointmentData, {
            skipDateCalculation: true,
            $appointment: $appointmentElement,
            skipHoursProcessing: needConvertByTimezones ? false : true
        });
        var result = {};
        (0, _extend.extend)(true, result, appointmentData, targetedData);
        appointmentElement && this.setTargetedAppointmentResources(result, appointmentElement, appointmentIndex);
        return result
    },
    getAppointmentDurationInMs: function(options) {
        var startDate = options.startDate;
        var endDate = options.endDate;
        var allDay = options.allDay;
        var appointmentDuration = endDate.getTime() - startDate.getTime();
        var dayDuration = toMs("day");
        var visibleDayDuration = this._workSpace.getVisibleDayDuration();
        var result = 0;
        if (allDay) {
            var ceilQuantityOfDays = Math.ceil(appointmentDuration / dayDuration);
            result = ceilQuantityOfDays * visibleDayDuration
        } else {
            var isDifferentDates = !_utils4.default.isSameAppointmentDates(startDate, endDate);
            var floorQuantityOfDays = Math.floor(appointmentDuration / dayDuration);
            var tailDuration;
            if (isDifferentDates) {
                var startDateEndHour = new Date(new Date(startDate).setHours(this.option("endDayHour"), 0, 0));
                var hiddenDayDuration = dayDuration - visibleDayDuration - (startDate.getTime() > startDateEndHour.getTime() ? startDate.getTime() - startDateEndHour.getTime() : 0);
                tailDuration = appointmentDuration - (floorQuantityOfDays ? floorQuantityOfDays * dayDuration : hiddenDayDuration);
                var startDayTime = this.option("startDayHour") * toMs("hour");
                var endPartDuration = endDate - _date2.default.trimTime(endDate);
                if (endPartDuration < startDayTime) {
                    if (floorQuantityOfDays) {
                        tailDuration -= hiddenDayDuration
                    }
                    tailDuration += startDayTime - endPartDuration
                }
            } else {
                tailDuration = appointmentDuration % dayDuration
            }
            if (tailDuration > visibleDayDuration) {
                tailDuration = visibleDayDuration
            }
            result = floorQuantityOfDays * visibleDayDuration + tailDuration || toMs("minute")
        }
        return result
    },
    fixWrongEndDate: function(appointment, startDate, endDate) {
        return this._appointmentModel.fixWrongEndDate(appointment, startDate, endDate)
    },
    getEndDayHour: function() {
        return this._workSpace.option("endDayHour") || this.option("endDayHour")
    },
    getStartDayHour: function() {
        return this._workSpace.option("startDayHour") || this.option("startDayHour")
    },
    isAdaptive: function() {
        return this.option("adaptivityEnabled")
    },
    moveBack: function() {
        var dragBehavior = this.getWorkSpace().dragBehavior;
        dragBehavior && dragBehavior.moveBack()
    }
};
module.exports = subscribes;
