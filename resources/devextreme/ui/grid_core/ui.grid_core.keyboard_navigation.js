/**
 * DevExtreme (ui/grid_core/ui.grid_core.keyboard_navigation.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";

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
var _renderer = require("../../core/renderer");
var _renderer2 = _interopRequireDefault(_renderer);
var _dom_adapter = require("../../core/dom_adapter");
var _dom_adapter2 = _interopRequireDefault(_dom_adapter);
var _events_engine = require("../../events/core/events_engine");
var _events_engine2 = _interopRequireDefault(_events_engine);
var _uiGrid_core = require("./ui.grid_core.modules");
var _uiGrid_core2 = _interopRequireDefault(_uiGrid_core);
var _uiGrid_core3 = require("./ui.grid_core.utils");
var _type = require("../../core/utils/type");
var _array = require("../../core/utils/array");
var _selectors = require("../widget/selectors");
var _ui = require("../widget/ui.keyboard_processor");
var _ui2 = _interopRequireDefault(_ui);
var _utils = require("../../events/utils");
var _utils2 = _interopRequireDefault(_utils);
var _pointer = require("../../events/pointer");
var _pointer2 = _interopRequireDefault(_pointer);
var _click = require("../../events/click");
var _click2 = _interopRequireDefault(_click);
var _common = require("../../core/utils/common");
var _accessibility = require("../shared/accessibility");
var accessibility = _interopRequireWildcard(_accessibility);
var _browser = require("../../core/utils/browser");
var _browser2 = _interopRequireDefault(_browser);
var _devices = require("../../core/devices");
var _devices2 = _interopRequireDefault(_devices);

function _getRequireWildcardCache() {
    if ("function" !== typeof WeakMap) {
        return null
    }
    var cache = new WeakMap;
    _getRequireWildcardCache = function() {
        return cache
    };
    return cache
}

function _interopRequireWildcard(obj) {
    if (obj && obj.__esModule) {
        return obj
    }
    if (null === obj || "object" !== _typeof(obj) && "function" !== typeof obj) {
        return {
            "default": obj
        }
    }
    var cache = _getRequireWildcardCache();
    if (cache && cache.has(obj)) {
        return cache.get(obj)
    }
    var newObj = {};
    var hasPropertyDescriptor = Object.defineProperty && Object.getOwnPropertyDescriptor;
    for (var key in obj) {
        if (Object.prototype.hasOwnProperty.call(obj, key)) {
            var desc = hasPropertyDescriptor ? Object.getOwnPropertyDescriptor(obj, key) : null;
            if (desc && (desc.get || desc.set)) {
                Object.defineProperty(newObj, key, desc)
            } else {
                newObj[key] = obj[key]
            }
        }
    }
    newObj.default = obj;
    if (cache) {
        cache.set(obj, newObj)
    }
    return newObj
}

function _interopRequireDefault(obj) {
    return obj && obj.__esModule ? obj : {
        "default": obj
    }
}
var ROWS_VIEW_CLASS = "rowsview";
var EDIT_FORM_CLASS = "edit-form";
var GROUP_FOOTER_CLASS = "group-footer";
var ROW_CLASS = "dx-row";
var DATA_ROW_CLASS = "dx-data-row";
var GROUP_ROW_CLASS = "dx-group-row";
var EDIT_FORM_ITEM_CLASS = "edit-form-item";
var MASTER_DETAIL_ROW_CLASS = "dx-master-detail-row";
var FREESPACE_ROW_CLASS = "dx-freespace-row";
var VIRTUAL_ROW_CLASS = "dx-virtual-row";
var MASTER_DETAIL_CELL_CLASS = "dx-master-detail-cell";
var EDITOR_CELL_CLASS = "dx-editor-cell";
var EDIT_ROW_CLASS = "dx-edit-row";
var DROPDOWN_EDITOR_OVERLAY_CLASS = "dx-dropdowneditor-overlay";
var COMMAND_EXPAND_CLASS = "dx-command-expand";
var COMMAND_SELECT_CLASS = "dx-command-select";
var COMMAND_CELL_SELECTOR = "[class^=dx-command]";
var CELL_FOCUS_DISABLED_CLASS = "dx-cell-focus-disabled";
var DATEBOX_WIDGET_NAME = "dxDateBox";
var FOCUS_STATE_CLASS = "dx-state-focused";
var WIDGET_CLASS = "dx-widget";
var FAST_EDITING_DELETE_KEY = "delete";
var INTERACTIVE_ELEMENTS_SELECTOR = "input:not([type='hidden']), textarea, a, select, [tabindex]";
var EDIT_MODE_ROW = "row";
var EDIT_MODE_FORM = "form";
var EDIT_MODE_BATCH = "batch";
var EDIT_MODE_CELL = "cell";
var FOCUS_TYPE_ROW = "row";
var FOCUS_TYPE_CELL = "cell";

function isGroupRow($row) {
    return $row && $row.hasClass(GROUP_ROW_CLASS)
}

function isDetailRow($row) {
    return $row && $row.hasClass(MASTER_DETAIL_ROW_CLASS)
}

function isDataRow($row) {
    return $row && !isGroupRow($row) && !isDetailRow($row)
}

function isNotFocusedRow($row) {
    return !$row || $row.hasClass(FREESPACE_ROW_CLASS) || $row.hasClass(VIRTUAL_ROW_CLASS)
}

function isCellElement($element) {
    return $element.length && "TD" === $element[0].tagName
}

function isEditorCell(that, $cell) {
    return !that._isRowEditMode() && $cell && $cell.hasClass(EDITOR_CELL_CLASS)
}

function isElementDefined($element) {
    return (0, _type.isDefined)($element) && $element.length > 0
}

function isMobile() {
    return "desktop" !== _devices2.default.current().deviceType
}
var KeyboardNavigationController = _uiGrid_core2.default.ViewController.inherit({
    init: function() {
        var that = this;
        if (that.isKeyboardEnabled()) {
            accessibility.subscribeVisibilityChange();
            that._dataController = that.getController("data");
            that._selectionController = that.getController("selection");
            that._editingController = that.getController("editing");
            that._headerPanel = that.getView("headerPanel");
            that._columnsController = that.getController("columns");
            that.getController("editorFactory").focused.add(function($element) {
                that.setupFocusedView();
                if (that._isNeedScroll) {
                    if ($element.is(":visible") && that._focusedView && that._focusedView.getScrollable) {
                        that._focusedView._scrollToElement($element);
                        that._isNeedScroll = false
                    }
                }
            });
            that._fastEditingStarted = false;
            that._focusedCellPosition = {};
            that._canceledCellPosition = null;
            that._initViewHandlers();
            that._initDocumentHandlers()
        }
    },
    _initViewHandlers: function() {
        var that = this;
        var pointerEventAction = that.createAction(that._pointerEventHandler);
        var rowsView = that.getView("rowsView");
        rowsView.renderCompleted.add(function(e) {
            var $rowsView = rowsView.element();
            var isFullUpdate = !e || "refresh" === e.changeType;
            var isFocusedViewCorrect = that._focusedView && that._focusedView.name === rowsView.name;
            var needUpdateFocus = false;
            var isAppend = e && ("append" === e.changeType || "prepend" === e.changeType);
            var clickSelector = ".".concat(ROW_CLASS, " > td, .").concat(ROW_CLASS);
            var $focusedElement = (0, _renderer2.default)(":focus");
            var isFocusedElementCorrect = !$focusedElement.length || $focusedElement.closest($rowsView).length || _browser2.default.msie && $focusedElement.is("body");
            var pointerEventName = !isMobile() ? _pointer2.default.down : _click2.default.name;
            _events_engine2.default.off($rowsView, _utils2.default.addNamespace(pointerEventName, "dxDataGridKeyboardNavigation"), pointerEventAction);
            _events_engine2.default.on($rowsView, _utils2.default.addNamespace(pointerEventName, "dxDataGridKeyboardNavigation"), clickSelector, pointerEventAction);
            that._initKeyDownProcessor(that, $rowsView, that._keyDownHandler);
            that._setRowsViewAttributes($rowsView);
            if (isFocusedViewCorrect && isFocusedElementCorrect) {
                needUpdateFocus = that._isNeedFocus ? !isAppend : that._isHiddenFocus && isFullUpdate;
                needUpdateFocus && that._updateFocus(true)
            }
        })
    },
    _initDocumentHandlers: function() {
        var that = this;
        var document = _dom_adapter2.default.getDocument();
        that._documentClickHandler = that.createAction(function(e) {
            var $target = (0, _renderer2.default)(e.event.target);
            var isCurrentRowsViewClick = that._isEventInCurrentGrid(e.event) && $target.closest(".".concat(that.addWidgetPrefix(ROWS_VIEW_CLASS))).length;
            var isEditorOverlay = $target.closest(".".concat(DROPDOWN_EDITOR_OVERLAY_CLASS)).length;
            if (!isCurrentRowsViewClick && !isEditorOverlay) {
                that._resetFocusedCell()
            }
        });
        that.createAction("onKeyDown");
        _events_engine2.default.on(document, _utils2.default.addNamespace(_pointer2.default.down, "dxDataGridKeyboardNavigation"), that._documentClickHandler)
    },
    _setRowsViewAttributes: function($rowsView) {
        var isGridEmpty = !this._dataController.getVisibleRows().length;
        if (isGridEmpty) {
            var tabIndex = this.option("tabindex") || 0;
            $rowsView.attr("tabindex", tabIndex)
        }
    },
    _initKeyDownProcessor: function(context, element, handler) {
        if (this._keyDownProcessor) {
            this._keyDownProcessor.dispose();
            this._keyDownProcessor = null
        }
        this._keyDownProcessor = new _ui2.default({
            element: element,
            context: context,
            handler: handler
        })
    },
    dispose: function() {
        this.callBase();
        this._focusedView = null;
        this._keyDownProcessor && this._keyDownProcessor.dispose();
        _events_engine2.default.off(_dom_adapter2.default.getDocument(), _utils2.default.addNamespace(_pointer2.default.down, "dxDataGridKeyboardNavigation"), this._documentClickHandler);
        accessibility.unsubscribeVisibilityChange()
    },
    optionChanged: function(args) {
        var that = this;
        switch (args.name) {
            case "keyboardNavigation":
            case "useLegacyKeyboardNavigation":
                args.handled = true;
                break;
            default:
                that.callBase(args)
        }
    },
    isRowFocusType: function() {
        return this.focusType === FOCUS_TYPE_ROW
    },
    isCellFocusType: function() {
        return this.focusType === FOCUS_TYPE_CELL
    },
    setRowFocusType: function() {
        if (this.option("focusedRowEnabled")) {
            this.focusType = FOCUS_TYPE_ROW
        }
    },
    setCellFocusType: function() {
        this.focusType = FOCUS_TYPE_CELL
    },
    _keyDownHandler: function(e) {
        var isEditing = this._editingController.isEditing();
        var needStopPropagation = true;
        var originalEvent = e.originalEvent;
        var isHandled = this._processOnKeyDown(e);
        if (originalEvent.isDefaultPrevented()) {
            return
        }
        this._isNeedFocus = true;
        this._isNeedScroll = true;
        this._updateFocusedCellPosition(this._getCellElementFromTarget(originalEvent.target));
        if (!isHandled) {
            switch (e.keyName) {
                case "leftArrow":
                case "rightArrow":
                    this._leftRightKeysHandler(e, isEditing);
                    break;
                case "upArrow":
                case "downArrow":
                    if (e.ctrl) {
                        accessibility.selectView("rowsView", this, originalEvent)
                    } else {
                        this._upDownKeysHandler(e, isEditing)
                    }
                    break;
                case "pageUp":
                case "pageDown":
                    this._pageUpDownKeyHandler(e);
                    break;
                case "space":
                    this._spaceKeyHandler(e, isEditing);
                    break;
                case "A":
                    if (e.ctrl) {
                        this._ctrlAKeyHandler(e, isEditing)
                    } else {
                        this._beginFastEditing(e.originalEvent)
                    }
                    break;
                case "tab":
                    this._tabKeyHandler(e, isEditing);
                    break;
                case "enter":
                    this._enterKeyHandler(e, isEditing);
                    break;
                case "escape":
                    this._escapeKeyHandler(e, isEditing);
                    break;
                case "F":
                    if (e.ctrl) {
                        this._ctrlFKeyHandler(e)
                    } else {
                        this._beginFastEditing(e.originalEvent)
                    }
                    break;
                case "F2":
                    this._f2KeyHandler();
                    break;
                case "del":
                case "backspace":
                    if (this._isFastEditingAllowed() && !this._isFastEditingStarted()) {
                        this._beginFastEditing(originalEvent, true)
                    }
                    break;
                default:
                    if (!this._beginFastEditing(originalEvent)) {
                        this._isNeedFocus = false;
                        this._isNeedScroll = false;
                        needStopPropagation = false
                    }
            }
            if (needStopPropagation) {
                originalEvent.stopPropagation()
            }
        }
    },
    _processOnKeyDown: function(eventArgs) {
        var originalEvent = eventArgs.originalEvent;
        var args = {
            handled: false,
            event: originalEvent
        };
        this.executeAction("onKeyDown", args);
        eventArgs.ctrl = originalEvent.ctrlKey;
        eventArgs.alt = originalEvent.altKey;
        eventArgs.shift = originalEvent.shiftKey;
        return !!args.handled
    },
    _leftRightKeysHandler: function(eventArgs, isEditing) {
        var rowIndex = this.getVisibleRowIndex();
        var $event = eventArgs.originalEvent;
        var $row = this._focusedView && this._focusedView.getRow(rowIndex);
        var directionCode = this._getDirectionCodeByKey(eventArgs.keyName);
        var isEditingNavigationMode = this._isFastEditingStarted();
        var allowNavigate = (!isEditing || isEditingNavigationMode) && isDataRow($row);
        if (allowNavigate) {
            this.setCellFocusType();
            isEditingNavigationMode && this._editingController.closeEditCell();
            var $cell = this._getNextCell(directionCode);
            if (isElementDefined($cell)) {
                this._arrowKeysHandlerFocusCell($event, $cell)
            }
            $event && $event.preventDefault()
        }
    },
    _upDownKeysHandler: function(eventArgs, isEditing) {
        var rowIndex = this.getVisibleRowIndex();
        var $row = this._focusedView && this._focusedView.getRow(rowIndex);
        var $event = eventArgs.originalEvent;
        var rowHeight;
        var isUpArrow = "upArrow" === eventArgs.keyName;
        var dataSource = this._dataController.dataSource();
        var isEditingNavigationMode = this._isFastEditingStarted();
        var allowNavigate = (!isEditing || isEditingNavigationMode) && $row && !isDetailRow($row);
        if (allowNavigate) {
            isEditingNavigationMode && this._editingController.closeEditCell();
            if (!this._navigateNextCell($event, eventArgs.keyName)) {
                if (this._isVirtualScrolling() && isUpArrow && dataSource && !dataSource.isLoading()) {
                    rowHeight = $row.outerHeight();
                    rowIndex = this._focusedCellPosition.rowIndex - 1;
                    this._scrollBy(-rowHeight, rowIndex, $event)
                }
            }
            $event && $event.preventDefault()
        }
    },
    _pageUpDownKeyHandler: function(eventArgs) {
        var pageIndex = this._dataController.pageIndex();
        var pageCount = this._dataController.pageCount();
        var pagingEnabled = this.option("paging.enabled");
        var isPageUp = "pageUp" === eventArgs.keyName;
        var pageStep = isPageUp ? -1 : 1;
        var scrollable = this.getView("rowsView").getScrollable();
        if (pagingEnabled && !this._isVirtualScrolling()) {
            if ((isPageUp ? pageIndex > 0 : pageIndex < pageCount - 1) && !this._isVirtualScrolling()) {
                this._dataController.pageIndex(pageIndex + pageStep);
                eventArgs.originalEvent.preventDefault()
            }
        } else {
            if (scrollable && scrollable._container().height() < scrollable.$content().height()) {
                this._scrollBy(scrollable._container().height() * pageStep);
                eventArgs.originalEvent.preventDefault()
            }
        }
    },
    _spaceKeyHandler: function(eventArgs, isEditing) {
        var rowIndex = this.getVisibleRowIndex();
        var $target = (0, _renderer2.default)(eventArgs.originalEvent && eventArgs.originalEvent.target);
        var isFocusedRowElement;
        var isFocusedSelectionCell;
        if (this.option("selection") && "none" !== this.option("selection").mode && !isEditing) {
            isFocusedRowElement = "row" === this._getElementType($target) && this.isRowFocusType() && isDataRow($target);
            isFocusedSelectionCell = $target.hasClass(COMMAND_SELECT_CLASS);
            if (isFocusedSelectionCell && "onClick" === this.option("selection.showCheckBoxesMode")) {
                this._selectionController.startSelectionWithCheckboxes()
            }
            if (isFocusedRowElement || $target.parent().hasClass(DATA_ROW_CLASS) || $target.hasClass(this.addWidgetPrefix(ROWS_VIEW_CLASS))) {
                this._selectionController.changeItemSelection(rowIndex, {
                    shift: eventArgs.shift,
                    control: eventArgs.ctrl
                });
                eventArgs.originalEvent.preventDefault()
            }
        } else {
            this._beginFastEditing(eventArgs.originalEvent)
        }
    },
    _ctrlAKeyHandler: function(eventArgs, isEditing) {
        if (!isEditing && eventArgs.ctrl && !eventArgs.alt && "multiple" === this.option("selection.mode") && this.option("selection.allowSelectAll")) {
            this._selectionController.selectAll();
            eventArgs.originalEvent.preventDefault()
        }
    },
    _tabKeyHandler: function(eventArgs, isEditing) {
        var editingOptions = this.option("editing");
        var direction = eventArgs.shift ? "previous" : "next";
        var isOriginalHandlerRequired = !eventArgs.shift && this._isLastValidCell(this._focusedCellPosition) || eventArgs.shift && this._isFirstValidCell(this._focusedCellPosition);
        var eventTarget = eventArgs.originalEvent.target;
        var focusedViewElement = this._focusedView && this._focusedView.element();
        if (this._handleTabKeyOnMasterDetailCell(eventTarget, direction)) {
            return
        }(0, _renderer2.default)(focusedViewElement).addClass(FOCUS_STATE_CLASS);
        if (editingOptions && eventTarget && !isOriginalHandlerRequired) {
            if ((0, _renderer2.default)(eventTarget).hasClass(this.addWidgetPrefix(ROWS_VIEW_CLASS))) {
                this._resetFocusedCell()
            }
            if (isEditing) {
                if (!this._editingCellTabHandler(eventArgs, direction)) {
                    return
                }
            } else {
                if (this._targetCellTabHandler(eventArgs, direction)) {
                    isOriginalHandlerRequired = true
                }
            }
        }
        if (isOriginalHandlerRequired) {
            this.getController("editorFactory").loseFocus();
            if (this._editingController.isEditing() && !this._isRowEditMode()) {
                this._resetFocusedCell();
                this._editingController.closeEditCell()
            }
        } else {
            eventArgs.originalEvent.preventDefault()
        }
    },
    _editingCellTabHandler: function(eventArgs, direction) {
        var eventTarget = eventArgs.originalEvent.target;
        var $cell = this._getCellElementFromTarget(eventTarget);
        var isEditingAllowed;
        var $event = eventArgs.originalEvent;
        var elementType = this._getElementType(eventTarget);
        if ($cell.is(COMMAND_CELL_SELECTOR)) {
            return !this._targetCellTabHandler(eventArgs, direction)
        }
        this._updateFocusedCellPosition($cell);
        var nextCellInfo = this._getNextCellByTabKey($event, direction, elementType);
        $cell = nextCellInfo.$cell;
        if (!$cell || this._handleTabKeyOnMasterDetailCell($cell, direction)) {
            return false
        }
        var column = this._columnsController.getVisibleColumns()[this.getView("rowsView").getCellIndex($cell)];
        var row = this._dataController.items()[this._getRowIndex($cell && $cell.parent())];
        if (column.allowEditing) {
            var _isDataRow = !row || "data" === row.rowType;
            isEditingAllowed = this._editingController.allowUpdating({
                row: row
            }) ? _isDataRow : row && row.isNewRow
        }
        if (!isEditingAllowed) {
            this._editingController.closeEditCell()
        }
        if (this._focusCell($cell, !nextCellInfo.isHighlighted)) {
            if (!this._isRowEditMode() && isEditingAllowed) {
                this._editingController.editCell(this.getVisibleRowIndex(), this._focusedCellPosition.columnIndex)
            } else {
                this._focusInteractiveElement($cell, eventArgs.shift)
            }
        }
        return true
    },
    _targetCellTabHandler: function(eventArgs, direction) {
        var $event = eventArgs.originalEvent;
        var eventTarget = $event.target;
        var $cell = this._getCellElementFromTarget(eventTarget);
        var $lastInteractiveElement = this._getInteractiveElement($cell, !eventArgs.shift);
        var isOriginalHandlerRequired = false;
        var elementType;
        if (!isEditorCell(this, $cell) && $lastInteractiveElement.length && eventTarget !== $lastInteractiveElement.get(0)) {
            isOriginalHandlerRequired = true
        } else {
            if (void 0 === this._focusedCellPosition.rowIndex && (0, _renderer2.default)(eventTarget).hasClass(ROW_CLASS)) {
                this._updateFocusedCellPosition((0, _renderer2.default)(eventTarget).children().first())
            }
            elementType = this._getElementType(eventTarget);
            if (this.isRowFocusType()) {
                this.setCellFocusType();
                if ("row" === elementType && isDataRow((0, _renderer2.default)(eventTarget))) {
                    eventTarget = this.getFirstValidCellInRow((0, _renderer2.default)(eventTarget));
                    elementType = this._getElementType(eventTarget)
                }
            }
            var nextCellInfo = this._getNextCellByTabKey($event, direction, elementType);
            $cell = nextCellInfo.$cell;
            if (!$cell) {
                return false
            }
            $cell = this._checkNewLineTransition($event, $cell);
            if (!$cell) {
                return false
            }
            this._focusCell($cell, !nextCellInfo.isHighlighted);
            if (!isEditorCell(this, $cell)) {
                this._focusInteractiveElement($cell, eventArgs.shift)
            }
        }
        return isOriginalHandlerRequired
    },
    _getNextCellByTabKey: function($event, direction, elementType) {
        var $cell = this._getNextCell(direction, elementType);
        var args = $cell && this._fireFocusedCellChanging($event, $cell, true);
        if (!args || args.cancel) {
            return {}
        }
        if (args.$newCellElement) {
            $cell = args.$newCellElement
        }
        return {
            $cell: $cell,
            isHighlighted: args.isHighlighted
        }
    },
    _checkNewLineTransition: function($event, $cell) {
        var rowIndex = this.getVisibleRowIndex();
        var $row = $cell.parent();
        if (rowIndex !== this._getRowIndex($row)) {
            var cellPosition = this._getCellPosition($cell);
            var args = this._fireFocusedRowChanging($event, $row);
            if (args.cancel) {
                return
            }
            if (args.rowIndexChanged) {
                this.setFocusedColumnIndex(cellPosition.columnIndex);
                $cell = this._getFocusedCell()
            }
        }
        return $cell
    },
    _enterKeyHandler: function(eventArgs, isEditing) {
        var $cell = this._getFocusedCell();
        var rowIndex = this.getVisibleRowIndex();
        var $row = this._focusedView && this._focusedView.getRow(rowIndex);
        if (this.option("grouping.allowCollapsing") && isGroupRow($row) || this.option("masterDetail.enabled") && $cell && $cell.hasClass(COMMAND_EXPAND_CLASS)) {
            var key = this._dataController.getKeyByRowIndex(rowIndex);
            var item = this._dataController.items()[rowIndex];
            if (void 0 !== key && item && item.data && !item.data.isContinuation) {
                this._dataController.changeRowExpand(key)
            }
        } else {
            this._processEnterKeyForDataCell(eventArgs, isEditing)
        }
    },
    _processEnterKeyForDataCell: function(eventArgs, isEditing) {
        var direction = this._getEnterKeyDirection(eventArgs);
        var allowEditingOnEnterKey = this._allowEditingOnEnterKey();
        if (isEditing || !allowEditingOnEnterKey && direction) {
            this._handleEnterKeyEditingCell(eventArgs.originalEvent);
            if ("next" === direction || "previous" === direction) {
                this._targetCellTabHandler(eventArgs, direction)
            } else {
                if ("upArrow" === direction || "downArrow" === direction) {
                    this._navigateNextCell(eventArgs.originalEvent, direction)
                }
            }
        } else {
            if (allowEditingOnEnterKey) {
                this._startEditing(eventArgs)
            }
        }
    },
    _getEnterKeyDirection: function(eventArgs) {
        var enterKeyDirection = this.option("keyboardNavigation.enterKeyDirection");
        var isShift = eventArgs.shift;
        if ("column" === enterKeyDirection) {
            return isShift ? "upArrow" : "downArrow"
        }
        if ("row" === enterKeyDirection) {
            return isShift ? "previous" : "next"
        }
    },
    _handleEnterKeyEditingCell: function(event) {
        var target = event.target;
        var $cell = this._getCellElementFromTarget(target);
        var isRowEditMode = this._isRowEditMode();
        this._updateFocusedCellPosition($cell);
        if (isRowEditMode) {
            this._focusEditFormCell($cell);
            setTimeout(this._editingController.saveEditData.bind(this._editingController))
        } else {
            _events_engine2.default.trigger((0, _renderer2.default)(target), "change");
            this._editingController.closeEditCell();
            event.preventDefault()
        }
    },
    _escapeKeyHandler: function(eventArgs, isEditing) {
        var $cell = this._getCellElementFromTarget(eventArgs.originalEvent.target);
        if (isEditing) {
            this._updateFocusedCellPosition($cell);
            if (!this._isRowEditMode()) {
                if ("cell" === this._editingController.getEditMode()) {
                    this._editingController.cancelEditData()
                } else {
                    this._editingController.closeEditCell()
                }
            } else {
                this._focusEditFormCell($cell);
                this._editingController.cancelEditData()
            }
            eventArgs.originalEvent.preventDefault()
        }
    },
    _ctrlFKeyHandler: function(eventArgs) {
        if (this.option("searchPanel.visible")) {
            var searchTextEditor = this._headerPanel.getSearchTextEditor();
            if (searchTextEditor) {
                searchTextEditor.focus();
                eventArgs.originalEvent.preventDefault()
            }
        }
    },
    _f2KeyHandler: function() {
        var isEditing = this._editingController.isEditing();
        var rowIndex = this.getVisibleRowIndex();
        var $row = this._focusedView && this._focusedView.getRow(rowIndex);
        if (!isEditing && isDataRow($row)) {
            this._startEditing()
        }
    },
    _navigateNextCell: function($event, keyCode) {
        var $cell = this._getNextCell(keyCode);
        if ($cell && this._isCellValid($cell)) {
            return this._arrowKeysHandlerFocusCell($event, $cell, true)
        }
        return false
    },
    _arrowKeysHandlerFocusCell: function($event, $cell, upDown) {
        var args = this._fireFocusChangingEvents($event, $cell, upDown, true);
        $cell = args.$newCellElement;
        if (!args.cancel && this._isCellValid($cell)) {
            this._focus($cell, !args.isHighlighted);
            return true
        }
        return false
    },
    _beginFastEditing: function(originalEvent, isDeleting) {
        if (!this._isFastEditingAllowed() || originalEvent.altKey || originalEvent.ctrlKey || this._editingController.isEditing()) {
            return false
        }
        if (isDeleting) {
            this._startEditing(originalEvent, FAST_EDITING_DELETE_KEY)
        } else {
            var key = originalEvent.key;
            var keyCode = originalEvent.keyCode || originalEvent.which;
            var fastEditingKey = key || keyCode && String.fromCharCode(keyCode);
            if (fastEditingKey && (1 === fastEditingKey.length || fastEditingKey === FAST_EDITING_DELETE_KEY)) {
                this._startEditing(originalEvent, fastEditingKey)
            }
        }
        return true
    },
    _pointerEventHandler: function(e) {
        var event = e.event || e;
        var $target = (0, _renderer2.default)(event.currentTarget);
        var rowsView = this.getView("rowsView");
        var focusedViewElement = rowsView && rowsView.element();
        var $parent = $target.parent();
        var isEditingRow = $parent.hasClass(EDIT_ROW_CLASS);
        var isInteractiveElement = (0, _renderer2.default)(event.target).is(INTERACTIVE_ELEMENTS_SELECTOR);
        var isCommandButtonTarget = (0, _renderer2.default)(event.target).hasClass("dx-link");
        if (isCommandButtonTarget) {
            this.setCellFocusType();
            return
        }
        if (this._isEventInCurrentGrid(event) && this._isCellValid($target, !isInteractiveElement)) {
            $target = this._isInsideEditForm($target) ? (0, _renderer2.default)(event.target) : $target;
            this._focusView();
            (0, _renderer2.default)(focusedViewElement).removeClass(FOCUS_STATE_CLASS);
            if ($parent.hasClass(FREESPACE_ROW_CLASS)) {
                this._updateFocusedCellPosition($target);
                this._focusedView.element().attr("tabindex", 0);
                this._focusedView.focus()
            } else {
                if (!this._isMasterDetailCell($target) && !isEditingRow) {
                    this._clickTargetCellHandler(event, $target)
                } else {
                    this._updateFocusedCellPosition($target)
                }
            }
        } else {
            if ($target.is("td")) {
                this._resetFocusedCell()
            }
        }
    },
    _clickTargetCellHandler: function(event, $cell) {
        var columnIndex = this.getView("rowsView").getCellIndex($cell);
        var column = this._columnsController.getVisibleColumns()[columnIndex];
        var isCellEditMode = this._isCellEditMode();
        this.setCellFocusType();
        var args = this._fireFocusChangingEvents(event, $cell, true);
        $cell = args.$newCellElement;
        if (!args.cancel) {
            if (args.resetFocusedRow) {
                this.getController("focus")._resetFocusedRow();
                return
            }
            if (args.rowIndexChanged) {
                $cell = this._getFocusedCell()
            }
            if (!args.isHighlighted && !isCellEditMode) {
                this.setRowFocusType()
            }
            this._updateFocusedCellPosition($cell);
            if (this._allowRowUpdating() && isCellEditMode && column && column.allowEditing) {
                this._isNeedFocus = false;
                this._isHiddenFocus = false
            } else {
                var $target = event && (0, _renderer2.default)(event.target).closest(INTERACTIVE_ELEMENTS_SELECTOR + ", td");
                var isInteractiveTarget = $target && $target.not($cell).is(INTERACTIVE_ELEMENTS_SELECTOR);
                var isEditor = !column.command && $cell.hasClass(EDITOR_CELL_CLASS);
                var isDisabled = !isEditor && (!args.isHighlighted || isInteractiveTarget);
                this._focus($cell, isDisabled, isInteractiveTarget)
            }
        } else {
            this.setRowFocusType();
            this.setFocusedRowIndex(args.prevRowIndex);
            $cell = this._getFocusedCell();
            if (this._editingController.isEditing() && isCellEditMode) {
                this._editingController.closeEditCell()
            }
        }
    },
    _allowRowUpdating: function() {
        var rowIndex = this.getVisibleRowIndex();
        var row = this._dataController.items()[rowIndex];
        return this._editingController.allowUpdating({
            row: row
        }, "click")
    },
    focus: function(element) {
        var activeElementSelector;
        var focusedRowEnabled = this.option("focusedRowEnabled");
        var isHighlighted = isCellElement((0, _renderer2.default)(element));
        if (!element) {
            activeElementSelector = ".dx-datagrid-rowsview .dx-row[tabindex]";
            if (!focusedRowEnabled) {
                activeElementSelector += ", .dx-datagrid-rowsview .dx-row > td[tabindex]"
            }
            element = this.component.$element().find(activeElementSelector).first()
        }
        element && this._focusElement((0, _renderer2.default)(element), isHighlighted)
    },
    getFocusedView: function() {
        return this._focusedView
    },
    setupFocusedView: function() {
        if (this.isKeyboardEnabled() && !(0, _type.isDefined)(this._focusedView)) {
            this._focusView()
        }
    },
    _focusElement: function($element, isHighlighted) {
        var rowsViewElement = (0, _renderer2.default)(this._getRowsViewElement());
        var $focusedView = $element.closest(rowsViewElement);
        var isRowFocusType = this.isRowFocusType();
        var args = {};
        if (!$focusedView.length || isCellElement($element) && !this._isCellValid($element)) {
            return
        }
        this._focusView();
        this._isNeedFocus = true;
        this._isNeedScroll = true;
        if (isCellElement($element) || isGroupRow($element)) {
            this.setCellFocusType();
            args = this._fireFocusChangingEvents(null, $element, false, isHighlighted);
            $element = args.$newCellElement;
            if (isRowFocusType && !args.isHighlighted) {
                this.setRowFocusType()
            }
        }
        this._focus($element, !args.isHighlighted);
        this._focusInteractiveElement($element)
    },
    _getFocusedViewByElement: function($element) {
        var view = this.getFocusedView();
        var $view = view && (0, _renderer2.default)(view.element());
        return $element && 0 !== $element.closest($view).length
    },
    _focusView: function() {
        this._focusedView = this.getView("rowsView")
    },
    _focusInteractiveElement: function($cell, isLast) {
        if (!$cell) {
            return
        }
        var $focusedElement = this._getInteractiveElement($cell, isLast);
        (0, _uiGrid_core3.focusAndSelectElement)(this, $focusedElement)
    },
    _focus: function($cell, disableFocus, isInteractiveElement) {
        var $row = $cell && !$cell.hasClass(ROW_CLASS) ? $cell.closest(".".concat(ROW_CLASS)) : $cell;
        if ($row && isNotFocusedRow($row)) {
            return
        }
        var $prevFocusedCell = this._getFocusedCell();
        var focusedView = this._focusedView;
        var $focusViewElement = focusedView && focusedView.element();
        var $focusElement;
        this._isHiddenFocus = disableFocus;
        if (isGroupRow($row) || this.isRowFocusType()) {
            $focusElement = $row;
            if (focusedView) {
                this.setFocusedRowIndex(this._getRowIndex($row))
            }
        } else {
            if (isCellElement($cell)) {
                $focusElement = $cell;
                this._updateFocusedCellPosition($cell)
            }
        }
        $prevFocusedCell && $prevFocusedCell.is("td") && $prevFocusedCell.not($focusElement).removeAttr("tabIndex");
        if ($focusElement) {
            _events_engine2.default.one($focusElement, "blur", function(e) {
                if (e.relatedTarget) {
                    $focusElement.removeClass(CELL_FOCUS_DISABLED_CLASS)
                }
            });
            if (!isInteractiveElement) {
                this._applyTabIndexToElement($focusElement);
                _events_engine2.default.trigger($focusElement, "focus")
            }
            if (disableFocus) {
                $focusViewElement && $focusViewElement.find("." + CELL_FOCUS_DISABLED_CLASS + "[tabIndex]").not($focusElement).removeClass(CELL_FOCUS_DISABLED_CLASS).removeAttr("tabIndex");
                $focusElement.addClass(CELL_FOCUS_DISABLED_CLASS)
            } else {
                $focusViewElement && $focusViewElement.find("." + CELL_FOCUS_DISABLED_CLASS + ":not(." + MASTER_DETAIL_CELL_CLASS + ")").removeClass(CELL_FOCUS_DISABLED_CLASS);
                this.getController("editorFactory").focus($focusElement)
            }
        }
    },
    _updateFocus: function(isRenderView) {
        var that = this;
        setTimeout(function() {
            var $cell = that._getFocusedCell();
            var isEditing = that.getController("editing").isEditing();
            if ($cell && !(that._isMasterDetailCell($cell) && !that._isRowEditMode())) {
                if (that._hasSkipRow($cell.parent())) {
                    var direction = that._focusedCellPosition && that._focusedCellPosition.rowIndex > 0 ? "upArrow" : "downArrow";
                    $cell = that._getNextCell(direction)
                }
                if (isElementDefined($cell)) {
                    if (isRenderView && !isEditing && that._checkCellOverlapped($cell)) {
                        return
                    }
                    if ($cell.is("td") || $cell.hasClass(that.addWidgetPrefix(EDIT_FORM_ITEM_CLASS))) {
                        var isCommandCell = $cell.is(COMMAND_CELL_SELECTOR);
                        if (!isCommandCell && that.getController("editorFactory").focus()) {
                            that._focus($cell)
                        } else {
                            if (that._isCellEditMode()) {
                                that._focus($cell, that._isHiddenFocus)
                            } else {
                                if (that._isHiddenFocus) {
                                    that._focus($cell, true)
                                }
                            }
                        }
                        if (isEditing) {
                            that._focusInteractiveElement.bind(that)($cell)
                        }
                    } else {
                        _events_engine2.default.trigger($cell, "focus")
                    }
                }
            }
        })
    },
    _checkCellOverlapped: function($cell) {
        var cellOffset = $cell.offset();
        var hasScrollable = this.component.getScrollable && this.component.getScrollable();
        var isOverlapped = false;
        if (hasScrollable) {
            if (cellOffset.left < 0) {
                isOverlapped = $cell.width() + cellOffset.left <= 0
            } else {
                if (cellOffset.top < 0) {
                    isOverlapped = $cell.height() + cellOffset.top <= 0
                }
            }
        }
        return isOverlapped
    },
    _getFocusedCell: function() {
        return (0, _renderer2.default)(this._getCell(this._focusedCellPosition))
    },
    _updateFocusedCellPosition: function($cell, direction) {
        var position = this._getCellPosition($cell, direction);
        if (position) {
            if (!$cell.length || position.rowIndex >= 0 && position.columnIndex >= 0) {
                this.setFocusedCellPosition(position.rowIndex, position.columnIndex)
            }
        }
        return position
    },
    _getCellPosition: function($cell, direction) {
        var that = this;
        var rowIndex;
        var columnIndex;
        var $row = isElementDefined($cell) && $cell.closest("tr");
        if (isElementDefined($row) && that._focusedView) {
            rowIndex = that._getRowIndex($row);
            columnIndex = that._focusedView.getCellIndex($cell, rowIndex);
            if (direction) {
                columnIndex = "previous" === direction ? columnIndex - 1 : columnIndex + 1;
                columnIndex = that._applyColumnIndexBoundaries(columnIndex)
            }
            return {
                rowIndex: rowIndex,
                columnIndex: columnIndex
            }
        }
    },
    _focusCell: function($cell, isDisabled) {
        if (this._isCellValid($cell)) {
            this._focus($cell, isDisabled);
            return true
        }
    },
    _focusEditFormCell: function($cell) {
        if ($cell.hasClass(MASTER_DETAIL_CELL_CLASS)) {
            this.getController("editorFactory").focus($cell, true)
        }
    },
    _resetFocusedCell: function() {
        var that = this;
        var $cell = that._getFocusedCell();
        $cell && $cell.removeAttr("tabIndex");
        that._focusedView && that._focusedView.renderFocusState && that._focusedView.renderFocusState();
        that._isNeedFocus = false;
        that._isNeedScroll = false;
        that._focusedCellPosition = {}
    },
    restoreFocusableElement: function(rowIndex, $event) {
        var that = this;
        var args;
        var $rowElement;
        var isUpArrow = (0, _type.isDefined)(rowIndex);
        var rowsView = that.getView("rowsView");
        var $rowsViewElement = rowsView.element();
        var columnIndex = that._focusedCellPosition.columnIndex;
        var rowIndexOffset = that._dataController.getRowIndexOffset();
        rowIndex = isUpArrow ? rowIndex : rowsView.getTopVisibleItemIndex() + rowIndexOffset;
        if (!isUpArrow) {
            that.getController("editorFactory").loseFocus();
            that._applyTabIndexToElement($rowsViewElement);
            _events_engine2.default.trigger($rowsViewElement, "focus")
        } else {
            $rowElement = rowsView.getRow(rowIndex - rowIndexOffset);
            args = that._fireFocusedRowChanging($event, $rowElement);
            if (!args.cancel && args.rowIndexChanged) {
                rowIndex = args.newRowIndex
            }
        }
        if (!isUpArrow || !args.cancel) {
            that.setFocusedCellPosition(rowIndex, columnIndex)
        }
        isUpArrow && that._updateFocus()
    },
    _getNewPositionByCode: function(cellPosition, elementType, code) {
        var columnIndex = cellPosition.columnIndex;
        var rowIndex = cellPosition.rowIndex;
        var visibleColumnsCount;
        if (void 0 === cellPosition.rowIndex && "next" === code) {
            return {
                columnIndex: 0,
                rowIndex: 0
            }
        }
        switch (code) {
            case "nextInRow":
            case "next":
                visibleColumnsCount = this._getVisibleColumnCount();
                if (columnIndex < visibleColumnsCount - 1 && !this._isLastValidCell({
                        columnIndex: columnIndex,
                        rowIndex: rowIndex
                    }) && "row" !== elementType) {
                    columnIndex++
                } else {
                    if (!this._isLastRow(rowIndex) && "next" === code) {
                        columnIndex = 0;
                        rowIndex++
                    }
                }
                break;
            case "previousInRow":
            case "previous":
                if (columnIndex > 0 && !this._isFirstValidCell({
                        columnIndex: columnIndex,
                        rowIndex: rowIndex
                    }) && "row" !== elementType) {
                    columnIndex--
                } else {
                    if (rowIndex > 0 && "previous" === code) {
                        rowIndex--;
                        visibleColumnsCount = this._getVisibleColumnCount();
                        columnIndex = visibleColumnsCount - 1
                    }
                }
                break;
            case "upArrow":
                rowIndex = rowIndex > 0 ? rowIndex - 1 : rowIndex;
                break;
            case "downArrow":
                rowIndex = !this._isLastRow(rowIndex) ? rowIndex + 1 : rowIndex
        }
        return {
            columnIndex: columnIndex,
            rowIndex: rowIndex
        }
    },
    setFocusedCellPosition: function(rowIndex, columnIndex) {
        this.setFocusedRowIndex(rowIndex);
        this.setFocusedColumnIndex(columnIndex)
    },
    setFocusedRowIndex: function(rowIndex) {
        if (!this._focusedCellPosition) {
            this._focusedCellPosition = {}
        }
        this._focusedCellPosition.rowIndex = rowIndex
    },
    setFocusedColumnIndex: function(columnIndex) {
        if (!this._focusedCellPosition) {
            this._focusedCellPosition = {}
        }
        this._focusedCellPosition.columnIndex = columnIndex
    },
    getVisibleRowIndex: function() {
        if (this._focusedCellPosition) {
            if (!this._focusedCellPosition.rowIndex) {
                return this._focusedCellPosition.rowIndex
            }
            return this._focusedCellPosition.rowIndex - this._dataController.getRowIndexOffset()
        }
        return null
    },
    getVisibleColumnIndex: function() {
        if (this._focusedCellPosition) {
            return (0, _type.isDefined)(this._focusedCellPosition.columnIndex) ? this._focusedCellPosition.columnIndex : -1
        }
        return -1
    },
    getFocusedColumnIndex: function() {
        return this._focusedCellPosition ? this._focusedCellPosition.columnIndex : null
    },
    _applyColumnIndexBoundaries: function(columnIndex) {
        var visibleColumnsCount = this._getVisibleColumnCount();
        if (columnIndex < 0) {
            columnIndex = 0
        } else {
            if (columnIndex >= visibleColumnsCount) {
                columnIndex = visibleColumnsCount - 1
            }
        }
        return columnIndex
    },
    _isCellByPositionValid: function(cellPosition) {
        var $cell = (0, _renderer2.default)(this._getCell(cellPosition));
        return this._isCellValid($cell)
    },
    _isLastRow: function(rowIndex) {
        if (this._isVirtualScrolling()) {
            return rowIndex >= this._dataController.totalItemsCount() - 1
        }
        return rowIndex === this.getController("data").items().length - 1
    },
    _isFirstValidCell: function(cellPosition) {
        var isFirstValidCell = false;
        if (0 === cellPosition.rowIndex && cellPosition.columnIndex >= 0) {
            isFirstValidCell = isFirstValidCell || !this._haveValidCellBeforePosition(cellPosition)
        }
        return isFirstValidCell
    },
    _haveValidCellBeforePosition: function(cellPosition) {
        var columnIndex = cellPosition.columnIndex;
        var hasValidCells = false;
        while (columnIndex > 0 && !hasValidCells) {
            var checkingPosition = {
                columnIndex: --columnIndex,
                rowIndex: cellPosition.rowIndex
            };
            hasValidCells = this._isCellByPositionValid(checkingPosition)
        }
        return hasValidCells
    },
    _isLastValidCell: function(cellPosition) {
        var nextColumnIndex = cellPosition.columnIndex >= 0 ? cellPosition.columnIndex + 1 : 0;
        var rowIndex = cellPosition.rowIndex;
        var checkingPosition = {
            columnIndex: nextColumnIndex,
            rowIndex: rowIndex
        };
        var visibleRows = this.component.getVisibleRows();
        var row = visibleRows && visibleRows[rowIndex];
        var isLastRow = this._isLastRow(rowIndex);
        if (!isLastRow) {
            return false
        }
        if (row && "group" === row.rowType && cellPosition.columnIndex > 0) {
            return true
        }
        if (cellPosition.columnIndex === this._getVisibleColumnCount() - 1) {
            return true
        }
        if (this._isCellByPositionValid(checkingPosition)) {
            return false
        }
        return this._isLastValidCell(checkingPosition)
    },
    _isCellValid: function($cell, isClick) {
        if (isElementDefined($cell) && this._columnsController) {
            var rowsView = this.getView("rowsView");
            var $row = $cell.parent();
            var visibleColumns = this._columnsController.getVisibleColumns();
            var columnIndex = rowsView.getCellIndex($cell);
            var column = visibleColumns[columnIndex];
            var visibleColumnCount = this._getVisibleColumnCount();
            var editingController = this._editingController;
            var isMasterDetailRow = isDetailRow($row);
            var isShowWhenGrouped = column && column.showWhenGrouped;
            var isDataCell = column && !$cell.hasClass(COMMAND_EXPAND_CLASS) && isDataRow($row);
            var isValidGroupSpaceColumn = function() {
                return !isMasterDetailRow && column && (!(0, _type.isDefined)(column.groupIndex) || isShowWhenGrouped && isDataCell) || parseInt($cell.attr("colspan")) > 1
            };
            if (this._isMasterDetailCell($cell)) {
                return true
            }
            if (visibleColumnCount > columnIndex && isValidGroupSpaceColumn()) {
                var rowItems = this._dataController.items();
                var visibleRowIndex = rowsView.getRowIndex($row);
                var row = rowItems[visibleRowIndex];
                var isCellEditing = editingController && this._isCellEditMode() && editingController.isEditing();
                var isRowEditingInCurrentRow = editingController && editingController.isEditRow(visibleRowIndex);
                var isEditing = isRowEditingInCurrentRow || isCellEditing;
                if (column.command) {
                    if (this._isLegacyNavigation()) {
                        return !isEditing && "expand" === column.command
                    }
                    if (isCellEditing) {
                        return !column.command
                    }
                    if (isRowEditingInCurrentRow) {
                        return "select" !== column.command
                    }
                    return !isEditing
                }
                if (isCellEditing && row && "data" !== row.rowType) {
                    return false
                }
                return !isEditing || column.allowEditing || isClick
            }
        }
    },
    getFirstValidCellInRow: function($row, columnIndex) {
        var that = this;
        var $cells = $row.find("> td");
        var $cell;
        var $result;
        columnIndex = columnIndex || 0;
        for (var i = columnIndex; i < $cells.length; ++i) {
            $cell = $cells.eq(i);
            if (that._isCellValid($cell)) {
                $result = $cell;
                break
            }
        }
        return $result
    },
    _getNextCell: function(keyCode, elementType, cellPosition) {
        var focusedCellPosition = cellPosition || this._focusedCellPosition;
        var isRowFocusType = this.isRowFocusType();
        var includeCommandCells = isRowFocusType || (0, _array.inArray)(keyCode, ["next", "previous"]) > -1;
        var rowIndex;
        var newFocusedCellPosition;
        var isLastCellOnDirection = "previous" === keyCode ? this._isFirstValidCell(focusedCellPosition) : this._isLastValidCell(focusedCellPosition);
        var $cell;
        var $row;
        if (this._focusedView && focusedCellPosition) {
            newFocusedCellPosition = this._getNewPositionByCode(focusedCellPosition, elementType, keyCode);
            $cell = (0, _renderer2.default)(this._getCell(newFocusedCellPosition));
            if (isElementDefined($cell) && !this._isCellValid($cell) && this._isCellInRow(newFocusedCellPosition, includeCommandCells) && !isLastCellOnDirection) {
                if (isRowFocusType) {
                    $cell = this.getFirstValidCellInRow($cell.parent(), newFocusedCellPosition.columnIndex)
                } else {
                    $cell = this._getNextCell(keyCode, "cell", newFocusedCellPosition)
                }
            }
            $row = isElementDefined($cell) && $cell.parent();
            if (this._hasSkipRow($row)) {
                rowIndex = this._getRowIndex($row);
                if (!this._isLastRow(rowIndex)) {
                    $cell = this._getNextCell(keyCode, "row", {
                        columnIndex: focusedCellPosition.columnIndex,
                        rowIndex: rowIndex
                    })
                } else {
                    return null
                }
            }
            return isElementDefined($cell) ? $cell : null
        }
        return null
    },
    _startEditing: function(eventArgs, fastEditingKey) {
        var focusedCellPosition = this._focusedCellPosition;
        var rowIndex = this.getVisibleRowIndex();
        var row = this._dataController.items()[rowIndex];
        var column = this._columnsController.getVisibleColumns()[focusedCellPosition.columnIndex];
        if (this._isAllowEditing(row, column)) {
            if (this._isRowEditMode()) {
                this._editingController.editRow(rowIndex)
            } else {
                if (focusedCellPosition) {
                    this._startEditingCell(eventArgs, fastEditingKey)
                }
            }
        }
    },
    _isAllowEditing: function(row, column) {
        return this.getController("editing").allowUpdating({
            row: row
        }) && column && column.allowEditing
    },
    _startEditingCell: function(eventArgs, fastEditingKey) {
        var that = this;
        var rowIndex = this.getVisibleRowIndex();
        var colIndex = this._focusedCellPosition.columnIndex;
        this._fastEditingStarted = (0, _type.isDefined)(fastEditingKey);
        var deferred = this._editingController.editCell(rowIndex, colIndex);
        if (this._isFastEditingStarted()) {
            if (true === deferred) {
                that._editingCellHandler(eventArgs, fastEditingKey)
            } else {
                if (deferred && deferred.done) {
                    var editorValue = fastEditingKey !== FAST_EDITING_DELETE_KEY ? fastEditingKey : "";
                    deferred.done(function() {
                        return that._editingCellHandler(eventArgs, editorValue)
                    })
                }
            }
        }
    },
    _editingCellHandler: function(eventArgs, editorValue) {
        var $input = this._getFocusedCell().find(".dx-texteditor-input").eq(0);
        var keyDownEvent = _utils2.default.createEvent(eventArgs, {
            type: "keydown",
            target: $input.get(0)
        });
        var keyPressEvent = _utils2.default.createEvent(eventArgs, {
            type: "keypress",
            target: $input.get(0)
        });
        var inputEvent = _utils2.default.createEvent(eventArgs, {
            type: "input",
            target: $input.get(0)
        });
        _events_engine2.default.trigger($input, keyDownEvent);
        if (!keyDownEvent.isDefaultPrevented()) {
            _events_engine2.default.trigger($input, keyPressEvent);
            if (!keyPressEvent.isDefaultPrevented()) {
                setTimeout(function() {
                    $input.val(editorValue);
                    var $widgetContainer = $input.closest(".".concat(WIDGET_CLASS));
                    _events_engine2.default.off($widgetContainer, "focusout");
                    _events_engine2.default.one($widgetContainer, "focusout", function() {
                        _events_engine2.default.trigger($input, "change")
                    });
                    _events_engine2.default.trigger($input, inputEvent)
                })
            }
        }
    },
    _fireFocusChangingEvents: function($event, $cell, fireRowEvent, isHighlighted) {
        var args = {};
        var cellPosition = this._getCellPosition($cell) || {};
        if (this.isCellFocusType()) {
            args = this._fireFocusedCellChanging($event, $cell, isHighlighted);
            if (!args.cancel) {
                cellPosition.columnIndex = args.newColumnIndex;
                cellPosition.rowIndex = args.newRowIndex;
                isHighlighted = args.isHighlighted;
                $cell = (0, _renderer2.default)(this._getCell(cellPosition))
            }
        }
        if (!args.cancel && fireRowEvent && $cell) {
            args = this._fireFocusedRowChanging($event, $cell.parent());
            if (!args.cancel) {
                cellPosition.rowIndex = args.newRowIndex;
                args.isHighlighted = isHighlighted
            }
        }
        args.$newCellElement = (0, _renderer2.default)(this._getCell(cellPosition));
        if (!args.$newCellElement.length) {
            args.$newCellElement = $cell
        }
        return args
    },
    _fireFocusedCellChanging: function($event, $cellElement, isHighlighted) {
        var that = this;
        var prevCellIndex = that.option("focusedColumnIndex");
        var prevRowIndex = that.option("focusedRowIndex");
        var cellPosition = that._getCellPosition($cellElement);
        var columnIndex = cellPosition ? cellPosition.columnIndex : -1;
        var rowIndex = cellPosition ? cellPosition.rowIndex : -1;
        var args = {
            cellElement: $cellElement,
            prevColumnIndex: prevCellIndex,
            prevRowIndex: prevRowIndex,
            newColumnIndex: columnIndex,
            newRowIndex: rowIndex,
            rows: that.getController("data").getVisibleRows(),
            columns: that.getController("columns").getVisibleColumns(),
            event: $event,
            isHighlighted: isHighlighted || false,
            cancel: false
        };
        this._canceledCellPosition = null;
        that.executeAction("onFocusedCellChanging", args);
        if (args.newColumnIndex !== columnIndex || args.newRowIndex !== rowIndex) {
            args.$newCellElement = (0, _renderer2.default)(this._getCell({
                columnIndex: args.newColumnIndex,
                rowIndex: args.newRowIndex
            }))
        }
        if (args.cancel) {
            this._canceledCellPosition = {
                rowIndex: rowIndex,
                columnIndex: columnIndex
            }
        }
        return args
    },
    _fireFocusedCellChanged: function($cellElement, prevCellIndex, prevRowIndex) {
        var that = this;
        var dataController = that.getController("data");
        var columnIndex = that.getView("rowsView").getCellIndex($cellElement);
        var rowIndex = this._getRowIndex($cellElement && $cellElement.parent());
        var localRowIndex = Math.min(rowIndex - dataController.getRowIndexOffset(), dataController.items().length - 1);
        var isEditingCell = that.getController("editing").isEditCell(localRowIndex, columnIndex);
        var row = dataController.items()[localRowIndex];
        if (!isEditingCell && (prevCellIndex !== columnIndex || prevRowIndex !== rowIndex)) {
            dataController = that.getController("data");
            that.executeAction("onFocusedCellChanged", {
                cellElement: $cellElement,
                columnIndex: columnIndex,
                rowIndex: rowIndex,
                row: row,
                column: that.getController("columns").getVisibleColumns()[columnIndex]
            })
        }
    },
    _fireFocusedRowChanging: function(eventArgs, $newFocusedRow) {
        var newRowIndex = this._getRowIndex($newFocusedRow);
        var dataController = this.getController("data");
        var prevFocusedRowIndex = this.option("focusedRowIndex");
        var loadingOperationTypes = dataController.loadingOperationTypes();
        var args = {
            rowElement: $newFocusedRow,
            prevRowIndex: prevFocusedRowIndex,
            newRowIndex: newRowIndex,
            event: eventArgs,
            rows: this.getController("data").getVisibleRows(),
            cancel: false
        };
        if (!dataController || dataController.isLoading() && (loadingOperationTypes.reload || loadingOperationTypes.paging)) {
            args.cancel = true;
            return args
        }
        if (this.option("focusedRowEnabled")) {
            this.executeAction("onFocusedRowChanging", args);
            if (!args.cancel && args.newRowIndex !== newRowIndex) {
                args.resetFocusedRow = args.newRowIndex < 0;
                if (!args.resetFocusedRow) {
                    this.setFocusedRowIndex(args.newRowIndex)
                }
                args.rowIndexChanged = true
            }
        }
        return args
    },
    _fireFocusedRowChanged: function($rowElement) {
        var row;
        var dataController;
        var focusedRowKey = this.option("focusedRowKey");
        var focusController = this.getController("focus");
        var focusedRowIndex = null === focusController || void 0 === focusController ? void 0 : focusController.getFocusedRowIndexByKey(focusedRowKey);
        if (this.option("focusedRowEnabled")) {
            if (focusedRowIndex >= 0) {
                dataController = this.getController("data");
                row = focusedRowIndex >= 0 && dataController.getVisibleRows()[focusedRowIndex - dataController.getRowIndexOffset()]
            }
            this.executeAction("onFocusedRowChanged", {
                rowElement: $rowElement,
                rowIndex: focusedRowIndex,
                row: row
            })
        }
    },
    _isEventInCurrentGrid: function(event) {
        return (0, _uiGrid_core3.isElementInCurrentGrid)(this, (0, _renderer2.default)(event.target))
    },
    _isRowEditMode: function() {
        var editMode = this.getController("editing").getEditMode();
        return editMode === EDIT_MODE_ROW || editMode === EDIT_MODE_FORM
    },
    _isCellEditMode: function() {
        var editMode = this.getController("editing").getEditMode();
        return editMode === EDIT_MODE_CELL || editMode === EDIT_MODE_BATCH
    },
    _isFastEditingAllowed: function() {
        return this._isCellEditMode() && this.option("keyboardNavigation.editOnKeyPress")
    },
    _getInteractiveElement: function($cell, isLast) {
        var $focusedElement = $cell.find(INTERACTIVE_ELEMENTS_SELECTOR).filter(":visible");
        return isLast ? $focusedElement.last() : $focusedElement.first()
    },
    _applyTabIndexToElement: function($element) {
        var tabIndex = this.option("tabIndex");
        $element.attr("tabIndex", (0, _type.isDefined)(tabIndex) ? tabIndex : 0)
    },
    _getCell: function(cellPosition) {
        if (this._focusedView && this._dataController && cellPosition) {
            return this._focusedView.getCell({
                rowIndex: cellPosition.rowIndex - this._dataController.getRowIndexOffset(),
                columnIndex: cellPosition.columnIndex
            })
        }
    },
    _getRowIndex: function($row) {
        var focusedView = this._focusedView;
        var rowIndex = -1;
        if (focusedView) {
            rowIndex = focusedView.getRowIndex($row)
        }
        if (rowIndex >= 0) {
            rowIndex += this.getController("data").getRowIndexOffset()
        }
        return rowIndex
    },
    _hasSkipRow: function($row) {
        var row = $row && $row.get(0);
        return row && ("none" === row.style.display || $row.hasClass(this.addWidgetPrefix(GROUP_FOOTER_CLASS)) || isDetailRow($row) && !$row.hasClass(this.addWidgetPrefix(EDIT_FORM_CLASS)))
    },
    _allowEditingOnEnterKey: function() {
        return "startEdit" === this.option("keyboardNavigation.enterKeyAction")
    },
    _isLegacyNavigation: function() {
        return this.option("useLegacyKeyboardNavigation")
    },
    _getDirectionCodeByKey: function(key) {
        var directionCode;
        if (this.option("rtlEnabled")) {
            directionCode = "leftArrow" === key ? "nextInRow" : "previousInRow"
        } else {
            directionCode = "leftArrow" === key ? "previousInRow" : "nextInRow"
        }
        return directionCode
    },
    _isVirtualScrolling: function() {
        var scrollingMode = this.option("scrolling.mode");
        return "virtual" === scrollingMode || "infinite" === scrollingMode
    },
    _scrollBy: function(top, rowIndex, $event) {
        var that = this;
        var scrollable = this.getView("rowsView").getScrollable();
        if (that._focusedCellPosition) {
            var scrollHandler = function scrollHandler() {
                scrollable.off("scroll", scrollHandler);
                setTimeout(that.restoreFocusableElement.bind(that, rowIndex, $event))
            };
            scrollable.on("scroll", scrollHandler)
        }
        scrollable.scrollBy({
            left: 0,
            top: top
        })
    },
    _isInsideEditForm: function(element) {
        return (0, _renderer2.default)(element).closest("." + this.addWidgetPrefix(EDIT_FORM_CLASS)).length > 0
    },
    _isMasterDetailCell: function(element) {
        var $masterDetailCell = (0, _renderer2.default)(element).closest("." + MASTER_DETAIL_CELL_CLASS);
        var $masterDetailGrid = $masterDetailCell.closest("." + this.getWidgetContainerClass()).parent();
        return $masterDetailCell.length && $masterDetailGrid.is(this.component.$element())
    },
    _processNextCellInMasterDetail: function($nextCell) {
        if (!this._isInsideEditForm($nextCell) && $nextCell) {
            this._applyTabIndexToElement($nextCell)
        }
    },
    _handleTabKeyOnMasterDetailCell: function(target, direction) {
        if (this._isMasterDetailCell(target)) {
            this._updateFocusedCellPosition((0, _renderer2.default)(target), direction);
            var $nextCell = this._getNextCell(direction, "row");
            this._processNextCellInMasterDetail($nextCell);
            return true
        }
        return false
    },
    _getElementType: function(target) {
        return (0, _renderer2.default)(target).is("tr") ? "row" : "cell"
    },
    _isFastEditingStarted: function() {
        return this._isFastEditingAllowed() && this._fastEditingStarted
    },
    _getVisibleColumnCount: function() {
        return this.getController("columns").getVisibleColumns().length
    },
    _isCellInRow: function(cellPosition, includeCommandCells) {
        var columnIndex = cellPosition.columnIndex;
        var visibleColumnsCount = this._getVisibleColumnCount();
        return includeCommandCells ? columnIndex >= 0 && columnIndex <= visibleColumnsCount - 1 : columnIndex > 0 && columnIndex < visibleColumnsCount - 1
    },
    _getCellElementFromTarget: function(target) {
        return (0, _renderer2.default)(target).closest(".".concat(ROW_CLASS, " > td"))
    },
    _getRowsViewElement: function() {
        var rowsView = this.getView("rowsView");
        return rowsView && rowsView.element()
    },
    isKeyboardEnabled: function() {
        return this.option("keyboardNavigation.enabled")
    },
    _processCanceledEditCellPosition: function(rowIndex, columnIndex) {
        if (this._canceledCellPosition) {
            var isCanceled = this._canceledCellPosition.rowIndex === rowIndex && this._canceledCellPosition.columnIndex === columnIndex;
            this._canceledCellPosition = null;
            return isCanceled
        }
    }
});
module.exports = {
    defaultOptions: function() {
        return {
            useLegacyKeyboardNavigation: false,
            keyboardNavigation: {
                enabled: true,
                enterKeyAction: "startEdit",
                enterKeyDirection: "none",
                editOnKeyPress: false
            }
        }
    },
    controllers: {
        keyboardNavigation: KeyboardNavigationController
    },
    extenders: {
        views: {
            rowsView: {
                _rowClick: function(e) {
                    var editRowIndex = this.getController("editing").getEditRowIndex();
                    var keyboardController = this.getController("keyboardNavigation");
                    if (editRowIndex === e.rowIndex) {
                        keyboardController.setCellFocusType()
                    }
                    var needTriggerPointerEventHandler = isMobile() && this.option("focusedRowEnabled");
                    if (needTriggerPointerEventHandler) {
                        this._triggerPointerDownEventHandler(e)
                    }
                    this.callBase.apply(this, arguments)
                },
                _triggerPointerDownEventHandler: function(e) {
                    var originalEvent = e.event.originalEvent;
                    if (originalEvent) {
                        var keyboardController = this.getController("keyboardNavigation");
                        var $cell = (0, _renderer2.default)(originalEvent.target);
                        var columnIndex = this.getCellIndex($cell);
                        var column = this.getController("columns").getVisibleColumns()[columnIndex];
                        var row = this.getController("data").items()[e.rowIndex];
                        if (keyboardController._isAllowEditing(row, column)) {
                            var eventArgs = _utils2.default.createEvent(originalEvent, {
                                currentTarget: originalEvent.target
                            });
                            keyboardController._pointerEventHandler(eventArgs)
                        }
                    }
                },
                renderFocusState: function() {
                    var dataController = this._dataController;
                    var rowIndex = this.option("focusedRowIndex") || 0;
                    var $rowsView = this.element();
                    var cellElements;
                    if ($rowsView && !(0, _selectors.focused)($rowsView)) {
                        $rowsView.attr("tabIndex", null)
                    }
                    if (rowIndex < 0 || rowIndex >= dataController.getVisibleRows().length) {
                        rowIndex = 0
                    }
                    cellElements = this.getCellElements(rowIndex);
                    if (this.getController("keyboardNavigation").isKeyboardEnabled() && cellElements) {
                        this.updateFocusElementTabIndex(cellElements)
                    }
                },
                updateFocusElementTabIndex: function(cellElements) {
                    var that = this;
                    var $row = cellElements.eq(0).parent();
                    var columnIndex = that.option("focusedColumnIndex");
                    var tabIndex = that.option("tabIndex") || 0;
                    if (!columnIndex || columnIndex < 0) {
                        columnIndex = 0
                    }
                    if (isGroupRow($row)) {
                        $row.attr("tabIndex", tabIndex)
                    } else {
                        that._updateFocusedCellTabIndex(cellElements, columnIndex)
                    }
                },
                _updateFocusedCellTabIndex: function(cellElements, columnIndex) {
                    var that = this;
                    var $cell;
                    var tabIndex = that.option("tabIndex") || 0;
                    var keyboardNavigation = that.getController("keyboardNavigation");
                    var oldFocusedView = keyboardNavigation._focusedView;
                    var cellElementsLength = cellElements ? cellElements.length : -1;
                    keyboardNavigation._focusedView = that;
                    if (cellElementsLength > 0) {
                        if (cellElementsLength <= columnIndex) {
                            columnIndex = cellElementsLength - 1
                        }
                        for (var i = columnIndex; i < cellElementsLength; ++i) {
                            $cell = (0, _renderer2.default)(cellElements[i]);
                            if (!keyboardNavigation._isMasterDetailCell($cell)) {
                                if (keyboardNavigation._isCellValid($cell) && isCellElement($cell)) {
                                    $cell.attr("tabIndex", tabIndex);
                                    keyboardNavigation.setCellFocusType();
                                    break
                                }
                            }
                        }
                    }
                    keyboardNavigation._focusedView = oldFocusedView
                },
                renderDelayedTemplates: function(change) {
                    this.callBase.apply(this, arguments);
                    if (!change || !change.repaintChangesOnly) {
                        this.renderFocusState()
                    }
                },
                _renderCore: function(change) {
                    this.callBase(change);
                    if (!change || !change.repaintChangesOnly) {
                        this.renderFocusState()
                    }
                },
                _editCellPrepared: function($cell) {
                    var editorInstance = this._getEditorInstance($cell);
                    var keyboardController = this.getController("keyboardNavigation");
                    var isEditingNavigationMode = keyboardController && keyboardController._isFastEditingStarted();
                    if (editorInstance && isEditingNavigationMode) {
                        this._handleEditingNavigationMode(editorInstance)
                    }
                    this.callBase.apply(this, arguments)
                },
                _handleEditingNavigationMode: function(editorInstance) {
                    ["downArrow", "upArrow"].forEach(function(keyName) {
                        var originalKeyHandler = editorInstance._supportedKeys()[keyName];
                        editorInstance.registerKeyHandler(keyName, function(e) {
                            var isDropDownOpened = "true" === editorInstance._input().attr("aria-expanded");
                            if (isDropDownOpened) {
                                return originalKeyHandler && originalKeyHandler.call(editorInstance, e)
                            }
                        })
                    });
                    editorInstance.registerKeyHandler("leftArrow", _common.noop);
                    editorInstance.registerKeyHandler("rightArrow", _common.noop);
                    var isDateBoxWithMask = editorInstance.NAME === DATEBOX_WIDGET_NAME && editorInstance.option("useMaskBehavior");
                    if (isDateBoxWithMask) {
                        editorInstance.registerKeyHandler("enter", _common.noop)
                    }
                },
                _getEditorInstance: function($cell) {
                    var $editor = $cell.find(".dx-texteditor").eq(0);
                    return (0, _uiGrid_core3.getWidgetInstance)($editor)
                }
            }
        },
        controllers: {
            editing: {
                editCell: function(rowIndex, columnIndex) {
                    var keyboardController = this.getController("keyboardNavigation");
                    if (keyboardController._processCanceledEditCellPosition(rowIndex, columnIndex)) {
                        return false
                    }
                    var isCellEditing = this.callBase(rowIndex, columnIndex);
                    if (isCellEditing) {
                        keyboardController.setupFocusedView()
                    }
                    return isCellEditing
                },
                editRow: function(rowIndex) {
                    var keyboardController = this.getController("keyboardNavigation");
                    var columnIndex = this.option("focusedColumnIndex");
                    var column = this._columnsController.getVisibleColumns()[columnIndex];
                    if (column && column.type || this.option("editing.mode") === EDIT_MODE_FORM) {
                        keyboardController._resetFocusedCell()
                    }
                    this.callBase(rowIndex)
                },
                addRow: function(parentKey) {
                    this.getController("keyboardNavigation").setupFocusedView();
                    return this.callBase.apply(this, arguments)
                },
                getFocusedCellInRow: function(rowIndex) {
                    var keyboardNavigationController = this.getController("keyboardNavigation");
                    var $cell = this.callBase(rowIndex);
                    if (keyboardNavigationController.isKeyboardEnabled() && keyboardNavigationController._focusedCellPosition.rowIndex === rowIndex) {
                        var $focusedCell = keyboardNavigationController._getFocusedCell();
                        if (isElementDefined($focusedCell) && !$focusedCell.hasClass("dx-command-edit")) {
                            $cell = $focusedCell
                        }
                    }
                    return $cell
                },
                _processCanceledEditingCell: function() {
                    var _this = this;
                    this.closeEditCell().done(function() {
                        var keyboardNavigation = _this.getController("keyboardNavigation");
                        keyboardNavigation._updateFocus()
                    })
                },
                init: function() {
                    this.callBase();
                    this._keyboardNavigationController = this.getController("keyboardNavigation")
                },
                closeEditCell: function() {
                    var keyboardNavigation = this.getController("keyboardNavigation");
                    keyboardNavigation._fastEditingStarted = false;
                    var result = this.callBase.apply(this, arguments);
                    keyboardNavigation._updateFocus();
                    return result
                },
                _delayedInputFocus: function() {
                    this._keyboardNavigationController._isNeedScroll = true;
                    this.callBase.apply(this, arguments)
                },
                _isEditingStart: function() {
                    var keyboardNavigation = this.getController("keyboardNavigation");
                    var cancel = this.callBase.apply(this, arguments);
                    if (cancel && !keyboardNavigation._isNeedFocus) {
                        var $cell = keyboardNavigation._getFocusedCell();
                        keyboardNavigation._focus($cell, true)
                    }
                    return cancel
                }
            },
            data: {
                _correctRowIndices: function(getRowIndexCorrection) {
                    var that = this;
                    var keyboardNavigationController = that.getController("keyboardNavigation");
                    var editorFactory = that.getController("editorFactory");
                    var focusedCellPosition = keyboardNavigationController._focusedCellPosition;
                    that.callBase.apply(that, arguments);
                    if (focusedCellPosition && focusedCellPosition.rowIndex >= 0) {
                        var focusedRowIndexCorrection = getRowIndexCorrection(focusedCellPosition.rowIndex);
                        if (focusedRowIndexCorrection) {
                            focusedCellPosition.rowIndex += focusedRowIndexCorrection;
                            editorFactory.focus(editorFactory.focus())
                        }
                    }
                }
            }
        }
    }
};