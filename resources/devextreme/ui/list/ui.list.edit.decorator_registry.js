/**
 * DevExtreme (ui/list/ui.list.edit.decorator_registry.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var extend = require("../../core/utils/extend").extend;
exports.registry = {};
exports.register = function(option, type, decoratorClass) {
    var decoratorsRegistry = exports.registry;
    var decoratorConfig = {};
    decoratorConfig[option] = decoratorsRegistry[option] ? decoratorsRegistry[option] : {};
    decoratorConfig[option][type] = decoratorClass;
    decoratorsRegistry = extend(decoratorsRegistry, decoratorConfig)
};
