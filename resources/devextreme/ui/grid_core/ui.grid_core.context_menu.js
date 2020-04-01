/**
 * DevExtreme (ui/grid_core/ui.grid_core.context_menu.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var _renderer = require("../../core/renderer");
var _renderer2 = _interopRequireDefault(_renderer);
var _dom = require("../../core/utils/dom");
var _common = require("../../core/utils/common");
var _iterator = require("../../core/utils/iterator");
var _uiGrid_core = require("./ui.grid_core.modules");
var _uiGrid_core2 = _interopRequireDefault(_uiGrid_core);
var _context_menu = require("../context_menu");
var _context_menu2 = _interopRequireDefault(_context_menu);

function _interopRequireDefault(obj) {
    return obj && obj.__esModule ? obj : {
        "default": obj
    }
}
var CONTEXT_MENU = "dx-context-menu";
var viewName = {
    columnHeadersView: "header",
    rowsView: "content",
    footerView: "footer",
    headerPanel: "headerPanel"
};
var VIEW_NAMES = ["columnHeadersView", "rowsView", "footerView", "headerPanel"];
var ContextMenuController = _uiGrid_core2.default.ViewController.inherit({
    init: function() {
        this.createAction("onContextMenuPreparing")
    },
    getContextMenuItems: function(dxEvent) {
        if (!dxEvent) {
            return false
        }
        var that = this;
        var $targetElement = (0, _renderer2.default)(dxEvent.target);
        var view;
        var options;
        var rowIndex;
        var columnIndex;
        var rowOptions;
        var $element;
        var $targetRowElement;
        var $targetCellElement;
        var menuItems;
        (0, _iterator.each)(VIEW_NAMES, function() {
            view = that.getView(this);
            $element = view && view.element();
            if ($element && ($element.is($targetElement) || $element.find($targetElement).length)) {
                $targetCellElement = $targetElement.closest(".dx-row > td, .dx-row > tr");
                $targetRowElement = $targetCellElement.parent();
                rowIndex = view.getRowIndex($targetRowElement);
                columnIndex = $targetCellElement[0] && $targetCellElement[0].cellIndex;
                rowOptions = $targetRowElement.data("options");
                options = {
                    event: dxEvent,
                    targetElement: (0, _dom.getPublicElement)($targetElement),
                    target: viewName[this],
                    rowIndex: rowIndex,
                    row: view._getRows()[rowIndex],
                    columnIndex: columnIndex,
                    column: rowOptions && rowOptions.cells[columnIndex].column
                };
                options.items = view.getContextMenuItems && view.getContextMenuItems(options);
                that.executeAction("onContextMenuPreparing", options);
                that._contextMenuPrepared(options);
                menuItems = options.items;
                if (menuItems) {
                    return false
                }
            }
        });
        return menuItems
    },
    _contextMenuPrepared: _common.noop
});
var ContextMenuView = _uiGrid_core2.default.View.inherit({
    _renderCore: function() {
        var that = this;
        var $element = that.element().addClass(CONTEXT_MENU);
        this.setAria("role", "presentation", $element);
        this._createComponent($element, _context_menu2.default, {
            onPositioning: function(actionArgs) {
                var event = actionArgs.event;
                var contextMenuInstance = actionArgs.component;
                var items = that.getController("contextMenu").getContextMenuItems(event);
                if (items) {
                    contextMenuInstance.option("items", items);
                    event.stopPropagation()
                } else {
                    actionArgs.cancel = true
                }
            },
            onItemClick: function(params) {
                params.itemData.onItemClick && params.itemData.onItemClick(params)
            },
            cssClass: that.getWidgetContainerClass(),
            target: that.component.$element()
        })
    }
});
module.exports = {
    defaultOptions: function() {
        return {
            onContextMenuPreparing: null
        }
    },
    controllers: {
        contextMenu: ContextMenuController
    },
    views: {
        contextMenuView: ContextMenuView
    }
};
