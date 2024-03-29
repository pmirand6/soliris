/**
 * DevExtreme (ui/file_manager/ui.file_manager.notification.js)
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
exports.default = void 0;
var _renderer = require("../../core/renderer");
var _renderer2 = _interopRequireDefault(_renderer);
var _extend = require("../../core/utils/extend");
var _type = require("../../core/utils/type");
var _ui = require("../widget/ui.widget");
var _ui2 = _interopRequireDefault(_ui);
var _popup = require("../popup");
var _popup2 = _interopRequireDefault(_popup);
var _ui3 = require("../drawer/ui.drawer");
var _ui4 = _interopRequireDefault(_ui3);
var _uiFile_managerNotification = require("./ui.file_manager.notification.progress_panel");
var _uiFile_managerNotification2 = _interopRequireDefault(_uiFile_managerNotification);

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

function _get(target, property, receiver) {
    if ("undefined" !== typeof Reflect && Reflect.get) {
        _get = Reflect.get
    } else {
        _get = function(target, property, receiver) {
            var base = _superPropBase(target, property);
            if (!base) {
                return
            }
            var desc = Object.getOwnPropertyDescriptor(base, property);
            if (desc.get) {
                return desc.get.call(receiver)
            }
            return desc.value
        }
    }
    return _get(target, property, receiver || target)
}

function _superPropBase(object, property) {
    while (!Object.prototype.hasOwnProperty.call(object, property)) {
        object = _getPrototypeOf(object);
        if (null === object) {
            break
        }
    }
    return object
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
var FILE_MANAGER_NOTIFICATION_CLASS = "dx-filemanager-notification";
var FILE_MANAGER_NOTIFICATION_DRAWER_CLASS = "".concat(FILE_MANAGER_NOTIFICATION_CLASS, "-drawer");
var FILE_MANAGER_NOTIFICATION_POPUP_CLASS = "".concat(FILE_MANAGER_NOTIFICATION_CLASS, "-popup");
var FILE_MANAGER_NOTIFICATION_POPUP_ERROR_CLASS = "".concat(FILE_MANAGER_NOTIFICATION_CLASS, "-popup-error");
var FILE_MANAGER_NOTIFICATION_COMMON_CLASS = "".concat(FILE_MANAGER_NOTIFICATION_CLASS, "-common");
var FILE_MANAGER_NOTIFICATION_SEPARATOR_CLASS = "".concat(FILE_MANAGER_NOTIFICATION_CLASS, "-separator");
var FILE_MANAGER_NOTIFICATION_DETAILS_CLASS = "".concat(FILE_MANAGER_NOTIFICATION_CLASS, "-details");
var FILE_MANAGER_NOTIFICATION_COMMON_NO_ITEM_CLASS = "".concat(FILE_MANAGER_NOTIFICATION_CLASS, "-common-no-item");
var FileManagerNotificationControl = function(_Widget) {
    _inherits(FileManagerNotificationControl, _Widget);
    var _super = _createSuper(FileManagerNotificationControl);

    function FileManagerNotificationControl() {
        _classCallCheck(this, FileManagerNotificationControl);
        return _super.apply(this, arguments)
    }
    _createClass(FileManagerNotificationControl, [{
        key: "_initMarkup",
        value: function() {
            var _this = this;
            _get(_getPrototypeOf(FileManagerNotificationControl.prototype), "_initMarkup", this).call(this);
            this._initActions();
            this._actionProgressStatus = "default";
            this._operationInProgressCount = 0;
            this._failedOperationCount = 0;
            var $progressPanelContainer = this.option("progressPanelContainer");
            var $progressDrawer = (0, _renderer2.default)("<div>").addClass(FILE_MANAGER_NOTIFICATION_DRAWER_CLASS).appendTo($progressPanelContainer);
            var contentRenderer = this.option("contentTemplate");
            if ((0, _type.isFunction)(contentRenderer)) {
                contentRenderer($progressDrawer)
            }
            this._progressDrawer = this._createComponent($progressDrawer, _ui4.default, {
                opened: false,
                position: "right",
                openedStateMode: "overlap",
                closeOnOutsideClick: true,
                shading: true,
                template: function(container) {
                    return _this._progressDrawerTemplate(container)
                }
            })
        }
    }, {
        key: "tryShowProgressPanel",
        value: function() {
            var _this2 = this;
            if ("default" === this._actionProgressStatus) {
                return
            }
            setTimeout(function() {
                _this2._progressDrawer.show();
                _this2._tryHideActionProgress()
            })
        }
    }, {
        key: "addOperation",
        value: function(processingMessage, allowCancel, allowProgressAutoUpdate) {
            this._operationInProgressCount++;
            var operationInfo = this._progressPanel.addOperation(processingMessage, allowCancel, allowProgressAutoUpdate);
            this._showPopup(processingMessage);
            this._updateActionProgress(processingMessage, "progress");
            return operationInfo
        }
    }, {
        key: "addOperationDetails",
        value: function(info, details, showCloseButton) {
            this._progressPanel.addOperationDetails(info, details, showCloseButton)
        }
    }, {
        key: "updateOperationItemProgress",
        value: function(operationInfo, itemIndex, itemProgress, commonProgress) {
            this._progressPanel.updateOperationItemProgress(operationInfo, itemIndex, itemProgress, commonProgress)
        }
    }, {
        key: "completeOperationItem",
        value: function(operationInfo, itemIndex, commonProgress) {
            this._progressPanel.completeOperationItem(operationInfo, itemIndex, commonProgress)
        }
    }, {
        key: "completeOperation",
        value: function(info, commonText, isError, statusText) {
            this._operationInProgressCount--;
            if (isError) {
                this._failedOperationCount++
            } else {
                this._showPopup(commonText)
            }
            this._progressPanel.completeOperation(info, commonText, isError, statusText);
            if (!this._isProgressDrawerOpened() || !this._tryHideActionProgress()) {
                var status = 0 === this._failedOperationCount ? "success" : "error";
                this._updateActionProgress("", status)
            }
        }
    }, {
        key: "completeSingleOperationWithError",
        value: function(operationInfo, errorInfo) {
            this._progressPanel.completeSingleOperationWithError(operationInfo, errorInfo.detailErrorText);
            this._notifyError(errorInfo)
        }
    }, {
        key: "addOperationDetailsError",
        value: function(operationInfo, errorInfo) {
            this._progressPanel.addOperationDetailsError(operationInfo, errorInfo.itemIndex, errorInfo.detailErrorText);
            this._notifyError(errorInfo)
        }
    }, {
        key: "_hideProgressPanel",
        value: function() {
            var _this3 = this;
            setTimeout(function() {
                return _this3._progressDrawer.hide()
            })
        }
    }, {
        key: "_tryHideActionProgress",
        value: function() {
            if (0 === this._operationInProgressCount && 0 === this._failedOperationCount) {
                this._updateActionProgress("", "default");
                return true
            }
            return false
        }
    }, {
        key: "_updateActionProgress",
        value: function(message, status) {
            this._actionProgressStatus = status;
            this._raiseActionProgress(message, status)
        }
    }, {
        key: "_progressDrawerTemplate",
        value: function(container) {
            var _this4 = this;
            var $panel = (0, _renderer2.default)("<div>").appendTo(container);
            this._progressPanel = this._createComponent($panel, this._getProgressPanelComponent(), {
                onOperationClosed: function(_ref) {
                    var info = _ref.info;
                    return _this4._onProgressPanelOperationClosed(info)
                },
                onOperationCanceled: function(_ref2) {
                    var info = _ref2.info;
                    return _this4._raiseOperationCanceled(info)
                },
                onOperationItemCanceled: function(_ref3) {
                    var item = _ref3.item,
                        itemIndex = _ref3.itemIndex;
                    return _this4._raiseOperationItemCanceled(item, itemIndex)
                },
                onPanelClosed: function() {
                    return _this4._hideProgressPanel()
                }
            })
        }
    }, {
        key: "_getProgressPanelComponent",
        value: function() {
            return _uiFile_managerNotification2.default
        }
    }, {
        key: "_notifyError",
        value: function(errorInfo) {
            this._showPopupError(errorInfo);
            this._updateActionProgress(errorInfo.commonErrorText, "error")
        }
    }, {
        key: "_onProgressPanelOperationClosed",
        value: function(info) {
            if (info.hasError) {
                this._failedOperationCount--;
                this._tryHideActionProgress()
            }
        }
    }, {
        key: "_isProgressDrawerOpened",
        value: function() {
            return this._progressDrawer.option("opened")
        }
    }, {
        key: "_showPopup",
        value: function(content, errorMode) {
            if (this._isProgressDrawerOpened()) {
                return
            }
            this._getNotificationPopup()._wrapper().toggleClass(FILE_MANAGER_NOTIFICATION_POPUP_ERROR_CLASS, !!errorMode);
            this._getNotificationPopup().option("contentTemplate", content);
            if (!this._getNotificationPopup().option("visible")) {
                this._getNotificationPopup().show()
            }
        }
    }, {
        key: "_showPopupError",
        value: function(errorInfo) {
            var $content = (0, _renderer2.default)("<div>");
            var $message = (0, _renderer2.default)("<div>").addClass(FILE_MANAGER_NOTIFICATION_COMMON_CLASS).text(errorInfo.commonErrorText);
            var $separator = (0, _renderer2.default)("<div>").addClass(FILE_MANAGER_NOTIFICATION_SEPARATOR_CLASS);
            (0, _renderer2.default)("<div>").appendTo($separator);
            var $details = (0, _renderer2.default)("<div>").addClass(FILE_MANAGER_NOTIFICATION_DETAILS_CLASS);
            if (errorInfo.item) {
                this._progressPanel.createErrorDetailsProgressBox($details, errorInfo.item, errorInfo.detailErrorText)
            } else {
                $message.addClass(FILE_MANAGER_NOTIFICATION_COMMON_NO_ITEM_CLASS);
                this._progressPanel.renderError($details, $separator, errorInfo.detailErrorText)
            }
            $content.append($message, $separator, $details);
            this._showPopup($content, true)
        }
    }, {
        key: "_getNotificationPopup",
        value: function() {
            if (!this._notificationPopup) {
                var $popup = (0, _renderer2.default)("<div>").addClass(FILE_MANAGER_NOTIFICATION_POPUP_CLASS).appendTo(this.$element());
                this._notificationPopup = this._createComponent($popup, _popup2.default, {
                    container: this.$element(),
                    width: "auto",
                    height: "auto",
                    showTitle: false,
                    dragEnabled: false,
                    shading: false,
                    visible: false,
                    closeOnOutsideClick: true,
                    animation: {
                        duration: 0
                    },
                    position: {
                        my: "right top",
                        at: "right bottom",
                        of: ".dx-filemanager-toolbar",
                        offset: "-50 -5"
                    }
                })
            }
            return this._notificationPopup
        }
    }, {
        key: "_raiseActionProgress",
        value: function(message, status) {
            this._actions.onActionProgress({
                message: message,
                status: status
            })
        }
    }, {
        key: "_raiseOperationCanceled",
        value: function(info) {
            this._actions.onOperationCanceled({
                info: info
            })
        }
    }, {
        key: "_raiseOperationItemCanceled",
        value: function(item, index) {
            this._actions.onOperationItemCanceled({
                item: item,
                itemIndex: index
            })
        }
    }, {
        key: "_initActions",
        value: function() {
            this._actions = {
                onActionProgress: this._createActionByOption("onActionProgress"),
                onOperationCanceled: this._createActionByOption("onOperationCanceled"),
                onOperationItemCanceled: this._createActionByOption("onOperationItemCanceled")
            }
        }
    }, {
        key: "_getDefaultOptions",
        value: function() {
            return (0, _extend.extend)(_get(_getPrototypeOf(FileManagerNotificationControl.prototype), "_getDefaultOptions", this).call(this), {
                progressPanelContainer: null,
                contentTemplate: null,
                onActionProgress: null,
                onOperationCanceled: null,
                onOperationItemCanceled: null
            })
        }
    }, {
        key: "_optionChanged",
        value: function(args) {
            var name = args.name;
            switch (name) {
                case "progressPanelContainer":
                case "contentTemplate":
                    break;
                case "onActionProgress":
                case "onOperationCanceled":
                case "onOperationItemCanceled":
                    this._actions[name] = this._createActionByOption(name);
                    break;
                default:
                    _get(_getPrototypeOf(FileManagerNotificationControl.prototype), "_optionChanged", this).call(this, args)
            }
        }
    }]);
    return FileManagerNotificationControl
}(_ui2.default);
exports.default = FileManagerNotificationControl;
