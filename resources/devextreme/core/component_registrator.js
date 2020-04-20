/**
 * DevExtreme (core/component_registrator.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var $ = require("./renderer");
var callbacks = require("./component_registrator_callbacks");
var errors = require("./errors");
var publicComponentUtils = require("./utils/public_component");
var registerComponent = function(name, namespace, componentClass) {
    if (!componentClass) {
        componentClass = namespace
    } else {
        namespace[name] = componentClass
    }
    publicComponentUtils.name(componentClass, name);
    callbacks.fire(name, componentClass)
};
var registerRendererComponent = function(name, componentClass) {
    $.fn[name] = function(options) {
        var isMemberInvoke = "string" === typeof options;
        var result;
        if (isMemberInvoke) {
            var memberName = options;
            var memberArgs = [].slice.call(arguments).slice(1);
            this.each(function() {
                var instance = componentClass.getInstance(this);
                if (!instance) {
                    throw errors.Error("E0009", name)
                }
                var member = instance[memberName];
                var memberValue = member.apply(instance, memberArgs);
                if (void 0 === result) {
                    result = memberValue
                }
            })
        } else {
            this.each(function() {
                var instance = componentClass.getInstance(this);
                if (instance) {
                    instance.option(options)
                } else {
                    new componentClass(this, options)
                }
            });
            result = this
        }
        return result
    }
};
callbacks.add(registerRendererComponent);
module.exports = registerComponent;
module.exports.default = module.exports;