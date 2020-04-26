/**
 * DevExtreme (ui/file_manager/ui.file_manager.item_list.details.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var _renderer = require("../../core/renderer");
var _renderer2 = _interopRequireDefault(_renderer);
var _type = require("../../core/utils/type");
var _type2 = _interopRequireDefault(_type);
var _message = require("../../localization/message");
var _message2 = _interopRequireDefault(_message);
var _ui = require("../data_grid/ui.data_grid");
var _ui2 = _interopRequireDefault(_ui);
var _custom_store = require("../../data/custom_store");
var _custom_store2 = _interopRequireDefault(_custom_store);
var _uiFile_manager = require("./ui.file_manager.item_list");
var _uiFile_manager2 = _interopRequireDefault(_uiFile_manager);
var _uiFile_manager3 = require("./ui.file_manager.file_actions_button");
var _uiFile_manager4 = _interopRequireDefault(_uiFile_manager3);
var _uiFile_managerUtils = require("./ui.file_manager.utils.js");

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
var FILE_MANAGER_DETAILS_ITEM_LIST_CLASS = "dx-filemanager-details";
var FILE_MANAGER_DETAILS_ITEM_THUMBNAIL_CLASS = "dx-filemanager-details-item-thumbnail";
var FILE_MANAGER_DETAILS_ITEM_NAME_CLASS = "dx-filemanager-details-item-name";
var FILE_MANAGER_DETAILS_ITEM_NAME_WRAPPER_CLASS = "dx-filemanager-details-item-name-wrapper";
var DATA_GRID_DATA_ROW_CLASS = "dx-data-row";
var PREDEFINED_COLUMN_NAMES = ["name", "isDirectory", "size", "thumbnail", "dateModified", "isParentFolder"];
var FileManagerDetailsItemList = function(_FileManagerItemListB) {
    _inherits(FileManagerDetailsItemList, _FileManagerItemListB);
    var _super = _createSuper(FileManagerDetailsItemList);

    function FileManagerDetailsItemList() {
        _classCallCheck(this, FileManagerDetailsItemList);
        return _super.apply(this, arguments)
    }
    _createClass(FileManagerDetailsItemList, [{
        key: "_initMarkup",
        value: function() {
            var _this = this;
            this._createFilesView();
            this._contextMenu.option("onContextMenuHidden", function() {
                return _this._onContextMenuHidden()
            });
            _get(_getPrototypeOf(FileManagerDetailsItemList.prototype), "_initMarkup", this).call(this)
        }
    }, {
        key: "_createFilesView",
        value: function() {
            var selectionMode = this.option("selectionMode");
            this._filesView = this._createComponent("<div>", _ui2.default, {
                hoverStateEnabled: true,
                selection: {
                    mode: selectionMode
                },
                allowColumnResizing: true,
                scrolling: {
                    mode: "virtual"
                },
                sorting: {
                    mode: "single",
                    showSortIndexes: false
                },
                showColumnLines: false,
                showRowLines: false,
                columnHidingEnabled: true,
                columns: this._createColumns(),
                onRowPrepared: this._onRowPrepared.bind(this),
                onContextMenuPreparing: this._onContextMenuPreparing.bind(this),
                onSelectionChanged: this._raiseSelectionChanged.bind(this),
                onOptionChanged: function(args) {
                    if (args.fullName.indexOf("sortOrder") > -1) {
                        this.columnOption("isParentFolder", {
                            sortOrder: "asc",
                            sortIndex: 0
                        })
                    }
                }
            });
            this.$element().addClass(FILE_MANAGER_DETAILS_ITEM_LIST_CLASS).append(this._filesView.$element());
            this.refresh()
        }
    }, {
        key: "_createColumns",
        value: function() {
            var columns = [{
                dataField: "isDirectory",
                caption: "",
                width: 64,
                alignment: "center",
                cellTemplate: this._createThumbnailColumnCell.bind(this)
            }, {
                dataField: "name",
                caption: _message2.default.format("dxFileManager-listDetailsColumnCaptionName"),
                cellTemplate: this._createNameColumnCell.bind(this)
            }, {
                dataField: "dateModified",
                caption: _message2.default.format("dxFileManager-listDetailsColumnCaptionDateModified"),
                width: 110,
                hidingPriority: 1
            }, {
                dataField: "size",
                caption: _message2.default.format("dxFileManager-listDetailsColumnCaptionFileSize"),
                width: 90,
                alignment: "right",
                hidingPriority: 0,
                calculateCellValue: this._calculateSizeColumnCellValue.bind(this)
            }, {
                dataField: "isParentFolder",
                caption: "isParentFolder",
                visible: false,
                sortIndex: 0,
                sortOrder: "asc"
            }];
            var customizeDetailColumns = this.option("customizeDetailColumns");
            if (_type2.default.isFunction(customizeDetailColumns)) {
                columns = customizeDetailColumns(columns)
            }
            for (var i = 0; i < columns.length; i++) {
                var dataItemSuffix = PREDEFINED_COLUMN_NAMES.indexOf(columns[i].dataField) < 0 ? "dataItem." : "";
                columns[i].dataField = "fileItem." + dataItemSuffix + columns[i].dataField
            }
            return columns
        }
    }, {
        key: "_onFileItemActionButtonClick",
        value: function(_ref) {
            var component = _ref.component,
                element = _ref.element,
                event = _ref.event;
            event.stopPropagation();
            var $row = component.$element().closest(this._getItemSelector());
            var fileItemInfo = $row.data("item");
            this._ensureItemSelected(fileItemInfo);
            this._showContextMenu(this.getSelectedItems(), element);
            this._activeFileActionsButton = component;
            this._activeFileActionsButton.setActive(true)
        }
    }, {
        key: "_onContextMenuHidden",
        value: function() {
            if (this._activeFileActionsButton) {
                this._activeFileActionsButton.setActive(false)
            }
        }
    }, {
        key: "_getItemThumbnailCssClass",
        value: function() {
            return FILE_MANAGER_DETAILS_ITEM_THUMBNAIL_CLASS
        }
    }, {
        key: "_getItemSelector",
        value: function() {
            return ".".concat(DATA_GRID_DATA_ROW_CLASS)
        }
    }, {
        key: "_onItemDblClick",
        value: function(e) {
            var $row = (0, _renderer2.default)(e.currentTarget);
            var fileItemInfo = $row.data("item");
            this._raiseSelectedItemOpened(fileItemInfo)
        }
    }, {
        key: "_onRowPrepared",
        value: function(e) {
            if ("data" === e.rowType) {
                (0, _renderer2.default)(e.rowElement).data("item", e.data)
            }
        }
    }, {
        key: "_onContextMenuPreparing",
        value: function(e) {
            var fileItems = null;
            if (e.row && "data" === e.row.rowType) {
                var item = e.row.data;
                this._ensureItemSelected(item);
                fileItems = this.getSelectedItems()
            }
            e.items = this._contextMenu.createContextMenuItems(fileItems)
        }
    }, {
        key: "_createThumbnailColumnCell",
        value: function(container, cellInfo) {
            this._getItemThumbnailContainer(cellInfo.data).appendTo(container)
        }
    }, {
        key: "_createNameColumnCell",
        value: function(container, cellInfo) {
            var _this2 = this;
            var $button = (0, _renderer2.default)("<div>");
            var $name = (0, _renderer2.default)("<span>").text(cellInfo.data.fileItem.name).addClass(FILE_MANAGER_DETAILS_ITEM_NAME_CLASS);
            var $wrapper = (0, _renderer2.default)("<div>").append($name, $button).addClass(FILE_MANAGER_DETAILS_ITEM_NAME_WRAPPER_CLASS);
            (0, _renderer2.default)(container).append($wrapper);
            this._createComponent($button, _uiFile_manager4.default, {
                onClick: function(e) {
                    return _this2._onFileItemActionButtonClick(e)
                }
            })
        }
    }, {
        key: "_calculateSizeColumnCellValue",
        value: function(rowData) {
            return rowData.fileItem.isDirectory ? "" : (0, _uiFile_managerUtils.getDisplayFileSize)(rowData.fileItem.size)
        }
    }, {
        key: "_ensureItemSelected",
        value: function(fileItemInfo) {
            var fileItem = fileItemInfo.fileItem;
            if (!this._filesView.isRowSelected(fileItem.key)) {
                var selectionController = this._filesView.getController("selection");
                var preserve = selectionController.isSelectionWithCheckboxes();
                this._filesView.selectRows([fileItem.key], preserve)
            }
        }
    }, {
        key: "clearSelection",
        value: function() {
            this._filesView.clearSelection()
        }
    }, {
        key: "refresh",
        value: function() {
            this.clearSelection();
            this._filesView.option("dataSource", {
                store: new _custom_store2.default({
                    key: "fileItem.key",
                    load: this._getItems.bind(this)
                })
            })
        }
    }, {
        key: "getSelectedItems",
        value: function() {
            return this._filesView.getSelectedRowsData()
        }
    }]);
    return FileManagerDetailsItemList
}(_uiFile_manager2.default);
module.exports = FileManagerDetailsItemList;
