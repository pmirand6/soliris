/**
 * DevExtreme (ui/toolbar.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var $ = require("../core/renderer");
var themes = require("./themes");
var registerComponent = require("../core/component_registrator");
var grep = require("../core/utils/common").grep;
var extend = require("../core/utils/extend").extend;
var arrayUtils = require("../core/utils/array");
var iteratorUtils = require("../core/utils/iterator");
var ActionSheetStrategy = require("./toolbar/ui.toolbar.strategy.action_sheet");
var DropDownMenuStrategy = require("./toolbar/ui.toolbar.strategy.drop_down_menu");
var ToolbarBase = require("./toolbar/ui.toolbar.base");
var ChildDefaultTemplate = require("../core/templates/child_default_template").ChildDefaultTemplate;
var STRATEGIES = {
    actionSheet: ActionSheetStrategy,
    dropDownMenu: DropDownMenuStrategy
};
var TOOLBAR_AUTO_HIDE_ITEM_CLASS = "dx-toolbar-item-auto-hide";
var TOOLBAR_AUTO_HIDE_TEXT_CLASS = "dx-toolbar-text-auto-hide";
var TOOLBAR_HIDDEN_ITEM = "dx-toolbar-item-invisible";
var Toolbar = ToolbarBase.inherit({
    _getDefaultOptions: function() {
        return extend(this.callBase(), {
            menuItemTemplate: "menuItem",
            submenuType: "dropDownMenu",
            menuContainer: void 0
        })
    },
    _defaultOptionsRules: function() {
        var themeName = themes.current();
        return this.callBase().concat([{
            device: function() {
                return themes.isIos7(themeName)
            },
            options: {
                submenuType: "actionSheet"
            }
        }])
    },
    _dimensionChanged: function(dimension) {
        if ("height" === dimension) {
            return
        }
        this._menuStrategy.toggleMenuVisibility(false, true);
        this.callBase();
        this._menuStrategy.renderMenuItems()
    },
    _initTemplates: function() {
        this.callBase();
        this._defaultTemplates.actionSheetItem = new ChildDefaultTemplate("item")
    },
    _initMarkup: function() {
        this.callBase();
        this._renderMenu()
    },
    _postProcessRenderItems: function() {
        this._hideOverflowItems();
        this._menuStrategy._updateMenuVisibility();
        this.callBase();
        this._menuStrategy.renderMenuItems()
    },
    _renderItem: function(index, item, itemContainer, $after) {
        var itemElement = this.callBase(index, item, itemContainer, $after);
        if ("auto" === item.locateInMenu) {
            itemElement.addClass(TOOLBAR_AUTO_HIDE_ITEM_CLASS)
        }
        if ("dxButton" === item.widget && "inMenu" === item.showText) {
            itemElement.toggleClass(TOOLBAR_AUTO_HIDE_TEXT_CLASS)
        }
        return itemElement
    },
    _getItemsWidth: function() {
        return this._getSummaryItemsWidth([this._$beforeSection, this._$centerSection, this._$afterSection])
    },
    _hideOverflowItems: function(elementWidth) {
        var overflowItems = this.$element().find("." + TOOLBAR_AUTO_HIDE_ITEM_CLASS);
        if (!overflowItems.length) {
            return
        }
        elementWidth = elementWidth || this.$element().width();
        $(overflowItems).removeClass(TOOLBAR_HIDDEN_ITEM);
        var itemsWidth = this._getItemsWidth();
        while (overflowItems.length && elementWidth < itemsWidth) {
            var $item = overflowItems.eq(-1);
            itemsWidth -= $item.outerWidth();
            $item.addClass(TOOLBAR_HIDDEN_ITEM);
            overflowItems.splice(-1, 1)
        }
    },
    _getMenuItems: function() {
        var that = this;
        var menuItems = grep(this.option("items") || [], function(item) {
            return that._isMenuItem(item)
        });
        var $hiddenItems = this._itemContainer().children("." + TOOLBAR_AUTO_HIDE_ITEM_CLASS + "." + TOOLBAR_HIDDEN_ITEM).not(".dx-state-invisible");
        this._restoreItems = this._restoreItems || [];
        var overflowItems = [].slice.call($hiddenItems).map(function(item) {
            var itemData = that._getItemData(item);
            var $itemContainer = $(item).children();
            var $itemMarkup = $itemContainer.children();
            return extend({
                menuItemTemplate: function() {
                    that._restoreItems.push({
                        container: $itemContainer,
                        item: $itemMarkup
                    });
                    var $container = $("<div>").addClass(TOOLBAR_AUTO_HIDE_ITEM_CLASS);
                    return $container.append($itemMarkup)
                }
            }, itemData)
        });
        return arrayUtils.merge(overflowItems, menuItems)
    },
    _getToolbarItems: function() {
        var that = this;
        return grep(this.option("items") || [], function(item) {
            return !that._isMenuItem(item)
        })
    },
    _renderMenu: function() {
        this._renderMenuStrategy();
        this._menuStrategy.render()
    },
    _renderMenuStrategy: function() {
        var strategyName = this.option("submenuType");
        if (this._requireDropDownStrategy()) {
            strategyName = "dropDownMenu"
        }
        var strategy = STRATEGIES[strategyName];
        if (!(this._menuStrategy && this._menuStrategy.NAME === strategyName)) {
            this._menuStrategy = new strategy(this)
        }
    },
    _requireDropDownStrategy: function() {
        var items = this.option("items") || [];
        var result = false;
        iteratorUtils.each(items, function(index, item) {
            if ("auto" === item.locateInMenu) {
                result = true
            } else {
                if ("always" === item.locateInMenu && item.widget) {
                    result = true
                }
            }
        });
        return result
    },
    _arrangeItems: function() {
        if (this.$element().is(":hidden")) {
            return
        }
        this._$centerSection.css({
            margin: "0 auto",
            "float": "none"
        });
        iteratorUtils.each(this._restoreItems || [], function(_, obj) {
            $(obj.container).append(obj.item)
        });
        this._restoreItems = [];
        var elementWidth = this.$element().width();
        this._hideOverflowItems(elementWidth);
        this.callBase(elementWidth)
    },
    _itemOptionChanged: function(item, property, value) {
        if (this._isMenuItem(item)) {
            this._menuStrategy.renderMenuItems()
        } else {
            if (this._isToolbarItem(item)) {
                this.callBase(item, property, value)
            } else {
                this.callBase(item, property, value);
                this._menuStrategy.renderMenuItems()
            }
        }
        if ("location" === property) {
            this.repaint()
        }
    },
    _isMenuItem: function(itemData) {
        return "menu" === itemData.location || "always" === itemData.locateInMenu
    },
    _isToolbarItem: function(itemData) {
        return void 0 === itemData.location || "never" === itemData.locateInMenu
    },
    _optionChanged: function(args) {
        var name = args.name;
        var value = args.value;
        switch (name) {
            case "submenuType":
                this._invalidate();
                break;
            case "visible":
                this.callBase.apply(this, arguments);
                this._menuStrategy.handleToolbarVisibilityChange(value);
                break;
            case "menuItemTemplate":
                this._changeMenuOption("itemTemplate", this._getTemplate(value));
                break;
            case "onItemClick":
                this._changeMenuOption(name, value);
                this.callBase.apply(this, arguments);
                break;
            case "menuContainer":
                this._changeMenuOption("container", value);
                break;
            default:
                this.callBase.apply(this, arguments)
        }
    },
    _changeMenuOption: function(name, value) {
        this._menuStrategy.widgetOption(name, value)
    }
});
registerComponent("dxToolbar", Toolbar);
module.exports = Toolbar;
module.exports.default = module.exports;