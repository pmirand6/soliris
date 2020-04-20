/**
 * DevExtreme (ui/gantt/ui.gantt.dialogs.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
Object.defineProperty(exports, "__esModule", {
    value: true
});
exports.GanttDialog = void 0;
var _popup = require("../popup");
var _popup2 = _interopRequireDefault(_popup);
var _form = require("../form");
var _form2 = _interopRequireDefault(_form);
require("../tag_box");

function _interopRequireDefault(obj) {
    return obj && obj.__esModule ? obj : {
        "default": obj
    }
}

function _typeof(obj) {
    "@babel/helpers - typeof";
    if ("function" === typeof Symbol && "symbol" === typeof Symbol.iterator) {
        _typeof = function(obj) {
            return typeof obj
        }
    } else {
        _typeof = function(obj) {
            return obj && "function" === typeof Symbol && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj
        }
    }
    return _typeof(obj)
}

function _createSuper(Derived) {
    return function() {
        var result, Super = _getPrototypeOf(Derived);
        if (_isNativeReflectConstruct()) {
            var NewTarget = _getPrototypeOf(this).constructor;
            result = Reflect.construct(Super, arguments, NewTarget)
        } else {
            result = Super.apply(this, arguments)
        }
        return _possibleConstructorReturn(this, result)
    }
}

function _possibleConstructorReturn(self, call) {
    if (call && ("object" === _typeof(call) || "function" === typeof call)) {
        return call
    }
    return _assertThisInitialized(self)
}

function _assertThisInitialized(self) {
    if (void 0 === self) {
        throw new ReferenceError("this hasn't been initialised - super() hasn't been called")
    }
    return self
}

function _isNativeReflectConstruct() {
    if ("undefined" === typeof Reflect || !Reflect.construct) {
        return false
    }
    if (Reflect.construct.sham) {
        return false
    }
    if ("function" === typeof Proxy) {
        return true
    }
    try {
        Date.prototype.toString.call(Reflect.construct(Date, [], function() {}));
        return true
    } catch (e) {
        return false
    }
}

function _getPrototypeOf(o) {
    _getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf : function(o) {
        return o.__proto__ || Object.getPrototypeOf(o)
    };
    return _getPrototypeOf(o)
}

function _inherits(subClass, superClass) {
    if ("function" !== typeof superClass && null !== superClass) {
        throw new TypeError("Super expression must either be null or a function")
    }
    subClass.prototype = Object.create(superClass && superClass.prototype, {
        constructor: {
            value: subClass,
            writable: true,
            configurable: true
        }
    });
    if (superClass) {
        _setPrototypeOf(subClass, superClass)
    }
}

function _setPrototypeOf(o, p) {
    _setPrototypeOf = Object.setPrototypeOf || function(o, p) {
        o.__proto__ = p;
        return o
    };
    return _setPrototypeOf(o, p)
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
var GanttDialog = exports.GanttDialog = function() {
    function GanttDialog(owner, $element) {
        _classCallCheck(this, GanttDialog);
        this._popupInstance = owner._createComponent($element, _popup2.default);
        this.infoMap = {
            TaskEdit: TaskEditDialogInfo,
            Resources: ResourcesEditDialogInfo
        }
    }
    _createClass(GanttDialog, [{
        key: "_apply",
        value: function() {
            var result = this._dialogInfo.getResult();
            this._callback(result);
            this.hide()
        }
    }, {
        key: "show",
        value: function(name, parameters, callback, editingOptions) {
            this._callback = callback;
            if (!this.infoMap[name]) {
                return
            }
            this._dialogInfo = new this.infoMap[name](parameters, this._apply.bind(this), this.hide.bind(this), editingOptions);
            this._popupInstance.option({
                title: this._dialogInfo.getTitle(),
                toolbarItems: this._dialogInfo.getToolbarItems(),
                maxWidth: this._dialogInfo.getMaxWidth(),
                height: this._dialogInfo.getHeight(),
                contentTemplate: this._dialogInfo.getContentTemplate()
            });
            this._popupInstance.show()
        }
    }, {
        key: "hide",
        value: function() {
            this._popupInstance.hide();
            delete this._dialogInfo
        }
    }]);
    return GanttDialog
}();
var DialogInfoBase = function() {
    function DialogInfoBase(parameters, applyAction, hideAction, editingOptions) {
        _classCallCheck(this, DialogInfoBase);
        this._parameters = parameters;
        this._applyAction = applyAction;
        this._hideAction = hideAction;
        this._editingOptions = editingOptions
    }
    _createClass(DialogInfoBase, [{
        key: "_getFormItems",
        value: function() {
            return {}
        }
    }, {
        key: "_updateParameters",
        value: function() {}
    }, {
        key: "_getOkToolbarItem",
        value: function() {
            return {
                widget: "dxButton",
                location: "after",
                toolbar: "bottom",
                options: {
                    text: "Ok",
                    onClick: this._applyAction
                }
            }
        }
    }, {
        key: "_getCancelToolbarItem",
        value: function() {
            return {
                widget: "dxButton",
                location: "after",
                toolbar: "bottom",
                options: {
                    text: "Cancel",
                    onClick: this._hideAction
                }
            }
        }
    }, {
        key: "getTitle",
        value: function() {
            return ""
        }
    }, {
        key: "getToolbarItems",
        value: function() {
            return this._editingOptions.enabled ? [this._getOkToolbarItem(), this._getCancelToolbarItem()] : [this._getCancelToolbarItem()]
        }
    }, {
        key: "getMaxWidth",
        value: function() {
            return 400
        }
    }, {
        key: "getHeight",
        value: function() {
            return "auto"
        }
    }, {
        key: "getContentTemplate",
        value: function() {
            var _this = this;
            return function(content) {
                _this._form = new _form2.default(content, {
                    formData: _this._parameters,
                    items: _this._getFormItems()
                });
                return content
            }
        }
    }, {
        key: "getResult",
        value: function() {
            var formData = this._form.option("formData");
            this._updateParameters(formData);
            return this._parameters
        }
    }]);
    return DialogInfoBase
}();
var TaskEditDialogInfo = function(_DialogInfoBase) {
    _inherits(TaskEditDialogInfo, _DialogInfoBase);
    var _super = _createSuper(TaskEditDialogInfo);

    function TaskEditDialogInfo() {
        _classCallCheck(this, TaskEditDialogInfo);
        return _super.apply(this, arguments)
    }
    _createClass(TaskEditDialogInfo, [{
        key: "getTitle",
        value: function() {
            return "Task Details"
        }
    }, {
        key: "_getFormItems",
        value: function() {
            var _this2 = this;
            var readOnly = !this._editingOptions.enabled || !this._editingOptions.allowTaskUpdating;
            return [{
                dataField: "title",
                editorType: "dxTextBox",
                label: {
                    text: "Title"
                },
                editorOptions: {
                    readOnly: readOnly
                }
            }, {
                dataField: "start",
                editorType: "dxDateBox",
                label: {
                    text: "Start"
                },
                editorOptions: {
                    type: "datetime",
                    width: "100%",
                    readOnly: readOnly
                }
            }, {
                dataField: "end",
                editorType: "dxDateBox",
                label: {
                    text: "End"
                },
                editorOptions: {
                    type: "datetime",
                    width: "100%",
                    readOnly: readOnly
                }
            }, {
                dataField: "progress",
                editorType: "dxNumberBox",
                label: {
                    text: "Progress"
                },
                editorOptions: {
                    value: this._parameters.progress / 100,
                    showSpinButtons: true,
                    min: 0,
                    max: 1,
                    format: "#0%",
                    step: .01,
                    readOnly: readOnly
                }
            }, {
                dataField: "assigned.items",
                editorType: "dxTagBox",
                label: {
                    text: "Resources"
                },
                editorOptions: {
                    readOnly: readOnly,
                    dataSource: this._parameters.resources.items,
                    displayExpr: "text",
                    buttons: [{
                        name: "editResources",
                        location: "after",
                        options: {
                            text: "...",
                            hint: "Edit Resource List",
                            onClick: function() {
                                _this2._parameters.showResourcesDialogCommand.execute()
                            }
                        }
                    }]
                }
            }]
        }
    }, {
        key: "_updateParameters",
        value: function(formData) {
            this._parameters.title = formData.title;
            this._parameters.start = formData.start;
            this._parameters.end = formData.end;
            this._parameters.progress = 100 * formData.progress;
            this._parameters.assigned = formData.assigned
        }
    }]);
    return TaskEditDialogInfo
}(DialogInfoBase);
var ResourcesEditDialogInfo = function(_DialogInfoBase2) {
    _inherits(ResourcesEditDialogInfo, _DialogInfoBase2);
    var _super2 = _createSuper(ResourcesEditDialogInfo);

    function ResourcesEditDialogInfo() {
        _classCallCheck(this, ResourcesEditDialogInfo);
        return _super2.apply(this, arguments)
    }
    _createClass(ResourcesEditDialogInfo, [{
        key: "getTitle",
        value: function() {
            return "Resources"
        }
    }, {
        key: "_getFormItems",
        value: function() {
            var _this3 = this;
            return [{
                label: {
                    visible: false
                },
                dataField: "resources.items",
                editorType: "dxList",
                editorOptions: {
                    allowItemDeleting: this._editingOptions.enabled && this._editingOptions.allowResourceDeleting,
                    itemDeleteMode: "static",
                    selectionMode: "none",
                    items: this._parameters.resources.items,
                    height: 250,
                    noDataText: "No resources",
                    onInitialized: function(e) {
                        _this3.list = e.component
                    },
                    onItemDeleted: function(e) {
                        _this3._parameters.resources.remove(e.itemData)
                    }
                }
            }, {
                label: {
                    visible: false
                },
                editorType: "dxTextBox",
                editorOptions: {
                    readOnly: !this._editingOptions.enabled || !this._editingOptions.allowResourceAdding,
                    onInitialized: function(e) {
                        _this3.textBox = e.component
                    },
                    onInput: function(e) {
                        var addButton = e.component.getButton("addResource");
                        var resourceName = e.component.option("text");
                        addButton.option("disabled", 0 === resourceName.length)
                    },
                    buttons: [{
                        name: "addResource",
                        location: "after",
                        options: {
                            text: "Add",
                            disabled: true,
                            onClick: function(e) {
                                var newItem = _this3._parameters.resources.createItem();
                                newItem.text = _this3.textBox.option("text");
                                _this3._parameters.resources.add(newItem);
                                _this3.list.option("items", _this3._parameters.resources.items);
                                _this3.list.scrollToItem(newItem);
                                _this3.textBox.reset();
                                e.component.option("disabled", true)
                            }
                        }
                    }]
                }
            }]
        }
    }]);
    return ResourcesEditDialogInfo
}(DialogInfoBase);
