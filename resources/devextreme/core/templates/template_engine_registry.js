/**
 * DevExtreme (core/templates/template_engine_registry.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
Object.defineProperty(exports, "__esModule", {
    value: true
});
exports.registerTemplateEngine = registerTemplateEngine;
exports.setTemplateEngine = setTemplateEngine;
exports.getCurrentTemplateEngine = getCurrentTemplateEngine;
var _type = require("../utils/type");
var _errors = require("../errors");
var _errors2 = _interopRequireDefault(_errors);

function _interopRequireDefault(obj) {
    return obj && obj.__esModule ? obj : {
        "default": obj
    }
}
var templateEngines = {};
var currentTemplateEngine;

function registerTemplateEngine(name, templateEngine) {
    templateEngines[name] = templateEngine
}

function setTemplateEngine(templateEngine) {
    if ((0, _type.isString)(templateEngine)) {
        currentTemplateEngine = templateEngines[templateEngine];
        if (!currentTemplateEngine) {
            throw _errors2.default.Error("E0020", templateEngine)
        }
    } else {
        currentTemplateEngine = templateEngine
    }
}

function getCurrentTemplateEngine() {
    return currentTemplateEngine
}
