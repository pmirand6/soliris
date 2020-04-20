/**
 * DevExtreme (ui/data_grid/ui.data_grid.export.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var _renderer = require("../../core/renderer");
var _renderer2 = _interopRequireDefault(_renderer);
var _class = require("../../core/class");
var _class2 = _interopRequireDefault(_class);
var _type = require("../../core/utils/type");
var _extend = require("../../core/utils/extend");
var _position = require("../../core/utils/position");
var _array = require("../../core/utils/array");
var _array2 = _interopRequireDefault(_array);
var _uiData_grid = require("./ui.data_grid.core");
var _uiData_grid2 = _interopRequireDefault(_uiData_grid);
var _uiGrid_core = require("../grid_core/ui.grid_core.export_mixin");
var _uiGrid_core2 = _interopRequireDefault(_uiGrid_core);
var _exporter = require("../../exporter");
var _message = require("../../localization/message");
var _message2 = _interopRequireDefault(_message);
var _button = require("../button");
var _button2 = _interopRequireDefault(_button);
var _list = require("../list");
var _list2 = _interopRequireDefault(_list);
var _context_menu = require("../context_menu");
var _context_menu2 = _interopRequireDefault(_context_menu);
var _deferred = require("../../core/utils/deferred");

function _interopRequireDefault(obj) {
    return obj && obj.__esModule ? obj : {
        "default": obj
    }
}
var DATAGRID_EXPORT_MENU_CLASS = "dx-datagrid-export-menu";
var DATAGRID_EXPORT_BUTTON_CLASS = "dx-datagrid-export-button";
var DATAGRID_EXPORT_ICON = "export-to";
var DATAGRID_EXPORT_EXCEL_ICON = "xlsxfile";
var DATAGRID_EXPORT_SELECTED_ICON = "exportselected";
var DATAGRID_EXPORT_EXCEL_BUTTON_ICON = "export-excel-button";
var TOOLBAR_ITEM_AUTO_HIDE_CLASS = "dx-toolbar-item-auto-hide";
var TOOLBAR_HIDDEN_BUTTON_CLASS = "dx-toolbar-hidden-button";
var BUTTON_CLASS = "dx-button";
var DATA_STYLE_OFFSET = 3;
exports.DataProvider = _class2.default.inherit({
    _getGroupValue: function(item) {
        var key = item.key,
            data = item.data,
            rowType = item.rowType,
            groupIndex = item.groupIndex,
            summaryCells = item.summaryCells;
        var groupColumn = this._options.groupColumns[groupIndex];
        var value = _uiData_grid2.default.getDisplayValue(groupColumn, groupColumn.deserializeValue ? groupColumn.deserializeValue(key[groupIndex]) : key[groupIndex], data, rowType);
        var result = groupColumn.caption + ": " + _uiData_grid2.default.formatValue(value, groupColumn);
        if (summaryCells && summaryCells[0] && summaryCells[0].length) {
            result += " " + _uiData_grid2.default.getGroupRowSummaryText(summaryCells[0], this._options.summaryTexts)
        }
        return result
    },
    _correctCellIndex: function(cellIndex) {
        return cellIndex
    },
    _initOptions: function() {
        var exportController = this._exportController;
        var groupColumns = exportController._columnsController.getGroupColumns();
        var excelWrapTextEnabled = exportController.option("export.excelWrapTextEnabled");
        this._options = {
            columns: exportController._getColumns(this._initialColumnWidthsByColumnIndex),
            groupColumns: groupColumns,
            items: this._selectedRowsOnly || exportController._selectionOnly ? exportController._getSelectedItems() : exportController._getAllItems(),
            getVisibleIndex: exportController._columnsController.getVisibleIndex.bind(exportController._columnsController),
            isHeadersVisible: exportController.option("showColumnHeaders"),
            summaryTexts: exportController.option("summary.texts"),
            customizeExportData: exportController.option("customizeExportData"),
            rtlEnabled: exportController.option("rtlEnabled"),
            wrapTextEnabled: (0, _type.isDefined)(excelWrapTextEnabled) ? excelWrapTextEnabled : !!exportController.option("wordWrapEnabled"),
            customizeExcelCell: exportController.option("export.customizeExcelCell")
        }
    },
    hasCustomizeExcelCell: function() {
        return (0, _type.isDefined)(this._options.customizeExcelCell)
    },
    customizeExcelCell: function(e, cellSourceData) {
        if (this._options.customizeExcelCell) {
            e.gridCell = cellSourceData;
            if ((0, _type.isDefined)(this._exportController) && (0, _type.isDefined)(this._exportController.component)) {
                e.component = this._exportController.component
            }
            this._options.customizeExcelCell(e)
        }
    },
    ctor: function(exportController, initialColumnWidthsByColumnIndex, selectedRowsOnly) {
        this._exportController = exportController;
        this._initialColumnWidthsByColumnIndex = initialColumnWidthsByColumnIndex;
        this._selectedRowsOnly = selectedRowsOnly
    },
    getStyles: function() {
        var wrapTextEnabled = this._options.wrapTextEnabled;
        var styles = ["center", "left", "right"].map(function(alignment) {
            return {
                bold: true,
                alignment: alignment,
                wrapText: true
            }
        });
        this.getColumns().forEach(function(column) {
            styles.push({
                alignment: column.alignment || "left",
                format: column.format,
                wrapText: wrapTextEnabled,
                dataType: column.dataType
            })
        });
        styles.push({
            bold: true,
            wrapText: false,
            alignment: (0, _position.getDefaultAlignment)(this._options.rtlEnabled)
        });
        return styles
    },
    _getTotalCellStyleId: function(cellIndex) {
        var alignment = this.getColumns()[cellIndex] && this.getColumns()[cellIndex].alignment || "right";
        return ["center", "left", "right"].indexOf(alignment)
    },
    getStyleId: function(rowIndex, cellIndex) {
        if (rowIndex < this.getHeaderRowCount()) {
            return 0
        } else {
            if (this.isTotalCell(rowIndex - this.getHeaderRowCount(), cellIndex)) {
                return this._getTotalCellStyleId(cellIndex)
            } else {
                if (this.isGroupRow(rowIndex - this.getHeaderRowCount())) {
                    return DATA_STYLE_OFFSET + this.getColumns().length
                } else {
                    return cellIndex + DATA_STYLE_OFFSET
                }
            }
        }
    },
    getColumns: function(getColumnsByAllRows) {
        var columns = this._options.columns;
        return getColumnsByAllRows ? columns : columns[columns.length - 1]
    },
    getRowsCount: function() {
        return this._options.items.length + this.getHeaderRowCount()
    },
    getHeaderRowCount: function() {
        if (this.isHeadersVisible()) {
            return this._options.columns.length - 1
        }
        return 0
    },
    isGroupRow: function(rowIndex) {
        return rowIndex < this._options.items.length && "group" === this._options.items[rowIndex].rowType
    },
    getGroupLevel: function(rowIndex) {
        var item = this._options.items[rowIndex - this.getHeaderRowCount()];
        var groupIndex = item && item.groupIndex;
        if (item && "totalFooter" === item.rowType) {
            return 0
        }
        return (0, _type.isDefined)(groupIndex) ? groupIndex : this._options.groupColumns.length
    },
    getCellType: function(rowIndex, cellIndex) {
        var columns = this.getColumns();
        if (rowIndex < this.getHeaderRowCount()) {
            return "string"
        } else {
            rowIndex -= this.getHeaderRowCount()
        }
        if (cellIndex < columns.length) {
            var item = this._options.items.length && this._options.items[rowIndex];
            var column = columns[cellIndex];
            if (item && "data" === item.rowType) {
                if (isFinite(item.values[this._correctCellIndex(cellIndex)]) && !(0, _type.isDefined)(column.customizeText)) {
                    return (0, _type.isDefined)(column.lookup) ? column.lookup.dataType : column.dataType
                }
            }
            return "string"
        }
    },
    ready: function() {
        var that = this;
        var options;
        that._initOptions();
        options = this._options;
        return (0, _deferred.when)(options.items).done(function(items) {
            options.customizeExportData && options.customizeExportData(that.getColumns(that.getHeaderRowCount() > 1), items);
            options.items = items
        }).fail(function() {
            options.items = []
        })
    },
    _convertFromGridGroupSummaryItems: function(gridGroupSummaryItems) {
        var result;
        if ((0, _type.isDefined)(gridGroupSummaryItems) && gridGroupSummaryItems.length > 0) {
            result = gridGroupSummaryItems.map(function(item) {
                return {
                    value: item.value,
                    name: item.name
                }
            })
        }
        return result
    },
    getCellData: function(rowIndex, cellIndex, isExcelJS) {
        var result = {
            cellSourceData: {},
            value: value
        };
        var column;
        var value;
        var i;
        var summaryItems;
        var columns = this.getColumns();
        var correctedCellIndex = this._correctCellIndex(cellIndex);
        var itemValues;
        var item;
        if (rowIndex < this.getHeaderRowCount()) {
            var columnsRow = this.getColumns(true)[rowIndex];
            column = columnsRow[cellIndex];
            result.cellSourceData.rowType = "header";
            result.cellSourceData.column = column && column.gridColumn;
            result.value = column && column.caption
        } else {
            rowIndex -= this.getHeaderRowCount();
            item = this._options.items.length && this._options.items[rowIndex];
            if (item) {
                itemValues = item.values;
                result.cellSourceData.rowType = item.rowType;
                result.cellSourceData.column = columns[cellIndex] && columns[cellIndex].gridColumn;
                switch (item.rowType) {
                    case "groupFooter":
                    case "totalFooter":
                        if (correctedCellIndex < itemValues.length) {
                            value = itemValues[correctedCellIndex];
                            if ((0, _type.isDefined)(value)) {
                                result.cellSourceData.value = value.value;
                                result.cellSourceData.totalSummaryItemName = value.name;
                                result.value = _uiData_grid2.default.getSummaryText(value, this._options.summaryTexts)
                            } else {
                                result.cellSourceData.value = void 0
                            }
                        }
                        break;
                    case "group":
                        result.cellSourceData.groupIndex = item.groupIndex;
                        if (cellIndex < 1) {
                            result.cellSourceData.column = this._options.groupColumns[item.groupIndex];
                            result.cellSourceData.value = item.key[item.groupIndex];
                            result.cellSourceData.groupSummaryItems = this._convertFromGridGroupSummaryItems(item.summaryCells[0]);
                            result.value = this._getGroupValue(item)
                        } else {
                            summaryItems = item.values[correctedCellIndex];
                            if (Array.isArray(summaryItems)) {
                                result.cellSourceData.groupSummaryItems = this._convertFromGridGroupSummaryItems(summaryItems);
                                value = "";
                                for (i = 0; i < summaryItems.length; i++) {
                                    value += (i > 0 ? isExcelJS ? "\n" : " \n " : "") + _uiData_grid2.default.getSummaryText(summaryItems[i], this._options.summaryTexts)
                                }
                                result.value = value
                            } else {
                                result.cellSourceData.value = void 0
                            }
                        }
                        break;
                    default:
                        column = columns[cellIndex];
                        if (column) {
                            var _value = itemValues[correctedCellIndex];
                            var displayValue = _uiData_grid2.default.getDisplayValue(column, _value, item.data, item.rowType);
                            if (!isFinite(displayValue) || (0, _type.isDefined)(column.customizeText)) {
                                if (isExcelJS && (0, _type.isDefined)(column.customizeText) && column.customizeText === this._exportController._columnsController.getCustomizeTextByDataType("boolean")) {
                                    result.value = displayValue
                                } else {
                                    result.value = _uiData_grid2.default.formatValue(displayValue, column)
                                }
                            } else {
                                result.value = displayValue
                            }
                            result.cellSourceData.value = _value
                        }
                        result.cellSourceData.data = item.data
                }
            }
        }
        return result
    },
    isHeadersVisible: function() {
        return this._options.isHeadersVisible
    },
    isTotalCell: function(rowIndex, cellIndex) {
        var items = this._options.items;
        var item = items[rowIndex];
        var correctCellIndex = this._correctCellIndex(cellIndex);
        var isSummaryAlignByColumn = item.summaryCells && item.summaryCells[correctCellIndex] && item.summaryCells[correctCellIndex].length > 0 && item.summaryCells[correctCellIndex][0].alignByColumn;
        return item && "groupFooter" === item.rowType || "totalFooter" === item.rowType || isSummaryAlignByColumn
    },
    getCellMerging: function(rowIndex, cellIndex) {
        var columns = this._options.columns;
        var column = columns[rowIndex] && columns[rowIndex][cellIndex];
        return column ? {
            colspan: (column.exportColspan || 1) - 1,
            rowspan: (column.rowspan || 1) - 1
        } : {
            colspan: 0,
            rowspan: 0
        }
    },
    getFrozenArea: function() {
        var that = this;
        return {
            x: 0,
            y: that.getHeaderRowCount()
        }
    }
});
exports.ExportController = _uiData_grid2.default.ViewController.inherit({}).include(_uiGrid_core2.default).inherit({
    _getEmptyCell: function() {
        return {
            caption: "",
            colspan: 1,
            rowspan: 1
        }
    },
    _updateColumnWidth: function(column, width) {
        column.width = width
    },
    _getColumns: function(initialColumnWidthsByColumnIndex) {
        var result = [];
        var i;
        var j;
        var column;
        var columns;
        var columnsController = this._columnsController;
        var rowCount = columnsController.getRowCount();
        var currentHeaderRow;
        var currentColspan;
        for (i = 0; i <= rowCount; i++) {
            currentHeaderRow = [];
            columns = columnsController.getVisibleColumns(i, true);
            var columnWidthsByColumnIndex = void 0;
            if (i === rowCount) {
                if (this._updateLockCount) {
                    columnWidthsByColumnIndex = initialColumnWidthsByColumnIndex
                } else {
                    var columnWidths = this._getColumnWidths(this._headersView, this._rowsView);
                    if (columnWidths && columnWidths.length) {
                        columnWidthsByColumnIndex = {};
                        for (var _i = 0; _i < columns.length; _i++) {
                            columnWidthsByColumnIndex[columns[_i].index] = columnWidths[_i]
                        }
                    }
                }
            }
            for (j = 0; j < columns.length; j++) {
                column = (0, _extend.extend)({}, columns[j], {
                    dataType: "datetime" === columns[j].dataType ? "date" : columns[j].dataType,
                    gridColumn: columns[j]
                });
                if (this._needColumnExporting(column)) {
                    currentColspan = this._calculateExportColspan(column);
                    if ((0, _type.isDefined)(currentColspan)) {
                        column.exportColspan = currentColspan
                    }
                    if (columnWidthsByColumnIndex) {
                        this._updateColumnWidth(column, columnWidthsByColumnIndex[column.index])
                    }
                    currentHeaderRow.push(column)
                }
            }
            result.push(currentHeaderRow)
        }
        columns = result[rowCount];
        result = this._prepareItems(result.slice(0, -1));
        result.push(columns);
        return result
    },
    _calculateExportColspan: function(column) {
        var _this = this;
        if (!column.isBand) {
            return
        }
        var childColumns = this._columnsController.getChildrenByBandColumn(column.index, true);
        if (!(0, _type.isDefined)(childColumns)) {
            return
        }
        return childColumns.reduce(function(result, childColumn) {
            if (_this._needColumnExporting(childColumn)) {
                return result + (_this._calculateExportColspan(childColumn) || 1)
            } else {
                return result
            }
        }, 0)
    },
    _needColumnExporting: function(column) {
        return !column.command && (column.allowExporting || void 0 === column.allowExporting)
    },
    _getFooterSummaryItems: function(summaryCells, isTotal) {
        var result = [];
        var estimatedItemsCount = 1;
        var values;
        var itemsLength;
        var summaryCell;
        var j;
        var i = 0;
        do {
            values = [];
            for (j = 0; j < summaryCells.length; j++) {
                summaryCell = summaryCells[j];
                itemsLength = summaryCell.length;
                if (estimatedItemsCount < itemsLength) {
                    estimatedItemsCount = itemsLength
                }
                values.push(summaryCell[i])
            }
            result.push({
                values: values,
                rowType: isTotal ? "totalFooter" : "groupFooter"
            })
        } while (i++ < estimatedItemsCount - 1);
        return result
    },
    _hasSummaryGroupFooters: function() {
        var i;
        var groupItems = this.option("summary.groupItems");
        if ((0, _type.isDefined)(groupItems)) {
            for (i = 0; i < groupItems.length; i++) {
                if (groupItems[i].showInGroupFooter) {
                    return true
                }
            }
        }
        return false
    },
    _getItemsWithSummaryGroupFooters: function(sourceItems) {
        var item;
        var result = [];
        var beforeGroupFooterItems = [];
        var groupFooterItems = [];
        var i;
        for (i = 0; i < sourceItems.length; i++) {
            item = sourceItems[i];
            if ("groupFooter" === item.rowType) {
                groupFooterItems = this._getFooterSummaryItems(item.summaryCells);
                result = result.concat(beforeGroupFooterItems, groupFooterItems);
                beforeGroupFooterItems = []
            } else {
                beforeGroupFooterItems.push(item)
            }
        }
        return result.length ? result : beforeGroupFooterItems
    },
    _updateGroupValuesWithSummaryByColumn: function(sourceItems) {
        var item;
        var summaryCells;
        var summaryItem;
        var summaryValues = [];
        var groupColumnCount;
        var k;
        var j;
        var i;
        for (i = 0; i < sourceItems.length; i++) {
            item = sourceItems[i];
            summaryCells = item.summaryCells;
            if ("group" === item.rowType && summaryCells && summaryCells.length > 1) {
                groupColumnCount = item.values.length;
                for (j = 1; j < summaryCells.length; j++) {
                    for (k = 0; k < summaryCells[j].length; k++) {
                        summaryItem = summaryCells[j][k];
                        if (summaryItem && summaryItem.alignByColumn) {
                            if (!Array.isArray(summaryValues[j - groupColumnCount])) {
                                summaryValues[j - groupColumnCount] = []
                            }
                            summaryValues[j - groupColumnCount].push(summaryItem)
                        }
                    }
                }
                if (summaryValues.length > 0) {
                    _array2.default.merge(item.values, summaryValues);
                    summaryValues = []
                }
            }
        }
    },
    _processUnExportedItems: function(items) {
        var columns = this._columnsController.getVisibleColumns(null, true);
        var groupColumns = this._columnsController.getGroupColumns();
        var item;
        var column;
        var values;
        var summaryCells;
        var i;
        var j;
        for (i = 0; i < items.length; i++) {
            item = items[i];
            values = [];
            summaryCells = [];
            for (j = 0; j < columns.length; j++) {
                column = columns[j];
                if (this._needColumnExporting(column)) {
                    if (item.values) {
                        if ("group" === item.rowType && !values.length) {
                            values.push(item.key[item.groupIndex])
                        } else {
                            values.push(item.values[j])
                        }
                    }
                    if (item.summaryCells) {
                        if ("group" === item.rowType && !summaryCells.length) {
                            summaryCells.push(item.summaryCells[j - groupColumns.length + item.groupIndex])
                        } else {
                            summaryCells.push(item.summaryCells[j])
                        }
                    }
                }
            }
            if (values.length) {
                item.values = values
            }
            if (summaryCells.length) {
                item.summaryCells = summaryCells
            }
        }
    },
    _getAllItems: function(data) {
        var that = this;
        var d = new _deferred.Deferred;
        var dataController = this.getController("data");
        var footerItems = dataController.footerItems();
        var totalItem = footerItems.length && footerItems[0];
        var summaryTotalItems = that.option("summary.totalItems");
        var summaryCells;
        var summaryItems;
        (0, _deferred.when)(data).done(function(data) {
            dataController.loadAll(data).done(function(sourceItems, totalAggregates) {
                that._updateGroupValuesWithSummaryByColumn(sourceItems);
                if (that._hasSummaryGroupFooters()) {
                    sourceItems = that._getItemsWithSummaryGroupFooters(sourceItems)
                }
                summaryCells = totalItem && totalItem.summaryCells;
                if ((0, _type.isDefined)(totalAggregates) && summaryTotalItems) {
                    summaryCells = dataController._getSummaryCells(summaryTotalItems, totalAggregates)
                }
                summaryItems = totalItem && that._getFooterSummaryItems(summaryCells, true);
                if (summaryItems) {
                    sourceItems = sourceItems.concat(summaryItems)
                }
                that._processUnExportedItems(sourceItems);
                d.resolve(sourceItems)
            }).fail(d.reject)
        }).fail(d.reject);
        return d
    },
    _getSelectedItems: function() {
        var selectionController = this.getController("selection");
        var selectedRowData = selectionController.getSelectedRowsData();
        return this._getAllItems(selectedRowData)
    },
    _getColumnWidths: function(headersView, rowsView) {
        return headersView && headersView.isVisible() ? headersView.getColumnWidths() : rowsView.getColumnWidths()
    },
    init: function() {
        this._columnsController = this.getController("columns");
        this._rowsView = this.getView("rowsView");
        this._headersView = this.getView("columnHeadersView");
        this.createAction("onExporting", {
            excludeValidators: ["disabled", "readOnly"]
        });
        this.createAction("onExported", {
            excludeValidators: ["disabled", "readOnly"]
        });
        this.createAction("onFileSaving", {
            excludeValidators: ["disabled", "readOnly"]
        })
    },
    callbackNames: function() {
        return ["selectionOnlyChanged"]
    },
    getExportFormat: function() {
        return ["EXCEL"]
    },
    getDataProvider: function(selectedRowsOnly) {
        var columnWidths = this._getColumnWidths(this._headersView, this._rowsView);
        var initialColumnWidthsByColumnIndex;
        if (columnWidths && columnWidths.length) {
            initialColumnWidthsByColumnIndex = {};
            var columnsLastRowVisibleColumns = this._columnsController.getVisibleColumns(this._columnsController.getRowCount(), true);
            for (var i = 0; i < columnsLastRowVisibleColumns.length; i++) {
                initialColumnWidthsByColumnIndex[columnsLastRowVisibleColumns[i].index] = columnWidths[i]
            }
        }
        return new exports.DataProvider(this, initialColumnWidthsByColumnIndex, selectedRowsOnly)
    },
    exportToExcel: function(selectionOnly) {
        var that = this;
        that._selectionOnly = selectionOnly;
        (0, _exporter.export)(that.component.getDataProvider(), {
            fileName: that.option("export.fileName"),
            proxyUrl: that.option("export.proxyUrl"),
            format: "EXCEL",
            autoFilterEnabled: !!that.option("export.excelFilterEnabled"),
            rtlEnabled: that.option("rtlEnabled"),
            ignoreErrors: that.option("export.ignoreExcelErrors"),
            exportingAction: that.getAction("onExporting"),
            exportedAction: that.getAction("onExported"),
            fileSavingAction: that.getAction("onFileSaving")
        }, _exporter.excel.getData)
    },
    publicMethods: function() {
        return ["getDataProvider", "getExportFormat", "exportToExcel"]
    },
    selectionOnly: function(value) {
        if ((0, _type.isDefined)(value)) {
            this._isSelectedRows = value;
            this.selectionOnlyChanged.fire()
        } else {
            return this._isSelectedRows
        }
    }
});
_uiData_grid2.default.registerModule("export", {
    defaultOptions: function() {
        return {
            "export": {
                enabled: false,
                fileName: "DataGrid",
                excelFilterEnabled: false,
                excelWrapTextEnabled: void 0,
                proxyUrl: void 0,
                allowExportSelectedData: false,
                ignoreExcelErrors: true,
                texts: {
                    exportTo: _message2.default.format("dxDataGrid-exportTo"),
                    exportAll: _message2.default.format("dxDataGrid-exportAll"),
                    exportSelectedRows: _message2.default.format("dxDataGrid-exportSelectedRows")
                }
            }
        }
    },
    controllers: {
        "export": exports.ExportController
    },
    extenders: {
        controllers: {
            editing: {
                callbackNames: function() {
                    var callbackList = this.callBase();
                    return (0, _type.isDefined)(callbackList) ? callbackList.push("editingChanged") : ["editingChanged"]
                },
                _updateEditButtons: function() {
                    this.callBase();
                    this.editingChanged.fire(this.hasChanges())
                }
            }
        },
        views: {
            headerPanel: {
                _getToolbarItems: function() {
                    var items = this.callBase();
                    return this._appendExportItems(items)
                },
                _appendExportItems: function(items) {
                    var that = this;
                    var exportOptions = that.option("export");
                    if (exportOptions.enabled) {
                        var exportItems = [];
                        if (exportOptions.allowExportSelectedData) {
                            exportItems.push({
                                template: function(data, index, container) {
                                    var $container = (0, _renderer2.default)(container);
                                    that._renderButton(data, $container);
                                    that._renderExportMenu($container)
                                },
                                menuItemTemplate: function(data, index, container) {
                                    that._renderList(data, (0, _renderer2.default)(container))
                                },
                                name: "exportButton",
                                allowExportSelected: true,
                                location: "after",
                                locateInMenu: "auto",
                                sortIndex: 30
                            })
                        } else {
                            exportItems.push({
                                template: function(data, index, container) {
                                    that._renderButton(data, (0, _renderer2.default)(container))
                                },
                                menuItemTemplate: function(data, index, container) {
                                    that._renderButton(data, (0, _renderer2.default)(container), true)
                                },
                                name: "exportButton",
                                location: "after",
                                locateInMenu: "auto",
                                sortIndex: 30
                            })
                        }
                        items = items.concat(exportItems);
                        that._correctItemsPosition(items)
                    }
                    return items
                },
                _renderButton: function(data, $container, withText) {
                    var that = this;
                    var buttonOptions = that._getButtonOptions(data.allowExportSelected);
                    var $buttonContainer = that._getButtonContainer().addClass(DATAGRID_EXPORT_BUTTON_CLASS).appendTo($container);
                    if (withText) {
                        var wrapperNode = (0, _renderer2.default)("<div>").addClass(TOOLBAR_ITEM_AUTO_HIDE_CLASS);
                        $container.wrapInner(wrapperNode).parent().addClass("dx-toolbar-menu-action dx-toolbar-menu-button " + TOOLBAR_HIDDEN_BUTTON_CLASS);
                        buttonOptions.text = buttonOptions.hint
                    }
                    that._createComponent($buttonContainer, _button2.default, buttonOptions)
                },
                _renderList: function(data, $container) {
                    var that = this;
                    var texts = that.option("export.texts");
                    var items = [{
                        template: function(data, index, container) {
                            that._renderFakeButton(data, (0, _renderer2.default)(container), DATAGRID_EXPORT_EXCEL_ICON)
                        },
                        text: texts.exportAll
                    }, {
                        template: function(data, index, container) {
                            that._renderFakeButton(data, (0, _renderer2.default)(container), DATAGRID_EXPORT_SELECTED_ICON)
                        },
                        text: texts.exportSelectedRows,
                        exportSelected: true
                    }];
                    that._createComponent($container, _list2.default, {
                        items: items,
                        onItemClick: function(e) {
                            that._exportController.exportToExcel(e.itemData.exportSelected)
                        },
                        scrollingEnabled: false
                    })
                },
                _renderFakeButton: function(data, $container, iconName) {
                    var $icon = (0, _renderer2.default)("<div>").addClass("dx-icon dx-icon-" + iconName);
                    var $text = (0, _renderer2.default)("<span>").addClass("dx-button-text").text(data.text);
                    var $content = (0, _renderer2.default)("<div>").addClass("dx-button-content").append($icon).append($text);
                    var $button = (0, _renderer2.default)("<div>").addClass(BUTTON_CLASS + " dx-button-has-text dx-button-has-icon dx-datagrid-toolbar-button").append($content);
                    var $toolbarItem = (0, _renderer2.default)("<div>").addClass(TOOLBAR_ITEM_AUTO_HIDE_CLASS).append($button);
                    $container.append($toolbarItem).parent().addClass("dx-toolbar-menu-custom " + TOOLBAR_HIDDEN_BUTTON_CLASS)
                },
                _correctItemsPosition: function(items) {
                    items.sort(function(itemA, itemB) {
                        return itemA.sortIndex - itemB.sortIndex
                    })
                },
                _renderExportMenu: function($buttonContainer) {
                    var that = this;
                    var $button = $buttonContainer.find("." + BUTTON_CLASS);
                    var texts = that.option("export.texts");
                    var menuItems = [{
                        text: texts.exportAll,
                        icon: DATAGRID_EXPORT_EXCEL_ICON
                    }, {
                        text: texts.exportSelectedRows,
                        exportSelected: true,
                        icon: DATAGRID_EXPORT_SELECTED_ICON
                    }];
                    var $menuContainer = (0, _renderer2.default)("<div>").appendTo($buttonContainer);
                    that._contextMenu = that._createComponent($menuContainer, _context_menu2.default, {
                        showEvent: "dxclick",
                        items: menuItems,
                        cssClass: DATAGRID_EXPORT_MENU_CLASS,
                        onItemClick: function(e) {
                            that._exportController.exportToExcel(e.itemData.exportSelected)
                        },
                        target: $button,
                        position: {
                            at: "left bottom",
                            my: "left top",
                            offset: "0 3",
                            collision: "fit",
                            boundary: that._$parent,
                            boundaryOffset: "1 1"
                        }
                    })
                },
                _isExportButtonVisible: function() {
                    return this.option("export.enabled")
                },
                _getButtonOptions: function(allowExportSelected) {
                    var that = this;
                    var texts = that.option("export.texts");
                    var options;
                    if (allowExportSelected) {
                        options = {
                            hint: texts.exportTo,
                            icon: DATAGRID_EXPORT_ICON
                        }
                    } else {
                        options = {
                            hint: texts.exportAll,
                            icon: DATAGRID_EXPORT_EXCEL_BUTTON_ICON,
                            onClick: function() {
                                that._exportController.exportToExcel()
                            }
                        }
                    }
                    return options
                },
                optionChanged: function(args) {
                    this.callBase(args);
                    if ("export" === args.name) {
                        args.handled = true;
                        this._invalidate()
                    }
                },
                init: function() {
                    var that = this;
                    this.callBase();
                    this._exportController = this.getController("export");
                    this._editingController = this.getController("editing");
                    this._editingController.editingChanged.add(function(hasChanges) {
                        that.setToolbarItemDisabled("exportButton", hasChanges)
                    })
                },
                isVisible: function() {
                    return this.callBase() || this._isExportButtonVisible()
                }
            }
        }
    }
});
