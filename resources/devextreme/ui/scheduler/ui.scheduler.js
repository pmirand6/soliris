/**
 * DevExtreme (ui/scheduler/ui.scheduler.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var _renderer = require("../../core/renderer");
var _renderer2 = _interopRequireDefault(_renderer);
var _callbacks = require("../../core/utils/callbacks");
var _callbacks2 = _interopRequireDefault(_callbacks);
var _translator = require("../../animation/translator");
var _translator2 = _interopRequireDefault(_translator);
var _ui = require("../widget/ui.errors");
var _ui2 = _interopRequireDefault(_ui);
var _window = require("../../core/utils/window");
var _window2 = _interopRequireDefault(_window);
var _dialog = require("../dialog");
var _dialog2 = _interopRequireDefault(_dialog);
var _utils = require("./utils.recurrence");
var _utils2 = _interopRequireDefault(_utils);
var _dom = require("../../core/utils/dom");
var _dom2 = _interopRequireDefault(_dom);
var _date = require("../../core/utils/date");
var _date2 = _interopRequireDefault(_date);
var _iterator = require("../../core/utils/iterator");
var _extend = require("../../core/utils/extend");
var _array = require("../../core/utils/array");
var _common = require("../../core/utils/common");
var _type = require("../../core/utils/type");
var _type2 = _interopRequireDefault(_type);
var _devices = require("../../core/devices");
var _devices2 = _interopRequireDefault(_devices);
var _config = require("../../core/config");
var _config2 = _interopRequireDefault(_config);
var _data = require("../../core/utils/data");
var _data2 = _interopRequireDefault(_data);
var _component_registrator = require("../../core/component_registrator");
var _component_registrator2 = _interopRequireDefault(_component_registrator);
var _message = require("../../localization/message");
var _message2 = _interopRequireDefault(_message);
var _date_serialization = require("../../core/utils/date_serialization");
var _date_serialization2 = _interopRequireDefault(_date_serialization);
var _date3 = require("../../localization/date");
var _date4 = _interopRequireDefault(_date3);
var _ui3 = require("../widget/ui.widget");
var _ui4 = _interopRequireDefault(_ui3);
var _uiScheduler = require("./ui.scheduler.subscribes");
var _uiScheduler2 = _interopRequireDefault(_uiScheduler);
var _desktopTooltipStrategy = require("./tooltip_strategies/desktopTooltipStrategy");
var _mobileTooltipStrategy = require("./tooltip_strategies/mobileTooltipStrategy");
var _appointmentPopup = require("./appointmentPopup");
var _appointmentPopup2 = _interopRequireDefault(_appointmentPopup);
var _uiScheduler3 = require("./ui.scheduler.header");
var _uiScheduler4 = _interopRequireDefault(_uiScheduler3);
var _uiScheduler5 = require("./workspaces/ui.scheduler.work_space_day");
var _uiScheduler6 = _interopRequireDefault(_uiScheduler5);
var _uiScheduler7 = require("./workspaces/ui.scheduler.work_space_week");
var _uiScheduler8 = _interopRequireDefault(_uiScheduler7);
var _uiScheduler9 = require("./workspaces/ui.scheduler.work_space_work_week");
var _uiScheduler10 = _interopRequireDefault(_uiScheduler9);
var _uiScheduler11 = require("./workspaces/ui.scheduler.work_space_month");
var _uiScheduler12 = _interopRequireDefault(_uiScheduler11);
var _uiScheduler13 = require("./workspaces/ui.scheduler.timeline_day");
var _uiScheduler14 = _interopRequireDefault(_uiScheduler13);
var _uiScheduler15 = require("./workspaces/ui.scheduler.timeline_week");
var _uiScheduler16 = _interopRequireDefault(_uiScheduler15);
var _uiScheduler17 = require("./workspaces/ui.scheduler.timeline_work_week");
var _uiScheduler18 = _interopRequireDefault(_uiScheduler17);
var _uiScheduler19 = require("./workspaces/ui.scheduler.timeline_month");
var _uiScheduler20 = _interopRequireDefault(_uiScheduler19);
var _uiScheduler21 = require("./workspaces/ui.scheduler.agenda");
var _uiScheduler22 = _interopRequireDefault(_uiScheduler21);
var _uiScheduler23 = require("./ui.scheduler.resource_manager");
var _uiScheduler24 = _interopRequireDefault(_uiScheduler23);
var _uiScheduler25 = require("./ui.scheduler.appointment_model");
var _uiScheduler26 = _interopRequireDefault(_uiScheduler25);
var _uiScheduler27 = require("./ui.scheduler.appointments");
var _uiScheduler28 = _interopRequireDefault(_uiScheduler27);
var _uiSchedulerAppointments = require("./ui.scheduler.appointments.layout_manager");
var _uiSchedulerAppointments2 = _interopRequireDefault(_uiSchedulerAppointments);
var _compactAppointmentsHelper = require("./compactAppointmentsHelper");
var _async_template_mixin = require("../shared/async_template_mixin");
var _async_template_mixin2 = _interopRequireDefault(_async_template_mixin);
var _data_helper = require("../../data_helper");
var _data_helper2 = _interopRequireDefault(_data_helper);
var _ui5 = require("./ui.loading");
var _ui6 = _interopRequireDefault(_ui5);
var _deferred = require("../../core/utils/deferred");
var _deferred2 = _interopRequireDefault(_deferred);
var _empty_template = require("../../core/templates/empty_template");
var _bindable_template = require("../../core/templates/bindable_template");
var _themes = require("../themes");
var _themes2 = _interopRequireDefault(_themes);
var _browser = require("../../core/utils/browser");
var _browser2 = _interopRequireDefault(_browser);
var _support = require("../../core/utils/support");
var _utils3 = require("./utils");
var _utils4 = _interopRequireDefault(_utils3);

function _interopRequireDefault(obj) {
    return obj && obj.__esModule ? obj : {
        "default": obj
    }
}
var when = _deferred2.default.when;
var Deferred = _deferred2.default.Deferred;
var toMs = _date2.default.dateToMilliseconds;
var WIDGET_CLASS = "dx-scheduler";
var WIDGET_SMALL_CLASS = "".concat(WIDGET_CLASS, "-small");
var WIDGET_ADAPTIVE_CLASS = "".concat(WIDGET_CLASS, "-adaptive");
var WIDGET_WIN_NO_TOUCH_CLASS = "".concat(WIDGET_CLASS, "-win-no-touch");
var WIDGET_READONLY_CLASS = "".concat(WIDGET_CLASS, "-readonly");
var RECURRENCE_EDITOR_ITEM_CLASS = "".concat(WIDGET_CLASS, "-recurrence-rule-item");
var RECURRENCE_EDITOR_OPENED_ITEM_CLASS = "".concat(WIDGET_CLASS, "-recurrence-rule-item-opened");
var WIDGET_SMALL_WIDTH = 400;
var FULL_DATE_FORMAT = "yyyyMMddTHHmmss";
var UTC_FULL_DATE_FORMAT = FULL_DATE_FORMAT + "Z";
var VIEWS_CONFIG = {
    day: {
        workSpace: _uiScheduler6.default,
        renderingStrategy: "vertical"
    },
    week: {
        workSpace: _uiScheduler8.default,
        renderingStrategy: "vertical"
    },
    workWeek: {
        workSpace: _uiScheduler10.default,
        renderingStrategy: "vertical"
    },
    month: {
        workSpace: _uiScheduler12.default,
        renderingStrategy: "horizontalMonth"
    },
    timelineDay: {
        workSpace: _uiScheduler14.default,
        renderingStrategy: "horizontal"
    },
    timelineWeek: {
        workSpace: _uiScheduler16.default,
        renderingStrategy: "horizontal"
    },
    timelineWorkWeek: {
        workSpace: _uiScheduler18.default,
        renderingStrategy: "horizontal"
    },
    timelineMonth: {
        workSpace: _uiScheduler20.default,
        renderingStrategy: "horizontalMonthLine"
    },
    agenda: {
        workSpace: _uiScheduler22.default,
        renderingStrategy: "agenda"
    }
};
var Scheduler = _ui4.default.inherit({
    _getDefaultOptions: function() {
        return (0, _extend.extend)(this.callBase(), {
            views: ["day", "week"],
            currentView: "day",
            currentDate: _date2.default.trimTime(new Date),
            min: void 0,
            max: void 0,
            dateSerializationFormat: void 0,
            firstDayOfWeek: void 0,
            groups: [],
            resources: [],
            dataSource: null,
            customizeDateNavigatorText: void 0,
            appointmentTemplate: "item",
            dropDownAppointmentTemplate: "dropDownAppointment",
            appointmentCollectorTemplate: "appointmentCollector",
            dataCellTemplate: null,
            timeCellTemplate: null,
            resourceCellTemplate: null,
            dateCellTemplate: null,
            startDayHour: 0,
            endDayHour: 24,
            editing: {
                allowAdding: true,
                allowDeleting: true,
                allowDragging: true,
                allowResizing: true,
                allowUpdating: true
            },
            showAllDayPanel: true,
            showCurrentTimeIndicator: true,
            shadeUntilCurrentTime: false,
            indicatorUpdateInterval: 3e5,
            indicatorTime: void 0,
            recurrenceEditMode: "dialog",
            cellDuration: 30,
            maxAppointmentsPerCell: "auto",
            selectedCellData: [],
            groupByDate: false,
            onAppointmentRendered: null,
            onAppointmentClick: null,
            onAppointmentDblClick: null,
            onAppointmentContextMenu: null,
            onCellClick: null,
            onCellContextMenu: null,
            onAppointmentAdding: null,
            onAppointmentAdded: null,
            onAppointmentUpdating: null,
            onAppointmentUpdated: null,
            onAppointmentDeleting: null,
            onAppointmentDeleted: null,
            onAppointmentFormOpening: null,
            appointmentTooltipTemplate: "appointmentTooltip",
            appointmentPopupTemplate: "appointmentPopup",
            crossScrollingEnabled: false,
            useDropDownViewSwitcher: false,
            startDateExpr: "startDate",
            endDateExpr: "endDate",
            textExpr: "text",
            descriptionExpr: "description",
            allDayExpr: "allDay",
            recurrenceRuleExpr: "recurrenceRule",
            recurrenceExceptionExpr: "recurrenceException",
            remoteFiltering: false,
            timeZone: "",
            startDateTimeZoneExpr: "startDateTimeZone",
            endDateTimeZoneExpr: "endDateTimeZone",
            noDataText: _message2.default.format("dxCollectionWidget-noDataText"),
            adaptivityEnabled: false,
            allowMultipleCellSelection: true,
            _appointmentTooltipOffset: {
                x: 0,
                y: 0
            },
            _appointmentTooltipButtonsPosition: "bottom",
            _appointmentTooltipOpenButtonText: _message2.default.format("dxScheduler-openAppointment"),
            _dropDownButtonIcon: "overflow",
            _appointmentCountPerCell: 2,
            _collectorOffset: 0,
            _appointmentOffset: 26
        })
    },
    _defaultOptionsRules: function() {
        return this.callBase().concat([{
            device: function() {
                return "desktop" === _devices2.default.real().deviceType && !_devices2.default.isSimulator()
            },
            options: {
                focusStateEnabled: true
            }
        }, {
            device: function() {
                return !_devices2.default.current().generic
            },
            options: {
                useDropDownViewSwitcher: true,
                editing: {
                    allowDragging: false,
                    allowResizing: false
                }
            }
        }, {
            device: function() {
                return _themes2.default.isMaterial()
            },
            options: {
                useDropDownViewSwitcher: true,
                dateCellTemplate: function(data, index, element) {
                    var text = data.text;
                    text.split(" ").forEach(function(text, index) {
                        var span = (0, _renderer2.default)("<span>").text(text).addClass("dx-scheduler-header-panel-cell-date");
                        (0, _renderer2.default)(element).append(span);
                        if (!index) {
                            (0, _renderer2.default)(element).append(" ")
                        }
                    })
                },
                _appointmentTooltipOffset: {
                    x: 0,
                    y: 11
                },
                _appointmentTooltipButtonsPosition: "top",
                _appointmentTooltipOpenButtonText: null,
                _dropDownButtonIcon: "chevrondown",
                _appointmentCountPerCell: 1,
                _collectorOffset: 20,
                _appointmentOffset: 30
            }
        }])
    },
    _setDeprecatedOptions: function() {
        this.callBase();
        (0, _extend.extend)(this._deprecatedOptions, {
            onAppointmentFormCreated: {
                since: "18.2",
                alias: "onAppointmentFormOpening"
            },
            dropDownAppointmentTemplate: {
                since: "19.2",
                message: "appointmentTooltipTemplate"
            }
        })
    },
    _postponeDataSourceLoading: function(promise) {
        this.postponedOperations.add("_reloadDataSource", this._reloadDataSource.bind(this), promise)
    },
    _postponeResourceLoading: function() {
        var _this = this;
        var whenLoaded = this.postponedOperations.add("_loadResources", function() {
            return _this._loadResources()
        });
        var resolveCallbacks = new Deferred;
        whenLoaded.done(function(resources) {
            resolveCallbacks.resolve(resources)
        });
        this._postponeDataSourceLoading(whenLoaded);
        return resolveCallbacks.promise()
    },
    _optionChanged: function(args) {
        var _this2 = this;
        var value = args.value;
        var name = args.name;
        switch (args.name) {
            case "customizeDateNavigatorText":
                this._updateOption("header", name, value);
                break;
            case "firstDayOfWeek":
                this._updateOption("workSpace", name, value);
                this._updateOption("header", name, value);
                break;
            case "currentDate":
                value = this._dateOption(name);
                value = _date2.default.trimTime(new Date(value));
                this.option("selectedCellData", []);
                this._workSpace.option(name, new Date(value));
                this._header.option(name, new Date(value));
                this._header.option("displayedDate", this._workSpace._getViewStartByOptions());
                this._appointments.option("items", []);
                this._filterAppointmentsByDate();
                this._postponeDataSourceLoading();
                break;
            case "dataSource":
                this._initDataSource();
                this._customizeStoreLoadOptions();
                this._appointmentModel.setDataSource(this._dataSource);
                this._postponeResourceLoading().done(function(resources) {
                    _this2._filterAppointmentsByDate();
                    _this2._updateOption("workSpace", "showAllDayPanel", _this2.option("showAllDayPanel"))
                });
                break;
            case "min":
            case "max":
                value = this._dateOption(name);
                this._updateOption("header", name, new Date(value));
                this._updateOption("workSpace", name, new Date(value));
                break;
            case "views":
                this._processCurrentView();
                if (this._getCurrentViewOptions()) {
                    this.repaint()
                } else {
                    this._header.option(name, value)
                }
                break;
            case "useDropDownViewSwitcher":
                this._header.option(name, value);
                break;
            case "currentView":
                this._processCurrentView();
                this.getLayoutManager().initRenderingStrategy(this._getAppointmentsRenderingStrategy());
                this._appointments.option({
                    items: [],
                    allowDrag: this._allowDragging(),
                    allowResize: this._allowResizing(),
                    itemTemplate: this._getAppointmentTemplate("appointmentTemplate")
                });
                this._postponeResourceLoading().done(function(resources) {
                    _this2._refreshWorkSpace(resources);
                    _this2._updateHeader();
                    _this2._filterAppointmentsByDate();
                    _this2._appointments.option("allowAllDayResize", "day" !== value)
                });
                break;
            case "appointmentTemplate":
                this._appointments.option("itemTemplate", value);
                break;
            case "dateCellTemplate":
            case "resourceCellTemplate":
            case "dataCellTemplate":
            case "timeCellTemplate":
                this._updateOption("workSpace", name, value);
                this.repaint();
                break;
            case "groups":
                this._postponeResourceLoading().done(function(resources) {
                    _this2._refreshWorkSpace(resources);
                    _this2._filterAppointmentsByDate()
                });
                break;
            case "resources":
                this._resourcesManager.setResources(this.option("resources"));
                this._appointmentModel.setDataAccessors(this._combineDataAccessors());
                this._postponeResourceLoading().done(function(resources) {
                    _this2._appointments.option("items", []);
                    _this2._refreshWorkSpace(resources);
                    _this2._filterAppointmentsByDate()
                });
                break;
            case "startDayHour":
            case "endDayHour":
                this._appointments.option("items", []);
                this._updateOption("workSpace", name, value);
                this._appointments.repaint();
                this._filterAppointmentsByDate();
                this._postponeDataSourceLoading();
                break;
            case "onAppointmentAdding":
            case "onAppointmentAdded":
            case "onAppointmentUpdating":
            case "onAppointmentUpdated":
            case "onAppointmentDeleting":
            case "onAppointmentDeleted":
            case "onAppointmentFormOpening":
                this._actions[name] = this._createActionByOption(name);
                break;
            case "onAppointmentRendered":
                this._appointments.option("onItemRendered", this._getAppointmentRenderedAction());
                break;
            case "onAppointmentClick":
                this._appointments.option("onItemClick", this._createActionByOption(name));
                break;
            case "onAppointmentDblClick":
                this._appointments.option(name, this._createActionByOption(name));
                break;
            case "onAppointmentContextMenu":
                this._appointments.option("onItemContextMenu", this._createActionByOption(name));
                break;
            case "noDataText":
            case "allowMultipleCellSelection":
            case "selectedCellData":
            case "accessKey":
            case "onCellClick":
                this._workSpace.option(name, value);
                break;
            case "onCellContextMenu":
                this._workSpace.option(name, value);
                break;
            case "crossScrollingEnabled":
                this._postponeResourceLoading().done(function(resources) {
                    _this2._appointments.option("items", []);
                    _this2._refreshWorkSpace(resources);
                    if (_this2._readyToRenderAppointments) {
                        _this2._appointments.option("items", _this2._getAppointmentsToRepaint())
                    }
                });
                break;
            case "cellDuration":
                this._appointments.option("items", []);
                if (this._readyToRenderAppointments) {
                    this._updateOption("workSpace", "hoursInterval", value / 60);
                    this._appointments.option("items", this._getAppointmentsToRepaint())
                }
                break;
            case "tabIndex":
            case "focusStateEnabled":
                this._updateOption("header", name, value);
                this._updateOption("workSpace", name, value);
                this._appointments.option(name, value);
                this.callBase(args);
                break;
            case "width":
                this._updateOption("header", name, value);
                if (this.option("crossScrollingEnabled")) {
                    this._updateOption("workSpace", "width", value)
                }
                this.callBase(args);
                this._dimensionChanged();
                break;
            case "height":
                this.callBase(args);
                this._dimensionChanged();
                break;
            case "editing":
                this._initEditing();
                var editing = this._editing;
                this._bringEditingModeToAppointments(editing);
                this.hideAppointmentTooltip();
                this._cleanPopup();
                break;
            case "showAllDayPanel":
                this._postponeResourceLoading().done(function(resources) {
                    _this2._filterAppointmentsByDate();
                    _this2._updateOption("workSpace", "allDayExpanded", value);
                    _this2._updateOption("workSpace", name, value)
                });
                break;
            case "showCurrentTimeIndicator":
            case "indicatorTime":
            case "indicatorUpdateInterval":
            case "shadeUntilCurrentTime":
            case "groupByDate":
                this._updateOption("workSpace", name, value);
                this.repaint();
                break;
            case "appointmentDragging":
            case "appointmentTooltipTemplate":
            case "appointmentPopupTemplate":
            case "recurrenceEditMode":
            case "remoteFiltering":
            case "timeZone":
            case "dropDownAppointmentTemplate":
            case "appointmentCollectorTemplate":
            case "_appointmentTooltipOffset":
            case "_appointmentTooltipButtonsPosition":
            case "_appointmentTooltipOpenButtonText":
            case "_dropDownButtonIcon":
            case "_appointmentCountPerCell":
            case "_collectorOffset":
            case "_appointmentOffset":
                this.repaint();
                break;
            case "dateSerializationFormat":
                break;
            case "maxAppointmentsPerCell":
                break;
            case "startDateExpr":
            case "endDateExpr":
            case "startDateTimeZoneExpr":
            case "endDateTimeZoneExpr":
            case "textExpr":
            case "descriptionExpr":
            case "allDayExpr":
            case "recurrenceRuleExpr":
            case "recurrenceExceptionExpr":
                this._updateExpression(name, value);
                this._appointmentModel.setDataAccessors(this._combineDataAccessors());
                this._initAppointmentTemplate();
                this.repaint();
                break;
            case "adaptivityEnabled":
                this._toggleAdaptiveClass();
                this.repaint();
                break;
            default:
                this.callBase(args)
        }
    },
    _updateHeader: function() {
        var viewCountConfig = this._getViewCountConfig();
        this._header.option("intervalCount", viewCountConfig.intervalCount);
        this._header.option("displayedDate", this._workSpace._getViewStartByOptions());
        this._header.option("min", this._dateOption("min"));
        this._header.option("max", this._dateOption("max"));
        this._header.option("currentDate", this._dateOption("currentDate"));
        this._header.option("firstDayOfWeek", this._getCurrentViewOption("firstDayOfWeek"));
        this._header.option("currentView", this._currentView)
    },
    _dateOption: function(optionName) {
        var optionValue = this._getCurrentViewOption(optionName);
        return _date_serialization2.default.deserializeDate(optionValue)
    },
    _getSerializationFormat: function(optionName) {
        var value = this._getCurrentViewOption(optionName);
        if ("number" === typeof value) {
            return "number"
        }
        if (!_type2.default.isString(value)) {
            return
        }
        return _date_serialization2.default.getDateSerializationFormat(value)
    },
    _bringEditingModeToAppointments: function(editing) {
        var editingConfig = {
            allowDelete: editing.allowUpdating && editing.allowDeleting
        };
        if (!this._isAgenda()) {
            editingConfig.allowDrag = editing.allowDragging;
            editingConfig.allowResize = editing.allowResizing;
            editingConfig.allowAllDayResize = editing.allowResizing && this._supportAllDayResizing()
        }
        this._appointments.option(editingConfig);
        this.repaint()
    },
    _isAgenda: function() {
        return "agenda" === this._getAppointmentsRenderingStrategy()
    },
    _allowDragging: function() {
        return this._editing.allowDragging && !this._isAgenda()
    },
    _allowResizing: function() {
        return this._editing.allowResizing && !this._isAgenda()
    },
    _allowAllDayResizing: function() {
        return this._editing.allowResizing && this._supportAllDayResizing()
    },
    _supportAllDayResizing: function() {
        return "day" !== this._getCurrentViewType() || this._currentView.intervalCount > 1
    },
    _isAllDayExpanded: function(items) {
        return this.option("showAllDayPanel") && this._appointmentModel.hasAllDayAppointments(items, this._getCurrentViewOption("startDayHour"), this._getCurrentViewOption("endDayHour"))
    },
    _getTimezoneOffsetByOption: function(date) {
        return _utils4.default.calculateTimezoneByValue(this.option("timeZone"), date)
    },
    getCorrectedDatesByDaylightOffsets: function(originalStartDate, dates, appointmentData) {
        var _this3 = this;
        var startDateTimeZone = this.fire("getField", "startDateTimeZone", appointmentData);
        var needCheckTimezoneOffset = _type2.default.isDefined(startDateTimeZone) && _type2.default.isDefined(this._getTimezoneOffsetByOption(originalStartDate));
        var convertedOriginalStartDate = this.fire("convertDateByTimezoneBack", new Date(originalStartDate.getTime()), startDateTimeZone);
        if (needCheckTimezoneOffset) {
            dates = dates.map(function(date) {
                var convertedDate = _this3.fire("convertDateByTimezoneBack", new Date(date.getTime()), startDateTimeZone);
                return _utils4.default.getCorrectedDateByDaylightOffsets(convertedOriginalStartDate, convertedDate, date, _this3.option("timeZone"), startDateTimeZone)
            })
        }
        return dates
    },
    _filterAppointmentsByDate: function() {
        var dateRange = this._workSpace.getDateRange();
        this._appointmentModel.filterByDate(dateRange[0], dateRange[1], this.option("remoteFiltering"), this.option("dateSerializationFormat"))
    },
    _loadResources: function() {
        var groups = this._getCurrentViewOption("groups");
        var result = new Deferred;
        this._resourcesManager.loadResources(groups).done(function(resources) {
            this._loadedResources = resources;
            result.resolve(resources)
        }.bind(this));
        return result.promise()
    },
    _dataSourceLoadedCallback: (0, _callbacks2.default)(),
    _reloadDataSource: function() {
        var result = new Deferred;
        if (this._dataSource) {
            this._dataSource.load().done(function() {
                _ui6.default.hide();
                this._fireContentReadyAction(result)
            }.bind(this)).fail(function() {
                _ui6.default.hide();
                result.reject()
            });
            this._dataSource.isLoading() && _ui6.default.show({
                container: this.$element(),
                position: {
                    of: this.$element()
                }
            })
        } else {
            this._fireContentReadyAction(result)
        }
        return result.promise()
    },
    _fireContentReadyAction: function(result) {
        this.callBase();
        result && result.resolve()
    },
    _dimensionChanged: function() {
        var filteredItems = this.getFilteredItems();
        this._toggleSmallClass();
        if (!this._isAgenda() && filteredItems && this._isVisible()) {
            this._workSpace._cleanAllowedPositions();
            this._workSpace.option("allDayExpanded", this._isAllDayExpanded(filteredItems));
            this._workSpace._dimensionChanged();
            var appointments = this._layoutManager.createAppointmentsMap(filteredItems);
            this._appointments.option("items", appointments)
        }
        this.hideAppointmentTooltip();
        this.resizePopup();
        this._appointmentPopup.updatePopupFullScreenMode()
    },
    _clean: function() {
        this._cleanPopup();
        this.callBase()
    },
    _toggleSmallClass: function() {
        var width = this.$element().get(0).getBoundingClientRect().width;
        this.$element().toggleClass(WIDGET_SMALL_CLASS, width < WIDGET_SMALL_WIDTH)
    },
    _toggleAdaptiveClass: function() {
        this.$element().toggleClass(WIDGET_ADAPTIVE_CLASS, this.option("adaptivityEnabled"))
    },
    _visibilityChanged: function(visible) {
        visible && this._dimensionChanged()
    },
    _dataSourceOptions: function() {
        return {
            paginate: false
        }
    },
    _init: function() {
        this._initExpressions({
            startDate: this.option("startDateExpr"),
            endDate: this.option("endDateExpr"),
            startDateTimeZone: this.option("startDateTimeZoneExpr"),
            endDateTimeZone: this.option("endDateTimeZoneExpr"),
            allDay: this.option("allDayExpr"),
            text: this.option("textExpr"),
            description: this.option("descriptionExpr"),
            recurrenceRule: this.option("recurrenceRuleExpr"),
            recurrenceException: this.option("recurrenceExceptionExpr")
        });
        this.callBase();
        this._initDataSource();
        this._loadedResources = [];
        this._proxiedCustomizeStoreLoadOptionsHandler = this._customizeStoreLoadOptionsHandler.bind(this);
        this._customizeStoreLoadOptions();
        this.$element().addClass(WIDGET_CLASS).toggleClass(WIDGET_WIN_NO_TOUCH_CLASS, !!(_browser2.default.msie && _support.touch));
        this._initEditing();
        this._resourcesManager = new _uiScheduler24.default(this.option("resources"));
        var combinedDataAccessors = this._combineDataAccessors();
        this._appointmentModel = new _uiScheduler26.default(this._dataSource, combinedDataAccessors, this.getAppointmentDurationInMinutes());
        this._initActions();
        this._compactAppointmentsHelper = new _compactAppointmentsHelper.CompactAppointmentsHelper(this);
        this._subscribes = _uiScheduler2.default
    },
    _initTemplates: function() {
        this.callBase();
        this._initAppointmentTemplate();
        this._defaultTemplates.appointmentTooltip = new _empty_template.EmptyTemplate;
        this._defaultTemplates.dropDownAppointment = new _empty_template.EmptyTemplate
    },
    setDefaultTemplate: function(templateName, template) {
        this._defaultTemplates[templateName] = template
    },
    _initAppointmentTemplate: function() {
        var _this4 = this;
        var expr = this._dataAccessors.expr;
        var createGetter = function(property) {
            return _data2.default.compileGetter("appointmentData.".concat(property))
        };
        this._defaultTemplates.item = new _bindable_template.BindableTemplate(function($container, data, model) {
            _this4.getAppointmentsInstance()._renderAppointmentTemplate($container, data, model)
        }, ["html", "text", "startDate", "endDate", "allDay", "description", "recurrenceRule", "recurrenceException", "startDateTimeZone", "endDateTimeZone"], this.option("integrationOptions.watchMethod"), {
            text: createGetter(expr.textExpr),
            startDate: createGetter(expr.startDateExpr),
            endDate: createGetter(expr.endDateExpr),
            startDateTimeZone: createGetter(expr.startDateTimeZoneExpr),
            endDateTimeZone: createGetter(expr.endDateTimeZoneExpr),
            allDay: createGetter(expr.allDayExpr),
            recurrenceRule: createGetter(expr.recurrenceRuleExpr)
        })
    },
    _combineDataAccessors: function() {
        var resourcesDataAccessors = this._resourcesManager._dataAccessors;
        var result = (0, _extend.extend)(true, {}, this._dataAccessors);
        (0, _iterator.each)(resourcesDataAccessors, function(type, accessor) {
            result[type].resources = accessor
        }.bind(this));
        return result
    },
    _renderContent: function() {
        this._renderContentImpl()
    },
    _dataSourceChangedHandler: function(result) {
        if (this._readyToRenderAppointments) {
            this._workSpaceRecalculation.done(function() {
                this._filteredItems = this.fire("prerenderFilter");
                this._workSpace.option("allDayExpanded", this._isAllDayExpanded(this._filteredItems));
                if (this._isAgenda()) {
                    this.getRenderingStrategyInstance().calculateRows(this._filteredItems, 7, this.option("currentDate"), true)
                }
                if (this._filteredItems.length && this._isVisible()) {
                    this._appointments.option("items", this._getAppointmentsToRepaint());
                    this._appointmentModel.cleanModelState()
                } else {
                    this._appointments.option("items", [])
                }
                if (this._isAgenda()) {
                    this._workSpace._renderView();
                    this._dataSourceLoadedCallback.fireWith(this, [result])
                }
            }.bind(this))
        }
    },
    _getAppointmentsToRepaint: function() {
        var appointments = this._layoutManager.createAppointmentsMap(this._filteredItems);
        return this._layoutManager.getRepaintedAppointments(appointments, this.getAppointmentsInstance().option("items"))
    },
    _initExpressions: function(fields) {
        var isDateField = function(field) {
            return "startDate" === field || "endDate" === field
        };
        if (!this._dataAccessors) {
            this._dataAccessors = {
                getter: {},
                setter: {},
                expr: {}
            }
        }(0, _iterator.each)(fields, function(name, expr) {
            if (expr) {
                var getter = _data2.default.compileGetter(expr);
                var setter = _data2.default.compileSetter(expr);
                var dateGetter;
                var dateSetter;
                if (isDateField(name)) {
                    var that = this;
                    dateGetter = function() {
                        var value = getter.apply(this, arguments);
                        if ((0, _config2.default)().forceIsoDateParsing) {
                            if (!that.option("dateSerializationFormat")) {
                                var format = _date_serialization2.default.getDateSerializationFormat(value);
                                if (format) {
                                    that.option("dateSerializationFormat", format)
                                }
                            }
                            value = _date_serialization2.default.deserializeDate(value)
                        }
                        return value
                    };
                    dateSetter = function(object, value) {
                        if ((0, _config2.default)().forceIsoDateParsing || that.option("dateSerializationFormat")) {
                            value = _date_serialization2.default.serializeDate(value, that.option("dateSerializationFormat"))
                        }
                        setter.call(this, object, value)
                    }
                }
                this._dataAccessors.getter[name] = dateGetter || getter;
                this._dataAccessors.setter[name] = dateSetter || setter;
                this._dataAccessors.expr[name + "Expr"] = expr
            } else {
                delete this._dataAccessors.getter[name];
                delete this._dataAccessors.setter[name];
                delete this._dataAccessors.expr[name + "Expr"]
            }
        }.bind(this))
    },
    _updateExpression: function(name, value) {
        var exprObj = {};
        exprObj[name.replace("Expr", "")] = value;
        this._initExpressions(exprObj)
    },
    _initEditing: function() {
        var editing = this.option("editing");
        this._editing = {
            allowAdding: !!editing,
            allowUpdating: !!editing,
            allowDeleting: !!editing,
            allowResizing: !!editing,
            allowDragging: !!editing
        };
        if (_type2.default.isObject(editing)) {
            this._editing = (0, _extend.extend)(this._editing, editing)
        }
        this._editing.allowDragging = this._editing.allowDragging && this._editing.allowUpdating;
        this._editing.allowResizing = this._editing.allowResizing && this._editing.allowUpdating;
        this.$element().toggleClass(WIDGET_READONLY_CLASS, this._isReadOnly())
    },
    _isReadOnly: function() {
        var result = true;
        var editing = this._editing;
        for (var prop in editing) {
            if (Object.prototype.hasOwnProperty.call(editing, prop)) {
                result = result && !editing[prop]
            }
        }
        return result
    },
    _customizeStoreLoadOptions: function() {
        this._dataSource && this._dataSource.on("customizeStoreLoadOptions", this._proxiedCustomizeStoreLoadOptionsHandler)
    },
    _dispose: function() {
        this._appointmentTooltip && this._appointmentTooltip.dispose();
        this.hideAppointmentPopup();
        this.hideAppointmentTooltip();
        this._cleanAsyncTemplatesTimer();
        this._dataSource && this._dataSource.off("customizeStoreLoadOptions", this._proxiedCustomizeStoreLoadOptionsHandler);
        this.callBase()
    },
    _customizeStoreLoadOptionsHandler: function(options) {
        options.storeLoadOptions.dxScheduler = {
            startDate: this.getStartViewDate(),
            endDate: this.getEndViewDate(),
            resources: this.option("resources")
        }
    },
    _initActions: function() {
        this._actions = {
            onAppointmentAdding: this._createActionByOption("onAppointmentAdding"),
            onAppointmentAdded: this._createActionByOption("onAppointmentAdded"),
            onAppointmentUpdating: this._createActionByOption("onAppointmentUpdating"),
            onAppointmentUpdated: this._createActionByOption("onAppointmentUpdated"),
            onAppointmentDeleting: this._createActionByOption("onAppointmentDeleting"),
            onAppointmentDeleted: this._createActionByOption("onAppointmentDeleted"),
            onAppointmentFormOpening: this._createActionByOption("onAppointmentFormOpening")
        }
    },
    _getAppointmentRenderedAction: function() {
        return this._createActionByOption("onAppointmentRendered", {
            excludeValidators: ["disabled", "readOnly"]
        })
    },
    _renderFocusTarget: _common.noop,
    _initMarkup: function() {
        this.callBase();
        this._processCurrentView();
        this._renderHeader();
        this._layoutManager = new _uiSchedulerAppointments2.default(this, this._getAppointmentsRenderingStrategy());
        this._appointments = this._createComponent("<div>", _uiScheduler28.default, this._appointmentsConfig());
        this._appointments.option("itemTemplate", this._getAppointmentTemplate("appointmentTemplate"));
        this._appointmentTooltip = new(this.option("adaptivityEnabled") ? _mobileTooltipStrategy.MobileTooltipStrategy : _desktopTooltipStrategy.DesktopTooltipStrategy)(this._getAppointmentTooltipOptions());
        this._appointmentPopup = new _appointmentPopup2.default(this);
        if (this._isLoaded()) {
            this._initMarkupCore(this._loadedResources);
            this._dataSourceChangedHandler(this._dataSource.items());
            this._fireContentReadyAction()
        } else {
            this._loadResources().done(function(resources) {
                this._initMarkupCore(resources);
                this._reloadDataSource()
            }.bind(this))
        }
    },
    _getAppointmentTooltipOptions: function() {
        var _this5 = this;
        var that = this;
        return {
            createComponent: that._createComponent.bind(that),
            container: that.$element(),
            getScrollableContainer: that.getWorkSpaceScrollableContainer.bind(that),
            setDefaultTemplate: that.setDefaultTemplate.bind(that),
            getAppointmentTemplate: that._getAppointmentTemplate.bind(that),
            showAppointmentPopup: that.showAppointmentPopup.bind(that),
            getTextAndFormatDate: function(data, currentData, format) {
                return that.fire("getTextAndFormatDate", data, currentData, format)
            },
            checkAndDeleteAppointment: that.checkAndDeleteAppointment.bind(that),
            isAppointmentInAllDayPanel: that.isAppointmentInAllDayPanel.bind(that),
            getSingleAppointmentData: function(appointmentData, targetElement) {
                var $appointment = (0, _renderer2.default)(targetElement);
                return _this5._getAppointmentData(appointmentData, {
                    data: appointmentData,
                    target: $appointment.get(0),
                    $appointment: $appointment,
                    skipHoursProcessing: true
                })
            }
        }
    },
    checkAndDeleteAppointment: function(data, appointmentData) {
        var that = this;
        var startDate = that.fire("getField", "startDate", appointmentData);
        that._checkRecurringAppointment(data, appointmentData, startDate, function() {
            that.deleteAppointment(data)
        }, true)
    },
    _getExtraAppointmentTooltipOptions: function() {
        return {
            rtlEnabled: this.option("rtlEnabled"),
            focusStateEnabled: this.option("focusStateEnabled"),
            editing: this.option("editing"),
            offset: this.option("_appointmentTooltipOffset")
        }
    },
    isAppointmentInAllDayPanel: function(appointmentData) {
        var workSpace = this._workSpace;
        var itTakesAllDay = this.appointmentTakesAllDay(appointmentData);
        return itTakesAllDay && workSpace.supportAllDayRow() && workSpace.option("showAllDayPanel")
    },
    _initMarkupCore: function(resources) {
        var _this6 = this;
        this._readyToRenderAppointments = _window2.default.hasWindow();
        this._workSpace && this._cleanWorkspace();
        this._renderWorkSpace(resources);
        this._appointments.option({
            fixedContainer: this._workSpace.getFixedContainer(),
            allDayContainer: this._workSpace.getAllDayContainer()
        });
        this._waitAsyncTemplates(function() {
            _this6._workSpaceRecalculation && _this6._workSpaceRecalculation.resolve()
        });
        this._filterAppointmentsByDate()
    },
    _isLoaded: function() {
        return this._isResourcesLoaded() && this._isDataSourceLoaded()
    },
    _isResourcesLoaded: function() {
        return _type2.default.isDefined(this._loadedResources)
    },
    _isDataSourceLoaded: function() {
        return this._dataSource && this._dataSource.isLoaded()
    },
    _render: function() {
        this._toggleSmallClass();
        this._toggleAdaptiveClass();
        this.callBase()
    },
    _renderHeader: function() {
        var $header = (0, _renderer2.default)("<div>").appendTo(this.$element());
        this._header = this._createComponent($header, _uiScheduler4.default, this._headerConfig())
    },
    _headerConfig: function() {
        var result;
        var currentViewOptions = this._getCurrentViewOptions();
        var countConfig = this._getViewCountConfig();
        result = (0, _extend.extend)({
            isAdaptive: this.option("adaptivityEnabled"),
            firstDayOfWeek: this.option("firstDayOfWeek"),
            currentView: this._currentView,
            tabIndex: this.option("tabIndex"),
            focusStateEnabled: this.option("focusStateEnabled"),
            width: this.option("width"),
            rtlEnabled: this.option("rtlEnabled"),
            useDropDownViewSwitcher: this.option("useDropDownViewSwitcher"),
            _dropDownButtonIcon: this.option("_dropDownButtonIcon"),
            customizeDateNavigatorText: this.option("customizeDateNavigatorText")
        }, currentViewOptions);
        result.observer = this;
        result.intervalCount = countConfig.intervalCount;
        result.views = this.option("views");
        result.min = new Date(this._dateOption("min"));
        result.max = new Date(this._dateOption("max"));
        result.currentDate = _date2.default.trimTime(new Date(this._dateOption("currentDate")));
        return result
    },
    _appointmentsConfig: function() {
        var that = this;
        var config = {
            observer: this,
            onItemRendered: this._getAppointmentRenderedAction(),
            onItemClick: this._createActionByOption("onAppointmentClick"),
            onItemContextMenu: this._createActionByOption("onAppointmentContextMenu"),
            onAppointmentDblClick: this._createActionByOption("onAppointmentDblClick"),
            tabIndex: this.option("tabIndex"),
            focusStateEnabled: this.option("focusStateEnabled"),
            allowDrag: this._allowDragging(),
            allowDelete: this._editing.allowUpdating && this._editing.allowDeleting,
            allowResize: this._allowResizing(),
            allowAllDayResize: this._allowAllDayResizing(),
            rtlEnabled: this.option("rtlEnabled"),
            currentView: this.option("currentView"),
            onContentReady: function() {
                that._workSpace && that._workSpace.option("allDayExpanded", that._isAllDayExpanded(that.getFilteredItems()))
            }
        };
        return config
    },
    getCollectorOffset: function() {
        if (this._workSpace.needApplyCollectorOffset() && !this.option("adaptivityEnabled")) {
            return this.option("_collectorOffset")
        } else {
            return 0
        }
    },
    getAppointmentDurationInMinutes: function() {
        return this._getCurrentViewOption("cellDuration")
    },
    _processCurrentView: function() {
        var views = this.option("views");
        var currentView = this.option("currentView");
        var that = this;
        this._currentView = currentView;
        (0, _iterator.each)(views, function(_, view) {
            var isViewIsObject = _type2.default.isObject(view);
            var viewName = isViewIsObject ? view.name : view;
            var viewType = view.type;
            if (currentView === viewName || currentView === viewType) {
                that._currentView = view;
                return false
            }
        })
    },
    _getCurrentViewType: function() {
        return this._currentView.type || this._currentView
    },
    _getAppointmentsRenderingStrategy: function() {
        return VIEWS_CONFIG[this._getCurrentViewType()].renderingStrategy
    },
    _renderWorkSpace: function(groups) {
        this._readyToRenderAppointments && this._toggleSmallClass();
        var $workSpace = (0, _renderer2.default)("<div>").appendTo(this.$element());
        var countConfig = this._getViewCountConfig();
        this._workSpace = this._createComponent($workSpace, VIEWS_CONFIG[this._getCurrentViewType()].workSpace, this._workSpaceConfig(groups, countConfig));
        this._allowDragging() && this._workSpace.initDragBehavior(this);
        this._workSpace.getWorkArea().append(this._appointments.$element());
        this._recalculateWorkspace();
        countConfig.startDate && this._header && this._header.option("currentDate", this._workSpace._getHeaderDate());
        this._appointments.option("_collectorOffset", this.getCollectorOffset())
    },
    _getViewCountConfig: function() {
        var currentView = this.option("currentView");
        var view = this._getViewByName(currentView);
        var viewCount = view && view.intervalCount || 1;
        var startDate = view && view.startDate || null;
        return {
            intervalCount: viewCount,
            startDate: startDate
        }
    },
    _getViewByName: function(name) {
        var views = this.option("views");
        for (var i = 0; i < views.length; i++) {
            if (views[i].name === name || views[i].type === name || views[i] === name) {
                return views[i]
            }
        }
    },
    _recalculateWorkspace: function() {
        var _this7 = this;
        this._workSpaceRecalculation = new Deferred;
        this._waitAsyncTemplates(function() {
            _dom2.default.triggerResizeEvent(_this7._workSpace.$element());
            _this7._workSpace._refreshDateTimeIndication()
        })
    },
    _workSpaceConfig: function(groups, countConfig) {
        var _this8 = this;
        var result;
        var currentViewOptions = this._getCurrentViewOptions();
        result = (0, _extend.extend)({
            noDataText: this.option("noDataText"),
            firstDayOfWeek: this.option("firstDayOfWeek"),
            startDayHour: this.option("startDayHour"),
            endDayHour: this.option("endDayHour"),
            tabIndex: this.option("tabIndex"),
            accessKey: this.option("accessKey"),
            focusStateEnabled: this.option("focusStateEnabled"),
            cellDuration: this.option("cellDuration"),
            showAllDayPanel: this.option("showAllDayPanel"),
            showCurrentTimeIndicator: this.option("showCurrentTimeIndicator"),
            indicatorTime: this.option("indicatorTime"),
            indicatorUpdateInterval: this.option("indicatorUpdateInterval"),
            shadeUntilCurrentTime: this.option("shadeUntilCurrentTime"),
            allDayExpanded: this._appointments.option("items"),
            crossScrollingEnabled: this.option("crossScrollingEnabled"),
            dataCellTemplate: this.option("dataCellTemplate"),
            timeCellTemplate: this.option("timeCellTemplate"),
            resourceCellTemplate: this.option("resourceCellTemplate"),
            dateCellTemplate: this.option("dateCellTemplate"),
            allowMultipleCellSelection: this.option("allowMultipleCellSelection"),
            selectedCellData: this.option("selectedCellData"),
            onSelectionChanged: function(args) {
                _this8.option("selectedCellData", args.selectedCellData)
            },
            groupByDate: this._getCurrentViewOption("groupByDate")
        }, currentViewOptions);
        result.observer = this;
        result.intervalCount = countConfig.intervalCount;
        result.startDate = countConfig.startDate;
        result.groups = groups;
        result.onCellClick = this._createActionByOption("onCellClick");
        result.onCellContextMenu = this._createActionByOption("onCellContextMenu");
        result.min = new Date(this._dateOption("min"));
        result.max = new Date(this._dateOption("max"));
        result.currentDate = _date2.default.trimTime(new Date(this._dateOption("currentDate")));
        result.hoursInterval = result.cellDuration / 60;
        result.allDayExpanded = this._isAllDayExpanded(this.getFilteredItems());
        result.dataCellTemplate = result.dataCellTemplate ? this._getTemplate(result.dataCellTemplate) : null;
        result.timeCellTemplate = result.timeCellTemplate ? this._getTemplate(result.timeCellTemplate) : null;
        result.resourceCellTemplate = result.resourceCellTemplate ? this._getTemplate(result.resourceCellTemplate) : null;
        result.dateCellTemplate = result.dateCellTemplate ? this._getTemplate(result.dateCellTemplate) : null;
        return result
    },
    _getCurrentViewOptions: function() {
        return this._currentView
    },
    _getCurrentViewOption: function(optionName) {
        var currentViewOptions = this._getCurrentViewOptions();
        if (currentViewOptions && void 0 !== currentViewOptions[optionName]) {
            return currentViewOptions[optionName]
        }
        return this.option(optionName)
    },
    _getAppointmentTemplate: function(optionName) {
        var currentViewOptions = this._getCurrentViewOptions();
        if (currentViewOptions && currentViewOptions[optionName]) {
            return this._getTemplate(currentViewOptions[optionName])
        }
        return this._getTemplateByOption(optionName)
    },
    _updateOption: function(viewName, optionName, value) {
        var currentViewOptions = this._getCurrentViewOptions();
        if (!currentViewOptions || !_type2.default.isDefined(currentViewOptions[optionName])) {
            this["_" + viewName].option(optionName, value)
        }
    },
    _refreshWorkSpace: function(groups) {
        var _this9 = this;
        this._cleanWorkspace();
        delete this._workSpace;
        this._renderWorkSpace(groups);
        if (this._readyToRenderAppointments) {
            this._appointments.option({
                fixedContainer: this._workSpace.getFixedContainer(),
                allDayContainer: this._workSpace.getAllDayContainer()
            });
            this._waitAsyncTemplates(function() {
                _this9._workSpaceRecalculation.resolve()
            })
        }
    },
    _cleanWorkspace: function() {
        this._appointments.$element().detach();
        this._workSpace._dispose();
        this._workSpace.$element().remove();
        this.option("selectedCellData", [])
    },
    getWorkSpaceScrollable: function() {
        return this._workSpace.getScrollable()
    },
    getWorkSpaceScrollableScrollTop: function(allDay) {
        return this._workSpace.getGroupedScrollableScrollTop(allDay)
    },
    getWorkSpaceScrollableScrollLeft: function() {
        return this._workSpace.getScrollableScrollLeft()
    },
    getWorkSpaceScrollableContainer: function() {
        return this._workSpace.getScrollableContainer()
    },
    getWorkSpaceAllDayHeight: function() {
        return this._workSpace.getAllDayHeight()
    },
    getWorkSpaceAllDayOffset: function() {
        return this._workSpace.getAllDayOffset()
    },
    getWorkSpaceHeaderPanelHeight: function() {
        return this._workSpace.getHeaderPanelHeight()
    },
    getWorkSpaceDateTableOffset: function() {
        return !this.option("crossScrollingEnabled") || this.option("rtlEnabled") ? this._workSpace.getWorkSpaceLeftOffset() : 0
    },
    getWorkSpace: function() {
        return this._workSpace
    },
    getAppointmentModel: function() {
        return this._appointmentModel
    },
    getHeader: function() {
        return this._header
    },
    getMaxAppointmentsPerCell: function() {
        return this._getCurrentViewOption("maxAppointmentsPerCell")
    },
    _cleanPopup: function() {
        this._appointmentPopup.dispose()
    },
    _convertDatesByTimezoneBack: function(applyAppointmentTimezone, sourceAppointmentData, targetAppointmentData) {
        targetAppointmentData = targetAppointmentData || sourceAppointmentData;
        var processedStartDate = this.fire("convertDateByTimezoneBack", this.fire("getField", "startDate", sourceAppointmentData), applyAppointmentTimezone && this.fire("getField", "startDateTimeZone", sourceAppointmentData));
        var processedEndDate = this.fire("convertDateByTimezoneBack", this.fire("getField", "endDate", sourceAppointmentData), applyAppointmentTimezone && this.fire("getField", "endDateTimeZone", sourceAppointmentData));
        this.fire("setField", "startDate", targetAppointmentData, processedStartDate);
        this.fire("setField", "endDate", targetAppointmentData, processedEndDate)
    },
    _checkRecurringAppointment: function(targetAppointment, singleAppointment, exceptionDate, callback, isDeleted, isPopupEditing, dragEvent) {
        delete this._updatedRecAppointment;
        var recurrenceRule = this.fire("getField", "recurrenceRule", targetAppointment);
        if (!_utils2.default.getRecurrenceRule(recurrenceRule).isValid || !this._editing.allowUpdating) {
            callback();
            return
        }
        var editMode = this.option("recurrenceEditMode");
        switch (editMode) {
            case "series":
                callback();
                break;
            case "occurrence":
                this._singleAppointmentChangesHandler(targetAppointment, singleAppointment, exceptionDate, isDeleted, isPopupEditing, dragEvent);
                break;
            default:
                if (dragEvent) {
                    dragEvent.cancel = new Deferred
                }
                this._showRecurrenceChangeConfirm(isDeleted).done(function(result) {
                    result && callback();
                    !result && this._singleAppointmentChangesHandler(targetAppointment, singleAppointment, exceptionDate, isDeleted, isPopupEditing, dragEvent)
                }.bind(this)).fail(function() {
                    this._appointments.moveAppointmentBack(dragEvent)
                }.bind(this))
        }
    },
    _singleAppointmentChangesHandler: function(targetAppointment, singleAppointment, exceptionDate, isDeleted, isPopupEditing, dragEvent) {
        exceptionDate = new Date(exceptionDate);

        function processAppointmentDates(appointment, commonTimezoneOffset) {
            var startDate = this.fire("getField", "startDate", appointment);
            var processedStartDate = this.fire("convertDateByTimezoneBack", startDate, this.fire("getField", "startDateTimeZone", appointment));
            var endDate = this.fire("getField", "endDate", appointment);
            var processedEndDate = this.fire("convertDateByTimezoneBack", endDate, this.fire("getField", "endDateTimeZone", appointment));
            if ("number" === typeof commonTimezoneOffset && !isNaN(commonTimezoneOffset)) {
                var startDateClientTzOffset = -(this._subscribes.getClientTimezoneOffset(startDate) / toMs("hour"));
                var endDateClientTzOffset = -(this._subscribes.getClientTimezoneOffset(endDate) / toMs("hour"));
                var processedStartDateInUTC = processedStartDate.getTime() - startDateClientTzOffset * toMs("hour");
                var processedEndDateInUTC = processedEndDate.getTime() - endDateClientTzOffset * toMs("hour");
                processedStartDate = new Date(processedStartDateInUTC + commonTimezoneOffset * toMs("hour"));
                processedEndDate = new Date(processedEndDateInUTC + commonTimezoneOffset * toMs("hour"))
            }
            this.fire("setField", "startDate", appointment, processedStartDate);
            this.fire("setField", "endDate", appointment, processedEndDate)
        }
        this.fire("setField", "recurrenceRule", singleAppointment, "");
        this.fire("setField", "recurrenceException", singleAppointment, "");
        if (!isDeleted && !isPopupEditing) {
            processAppointmentDates.call(this, singleAppointment, this._getTimezoneOffsetByOption());
            this.addAppointment(singleAppointment)
        }
        var recurrenceException = this._makeDateAsRecurrenceException(exceptionDate, targetAppointment);
        var updatedAppointment = (0, _extend.extend)({}, targetAppointment);
        this.fire("setField", "recurrenceException", updatedAppointment, recurrenceException);
        if (isPopupEditing) {
            this._updatedRecAppointment = updatedAppointment;
            this._showAppointmentPopup(singleAppointment, true, false);
            this._editAppointmentData = targetAppointment
        } else {
            this._updateAppointment(targetAppointment, updatedAppointment, function() {
                this._appointments.moveAppointmentBack(dragEvent)
            }, dragEvent)
        }
    },
    _makeDateAsRecurrenceException: function(exceptionDate, targetAppointment) {
        var startDate = this._getStartDate(targetAppointment, true);
        var startDateTimeZone = this.fire("getField", "startDateTimeZone", targetAppointment);
        var exceptionByDate = this._getRecurrenceExceptionDate(exceptionDate, startDate, startDateTimeZone);
        var recurrenceException = this.fire("getField", "recurrenceException", targetAppointment);
        return recurrenceException ? recurrenceException + "," + exceptionByDate : exceptionByDate
    },
    _getRecurrenceExceptionDate: function(exceptionStartDate, targetStartDate, startDateTimeZone) {
        exceptionStartDate = this.fire("convertDateByTimezoneBack", exceptionStartDate, startDateTimeZone);
        var appointmentStartDate = this.fire("convertDateByTimezoneBack", targetStartDate, startDateTimeZone);
        exceptionStartDate.setHours(appointmentStartDate.getHours(), appointmentStartDate.getMinutes(), appointmentStartDate.getSeconds(), appointmentStartDate.getMilliseconds());
        var timezoneDiff = targetStartDate.getTimezoneOffset() - exceptionStartDate.getTimezoneOffset();
        exceptionStartDate = new Date(exceptionStartDate.getTime() - timezoneDiff * toMs("minute"));
        return _date_serialization2.default.serializeDate(exceptionStartDate, UTC_FULL_DATE_FORMAT)
    },
    _showRecurrenceChangeConfirm: function(isDeleted) {
        var message = _message2.default.format(isDeleted ? "dxScheduler-confirmRecurrenceDeleteMessage" : "dxScheduler-confirmRecurrenceEditMessage");
        var seriesText = _message2.default.format(isDeleted ? "dxScheduler-confirmRecurrenceDeleteSeries" : "dxScheduler-confirmRecurrenceEditSeries");
        var occurrenceText = _message2.default.format(isDeleted ? "dxScheduler-confirmRecurrenceDeleteOccurrence" : "dxScheduler-confirmRecurrenceEditOccurrence");
        return _dialog2.default.custom({
            messageHtml: message,
            showCloseButton: true,
            showTitle: true,
            buttons: [{
                text: seriesText,
                onClick: function() {
                    return true
                }
            }, {
                text: occurrenceText,
                onClick: function() {
                    return false
                }
            }]
        }).show()
    },
    _getUpdatedData: function(options) {
        var target = options.data || options;
        var cellData = this.getTargetCellData();
        var targetAllDay = this.fire("getField", "allDay", target);
        var targetStartDate = new Date(this.fire("getField", "startDate", target));
        var targetEndDate = new Date(this.fire("getField", "endDate", target));
        var date = cellData.date || targetStartDate;
        var duration = targetEndDate.getTime() - targetStartDate.getTime();
        if (this._workSpace.keepOriginalHours() && !isNaN(targetStartDate.getTime())) {
            var diff = targetStartDate.getTime() - _date2.default.trimTime(targetStartDate).getTime();
            date = new Date(_date2.default.trimTime(date).getTime() + diff)
        }
        var updatedData = {};
        var allDay = cellData.allDay;
        this.fire("setField", "allDay", updatedData, allDay);
        this.fire("setField", "startDate", updatedData, date);
        var endDate = new Date(date.getTime() + duration);
        if (this.appointmentTakesAllDay(target) && !updatedData.allDay && this._workSpace.supportAllDayRow()) {
            endDate = this._workSpace.calculateEndDate(date)
        }
        if (targetAllDay && !this._workSpace.supportAllDayRow() && !this._workSpace.keepOriginalHours()) {
            var dateCopy = new Date(date);
            dateCopy.setHours(0);
            endDate = new Date(dateCopy.getTime() + duration);
            if (0 !== endDate.getHours()) {
                endDate.setHours(this._getCurrentViewOption("endDayHour"))
            }
        }
        endDate = new Date(endDate.getTime() - _utils4.default.getTimezoneOffsetChangeInMs(targetStartDate, targetEndDate, date, endDate));
        this.fire("setField", "endDate", updatedData, endDate);
        this._resourcesManager.setResourcesToItem(updatedData, cellData.groups);
        return updatedData
    },
    _getCoordinates: function(initialDates, dates, appointmentResources, allDay) {
        var result = [];
        for (var i = 0; i < dates.length; i++) {
            var currentCoords = this._workSpace.getCoordinatesByDateInGroup(dates[i], appointmentResources, allDay);
            for (var j = 0; j < currentCoords.length; j++) {
                (0, _extend.extend)(currentCoords[j], {
                    startDate: dates[i],
                    initialStartDate: initialDates[i]
                })
            }
            result = result.concat(currentCoords)
        }
        return result
    },
    _isAppointmentRecurrence: function(appointmentData) {
        var recurrenceRule = this.fire("getField", "recurrenceRule", appointmentData);
        return recurrenceRule && _utils2.default.getRecurrenceRule(recurrenceRule).isValid
    },
    resizePopup: function() {
        this._appointmentPopup.triggerResize()
    },
    _getAppointmentData: function(appointmentData, options) {
        options = options || {};
        var $appointment = options.$appointment;
        var updatedData = options.skipDateCalculation ? {} : this._getUpdatedData(options);
        var resultAppointmentData = (0, _extend.extend)({}, appointmentData, updatedData);
        var allDay = this.fire("getField", "allDay", appointmentData);
        var isAllDay = this._workSpace.supportAllDayRow() && allDay;
        var startDate = new Date(this.fire("getField", "startDate", resultAppointmentData));
        var endDate = new Date(this.fire("getField", "endDate", resultAppointmentData));
        var appointmentDuration = endDate.getTime() - startDate.getTime();
        var updatedStartDate = startDate;
        var appointmentStartDate;
        var appointmentEndDate;
        if (_type2.default.isDefined($appointment)) {
            var apptDataCalculator = this.getRenderingStrategyInstance().getAppointmentDataCalculator();
            if (_type2.default.isFunction(apptDataCalculator) && this._isAppointmentRecurrence(appointmentData)) {
                updatedStartDate = apptDataCalculator($appointment, startDate).startDate
            } else {
                if (options.isAppointmentResized) {
                    var coordinates = _translator2.default.locate($appointment);
                    updatedStartDate = new Date(this._workSpace.getCellDataByCoordinates(coordinates, isAllDay).startDate)
                } else {
                    var settings = $appointment.data("dxAppointmentSettings");
                    appointmentStartDate = settings && settings.originalAppointmentStartDate;
                    appointmentEndDate = settings && settings.originalAppointmentEndDate;
                    if (this._isAppointmentRecurrence(appointmentData)) {
                        appointmentStartDate = settings && settings.startDate;
                        appointmentEndDate = settings && settings.endDate
                    }
                    if (appointmentStartDate) {
                        updatedStartDate = appointmentStartDate
                    }
                }
            }
        }
        this.fire("setField", "startDate", resultAppointmentData, updatedStartDate);
        this.fire("setField", "endDate", resultAppointmentData, appointmentEndDate || new Date(updatedStartDate.getTime() + appointmentDuration));
        if (!options.skipHoursProcessing && !options.isAppointmentResized) {
            this._convertDatesByTimezoneBack(false, resultAppointmentData)
        }
        return resultAppointmentData
    },
    subscribe: function(subject, action) {
        this._subscribes[subject] = _uiScheduler2.default[subject] = action
    },
    fire: function(subject) {
        var callback = this._subscribes[subject];
        var args = Array.prototype.slice.call(arguments);
        if (!_type2.default.isFunction(callback)) {
            throw _ui2.default.Error("E1031", subject)
        }
        return callback.apply(this, args.slice(1))
    },
    getTargetCellData: function() {
        return this._workSpace.getDataByDroppableCell()
    },
    _updateAppointment: function(target, appointment, onUpdatePrevented, dragEvent) {
        var updatingOptions = {
            newData: appointment,
            oldData: (0, _extend.extend)({}, target),
            cancel: false
        };
        var performFailAction = function(err) {
            if (_type2.default.isFunction(onUpdatePrevented)) {
                onUpdatePrevented.call(this)
            }
            if (err && "Error" === err.name) {
                throw err
            }
        }.bind(this);
        this._actions.onAppointmentUpdating(updatingOptions);
        if (dragEvent && !_type2.default.isDeferred(dragEvent.cancel)) {
            dragEvent.cancel = new Deferred
        }
        this._processActionResult(updatingOptions, function(canceled) {
            if (!canceled) {
                this._expandAllDayPanel(appointment);
                try {
                    this._appointmentModel.update(target, appointment).done(function() {
                        dragEvent && dragEvent.cancel.resolve(false)
                    }).always(function(e) {
                        this._executeActionWhenOperationIsCompleted(this._actions.onAppointmentUpdated, appointment, e)
                    }.bind(this)).fail(function() {
                        performFailAction()
                    })
                } catch (err) {
                    performFailAction(err)
                }
            } else {
                performFailAction()
            }
        })
    },
    _processActionResult: function(actionOptions, callback) {
        var _this10 = this;
        if (_type2.default.isPromise(actionOptions.cancel)) {
            when(_deferred2.default.fromPromise(actionOptions.cancel)).always(function(cancel) {
                if (!_type2.default.isDefined(cancel)) {
                    cancel = "rejected" === actionOptions.cancel.state()
                }
                callback.call(_this10, cancel)
            })
        } else {
            callback.call(this, actionOptions.cancel)
        }
    },
    _expandAllDayPanel: function(appointment) {
        if (!this._isAllDayExpanded(this.getFilteredItems()) && this.appointmentTakesAllDay(appointment)) {
            this._workSpace.option("allDayExpanded", true)
        }
    },
    _executeActionWhenOperationIsCompleted: function(action, appointment, e) {
        var options = {
            appointmentData: appointment
        };
        var isError = e && "Error" === e.name;
        if (isError) {
            options.error = e
        } else {
            this._appointmentPopup.isVisible() && this._appointmentPopup.hide()
        }
        action(options);
        this._fireContentReadyAction()
    },
    _showAppointmentPopup: function(data, visibleButtons, isProcessTimeZone) {
        this._appointmentPopup.show(data, visibleButtons, isProcessTimeZone)
    },
    getAppointmentPopup: function() {
        return this._appointmentPopup.getPopup()
    },
    getAppointmentDetailsForm: function() {
        return this._appointmentPopup._appointmentForm
    },
    getUpdatedAppointment: function() {
        return this._appointmentModel.getUpdatedAppointment()
    },
    getUpdatedAppointmentKeys: function() {
        return this._appointmentModel.getUpdatedAppointmentKeys()
    },
    getAppointmentsInstance: function() {
        return this._appointments
    },
    getResourceManager: function() {
        return this._resourcesManager
    },
    getLayoutManager: function() {
        return this._layoutManager
    },
    getRenderingStrategyInstance: function() {
        return this._layoutManager.getRenderingStrategyInstance()
    },
    getFilteredItems: function() {
        return this._filteredItems
    },
    getActions: function() {
        return this._actions
    },
    appointmentTakesAllDay: function(appointment) {
        return this._appointmentModel.appointmentTakesAllDay(appointment, this._getCurrentViewOption("startDayHour"), this._getCurrentViewOption("endDayHour"))
    },
    _getStartDate: function(appointment, skipNormalize) {
        var startDate = this.fire("getField", "startDate", appointment);
        var startDateTimeZone = this.fire("getField", "startDateTimeZone", appointment);
        startDate = this.fire("convertDateByTimezone", _date2.default.makeDate(startDate), startDateTimeZone);
        return !skipNormalize ? this.fire("updateAppointmentStartDate", {
            startDate: startDate,
            appointment: appointment
        }) : startDate
    },
    _getEndDate: function(appointment, skipNormalize) {
        var endDate = new Date(this.fire("getField", "endDate", appointment));
        var startDate = new Date(this.fire("getField", "startDate", appointment));
        var isSameDate = _date2.default.sameDate(startDate, endDate);
        if (endDate) {
            var endDateTimeZone = this.fire("getField", "endDateTimeZone", appointment);
            endDate = this.fire("convertDateByTimezone", _date2.default.makeDate(endDate), endDateTimeZone);
            return !skipNormalize ? this.fire("updateAppointmentEndDate", {
                endDate: endDate,
                isSameDate: isSameDate
            }) : endDate
        }
        return endDate
    },
    _getRecurrenceException: function(appointmentData) {
        var recurrenceException = this.fire("getField", "recurrenceException", appointmentData);
        if (recurrenceException) {
            var startDate = this.fire("getField", "startDate", appointmentData);
            var exceptions = recurrenceException.split(",");
            var startDateTimeZone = this.fire("getField", "startDateTimeZone", appointmentData);
            var exceptionByStartDate = this.fire("convertDateByTimezone", startDate, startDateTimeZone);
            for (var i = 0; i < exceptions.length; i++) {
                exceptions[i] = this._convertRecurrenceException(exceptions[i], exceptionByStartDate, startDateTimeZone)
            }
            recurrenceException = exceptions.join()
        }
        return recurrenceException
    },
    _convertRecurrenceException: function(exception, exceptionByStartDate, startDateTimeZone) {
        exception = exception.replace(/\s/g, "");
        exception = _date_serialization2.default.deserializeDate(exception);
        exception = this.fire("convertDateByTimezone", exception, startDateTimeZone);
        exception.setHours(exceptionByStartDate.getHours());
        exception = _date_serialization2.default.serializeDate(exception, FULL_DATE_FORMAT);
        return exception
    },
    recurrenceEditorVisibilityChanged: function(visible) {
        if (this._appointmentPopup._appointmentForm) {
            this._appointmentPopup._appointmentForm.$element().find("." + RECURRENCE_EDITOR_ITEM_CLASS).toggleClass(RECURRENCE_EDITOR_OPENED_ITEM_CLASS, visible)
        }
    },
    dayHasAppointment: function(day, appointment, trimTime) {
        var startDate = new Date(this.fire("getField", "startDate", appointment));
        var endDate = new Date(this.fire("getField", "endDate", appointment));
        var startDateTimeZone = this.fire("getField", "startDateTimeZone", appointment);
        var endDateTimeZone = this.fire("getField", "endDateTimeZone", appointment);
        startDate = this.fire("convertDateByTimezone", startDate, startDateTimeZone);
        endDate = this.fire("convertDateByTimezone", endDate, endDateTimeZone);
        if (day.getTime() === endDate.getTime()) {
            return startDate.getTime() === endDate.getTime()
        }
        if (trimTime) {
            day = _date2.default.trimTime(day);
            startDate = _date2.default.trimTime(startDate);
            endDate = _date2.default.trimTime(endDate)
        }
        var dayTimeStamp = day.getTime();
        var startDateTimeStamp = startDate.getTime();
        var endDateTimeStamp = endDate.getTime();
        return (0, _array.inArray)(dayTimeStamp, [startDateTimeStamp, endDateTimeStamp]) > -1 || startDateTimeStamp < dayTimeStamp && endDateTimeStamp > dayTimeStamp
    },
    setTargetedAppointmentResources: function(targetedAppointment, appointmentElement, appointmentIndex) {
        var groups = this._getCurrentViewOption("groups");
        if (groups && groups.length) {
            var resourcesSetter = this._resourcesManager._dataAccessors.setter;
            var workSpace = this._workSpace;
            var getGroups;
            var setResourceCallback;
            if (this._isAgenda()) {
                getGroups = function() {
                    var apptSettings = this.getLayoutManager()._positionMap[appointmentIndex];
                    return workSpace._getCellGroups(apptSettings[0].groupIndex)
                };
                setResourceCallback = function(_, group) {
                    resourcesSetter[group.name](targetedAppointment, group.id)
                }
            } else {
                getGroups = function() {
                    var setting = (0, _renderer2.default)(appointmentElement).data("dxAppointmentSettings") || {};
                    return workSpace.getCellDataByCoordinates({
                        left: setting.left,
                        top: setting.top
                    }).groups
                };
                setResourceCallback = function(field, value) {
                    resourcesSetter[field](targetedAppointment, value)
                }
            }(0, _iterator.each)(getGroups.call(this), setResourceCallback)
        }
    },
    getStartViewDate: function() {
        return this._workSpace.getStartViewDate()
    },
    getEndViewDate: function() {
        return this._workSpace.getEndViewDate()
    },
    showAppointmentPopup: function(appointmentData, createNewAppointment, currentAppointmentData) {
        var singleAppointment = currentAppointmentData || this._getAppointmentData(appointmentData, {
            skipDateCalculation: true
        });
        var startDate = this.fire("getField", "startDate", currentAppointmentData || appointmentData);
        this._checkRecurringAppointment(appointmentData, singleAppointment, startDate, function() {
            if (createNewAppointment || _type2.default.isEmptyObject(appointmentData)) {
                delete this._editAppointmentData;
                this._editing.allowAdding && this._showAppointmentPopup(appointmentData, true, true)
            } else {
                this._editAppointmentData = appointmentData;
                this._showAppointmentPopup(appointmentData, this._editing.allowUpdating, true)
            }
        }.bind(this), false, true)
    },
    hideAppointmentPopup: function(saveChanges) {
        if (this._appointmentPopup.isVisible()) {
            saveChanges && this._appointmentPopup.saveChanges();
            this._appointmentPopup.hide()
        }
    },
    showAppointmentTooltip: function(appointmentData, target, currentAppointmentData) {
        if (appointmentData) {
            this.showAppointmentTooltipCore(target, [{
                color: this._appointments._tryGetAppointmentColor(target),
                data: appointmentData,
                currentData: currentAppointmentData
            }])
        }
    },
    showAppointmentTooltipCore: function(target, data, options) {
        if (this._appointmentTooltip.isAlreadyShown(target)) {
            this.hideAppointmentTooltip()
        } else {
            this._appointmentTooltip.show(target, data, (0, _extend.extend)(this._getExtraAppointmentTooltipOptions(), options))
        }
    },
    hideAppointmentTooltip: function() {
        this._appointmentTooltip.hide()
    },
    scrollToTime: function(hours, minutes, date) {
        this._workSpace.scrollToTime(hours, minutes, date)
    },
    addAppointment: function(appointment) {
        var text = this.fire("getField", "text", appointment);
        if (!text) {
            this.fire("setField", "text", appointment, "")
        }
        this._convertDatesByTimezoneBack(true, appointment);
        var addingOptions = {
            appointmentData: appointment,
            cancel: false
        };
        this._actions.onAppointmentAdding(addingOptions);
        this._processActionResult(addingOptions, function(canceled) {
            if (!canceled) {
                this._expandAllDayPanel(appointment);
                this._appointmentModel.add(appointment, {
                    value: this._getTimezoneOffsetByOption(),
                    clientOffset: this.fire("getClientTimezoneOffset")
                }).always(function(e) {
                    this._executeActionWhenOperationIsCompleted(this._actions.onAppointmentAdded, appointment, e)
                }.bind(this))
            }
        })
    },
    updateAppointment: function(target, appointment) {
        this._updateAppointment(target, appointment)
    },
    deleteAppointment: function(appointment) {
        var deletingOptions = {
            appointmentData: appointment,
            cancel: false
        };
        this._actions.onAppointmentDeleting(deletingOptions);
        this._processActionResult(deletingOptions, function(canceled) {
            if (!canceled) {
                this._appointmentModel.remove(appointment).always(function(e) {
                    this._executeActionWhenOperationIsCompleted(this._actions.onAppointmentDeleted, appointment, e)
                }.bind(this))
            }
        })
    },
    focus: function() {
        if (this._editAppointmentData) {
            this._appointments.focus()
        } else {
            this._workSpace.focus()
        }
    },
    getFirstDayOfWeek: function() {
        return _type2.default.isDefined(this.option("firstDayOfWeek")) ? this.option("firstDayOfWeek") : _date4.default.firstDayOfWeekIndex()
    }
}).include(_async_template_mixin2.default, _data_helper2.default);
(0, _component_registrator2.default)("dxScheduler", Scheduler);
module.exports = Scheduler;
