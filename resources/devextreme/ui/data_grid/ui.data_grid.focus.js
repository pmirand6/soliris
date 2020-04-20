/**
 * DevExtreme (ui/data_grid/ui.data_grid.focus.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var _uiData_grid = require("./ui.data_grid.core");
var _uiData_grid2 = _interopRequireDefault(_uiData_grid);
var _uiGrid_core = require("../grid_core/ui.grid_core.focus");
var _uiGrid_core2 = _interopRequireDefault(_uiGrid_core);
var _deferred = require("../../core/utils/deferred");
var _type = require("../../core/utils/type");
var _common = require("../../core/utils/common");
var _uiData_grid3 = require("./ui.data_grid.utils");
var _data = require("../../core/utils/data");
var _extend = require("../../core/utils/extend");

function _interopRequireDefault(obj) {
    return obj && obj.__esModule ? obj : {
        "default": obj
    }
}
var MAX_SAFE_INTEGER = Number.MAX_SAFE_INTEGER || 9007199254740991;
_uiData_grid2.default.registerModule("focus", (0, _extend.extend)(true, {}, _uiGrid_core2.default, {
    extenders: {
        controllers: {
            data: {
                changeRowExpand: function(path) {
                    if (this.option("focusedRowEnabled") && Array.isArray(path) && this.isRowExpanded(path)) {
                        if (this._isFocusedRowInsideGroup(path)) {
                            this.option("focusedRowKey", path)
                        }
                    }
                    return this.callBase.apply(this, arguments)
                },
                _isFocusedRowInsideGroup: function(path) {
                    var columnsController = this.getController("columns");
                    var focusedRowKey = this.option("focusedRowKey");
                    var rowIndex = this.getRowIndexByKey(focusedRowKey);
                    var focusedRow = rowIndex >= 0 && this.getVisibleRows()[rowIndex];
                    var groups = columnsController.getGroupDataSourceParameters(true);
                    var getter;
                    if (focusedRow) {
                        for (var i = 0; i < path.length; ++i) {
                            getter = (0, _data.compileGetter)(groups[i] && groups[i].selector);
                            if (getter(focusedRow.data) !== path[i]) {
                                return false
                            }
                        }
                    }
                    return true
                },
                _getGroupPath: function(group) {
                    var groupPath = [group.key];
                    var items = group.items;
                    while (items && items[0]) {
                        var item = items[0];
                        if (void 0 !== item.key) {
                            groupPath.push(item.key)
                        }
                        items = item.items
                    }
                    return groupPath
                },
                _expandGroupByPath: function(that, groupPath, level) {
                    var d = new _deferred.Deferred;
                    level++;
                    that.expandRow(groupPath.slice(0, level)).done(function() {
                        if (level === groupPath.length) {
                            d.resolve()
                        } else {
                            that._expandGroupByPath(that, groupPath, level).done(d.resolve).fail(d.reject)
                        }
                    }).fail(d.reject);
                    return d.promise()
                },
                _calculateGlobalRowIndexByGroupedData: function(key) {
                    var that = this;
                    var dataSource = that._dataSource;
                    var filter = that._generateFilterByKey(key);
                    var deferred = new _deferred.Deferred;
                    var groupPath;
                    var isGroupKey = Array.isArray(key);
                    var group = dataSource.group();
                    if (isGroupKey) {
                        return deferred.resolve(-1).promise()
                    }
                    if (!dataSource._grouping._updatePagingOptions) {
                        that._calculateGlobalRowIndexByFlatData(key, null, true).done(deferred.resolve).fail(deferred.reject);
                        return deferred
                    }
                    dataSource.load({
                        filter: that._concatWithCombinedFilter(filter),
                        group: group
                    }).done(function(data) {
                        if (!data || 0 === data.length || !(0, _type.isDefined)(data[0].key) || data[0].key === -1) {
                            return deferred.resolve(-1).promise()
                        }
                        groupPath = that._getGroupPath(data[0]);
                        that._expandGroupByPath(that, groupPath, 0).done(function() {
                            that._calculateExpandedRowGlobalIndex(deferred, key, groupPath, group)
                        }).fail(deferred.reject)
                    }).fail(deferred.reject);
                    return deferred.promise()
                },
                _calculateExpandedRowGlobalIndex: function(deferred, key, groupPath, group) {
                    var groupFilter = (0, _uiData_grid3.createGroupFilter)(groupPath, {
                        group: group
                    });
                    var dataSource = this._dataSource;
                    var scrollingMode = this.option("scrolling.mode");
                    var isVirtualScrolling = "virtual" === scrollingMode || "infinite" === scrollingMode;
                    var pageSize = dataSource.pageSize();
                    var groupOffset;
                    dataSource._grouping._updatePagingOptions({
                        skip: 0,
                        take: MAX_SAFE_INTEGER
                    }, function(groupInfo, totalOffset) {
                        if ((0, _common.equalByValue)(groupInfo.path, groupPath)) {
                            groupOffset = totalOffset
                        }
                    });
                    this._calculateGlobalRowIndexByFlatData(key, groupFilter).done(function(dataOffset) {
                        var count;
                        var currentPageOffset;
                        var groupContinuationCount;
                        if (dataOffset < 0) {
                            deferred.resolve(-1);
                            return
                        }
                        currentPageOffset = groupOffset % pageSize || pageSize;
                        count = currentPageOffset + dataOffset - groupPath.length;
                        if (isVirtualScrolling) {
                            groupContinuationCount = 0
                        } else {
                            groupContinuationCount = Math.floor(count / (pageSize - groupPath.length)) * groupPath.length
                        }
                        count = groupOffset + dataOffset + groupContinuationCount;
                        deferred.resolve(count)
                    }).fail(deferred.reject)
                }
            }
        }
    }
}));