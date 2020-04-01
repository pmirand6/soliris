/**
 * DevExtreme (ui/nav_bar.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var registerComponent = require("../core/component_registrator");
var extend = require("../core/utils/extend").extend;
var NavBarItem = require("./nav_bar/item");
var Tabs = require("./tabs");
var NAVBAR_CLASS = "dx-navbar";
var ITEM_CLASS = "dx-item-content";
var NAVBAR_ITEM_CLASS = "dx-nav-item";
var NAVBAR_ITEM_CONTENT_CLASS = "dx-nav-item-content";
var NavBar = Tabs.inherit({
    _getDefaultOptions: function() {
        return extend(this.callBase(), {
            scrollingEnabled: false
        })
    },
    _render: function() {
        this.callBase();
        this.$element().addClass(NAVBAR_CLASS)
    },
    _postprocessRenderItem: function(args) {
        this.callBase(args);
        var $itemElement = args.itemElement;
        var itemData = args.itemData;
        $itemElement.addClass(NAVBAR_ITEM_CLASS);
        $itemElement.find("." + ITEM_CLASS).addClass(NAVBAR_ITEM_CONTENT_CLASS);
        if (!itemData.icon) {
            $itemElement.addClass("dx-navbar-text-item")
        }
    }
});
NavBar.ItemClass = NavBarItem;
registerComponent("dxNavBar", NavBar);
module.exports = NavBar;
module.exports.default = module.exports;
