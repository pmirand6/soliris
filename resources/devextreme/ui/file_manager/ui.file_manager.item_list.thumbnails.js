/**
 * DevExtreme (ui/file_manager/ui.file_manager.item_list.thumbnails.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var _renderer = require("../../core/renderer");
var _renderer2 = _interopRequireDefault(_renderer);
var _extend = require("../../core/utils/extend");
var _deferred = require("../../core/utils/deferred");
var _events_engine = require("../../events/core/events_engine");
var _events_engine2 = _interopRequireDefault(_events_engine);
var _utils = require("../../events/utils");
var _contextmenu = require("../../events/contextmenu");
var _uiFile_managerUtils = require("./ui.file_manager.utils.js");
var _message = require("../../localization/message");
var _message2 = _interopRequireDefault(_message);
var _uiFile_manager = require("./ui.file_manager.item_list");
var _uiFile_manager2 = _interopRequireDefault(_uiFile_manager);

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
var FILE_MANAGER_THUMBNAILS_ITEM_LIST_CLASS = "dx-filemanager-thumbnails";
var FILE_MANAGER_THUMBNAILS_VIEW_PORT_CLASS = "dx-filemanager-thumbnails-view-port";
var FILE_MANAGER_THUMBNAILS_ITEM_LIST_CONTAINER_CLASS = "dx-filemanager-thumbnails-container";
var FILE_MANAGER_THUMBNAILS_ITEM_CLASS = "dx-filemanager-thumbnails-item";
var FILE_MANAGER_THUMBNAILS_ITEM_CONTENT_CLASS = "dx-filemanager-thumbnails-item-content";
var FILE_MANAGER_THUMBNAILS_ITEM_THUMBNAIL_CLASS = "dx-filemanager-thumbnails-item-thumbnail";
var FILE_MANAGER_THUMBNAILS_ITEM_SPACER_CLASS = "dx-filemanager-thumbnails-item-spacer";
var FILE_MANAGER_THUMBNAILS_ITEM_NAME_CLASS = "dx-filemanager-thumbnails-item-name";
var FILE_MANAGER_ITEM_SELECTED_CLASS = "dx-filemanager-item-selected";
var FILE_MANAGER_ITEM_FOCUSED_CLASS = "dx-filemanager-item-focused";
var FILE_MANAGER_THUMBNAILS_EVENT_NAMESPACE = "dxFileManager_thumbnails";
var FileManagerThumbnailsItemList = function(_FileManagerItemListB) {
    _inherits(FileManagerThumbnailsItemList, _FileManagerItemListB);
    var _super = _createSuper(FileManagerThumbnailsItemList);

    function FileManagerThumbnailsItemList() {
        _classCallCheck(this, FileManagerThumbnailsItemList);
        return _super.apply(this, arguments)
    }
    _createClass(FileManagerThumbnailsItemList, [{
        key: "_init",
        value: function() {
            this._items = [];
            this._currentLoadOperationId = 0;
            _get(_getPrototypeOf(FileManagerThumbnailsItemList.prototype), "_init", this).call(this)
        }
    }, {
        key: "_initMarkup",
        value: function() {
            _get(_getPrototypeOf(FileManagerThumbnailsItemList.prototype), "_initMarkup", this).call(this);
            var multipleSelection = "multiple" === this.option("selectionMode");
            var controllerOptions = {
                onSelectionChanged: this._raiseSelectionChanged.bind(this)
            };
            var controllerClass = multipleSelection ? MultipleSelectionController : SingleSelectionController;
            this._selectionController = new controllerClass(controllerOptions);
            this._$itemViewContainer = (0, _renderer2.default)("<div>").addClass(FILE_MANAGER_THUMBNAILS_ITEM_LIST_CONTAINER_CLASS);
            this._$viewPort = (0, _renderer2.default)("<div>").addClass(FILE_MANAGER_THUMBNAILS_VIEW_PORT_CLASS);
            this._$viewPort.append(this._$itemViewContainer);
            this.$element().addClass(FILE_MANAGER_THUMBNAILS_ITEM_LIST_CLASS);
            this.$element().append(this._$viewPort);
            var contextMenuEvent = (0, _utils.addNamespace)(_contextmenu.name, FILE_MANAGER_THUMBNAILS_EVENT_NAMESPACE);
            var clickEvent = (0, _utils.addNamespace)("click", FILE_MANAGER_THUMBNAILS_EVENT_NAMESPACE);
            _events_engine2.default.on(this.$element(), contextMenuEvent, this._onContextMenu.bind(this));
            _events_engine2.default.on(this.$element(), clickEvent, this._onClick.bind(this));
            this._loadItems()
        }
    }, {
        key: "_supportedKeys",
        value: function() {
            return (0, _extend.extend)(_get(_getPrototypeOf(FileManagerThumbnailsItemList.prototype), "_supportedKeys", this).call(this), {
                rightArrow: function(e) {
                    this._beforeKeyProcessing(e);
                    this._processMoveArrow(1, true, e)
                },
                leftArrow: function(e) {
                    this._beforeKeyProcessing(e);
                    this._processMoveArrow(-1, true, e)
                },
                upArrow: function(e) {
                    this._beforeKeyProcessing(e);
                    this._processMoveArrow(-1, false, e)
                },
                downArrow: function(e) {
                    this._beforeKeyProcessing(e);
                    this._processMoveArrow(1, false, e)
                },
                home: function(e) {
                    this._beforeKeyProcessing(e);
                    this._selectItemByIndex(0, true, e)
                },
                end: function(e) {
                    this._beforeKeyProcessing(e);
                    this._selectItemByIndex(this._items.length - 1, true, e)
                },
                pageUp: function(e) {
                    this._beforeKeyProcessing(e);
                    this._processPageChange(true, e)
                },
                pageDown: function(e) {
                    this._beforeKeyProcessing(e);
                    this._processPageChange(false, e)
                },
                space: function(e) {
                    this._beforeKeyProcessing(e);
                    this._selectionController.invertFocusedItemSelection()
                },
                enter: function(e) {
                    this._beforeKeyProcessing(e);
                    this.tryOpen()
                },
                A: function(e) {
                    this._beforeKeyProcessing(e);
                    if (e.ctrlKey) {
                        this._selectAll()
                    }
                }
            })
        }
    }, {
        key: "_beforeKeyProcessing",
        value: function(e) {
            e.preventDefault();
            this._resetLayoutModel()
        }
    }, {
        key: "_processMoveArrow",
        value: function(offset, horizontal, eventArgs) {
            var item = this._getFocusedItem();
            if (item) {
                if (!horizontal) {
                    var layout = this._getLayoutModel();
                    if (!layout) {
                        return
                    }
                    offset *= layout.itemPerRowCount
                }
                var newItemIndex = item._state.index + offset;
                this._selectItemByIndex(newItemIndex, true, eventArgs)
            }
        }
    }, {
        key: "_processPageChange",
        value: function(pageUp, eventArgs) {
            var item = this._getFocusedItem();
            if (!item) {
                return
            }
            var layout = this._getLayoutModel();
            if (!layout) {
                return
            }
            var itemLayout = this._createItemLayoutModel(item._state.index);
            var rowOffset = pageUp ? layout.rowPerPageRate : -layout.rowPerPageRate;
            var newRowRate = itemLayout.itemRowIndex - rowOffset;
            var roundFunc = pageUp ? Math.ceil : Math.floor;
            var newRowIndex = roundFunc(newRowRate);
            var newItemIndex = newRowIndex * layout.itemPerRowCount + itemLayout.itemColumnIndex;
            if (newItemIndex < 0) {
                newItemIndex = 0
            } else {
                if (newItemIndex >= this._items.length) {
                    newItemIndex = this._items.length - 1
                }
            }
            this._selectItemByIndex(newItemIndex, true, eventArgs)
        }
    }, {
        key: "_onClick",
        value: function(e) {
            var $item = (0, _renderer2.default)(e.target).closest(this._getItemSelector());
            if ($item.length > 0) {
                this._selectItemByItemElement($item, e)
            } else {
                this.clearSelection()
            }
        }
    }, {
        key: "_onContextMenu",
        value: function(e) {
            e.preventDefault();
            this._onClick(e);
            var items = this.getSelectedItems();
            this._showContextMenu(items, e.target, e)
        }
    }, {
        key: "_selectItemByItemElement",
        value: function($item, e) {
            var index = $item.data("index");
            this._selectItemByIndex(index, false, e)
        }
    }, {
        key: "_getItemThumbnailCssClass",
        value: function() {
            return FILE_MANAGER_THUMBNAILS_ITEM_THUMBNAIL_CLASS
        }
    }, {
        key: "_getItemSelector",
        value: function() {
            return ".".concat(FILE_MANAGER_THUMBNAILS_ITEM_CLASS)
        }
    }, {
        key: "_onItemDblClick",
        value: function(e) {
            var $item = (0, _renderer2.default)(e.currentTarget);
            var index = $item.data("index");
            var item = this._items[index];
            this._raiseSelectedItemOpened(item)
        }
    }, {
        key: "_scrollToItem",
        value: function(item) {
            var layout = this._getLayoutModel();
            if (!layout) {
                return
            }
            var itemRowIndex = Math.floor(item._state.index / layout.itemPerRowCount);
            var itemTop = itemRowIndex * layout.itemHeight;
            var itemBottom = itemTop + layout.itemHeight;
            var newScrollTop = layout.viewPortScrollTop;
            if (itemTop < layout.viewPortScrollTop) {
                newScrollTop = itemTop
            } else {
                if (itemBottom > layout.viewPortScrollBottom) {
                    newScrollTop = itemBottom - layout.viewPortHeight
                }
            }
            this._$viewPort.scrollTop(newScrollTop)
        }
    }, {
        key: "_resetLayoutModel",
        value: function() {
            this._layoutModel = null
        }
    }, {
        key: "_getLayoutModel",
        value: function() {
            if (!this._layoutModel) {
                this._layoutModel = this._createLayoutModel()
            }
            return this._layoutModel
        }
    }, {
        key: "_createLayoutModel",
        value: function() {
            if (0 === this._items.length) {
                return null
            }
            var item = this._items[0];
            var $item = item._state.$element;
            var itemWidth = $item.outerWidth(true);
            if (0 === itemWidth) {
                return null
            }
            var itemHeight = $item.outerHeight(true);
            var viewPortWidth = this._$itemViewContainer.innerWidth();
            var viewPortHeight = this._$viewPort.innerHeight();
            var viewPortScrollTop = this._$viewPort.scrollTop();
            var viewPortScrollBottom = viewPortScrollTop + viewPortHeight;
            var itemPerRowCount = Math.floor(viewPortWidth / itemWidth);
            var rowPerPageRate = viewPortHeight / itemHeight;
            return {
                itemWidth: itemWidth,
                itemHeight: itemHeight,
                viewPortWidth: viewPortWidth,
                viewPortHeight: viewPortHeight,
                viewPortScrollTop: viewPortScrollTop,
                viewPortScrollBottom: viewPortScrollBottom,
                itemPerRowCount: itemPerRowCount,
                rowPerPageRate: rowPerPageRate
            }
        }
    }, {
        key: "_createItemLayoutModel",
        value: function(index) {
            var layout = this._getLayoutModel();
            if (!layout) {
                return null
            }
            var itemRowIndex = Math.floor(index / layout.itemPerRowCount);
            var itemColumnIndex = index % layout.itemPerRowCount;
            var itemTop = itemRowIndex * layout.itemHeight;
            var itemBottom = itemTop + layout.itemHeight;
            return {
                itemRowIndex: itemRowIndex,
                itemColumnIndex: itemColumnIndex,
                itemTop: itemTop,
                itemBottom: itemBottom
            }
        }
    }, {
        key: "_selectAll",
        value: function() {
            this._selectionController.selectAll()
        }
    }, {
        key: "_selectItem",
        value: function(item, scrollToItem, eventArgs) {
            this._selectionController.selectItem(item, eventArgs);
            if (scrollToItem) {
                this._scrollToItem(item)
            }
        }
    }, {
        key: "_selectItemByIndex",
        value: function(index, scrollToItem, eventArgs) {
            if (index >= 0 && index < this._items.length) {
                var item = this._items[index];
                this._selectItem(item, scrollToItem, eventArgs)
            }
        }
    }, {
        key: "_getFocusedItem",
        value: function() {
            return this._selectionController.getFocusedItem()
        }
    }, {
        key: "_loadItems",
        value: function() {
            var _this = this;
            var loadOperationId = this._getUniqueId();
            this._currentLoadOperationId = loadOperationId;
            (0, _deferred.when)(this._getItems()).then(function(items) {
                if (_this._currentLoadOperationId === loadOperationId) {
                    _this._applyItems(items || [])
                }
            }, function(error) {
                if (_this._currentLoadOperationId === loadOperationId) {
                    _this._raiseOnError(error)
                }
            })
        }
    }, {
        key: "_applyItems",
        value: function(items) {
            this._items = items;
            this._selectionController.setItems(items);
            this._renderItems(items)
        }
    }, {
        key: "_renderItems",
        value: function(items) {
            this._$itemViewContainer.empty();
            for (var i = 0; i < items.length; i++) {
                var item = items[i];
                item._state = {
                    index: i,
                    selected: false,
                    $element: null
                };
                this._renderItem(item)
            }
        }
    }, {
        key: "_renderItem",
        value: function(fileItemInfo) {
            var $item = (0, _renderer2.default)("<div>").addClass(FILE_MANAGER_THUMBNAILS_ITEM_CLASS).attr("title", this._getTooltipText(fileItemInfo)).data("index", fileItemInfo._state.index);
            var $itemContent = (0, _renderer2.default)("<div>").addClass(FILE_MANAGER_THUMBNAILS_ITEM_CONTENT_CLASS);
            var $itemThumbnail = this._getItemThumbnailContainer(fileItemInfo);
            _events_engine2.default.on($itemThumbnail, "dragstart", this._disableDragging);
            var $itemSpacer = (0, _renderer2.default)("<div>").addClass(FILE_MANAGER_THUMBNAILS_ITEM_SPACER_CLASS);
            var $itemName = (0, _renderer2.default)("<div>").addClass(FILE_MANAGER_THUMBNAILS_ITEM_NAME_CLASS).text(fileItemInfo.fileItem.name);
            $item.append($itemContent);
            $itemContent.append($itemThumbnail, $itemSpacer, $itemName);
            this._$itemViewContainer.append($item);
            fileItemInfo._state.$element = $item
        }
    }, {
        key: "_getTooltipText",
        value: function(fileItemInfo) {
            var item = fileItemInfo.fileItem;
            if (item.tooltipText) {
                return item.tooltipText
            }
            var text = "".concat(item.name, "\r\n");
            if (!item.isDirectory) {
                text += "".concat(_message2.default.format("dxFileManager-listThumbnailsTooltipTextSize"), ": ").concat((0, _uiFile_managerUtils.getDisplayFileSize)(item.size), "\r\n")
            }
            text += "".concat(_message2.default.format("dxFileManager-listThumbnailsTooltipTextDateModified"), ": ").concat(item.dateModified);
            return text
        }
    }, {
        key: "_getUniqueId",
        value: function() {
            return "".concat(Date.now(), "_").concat(Math.round(1e5 * Math.random()))
        }
    }, {
        key: "_disableDragging",
        value: function() {
            return false
        }
    }, {
        key: "_getDefaultOptions",
        value: function() {
            return (0, _extend.extend)(_get(_getPrototypeOf(FileManagerThumbnailsItemList.prototype), "_getDefaultOptions", this).call(this), {
                focusStateEnabled: true
            })
        }
    }, {
        key: "refresh",
        value: function() {
            this.clearSelection();
            this._loadItems()
        }
    }, {
        key: "tryOpen",
        value: function() {
            var item = this._getFocusedItem();
            if (item) {
                this._raiseSelectedItemOpened(item)
            }
        }
    }, {
        key: "clearSelection",
        value: function() {
            this._selectionController.clearSelection()
        }
    }, {
        key: "getSelectedItems",
        value: function() {
            return this._selectionController.getSelectedItems()
        }
    }]);
    return FileManagerThumbnailsItemList
}(_uiFile_manager2.default);
var SingleSelectionController = function() {
    function SingleSelectionController(options) {
        _classCallCheck(this, SingleSelectionController);
        this._items = [];
        this._selectionChangedHandler = options.onSelectionChanged;
        this._selectionChanged = false
    }
    _createClass(SingleSelectionController, [{
        key: "selectAll",
        value: function() {}
    }, {
        key: "clearSelection",
        value: function() {
            this._beginUpdate();
            this._setAllItemsSelectedState(false);
            this._endUpdate()
        }
    }, {
        key: "selectItem",
        value: function(item, eventArgs) {
            this._beginUpdate();
            this._setAllItemsSelectedState(false, [item]);
            this._setItemSelectedState(item, true);
            this._endUpdate()
        }
    }, {
        key: "invertFocusedItemSelection",
        value: function(item) {}
    }, {
        key: "getFocusedItem",
        value: function() {
            var selectedItems = this.getSelectedItems();
            return selectedItems.length > 0 ? selectedItems[0] : null
        }
    }, {
        key: "getSelectedItems",
        value: function() {
            return this._items.filter(function(item) {
                return item._state.selected
            })
        }
    }, {
        key: "setItems",
        value: function(items) {
            this._items = items
        }
    }, {
        key: "_setItemSelectedState",
        value: function(item, selected) {
            if (item._state.selected === selected) {
                return
            }
            item._state.selected = selected;
            item._state.$element.toggleClass(FILE_MANAGER_ITEM_SELECTED_CLASS, selected);
            this._selectionChanged = true
        }
    }, {
        key: "_setAllItemsSelectedState",
        value: function(selected, exceptedItems) {
            for (var i = 0; i < this._items.length; i++) {
                var item = this._items[i];
                if (exceptedItems && exceptedItems.indexOf(item) !== -1) {
                    continue
                }
                this._setItemSelectedState(item, selected)
            }
        }
    }, {
        key: "_beginUpdate",
        value: function() {
            this._selectionChanged = false
        }
    }, {
        key: "_endUpdate",
        value: function() {
            if (this._selectionChanged) {
                this._selectionChangedHandler();
                this._selectionChanged = false
            }
        }
    }]);
    return SingleSelectionController
}();
var MultipleSelectionController = function(_SingleSelectionContr) {
    _inherits(MultipleSelectionController, _SingleSelectionContr);
    var _super2 = _createSuper(MultipleSelectionController);

    function MultipleSelectionController(options) {
        var _this2;
        _classCallCheck(this, MultipleSelectionController);
        _this2 = _super2.call(this, options);
        _this2._focusedItem = null;
        return _this2
    }
    _createClass(MultipleSelectionController, [{
        key: "selectAll",
        value: function() {
            this._beginUpdate();
            this._setAllItemsSelectedState(true);
            this._endUpdate()
        }
    }, {
        key: "selectItem",
        value: function(item, eventArgs) {
            this._beginUpdate();
            if (eventArgs.shiftKey) {
                this._setItemsRangeSelectedState(this._focusedItem._state.index, item._state.index, eventArgs.ctrlKey, true)
            } else {
                if (eventArgs.ctrlKey) {
                    var needSelect = 1 === this._items.length && this._focusedItem === item || !item._state.selected;
                    this._setItemSelectedState(item, needSelect)
                } else {
                    this._setAllItemsSelectedState(false, [item]);
                    this._setItemSelectedState(item, true)
                }
            }
            this._setFocusedItem(item);
            this._endUpdate()
        }
    }, {
        key: "_setItemsRangeSelectedState",
        value: function(startIndex, endIndex, invert, selected) {
            if (startIndex > endIndex) {
                var temp = endIndex;
                endIndex = startIndex;
                startIndex = temp
            }
            for (var i = startIndex; i <= endIndex; i++) {
                var item = this._items[i];
                var actualSelected = invert ? !item._state.selected : selected;
                this._setItemSelectedState(item, actualSelected)
            }
        }
    }, {
        key: "_setFocusedItem",
        value: function(item) {
            if (this._focusedItem === item) {
                return
            }
            if (this._focusedItem) {
                this._focusedItem._state.$element.removeClass(FILE_MANAGER_ITEM_FOCUSED_CLASS)
            }
            item._state.$element.addClass(FILE_MANAGER_ITEM_FOCUSED_CLASS);
            this._focusedItem = item
        }
    }, {
        key: "invertFocusedItemSelection",
        value: function() {
            if (!this._focusedItem) {
                return
            }
            this._beginUpdate();
            this._setItemSelectedState(this._focusedItem, !this._focusedItem._state.selected);
            this._endUpdate()
        }
    }, {
        key: "getFocusedItem",
        value: function() {
            return this._focusedItem
        }
    }, {
        key: "setItems",
        value: function(items) {
            _get(_getPrototypeOf(MultipleSelectionController.prototype), "setItems", this).call(this, items);
            this._focusedItem = items.length > 0 ? items[0] : null
        }
    }]);
    return MultipleSelectionController
}(SingleSelectionController);
module.exports = FileManagerThumbnailsItemList;
