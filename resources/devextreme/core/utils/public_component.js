/**
 * DevExtreme (core/utils/public_component.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var dataUtils = require("../../core/element_data");
var eventsEngine = require("../../events/core/events_engine");
var WeakMap = require("../polyfills/weak_map");
var isDefined = require("./type").isDefined;
var removeEvent = require("../remove_event");
var COMPONENT_NAMES_DATA_KEY = "dxComponents";
var ANONYMOUS_COMPONENT_DATA_KEY = "dxPrivateComponent";
var componentNames = new WeakMap;
var nextAnonymousComponent = 0;
var getName = exports.name = function(componentClass, newName) {
    if (isDefined(newName)) {
        componentNames.set(componentClass, newName);
        return
    }
    if (!componentNames.has(componentClass)) {
        var generatedName = ANONYMOUS_COMPONENT_DATA_KEY + nextAnonymousComponent++;
        componentNames.set(componentClass, generatedName);
        return generatedName
    }
    return componentNames.get(componentClass)
};
exports.attachInstanceToElement = function($element, componentInstance, disposeFn) {
    var data = dataUtils.data($element.get(0));
    var name = getName(componentInstance.constructor);
    data[name] = componentInstance;
    if (disposeFn) {
        eventsEngine.one($element, removeEvent, function() {
            disposeFn.call(componentInstance)
        })
    }
    if (!data[COMPONENT_NAMES_DATA_KEY]) {
        data[COMPONENT_NAMES_DATA_KEY] = []
    }
    data[COMPONENT_NAMES_DATA_KEY].push(name)
};
exports.getInstanceByElement = function($element, componentClass) {
    var name = getName(componentClass);
    return dataUtils.data($element.get(0), name)
};
