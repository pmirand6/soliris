/**
 * DevExtreme (ui/button_group.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var _renderer = require("../core/renderer");
var _renderer2 = _interopRequireDefault(_renderer);
var _ui = require("./widget/ui.widget");
var _ui2 = _interopRequireDefault(_ui);
var _button = require("./button");
var _button2 = _interopRequireDefault(_button);
var _uiCollection_widget = require("./collection/ui.collection_widget.edit");
var _uiCollection_widget2 = _interopRequireDefault(_uiCollection_widget);
var _component_registrator = require("../core/component_registrator");
var _component_registrator2 = _interopRequireDefault(_component_registrator);
var _extend = require("../core/utils/extend");
var _type = require("../core/utils/type");
var _bindable_template = require("../core/templates/bindable_template");

function _interopRequireDefault(obj) {
    return obj && obj.__esModule ? obj : {
        "default": obj
    }
}
var BUTTON_GROUP_CLASS = "dx-buttongroup";
var BUTTON_GROUP_WRAPPER_CLASS = BUTTON_GROUP_CLASS + "-wrapper";
var BUTTON_GROUP_ITEM_CLASS = BUTTON_GROUP_CLASS + "-item";
var BUTTON_GROUP_FIRST_ITEM_CLASS = BUTTON_GROUP_CLASS + "-first-item";
var BUTTON_GROUP_LAST_ITEM_CLASS = BUTTON_GROUP_CLASS + "-last-item";
var BUTTON_GROUP_ITEM_HAS_WIDTH = BUTTON_GROUP_ITEM_CLASS + "-has-width";
var SHAPE_STANDARD_CLASS = "dx-shape-standard";
var ButtonCollection = _uiCollection_widget2.default.inherit({
    _initTemplates: function() {
        var _this = this;
        this.callBase();
        this._defaultTemplates.item = new _bindable_template.BindableTemplate(function($container, data, model) {
            _this._prepareItemStyles($container);
            _this._createComponent($container, _button2.default, (0, _extend.extend)({}, model, data, _this._getBasicButtonOptions(), {
                _templateData: model,
                template: model.template || _this.option("buttonTemplate")
            }))
        }, ["text", "type", "icon", "disabled", "visible", "hint"], this.option("integrationOptions.watchMethod"))
    },
    _getBasicButtonOptions: function() {
        return {
            focusStateEnabled: false,
            onClick: null,
            hoverStateEnabled: this.option("hoverStateEnabled"),
            activeStateEnabled: this.option("activeStateEnabled"),
            stylingMode: this.option("stylingMode")
        }
    },
    _getDefaultOptions: function() {
        return (0, _extend.extend)(this.callBase(), {
            itemTemplateProperty: null
        })
    },
    _prepareItemStyles: function($item) {
        var itemIndex = $item.data("dxItemIndex");
        0 === itemIndex && $item.addClass(BUTTON_GROUP_FIRST_ITEM_CLASS);
        var items = this.option("items");
        items && itemIndex === items.length - 1 && $item.addClass(BUTTON_GROUP_LAST_ITEM_CLASS);
        $item.addClass(SHAPE_STANDARD_CLASS)
    },
    _renderItemContent: function(args) {
        args.container = (0, _renderer2.default)(args.container).parent();
        return this.callBase(args)
    },
    _renderItemContentByNode: function(args, $node) {
        args.container = (0, _renderer2.default)(args.container.children().first());
        return this.callBase(args, $node)
    },
    _focusTarget: function() {
        return this.$element().parent()
    },
    _keyboardEventBindingTarget: function() {
        return this._focusTarget()
    },
    _refreshContent: function() {
        this._prepareContent();
        this._renderContent()
    },
    _itemClass: function() {
        return BUTTON_GROUP_ITEM_CLASS
    },
    _itemSelectHandler: function(e) {
        if ("single" === this.option("selectionMode") && this.isItemSelected(e.currentTarget)) {
            return
        }
        this.callBase(e)
    }
});
var ButtonGroup = _ui2.default.inherit({
    _getDefaultOptions: function() {
        return (0, _extend.extend)(this.callBase(), {
            hoverStateEnabled: true,
            focusStateEnabled: true,
            selectionMode: "single",
            selectedItems: [],
            selectedItemKeys: [],
            stylingMode: "contained",
            keyExpr: "text",
            items: [],
            buttonTemplate: "content",
            onSelectionChanged: null,
            onItemClick: null
        })
    },
    _setDeprecatedOptions: function() {
        this.callBase();
        (0, _extend.extend)(this._deprecatedOptions, {
            itemTemplate: {
                since: "19.2",
                alias: "buttonTemplate"
            }
        })
    },
    _init: function() {
        this.callBase();
        this._createItemClickAction()
    },
    _createItemClickAction: function() {
        this._itemClickAction = this._createActionByOption("onItemClick")
    },
    _initMarkup: function() {
        this.setAria("role", "group");
        this.$element().addClass(BUTTON_GROUP_CLASS);
        this._renderButtons();
        this._syncSelectionOptions();
        this.callBase()
    },
    _fireSelectionChangeEvent: function(addedItems, removedItems) {
        this._createActionByOption("onSelectionChanged", {
            excludeValidators: ["disabled", "readOnly"]
        })({
            addedItems: addedItems,
            removedItems: removedItems
        })
    },
    _renderButtons: function() {
        var _this2 = this;
        var $buttons = (0, _renderer2.default)("<div>").addClass(BUTTON_GROUP_WRAPPER_CLASS).appendTo(this.$element());
        var selectedItems = this.option("selectedItems");
        var options = {
            selectionMode: this.option("selectionMode"),
            items: this.option("items"),
            keyExpr: this.option("keyExpr"),
            buttonTemplate: this.option("buttonTemplate"),
            scrollingEnabled: false,
            selectedItemKeys: this.option("selectedItemKeys"),
            focusStateEnabled: this.option("focusStateEnabled"),
            hoverStateEnabled: this.option("hoverStateEnabled"),
            activeStateEnabled: this.option("activeStateEnabled"),
            stylingMode: this.option("stylingMode"),
            accessKey: this.option("accessKey"),
            tabIndex: this.option("tabIndex"),
            noDataText: "",
            selectionRequired: false,
            onItemRendered: function(e) {
                var width = _this2.option("width");
                (0, _type.isDefined)(width) && (0, _renderer2.default)(e.itemElement).addClass(BUTTON_GROUP_ITEM_HAS_WIDTH)
            },
            onSelectionChanged: function(e) {
                _this2._syncSelectionOptions();
                _this2._fireSelectionChangeEvent(e.addedItems, e.removedItems)
            },
            onItemClick: function(e) {
                _this2._itemClickAction(e)
            }
        };
        if ((0, _type.isDefined)(selectedItems) && selectedItems.length) {
            options.selectedItems = selectedItems
        }
        this._buttonsCollection = this._createComponent($buttons, ButtonCollection, options)
    },
    _syncSelectionOptions: function() {
        this._setOptionSilent("selectedItems", this._buttonsCollection.option("selectedItems"));
        this._setOptionSilent("selectedItemKeys", this._buttonsCollection.option("selectedItemKeys"))
    },
    _optionChanged: function(args) {
        switch (args.name) {
            case "stylingMode":
            case "selectionMode":
            case "keyExpr":
            case "buttonTemplate":
            case "items":
            case "activeStateEnabled":
            case "focusStateEnabled":
            case "hoverStateEnabled":
            case "tabIndex":
                this._invalidate();
                break;
            case "selectedItemKeys":
            case "selectedItems":
                this._buttonsCollection.option(args.name, args.value);
                break;
            case "onItemClick":
                this._createItemClickAction();
                break;
            case "onSelectionChanged":
                break;
            case "width":
                this.callBase(args);
                this._buttonsCollection.itemElements().toggleClass(BUTTON_GROUP_ITEM_HAS_WIDTH, !!args.value);
                break;
            default:
                this.callBase(args)
        }
    }
});
(0, _component_registrator2.default)("dxButtonGroup", ButtonGroup);
module.exports = ButtonGroup;
module.exports.default = module.exports;