/**
 * DevExtreme (ui/tree_view/ui.tree_view.search.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var _renderer = require("../../core/renderer");
var _renderer2 = _interopRequireDefault(_renderer);
var _component_registrator = require("../../core/component_registrator");
var _component_registrator2 = _interopRequireDefault(_component_registrator);
var _ui = require("../widget/ui.search_box_mixin");
var _ui2 = _interopRequireDefault(_ui);
var _extend = require("../../core/utils/extend");
var _uiTree_view = require("./ui.tree_view.base");
var _uiTree_view2 = _interopRequireDefault(_uiTree_view);

function _interopRequireDefault(obj) {
    return obj && obj.__esModule ? obj : {
        "default": obj
    }
}
var WIDGET_CLASS = "dx-treeview";
var NODE_CONTAINER_CLASS = "".concat(WIDGET_CLASS, "-node-container");
var TreeViewSearch = _uiTree_view2.default.inherit(_ui2.default).inherit({
    _addWidgetPrefix: function(className) {
        return "".concat(WIDGET_CLASS, "-").concat(className)
    },
    _optionChanged: function(args) {
        switch (args.name) {
            case "searchValue":
                if (this._showCheckboxes() && this._isRecursiveSelection()) {
                    this._removeSelection()
                }
                this._initDataAdapter();
                this._updateSearch();
                this._repaintContainer();
                break;
            case "searchExpr":
                this._initDataAdapter();
                this.repaint();
                break;
            case "searchMode":
                this.option("expandNodesRecursive") ? this._updateDataAdapter() : this._initDataAdapter();
                this.repaint();
                break;
            default:
                this.callBase(args)
        }
    },
    _updateDataAdapter: function() {
        this._setOptionSilent("expandNodesRecursive", false);
        this._initDataAdapter();
        this._setOptionSilent("expandNodesRecursive", true)
    },
    _getDataAdapterOptions: function() {
        return (0, _extend.extend)(this.callBase(), {
            searchValue: this.option("searchValue"),
            searchMode: this.option("searchMode") || "contains",
            searchExpr: this.option("searchExpr")
        })
    },
    _updateSearch: function() {
        if (this._searchEditor) {
            var editorOptions = this._getSearchEditorOptions();
            this._searchEditor.option(editorOptions)
        }
    },
    _repaintContainer: function() {
        var $container = this.$element().find(".".concat(NODE_CONTAINER_CLASS)).first();
        var rootNodes;
        if ($container.length) {
            $container.empty();
            rootNodes = this._dataAdapter.getRootNodes();
            this._renderEmptyMessage(rootNodes);
            this._renderItems($container, rootNodes);
            this._fireContentReadyAction()
        }
    },
    _itemContainer: function(isSearchMode) {
        if (this._scrollableContainer && isSearchMode) {
            return (0, _renderer2.default)(this._scrollableContainer.content())
        }
        return this.callBase()
    },
    _addWidgetClass: function() {
        this.$element().addClass(this._widgetClass())
    },
    _clean: function() {
        this.callBase();
        this._removeSearchBox()
    }
});
(0, _component_registrator2.default)("dxTreeView", TreeViewSearch);
module.exports = TreeViewSearch;
