/**
 * DevExtreme (ui/scheduler/ui.scheduler.appointment_form.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var _renderer = require("../../core/renderer");
var _renderer2 = _interopRequireDefault(_renderer);
var _form = require("../form");
var _form2 = _interopRequireDefault(_form);
var _date_serialization = require("../../core/utils/date_serialization");
var _date_serialization2 = _interopRequireDefault(_date_serialization);
var _message = require("../../localization/message");
var _message2 = _interopRequireDefault(_message);
var _click = require("../../events/click");
var _click2 = _interopRequireDefault(_click);
var _type = require("../../core/utils/type");
var _type2 = _interopRequireDefault(_type);
var _events_engine = require("../../events/core/events_engine");
var _events_engine2 = _interopRequireDefault(_events_engine);
require("./ui.scheduler.recurrence_editor");
require("./timezones/ui.scheduler.timezone_editor");
require("../text_area");
require("../tag_box");
require("../switch");

function _interopRequireDefault(obj) {
    return obj && obj.__esModule ? obj : {
        "default": obj
    }
}
var RECURRENCE_EDITOR_ITEM_CLASS = "dx-scheduler-recurrence-rule-item";
var SCREEN_SIZE_OF_TOP_LABEL_LOCATION = 608;
var SCREEN_SIZE_OF_SINGLE_COLUMN = 460;
var SchedulerAppointmentForm = {
    _appointmentForm: {},
    _lockDateShiftFlag: false,
    _validateAppointmentFormDate: function(editor, value, previousValue) {
        var isCurrentDateCorrect = null === value || !!value;
        var isPreviousDateCorrect = null === previousValue || !!previousValue;
        if (!isCurrentDateCorrect && isPreviousDateCorrect) {
            editor.option("value", previousValue)
        }
    },
    _getAllDayStartDate: function(startDate) {
        return new Date(new Date(startDate).setHours(0, 0, 0, 0))
    },
    _getAllDayEndDate: function(startDate) {
        return new Date(new Date(startDate).setDate(startDate.getDate() + 1))
    },
    _getStartDateWithStartHour: function(startDate, startDayHour) {
        return new Date(new Date(startDate).setHours(startDayHour))
    },
    _updateLabelLocation: function(formWidth) {
        if (formWidth > 0 && this._appointmentForm._rootLayoutManager._contentReadyAction) {
            this._appointmentForm.option("labelLocation", formWidth < SCREEN_SIZE_OF_TOP_LABEL_LOCATION ? "top" : "left")
        }
    },
    create: function(componentCreator, $container, isReadOnly, formData) {
        var _this = this;
        this._appointmentForm = componentCreator($container, _form2.default, {
            items: this._editors,
            readOnly: isReadOnly,
            showValidationSummary: true,
            scrollingEnabled: true,
            colCount: 2,
            formData: formData,
            showColonAfterLabel: false,
            screenByWidth: function() {
                var formWidth = $container.parent().outerWidth();
                _this._updateLabelLocation(formWidth);
                return formWidth < SCREEN_SIZE_OF_SINGLE_COLUMN ? "xs" : "lg"
            }
        });
        return this._appointmentForm
    },
    _dateBoxValueChanged: function(args, dateExpr, isNeedCorrect) {
        this._validateAppointmentFormDate(args.component, args.value, args.previousValue);
        var value = _date_serialization2.default.deserializeDate(args.value);
        var previousValue = _date_serialization2.default.deserializeDate(args.previousValue);
        var dateEditor = this._appointmentForm.getEditor(dateExpr);
        var dateValue = _date_serialization2.default.deserializeDate(dateEditor.option("value"));
        if (!this._appointmentForm._lockDateShiftFlag && dateValue && value && isNeedCorrect(dateValue, value)) {
            var duration = previousValue ? dateValue.getTime() - previousValue.getTime() : 0;
            dateEditor.option("value", new Date(value.getTime() + duration))
        }
    },
    prepareAppointmentFormEditors: function(dataExprs, schedulerInst) {
        var that = this;
        this._editors = [{
            dataField: dataExprs.textExpr,
            editorType: "dxTextBox",
            colSpan: 2,
            label: {
                text: _message2.default.format("dxScheduler-editorLabelTitle")
            }
        }, {
            dataField: dataExprs.startDateExpr,
            editorType: "dxDateBox",
            label: {
                text: _message2.default.format("dxScheduler-editorLabelStartDate")
            },
            validationRules: [{
                type: "required"
            }],
            editorOptions: {
                width: "100%",
                calendarOptions: {
                    firstDayOfWeek: schedulerInst.option("firstDayOfWeek")
                },
                onValueChanged: function(args) {
                    that._dateBoxValueChanged(args, dataExprs.endDateExpr, function(endValue, startValue) {
                        return endValue < startValue
                    })
                }
            }
        }, {
            dataField: dataExprs.startDateTimeZoneExpr,
            editorType: "dxSchedulerTimezoneEditor",
            colSpan: 2,
            label: {
                text: " ",
                showColon: false
            },
            editorOptions: {
                observer: schedulerInst
            },
            visible: false
        }, {
            dataField: dataExprs.endDateExpr,
            editorType: "dxDateBox",
            label: {
                text: _message2.default.format("dxScheduler-editorLabelEndDate")
            },
            validationRules: [{
                type: "required"
            }],
            editorOptions: {
                width: "100%",
                calendarOptions: {
                    firstDayOfWeek: schedulerInst.option("firstDayOfWeek")
                },
                onValueChanged: function(args) {
                    that._dateBoxValueChanged(args, dataExprs.startDateExpr, function(startValue, endValue) {
                        return endValue < startValue
                    })
                }
            }
        }, {
            dataField: dataExprs.endDateTimeZoneExpr,
            editorType: "dxSchedulerTimezoneEditor",
            colSpan: 2,
            label: {
                text: " ",
                showColon: false
            },
            editorOptions: {
                observer: schedulerInst
            },
            visible: false
        }, {
            dataField: dataExprs.allDayExpr,
            editorType: "dxSwitch",
            colSpan: 2,
            label: {
                text: _message2.default.format("dxScheduler-allDay")
            },
            editorOptions: {
                onValueChanged: function(args) {
                    var value = args.value;
                    var startDateEditor = that._appointmentForm.getEditor(dataExprs.startDateExpr);
                    var endDateEditor = that._appointmentForm.getEditor(dataExprs.endDateExpr);
                    var startDate = _date_serialization2.default.deserializeDate(startDateEditor.option("value"));
                    if (!that._appointmentForm._lockDateShiftFlag && startDate) {
                        if (value) {
                            var allDayStartDate = that._getAllDayStartDate(startDate);
                            startDateEditor.option("value", allDayStartDate);
                            endDateEditor.option("value", that._getAllDayEndDate(allDayStartDate))
                        } else {
                            var startDateWithStartHour = that._getStartDateWithStartHour(startDate, schedulerInst.option("startDayHour"));
                            var endDate = schedulerInst._workSpace.calculateEndDate(startDateWithStartHour);
                            startDateEditor.option("value", startDateWithStartHour);
                            endDateEditor.option("value", endDate)
                        }
                    }
                    startDateEditor.option("type", value ? "date" : "datetime");
                    endDateEditor.option("type", value ? "date" : "datetime")
                }
            }
        }, {
            itemType: "empty",
            colSpan: 2
        }, {
            dataField: dataExprs.descriptionExpr,
            editorType: "dxTextArea",
            colSpan: 2,
            label: {
                text: _message2.default.format("dxScheduler-editorLabelDescription")
            }
        }, {
            itemType: "empty",
            colSpan: 2
        }, {
            dataField: dataExprs.recurrenceRuleExpr,
            editorType: "dxRecurrenceEditor",
            colSpan: 2,
            editorOptions: {
                observer: schedulerInst,
                firstDayOfWeek: schedulerInst.option("firstDayOfWeek"),
                onValueChanged: function(args) {
                    var value = that._getRecurrenceRule(schedulerInst, that._appointmentForm);
                    schedulerInst.fire("recurrenceEditorVisibilityChanged", value)
                },
                onContentReady: function(args) {
                    var $editorField = (0, _renderer2.default)(args.element).closest(".dx-field-item");
                    var $editorLabel = $editorField.find(".dx-field-item-label");
                    _events_engine2.default.off($editorLabel, _click2.default.name);
                    _events_engine2.default.on($editorLabel, _click2.default.name, function() {
                        args.component.toggle()
                    })
                }
            },
            cssClass: RECURRENCE_EDITOR_ITEM_CLASS,
            label: {
                text: _message2.default.format("dxScheduler-editorLabelRecurrence")
            }
        }];
        if (!dataExprs.recurrenceRuleExpr) {
            this._editors.splice(9, 2)
        }
        return this._editors
    },
    _getRecurrenceRule: function(schedulerInstance, appointmentForm) {
        return !_type2.default.isEmptyObject(appointmentForm) ? !!schedulerInstance.fire("getField", "recurrenceRule", appointmentForm.option("formData")) : false
    },
    concatResources: function(resources) {
        this._editors = this._editors.concat(resources)
    },
    checkEditorsType: function(form, startDateExpr, endDateExpr, allDay) {
        var startDateFormItem = form.itemOption(startDateExpr);
        var endDateFormItem = form.itemOption(endDateExpr);
        if (startDateFormItem && endDateFormItem) {
            var startDateEditorOptions = startDateFormItem.editorOptions;
            var endDateEditorOptions = endDateFormItem.editorOptions;
            if (allDay) {
                startDateEditorOptions.type = endDateEditorOptions.type = "date"
            } else {
                startDateEditorOptions.type = endDateEditorOptions.type = "datetime"
            }
            form.itemOption(startDateExpr, "editorOptions", startDateEditorOptions);
            form.itemOption(endDateExpr, "editorOptions", endDateEditorOptions)
        }
    },
    updateFormData: function(appointmentForm, formData) {
        appointmentForm._lockDateShiftFlag = true;
        appointmentForm.option("formData", formData);
        appointmentForm._lockDateShiftFlag = false
    }
};
module.exports = SchedulerAppointmentForm;
