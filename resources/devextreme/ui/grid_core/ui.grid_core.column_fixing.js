/**
 * DevExtreme (ui/grid_core/ui.grid_core.column_fixing.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var _renderer = require("../../core/renderer");
var _renderer2 = _interopRequireDefault(_renderer);
var _events_engine = require("../../events/core/events_engine");
var _events_engine2 = _interopRequireDefault(_events_engine);
var _wheel = require("../../events/core/wheel");
var _wheel2 = _interopRequireDefault(_wheel);
var _message = require("../../localization/message");
var _message2 = _interopRequireDefault(_message);
var _uiGrid_core = require("../grid_core/ui.grid_core.utils");
var _uiGrid_core2 = _interopRequireDefault(_uiGrid_core);
var _type = require("../../core/utils/type");
var _extend = require("../../core/utils/extend");
var _iterator = require("../../core/utils/iterator");
var _browser = require("../../core/utils/browser");
var _browser2 = _interopRequireDefault(_browser);
var _translator = require("../../animation/translator");
var _translator2 = _interopRequireDefault(_translator);

function _interopRequireDefault(obj) {
    return obj && obj.__esModule ? obj : {
        "default": obj
    }
}
var CONTENT_CLASS = "content";
var CONTENT_FIXED_CLASS = "content-fixed";
var MASTER_DETAIL_CELL_CLASS = "dx-master-detail-cell";
var FIRST_CELL_CLASS = "dx-first-cell";
var LAST_CELL_CLASS = "dx-last-cell";
var HOVER_STATE_CLASS = "dx-state-hover";
var FIXED_COL_CLASS = "dx-col-fixed";
var FIXED_COLUMNS_CLASS = "dx-fixed-columns";
var POINTER_EVENTS_TARGET_CLASS = "dx-pointer-events-target";
var POINTER_EVENTS_NONE_CLASS = "dx-pointer-events-none";
var COMMAND_TRANSPARENT = "transparent";
var GROUP_ROW_CLASS = "dx-group-row";
var getTransparentColumnIndex = function(fixedColumns) {
    var transparentColumnIndex = -1;
    (0, _iterator.each)(fixedColumns, function(index, column) {
        if (column.command === COMMAND_TRANSPARENT) {
            transparentColumnIndex = index;
            return false
        }
    });
    return transparentColumnIndex
};
var normalizeColumnWidths = function(fixedColumns, widths, fixedWidths) {
    var i;
    var fixedColumnIndex = 0;
    if (fixedColumns && widths && fixedWidths) {
        for (i = 0; i < fixedColumns.length; i++) {
            if (fixedColumns[i].command === COMMAND_TRANSPARENT) {
                fixedColumnIndex += fixedColumns[i].colspan
            } else {
                if (widths[fixedColumnIndex] < fixedWidths[i]) {
                    widths[fixedColumnIndex] = fixedWidths[i]
                }
                fixedColumnIndex++
            }
        }
    }
    return widths
};
var baseFixedColumns = {
    init: function() {
        this.callBase();
        this._isFixedTableRendering = false;
        this._isFixedColumns = false
    },
    _createCol: function(column) {
        return this.callBase(column).toggleClass(FIXED_COL_CLASS, !!(this._isFixedTableRendering && (column.fixed || column.command && column.command !== COMMAND_TRANSPARENT)))
    },
    _correctColumnIndicesForFixedColumns: function(fixedColumns, change) {
        var transparentColumnIndex = getTransparentColumnIndex(fixedColumns);
        var transparentColspan = fixedColumns[transparentColumnIndex].colspan;
        var columnIndices = change && change.columnIndices;
        if (columnIndices) {
            change.columnIndices = columnIndices.map(function(columnIndices) {
                if (columnIndices) {
                    return columnIndices.map(function(columnIndex) {
                        if (columnIndex < transparentColumnIndex) {
                            return columnIndex
                        } else {
                            if (columnIndex >= transparentColumnIndex + transparentColspan) {
                                return columnIndex - transparentColspan + 1
                            }
                        }
                        return -1
                    }).filter(function(columnIndex) {
                        return columnIndex >= 0
                    })
                }
            })
        }
    },
    _renderTable: function(options) {
        var that = this;
        var $fixedTable;
        var $table;
        var fixedColumns = that.getFixedColumns();
        that._isFixedColumns = !!fixedColumns.length;
        $table = that.callBase(options);
        if (that._isFixedColumns) {
            that._isFixedTableRendering = true;
            var change = options && options.change;
            var columnIndices = change && change.columnIndices;
            that._correctColumnIndicesForFixedColumns(fixedColumns, change);
            $fixedTable = that._createTable(fixedColumns);
            that._renderRows($fixedTable, (0, _extend.extend)({}, options, {
                columns: fixedColumns
            }));
            that._updateContent($fixedTable, change);
            if (columnIndices) {
                change.columnIndices = columnIndices
            }
            that._isFixedTableRendering = false
        } else {
            that._fixedTableElement && that._fixedTableElement.parent().remove();
            that._fixedTableElement = null
        }
        return $table
    },
    _renderRow: function($table, options) {
        var fixedCells;
        var fixedCorrection;
        var cells = options.row.cells;
        this.callBase.apply(this, arguments);
        if (this._isFixedTableRendering && cells && cells.length) {
            fixedCorrection = 0;
            fixedCells = options.row.cells || [];
            cells = cells.slice();
            options.row.cells = cells;
            for (var i = 0; i < fixedCells.length; i++) {
                if (fixedCells[i].column && fixedCells[i].column.command === COMMAND_TRANSPARENT) {
                    fixedCorrection = (fixedCells[i].column.colspan || 1) - 1;
                    continue
                }
                cells[i + fixedCorrection] = fixedCells[i]
            }
        }
    },
    _createCell: function(options) {
        var that = this;
        var column = options.column;
        var columnCommand = column && column.command;
        var rowType = options.rowType;
        var $cell = that.callBase.apply(that, arguments);
        var fixedColumns;
        var prevFixedColumn;
        var transparentColumnIndex;
        if (that._isFixedTableRendering || "filter" === rowType) {
            fixedColumns = that.getFixedColumns();
            transparentColumnIndex = getTransparentColumnIndex(fixedColumns);
            prevFixedColumn = fixedColumns[transparentColumnIndex - 1]
        }
        if (that._isFixedTableRendering) {
            if (columnCommand === COMMAND_TRANSPARENT) {
                $cell.addClass(POINTER_EVENTS_NONE_CLASS).toggleClass(FIRST_CELL_CLASS, 0 === transparentColumnIndex || prevFixedColumn && "expand" === prevFixedColumn.command).toggleClass(LAST_CELL_CLASS, fixedColumns.length && transparentColumnIndex === fixedColumns.length - 1);
                if ("freeSpace" !== rowType) {
                    _uiGrid_core2.default.setEmptyText($cell)
                }
            }
        } else {
            if ("filter" === rowType) {
                $cell.toggleClass(FIRST_CELL_CLASS, options.columnIndex === transparentColumnIndex)
            }
        }
        return $cell
    },
    _wrapTableInScrollContainer: function() {
        var $scrollContainer = this.callBase.apply(this, arguments);
        if (this._isFixedTableRendering) {
            $scrollContainer.addClass(this.addWidgetPrefix(CONTENT_FIXED_CLASS) + " " + POINTER_EVENTS_TARGET_CLASS)
        }
        return $scrollContainer
    },
    _renderCellContent: function($cell, options) {
        var that = this;
        var columns;
        var isEmptyCell;
        var transparentColumnIndex;
        var alignByFixedColumnCellCount;
        var column = options.column;
        var isFixedTableRendering = that._isFixedTableRendering;
        var isGroupCell = "group" === options.rowType && (0, _type.isDefined)(column.groupIndex);
        if (isFixedTableRendering && isGroupCell && !column.command && !column.groupCellTemplate) {
            $cell.css("pointerEvents", "none")
        }
        if (!isFixedTableRendering && that._isFixedColumns) {
            isEmptyCell = column.fixed || column.command && false !== column.fixed;
            if (isGroupCell) {
                isEmptyCell = false;
                if (options.row.summaryCells && options.row.summaryCells.length) {
                    columns = that._columnsController.getVisibleColumns();
                    alignByFixedColumnCellCount = that._getAlignByColumnCellCount ? that._getAlignByColumnCellCount(column.colspan, {
                        columns: columns,
                        row: options.row,
                        isFixed: true
                    }) : 0;
                    if (alignByFixedColumnCellCount > 0) {
                        transparentColumnIndex = getTransparentColumnIndex(that._columnsController.getFixedColumns());
                        isEmptyCell = columns.length - alignByFixedColumnCellCount < transparentColumnIndex
                    }
                }
            }
            if (isEmptyCell) {
                if (that.option("legacyRendering") || column.command && "buttons" !== column.type || "group" === options.rowType) {
                    $cell.html("&nbsp;").addClass(column.cssClass);
                    return
                } else {
                    $cell.addClass("dx-hidden-cell")
                }
            }
        }
        if (column.command !== COMMAND_TRANSPARENT) {
            that.callBase($cell, options)
        }
    },
    _getCellElementsCore: function(rowIndex) {
        var that = this;
        var fixedColumn;
        var fixedColumns;
        var fixedColumnIndex;
        var fixedCellElements;
        var cellElements = that.callBase(rowIndex);
        var isGroupRow = cellElements.parent().hasClass(GROUP_ROW_CLASS);
        var index = "columnHeadersView" === that.name ? rowIndex : void 0;
        if (that._fixedTableElement && cellElements) {
            fixedColumns = that.getFixedColumns(index);
            fixedCellElements = that._getRowElements(that._fixedTableElement).eq(rowIndex).children("td");
            (0, _iterator.each)(fixedCellElements, function(columnIndex, cell) {
                if (isGroupRow) {
                    if (cellElements[columnIndex] && "hidden" !== cell.style.visibility) {
                        cellElements[columnIndex] = cell
                    }
                } else {
                    fixedColumn = fixedColumns[columnIndex];
                    if (fixedColumn) {
                        if (fixedColumn.command === COMMAND_TRANSPARENT) {
                            if (fixedCellElements.eq(columnIndex).hasClass(MASTER_DETAIL_CELL_CLASS)) {
                                cellElements[columnIndex] = cell || cellElements[columnIndex]
                            }
                        } else {
                            fixedColumnIndex = that._columnsController.getVisibleIndex(fixedColumn.index, index);
                            cellElements[fixedColumnIndex] = cell || cellElements[fixedColumnIndex]
                        }
                    }
                }
            })
        }
        return cellElements
    },
    getColumnWidths: function() {
        var that = this;
        var fixedWidths;
        var result = that.callBase();
        var fixedColumns = that.getFixedColumns();
        if (that._fixedTableElement && result.length) {
            fixedWidths = that.callBase(that._fixedTableElement)
        }
        return normalizeColumnWidths(fixedColumns, result, fixedWidths)
    },
    _getTableElement: function() {
        var tableElement = this._isFixedTableRendering ? this._fixedTableElement : this.callBase();
        return tableElement
    },
    _setTableElement: function(tableElement) {
        if (this._isFixedTableRendering) {
            this._fixedTableElement = tableElement.addClass(POINTER_EVENTS_NONE_CLASS)
        } else {
            this.callBase(tableElement)
        }
    },
    getColumns: function(rowIndex, $tableElement) {
        $tableElement = $tableElement || this._getTableElement();
        if (this._isFixedTableRendering || $tableElement && $tableElement.closest("table").parent("." + this.addWidgetPrefix(CONTENT_FIXED_CLASS)).length) {
            return this.getFixedColumns(rowIndex)
        }
        return this.callBase(rowIndex, $tableElement)
    },
    getRowIndex: function($row) {
        var $fixedTable = this._fixedTableElement;
        if ($fixedTable && $fixedTable.find($row).length) {
            return this._getRowElements($fixedTable).index($row)
        }
        return this.callBase($row)
    },
    getTableElements: function() {
        var result = this.callBase.apply(this, arguments);
        if (this._fixedTableElement) {
            result = (0, _renderer2.default)([result.get(0), this._fixedTableElement.get(0)])
        }
        return result
    },
    getFixedColumns: function(rowIndex) {
        return this._columnsController.getFixedColumns(rowIndex)
    },
    getFixedColumnsOffset: function() {
        var offset = {
            left: 0,
            right: 0
        };
        var $transparentColumn;
        var positionTransparentColumn;
        if (this._fixedTableElement) {
            $transparentColumn = this.getTransparentColumnElement();
            positionTransparentColumn = $transparentColumn.position();
            offset = {
                left: positionTransparentColumn.left,
                right: this.element().outerWidth(true) - ($transparentColumn.outerWidth(true) + positionTransparentColumn.left)
            }
        }
        return offset
    },
    getTransparentColumnElement: function() {
        return this._fixedTableElement && this._fixedTableElement.find("." + POINTER_EVENTS_NONE_CLASS).first()
    },
    getFixedTableElement: function() {
        return this._fixedTableElement
    },
    isFixedColumns: function() {
        return this._isFixedColumns
    },
    _resizeCore: function() {
        this.callBase();
        this.synchronizeRows()
    },
    setColumnWidths: function(options) {
        var columns;
        var visibleColumns = this._columnsController.getVisibleColumns();
        var widths = options.widths;
        var isWidthsSynchronized = widths && widths.length && (0, _type.isDefined)(visibleColumns[0].visibleWidth);
        var optionNames = options.optionNames;
        var isColumnWidthChanged = optionNames && optionNames.width;
        var useVisibleColumns = false;
        this.callBase.apply(this, arguments);
        if (this._fixedTableElement) {
            if (this.option("legacyRendering")) {
                useVisibleColumns = widths && widths.length && !this.isScrollbarVisible(true)
            } else {
                var hasAutoWidth = widths && widths.some(function(width) {
                    return "auto" === width
                });
                useVisibleColumns = hasAutoWidth && (!isWidthsSynchronized || !this.isScrollbarVisible(true))
            }
            if (useVisibleColumns) {
                columns = visibleColumns
            }
            this.callBase((0, _extend.extend)({}, options, {
                $tableElement: this._fixedTableElement,
                columns: columns,
                fixed: true
            }))
        }
        if (isWidthsSynchronized || isColumnWidthChanged && this.option("wordWrapEnabled")) {
            this.synchronizeRows()
        }
    },
    _createColGroup: function(columns) {
        if (!this.option("legacyRendering") && this._isFixedTableRendering && !this.option("columnAutoWidth")) {
            var visibleColumns = this._columnsController.getVisibleColumns();
            var useVisibleColumns = visibleColumns.filter(function(column) {
                return !column.width
            }).length;
            if (useVisibleColumns) {
                columns = visibleColumns
            }
        }
        return this.callBase(columns)
    },
    _getClientHeight: function(element) {
        var boundingClientRectElement = element.getBoundingClientRect && element.getBoundingClientRect();
        return boundingClientRectElement && boundingClientRectElement.height ? boundingClientRectElement.height : element.clientHeight
    },
    synchronizeRows: function() {
        var that = this;
        var rowHeight;
        var fixedRowHeight;
        var rowHeights = [];
        var fixedRowHeights = [];
        var rowIndex;
        var heightTable;
        var heightFixedTable;
        var $rowElements;
        var $fixedRowElements;
        var $contentElement;
        if (that._isFixedColumns && that._tableElement && that._fixedTableElement) {
            heightTable = that._getClientHeight(that._tableElement.get(0));
            heightFixedTable = that._getClientHeight(that._fixedTableElement.get(0));
            $rowElements = that._getRowElements(that._tableElement);
            $fixedRowElements = that._getRowElements(that._fixedTableElement);
            $contentElement = that._findContentElement();
            if (heightTable !== heightFixedTable) {
                $contentElement && $contentElement.css("height", heightTable);
                $rowElements.css("height", "");
                $fixedRowElements.css("height", "");
                for (rowIndex = 0; rowIndex < $rowElements.length; rowIndex++) {
                    rowHeights.push(that._getClientHeight($rowElements.get(rowIndex)));
                    fixedRowHeights.push(that._getClientHeight($fixedRowElements.get(rowIndex)))
                }
                for (rowIndex = 0; rowIndex < $rowElements.length; rowIndex++) {
                    rowHeight = rowHeights[rowIndex];
                    fixedRowHeight = fixedRowHeights[rowIndex];
                    if (rowHeight > fixedRowHeight) {
                        $fixedRowElements.eq(rowIndex).css("height", rowHeight)
                    } else {
                        if (rowHeight < fixedRowHeight) {
                            $rowElements.eq(rowIndex).css("height", fixedRowHeight)
                        }
                    }
                }
                $contentElement && $contentElement.css("height", "")
            }
        }
    },
    setScrollerSpacing: function(width) {
        var rtlEnabled = this.option("rtlEnabled");
        this.callBase(width);
        this.element().children("." + this.addWidgetPrefix(CONTENT_FIXED_CLASS)).css({
            paddingLeft: rtlEnabled ? width : "",
            paddingRight: !rtlEnabled ? width : ""
        })
    }
};
var ColumnHeadersViewFixedColumnsExtender = (0, _extend.extend)({}, baseFixedColumns, {
    _getRowVisibleColumns: function(rowIndex) {
        if (this._isFixedTableRendering) {
            return this.getFixedColumns(rowIndex)
        }
        return this.callBase(rowIndex)
    },
    getContextMenuItems: function(options) {
        var that = this;
        var column = options.column;
        var onItemClick;
        var columnFixingOptions = that.option("columnFixing");
        var items = that.callBase(options);
        if (options.row && "header" === options.row.rowType) {
            if (column && column.allowFixing) {
                onItemClick = function(params) {
                    switch (params.itemData.value) {
                        case "none":
                            that._columnsController.columnOption(column.index, "fixed", false);
                            break;
                        case "left":
                            that._columnsController.columnOption(column.index, {
                                fixed: true,
                                fixedPosition: "left"
                            });
                            break;
                        case "right":
                            that._columnsController.columnOption(column.index, {
                                fixed: true,
                                fixedPosition: "right"
                            })
                    }
                };
                items = items || [];
                items.push({
                    text: columnFixingOptions.texts.fix,
                    beginGroup: true,
                    items: [{
                        text: columnFixingOptions.texts.leftPosition,
                        value: "left",
                        disabled: column.fixed && (!column.fixedPosition || "left" === column.fixedPosition),
                        onItemClick: onItemClick
                    }, {
                        text: columnFixingOptions.texts.rightPosition,
                        value: "right",
                        disabled: column.fixed && "right" === column.fixedPosition,
                        onItemClick: onItemClick
                    }]
                }, {
                    text: columnFixingOptions.texts.unfix,
                    value: "none",
                    disabled: !column.fixed,
                    onItemClick: onItemClick
                })
            }
        }
        return items
    },
    getFixedColumnElements: function(rowIndex) {
        var that = this;
        var columnElements;
        var transparentColumnIndex;
        var $transparentColumnElement;
        if ((0, _type.isDefined)(rowIndex)) {
            return this._fixedTableElement && this._getRowElements(this._fixedTableElement).eq(rowIndex).children()
        }
        columnElements = that.getColumnElements();
        $transparentColumnElement = that.getTransparentColumnElement();
        if (columnElements && $transparentColumnElement && $transparentColumnElement.length) {
            transparentColumnIndex = getTransparentColumnIndex(that.getFixedColumns());
            columnElements.splice(transparentColumnIndex, $transparentColumnElement.get(0).colSpan, $transparentColumnElement.get(0))
        }
        return columnElements
    },
    getColumnWidths: function() {
        var that = this;
        var fixedWidths;
        var result = that.callBase();
        var $fixedColumnElements = that.getFixedColumnElements();
        var fixedColumns = that.getFixedColumns();
        if (that._fixedTableElement) {
            if ($fixedColumnElements && $fixedColumnElements.length) {
                fixedWidths = that._getWidths($fixedColumnElements)
            } else {
                fixedWidths = that.callBase(that._fixedTableElement)
            }
        }
        return normalizeColumnWidths(fixedColumns, result, fixedWidths)
    }
});
var RowsViewFixedColumnsExtender = (0, _extend.extend)({}, baseFixedColumns, {
    _detachHoverEvents: function() {
        this._fixedTableElement && _events_engine2.default.off(this._fixedTableElement, "mouseover mouseout", ".dx-data-row");
        this._tableElement && _events_engine2.default.off(this._tableElement, "mouseover mouseout", ".dx-data-row")
    },
    _attachHoverEvents: function() {
        var that = this;
        var attachHoverEvent = function($table) {
            _events_engine2.default.on($table, "mouseover mouseout", ".dx-data-row", that.createAction(function(args) {
                var event = args.event;
                var rowIndex = that.getRowIndex((0, _renderer2.default)(event.target).closest(".dx-row"));
                var isHover = "mouseover" === event.type;
                if (rowIndex >= 0) {
                    that._tableElement && that._getRowElements(that._tableElement).eq(rowIndex).toggleClass(HOVER_STATE_CLASS, isHover);
                    that._fixedTableElement && that._getRowElements(that._fixedTableElement).eq(rowIndex).toggleClass(HOVER_STATE_CLASS, isHover)
                }
            }))
        };
        if (that._fixedTableElement && that._tableElement) {
            attachHoverEvent(that._fixedTableElement);
            attachHoverEvent(that._tableElement)
        }
    },
    _findContentElement: function() {
        var that = this;
        var $content;
        var scrollable;
        var scrollTop;
        var contentClass = that.addWidgetPrefix(CONTENT_CLASS);
        var element = that.element();
        var scrollDelay = _browser2.default.mozilla ? 60 : 0;
        if (element && that._isFixedTableRendering) {
            $content = element.children("." + contentClass);
            scrollable = that.getScrollable();
            if (!$content.length && scrollable) {
                $content = (0, _renderer2.default)("<div>").addClass(contentClass);
                _events_engine2.default.on($content, "scroll", function(e) {
                    clearTimeout(that._fixedScrollTimeout);
                    that._fixedScrollTimeout = setTimeout(function() {
                        scrollTop = (0, _renderer2.default)(e.target).scrollTop();
                        scrollable.scrollTo({
                            y: scrollTop
                        })
                    }, scrollDelay)
                });
                _events_engine2.default.on($content, _wheel2.default.name, function(e) {
                    if (scrollable) {
                        scrollTop = scrollable.scrollTop();
                        scrollable.scrollTo({
                            y: scrollTop - e.delta
                        });
                        if (scrollable.scrollTop() > 0 && scrollable.scrollTop() + scrollable.clientHeight() < scrollable.scrollHeight() + that.getScrollbarWidth()) {
                            return false
                        }
                    }
                });
                $content.appendTo(element)
            }
            return $content
        }
        return that.callBase()
    },
    _updateScrollable: function() {
        this.callBase();
        var scrollable = this.getScrollable();
        var scrollTop = scrollable && scrollable.scrollOffset().top;
        this._updateFixedTablePosition(scrollTop)
    },
    _renderContent: function(contentElement, tableElement) {
        if (this._isFixedTableRendering) {
            return contentElement.empty().addClass(this.addWidgetPrefix(CONTENT_CLASS) + " " + this.addWidgetPrefix(CONTENT_FIXED_CLASS) + " " + POINTER_EVENTS_TARGET_CLASS).append(tableElement)
        }
        return this.callBase(contentElement, tableElement)
    },
    _getGroupCellOptions: function(options) {
        if (this._isFixedTableRendering) {
            return this.callBase((0, _extend.extend)({}, options, {
                columns: this._columnsController.getVisibleColumns()
            }))
        }
        return this.callBase(options)
    },
    _renderGroupedCells: function($row, options) {
        return this.callBase($row, (0, _extend.extend)({}, options, {
            columns: this._columnsController.getVisibleColumns()
        }))
    },
    _renderGroupSummaryCells: function($row, options) {
        if (this._isFixedTableRendering) {
            this.callBase($row, (0, _extend.extend)({}, options, {
                columns: this._columnsController.getVisibleColumns()
            }))
        } else {
            this.callBase($row, options)
        }
    },
    _hasAlignByColumnSummaryItems: function(columnIndex, options) {
        var result = this.callBase.apply(this, arguments);
        var column = options.columns[columnIndex];
        if (options.isFixed) {
            return column.fixed && (result || "right" === column.fixedPosition)
        }
        return result && !column.fixed
    },
    _renderGroupSummaryCellsCore: function($groupCell, options, groupCellColSpan, alignByColumnCellCount) {
        var startColumnIndex;
        var transparentColumnIndex;
        var alignByFixedColumnCellCount;
        if (this._isFixedTableRendering) {
            options.isFixed = true;
            alignByFixedColumnCellCount = this._getAlignByColumnCellCount(groupCellColSpan, options);
            options.isFixed = false;
            startColumnIndex = options.columns.length - alignByFixedColumnCellCount;
            options = (0, _extend.extend)({}, options, {
                columns: this.getFixedColumns()
            });
            transparentColumnIndex = getTransparentColumnIndex(options.columns);
            if (startColumnIndex < transparentColumnIndex) {
                alignByFixedColumnCellCount -= options.columns[transparentColumnIndex].colspan - 1 || 0;
                groupCellColSpan -= options.columns[transparentColumnIndex].colspan - 1 || 0
            } else {
                if (alignByColumnCellCount > 0) {
                    $groupCell.css("visibility", "hidden")
                }
            }
            alignByColumnCellCount = alignByFixedColumnCellCount
        }
        this.callBase($groupCell, options, groupCellColSpan, alignByColumnCellCount)
    },
    _getSummaryCellIndex: function(columnIndex, columns) {
        var transparentColumnIndex;
        if (this._isFixedTableRendering) {
            transparentColumnIndex = getTransparentColumnIndex(columns);
            if (columnIndex > transparentColumnIndex) {
                columnIndex += columns[transparentColumnIndex].colspan - 1
            }
            return columnIndex
        }
        return this.callBase.apply(this, arguments)
    },
    _renderCore: function(change) {
        this._detachHoverEvents();
        this.callBase(change);
        var isFixedColumns = this._isFixedColumns;
        this.element().toggleClass(FIXED_COLUMNS_CLASS, isFixedColumns);
        if (this.option("hoverStateEnabled") && isFixedColumns) {
            this._attachHoverEvents()
        }
    },
    setRowsOpacity: function(columnIndex, value) {
        this.callBase(columnIndex, value);
        var $rows = this._getRowElements(this._fixedTableElement);
        this._setRowsOpacityCore($rows, this.getFixedColumns(), columnIndex, value)
    },
    optionChanged: function(args) {
        var that = this;
        that.callBase(args);
        if ("hoverStateEnabled" === args.name && that._isFixedColumns) {
            args.value ? this._attachHoverEvents() : this._detachHoverEvents()
        }
    },
    getCellIndex: function($cell) {
        var $fixedTable = this._fixedTableElement;
        var columns;
        var cellIndex = 0;
        if ($fixedTable && $cell.is("td") && $cell.closest($fixedTable).length) {
            columns = this.getFixedColumns();
            (0, _iterator.each)(columns, function(index, column) {
                if (index === $cell[0].cellIndex) {
                    return false
                }
                if (column.colspan) {
                    cellIndex += column.colspan;
                    return
                }
                cellIndex++
            });
            return cellIndex
        }
        return this.callBase.apply(this, arguments)
    },
    _updateFixedTablePosition: function(scrollTop, needFocus) {
        if (this._fixedTableElement && this._tableElement) {
            var $focusedElement;
            var editorFactory = this.getController("editorFactory");
            this._fixedTableElement.parent().scrollTop(scrollTop);
            if (needFocus) {
                $focusedElement = editorFactory.focus();
                $focusedElement && editorFactory.focus($focusedElement)
            }
        }
    },
    setScrollerSpacing: function(vWidth, hWidth) {
        var that = this;
        var useNativeScrolling;
        var styles = {
            marginBottom: 0
        };
        var $fixedContent = that.element().children("." + this.addWidgetPrefix(CONTENT_FIXED_CLASS));
        if ($fixedContent.length && that._fixedTableElement) {
            $fixedContent.css(styles);
            that._fixedTableElement.css(styles);
            styles[that.option("rtlEnabled") ? "marginLeft" : "marginRight"] = vWidth;
            styles.marginBottom = hWidth;
            useNativeScrolling = that._scrollable && that._scrollable.option("useNative");
            (useNativeScrolling ? $fixedContent : that._fixedTableElement).css(styles)
        }
    },
    _getElasticScrollTop: function(e) {
        var maxScrollTop;
        var scrollableContent;
        var scrollableContainer;
        var elasticScrollTop = 0;
        var scrollbarWidth = this.getScrollbarWidth(true);
        if (e.scrollOffset.top < 0) {
            elasticScrollTop = -e.scrollOffset.top
        } else {
            if (e.reachedBottom) {
                scrollableContent = this._findContentElement();
                scrollableContainer = e.component._container();
                maxScrollTop = Math.max(scrollableContent.height() + scrollbarWidth - scrollableContainer.height(), 0);
                elasticScrollTop = maxScrollTop - e.scrollOffset.top
            }
        }
        return elasticScrollTop
    },
    _applyElasticScrolling: function(e) {
        if (this._fixedTableElement) {
            var elasticScrollTop = this._getElasticScrollTop(e);
            if (0 !== Math.ceil(elasticScrollTop)) {
                _translator2.default.move(this._fixedTableElement, {
                    top: elasticScrollTop
                })
            } else {
                this._fixedTableElement.css("transform", "")
            }
        }
    },
    _handleScroll: function(e) {
        this._updateFixedTablePosition(e.scrollOffset.top, true);
        this._applyElasticScrolling(e);
        this.callBase(e)
    },
    _updateContentPosition: function(isRender) {
        this.callBase.apply(this, arguments);
        if (!isRender) {
            this._updateFixedTablePosition(this._scrollTop)
        }
    },
    _afterRowPrepared: function(e) {
        if (this._isFixedTableRendering) {
            return
        }
        this.callBase(e)
    },
    _scrollToElement: function($element) {
        this.callBase($element, this.getFixedColumnsOffset())
    },
    dispose: function() {
        this.callBase.apply(this, arguments);
        clearTimeout(this._fixedScrollTimeout)
    }
});
var FooterViewFixedColumnsExtender = baseFixedColumns;
module.exports = {
    defaultOptions: function() {
        return {
            columnFixing: {
                enabled: false,
                texts: {
                    fix: _message2.default.format("dxDataGrid-columnFixingFix"),
                    unfix: _message2.default.format("dxDataGrid-columnFixingUnfix"),
                    leftPosition: _message2.default.format("dxDataGrid-columnFixingLeftPosition"),
                    rightPosition: _message2.default.format("dxDataGrid-columnFixingRightPosition")
                }
            }
        }
    },
    extenders: {
        views: {
            columnHeadersView: ColumnHeadersViewFixedColumnsExtender,
            rowsView: RowsViewFixedColumnsExtender,
            footerView: FooterViewFixedColumnsExtender
        },
        controllers: function() {
            var normalizeColumnIndicesByPoints = function(columns, fixedColumns, pointsByColumns) {
                var transparentColumnIndex = getTransparentColumnIndex(fixedColumns);
                var correctIndex = columns.length - fixedColumns.length;
                (0, _iterator.each)(pointsByColumns, function(_, point) {
                    if (point.index > transparentColumnIndex) {
                        point.columnIndex += correctIndex;
                        point.index += correctIndex
                    }
                });
                return pointsByColumns
            };
            return {
                draggingHeader: {
                    _generatePointsByColumns: function(options) {
                        var pointsByColumns;
                        var visibleColumns = options.columns;
                        var targetDraggingPanel = options.targetDraggingPanel;
                        if (targetDraggingPanel && "headers" === targetDraggingPanel.getName() && targetDraggingPanel.isFixedColumns()) {
                            if (options.sourceColumn.fixed) {
                                if (!options.rowIndex) {
                                    options.columnElements = targetDraggingPanel.getFixedColumnElements(0)
                                }
                                options.columns = targetDraggingPanel.getFixedColumns(options.rowIndex);
                                pointsByColumns = this.callBase(options);
                                normalizeColumnIndicesByPoints(visibleColumns, options.columns, pointsByColumns);
                                return pointsByColumns
                            }
                        }
                        return this.callBase(options)
                    },
                    _pointCreated: function(point, columns, location, sourceColumn) {
                        var result = this.callBase.apply(this, arguments);
                        var $transparentColumn = this._columnHeadersView.getTransparentColumnElement();
                        var boundingRect;
                        if (!result && "headers" === location && $transparentColumn && $transparentColumn.length) {
                            boundingRect = $transparentColumn.get(0).getBoundingClientRect();
                            if (sourceColumn && sourceColumn.fixed) {
                                return "right" === sourceColumn.fixedPosition ? point.x < boundingRect.right : point.x > boundingRect.left
                            } else {
                                return point.x < boundingRect.left || point.x > boundingRect.right
                            }
                        }
                        return result
                    }
                },
                columnsResizer: {
                    _generatePointsByColumns: function() {
                        var that = this;
                        var columnsController = that._columnsController;
                        var columns = columnsController && that._columnsController.getVisibleColumns();
                        var fixedColumns = columnsController && that._columnsController.getFixedColumns();
                        var cells = that._columnHeadersView.getFixedColumnElements();
                        var pointsByFixedColumns = [];
                        that.callBase();
                        if (cells && cells.length > 0) {
                            pointsByFixedColumns = _uiGrid_core2.default.getPointsByColumns(cells, function(point) {
                                return that._pointCreated(point, cells.length, fixedColumns)
                            });
                            that._pointsByFixedColumns = normalizeColumnIndicesByPoints(columns, fixedColumns, pointsByFixedColumns)
                        }
                    },
                    _pointCreated: function(point, cellsLength, columns) {
                        var currentColumn;
                        var nextColumn;
                        var isWidgetResizingMode = "widget" === this.option("columnResizingMode");
                        if (point.index > 0 && point.index < cellsLength) {
                            currentColumn = columns[point.columnIndex - 1] || {};
                            nextColumn = columns[point.columnIndex] || {};
                            if (currentColumn.fixed || nextColumn.fixed) {
                                point.columnIndex -= 1;
                                return !((currentColumn.allowResizing || currentColumn.command === COMMAND_TRANSPARENT) && (isWidgetResizingMode || nextColumn.allowResizing || nextColumn.command === COMMAND_TRANSPARENT))
                            }
                        }
                        return this.callBase.apply(this, arguments)
                    },
                    _getTargetPoint: function(pointsByColumns, currentX, deltaX) {
                        var $transparentColumn = this._columnHeadersView.getTransparentColumnElement();
                        var boundingRect;
                        if ($transparentColumn && $transparentColumn.length) {
                            boundingRect = $transparentColumn.get(0).getBoundingClientRect();
                            if (currentX <= boundingRect.left || currentX >= boundingRect.right) {
                                return this.callBase(this._pointsByFixedColumns, currentX, deltaX)
                            }
                        }
                        return this.callBase(pointsByColumns, currentX, deltaX)
                    }
                }
            }
        }()
    }
};
