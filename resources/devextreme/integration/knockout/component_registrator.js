/**
 * DevExtreme (integration/knockout/component_registrator.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var $ = require("../../core/renderer");
var ko = require("knockout");
var Callbacks = require("../../core/utils/callbacks");
var errors = require("../../core/errors");
var inflector = require("../../core/utils/inflector");
var isPlainObject = require("../../core/utils/type").isPlainObject;
var registerComponentCallbacks = require("../../core/component_registrator_callbacks");
var Widget = require("../../ui/widget/ui.widget");
var KoTemplate = require("./template").KoTemplate;
var Editor = require("../../ui/editor/editor");
var Locker = require("../../core/utils/locker");
var getClosestNodeWithContext = require("./utils").getClosestNodeWithContext;
var config = require("../../core/config");
var LOCKS_DATA_KEY = "dxKoLocks";
var CREATED_WITH_KO_DATA_KEY = "dxKoCreation";
var editorsBindingHandlers = [];
var registerComponentKoBinding = function(componentName, componentClass) {
    if (componentClass.subclassOf(Editor)) {
        editorsBindingHandlers.push(componentName)
    }
    ko.bindingHandlers[componentName] = {
        init: function(domNode, valueAccessor) {
            var $element = $(domNode);
            var optionChangedCallbacks = Callbacks();
            var optionsByReference = {};
            var component;
            var knockoutConfig = config().knockout;
            var isBindingPropertyPredicateName = knockoutConfig && knockoutConfig.isBindingPropertyPredicateName;
            var isBindingPropertyPredicate;
            var ctorOptions = {
                onInitializing: function() {
                    optionsByReference = this._getOptionsByReference();
                    ko.computed(function() {
                        var model = ko.unwrap(valueAccessor());
                        if (component) {
                            component.beginUpdate()
                        }
                        isBindingPropertyPredicate = isBindingPropertyPredicateName && model && model[isBindingPropertyPredicateName];
                        unwrapModel(model);
                        if (component) {
                            component.endUpdate()
                        }
                    }, null, {
                        disposeWhenNodeIsRemoved: domNode
                    });
                    component = this
                },
                modelByElement: function($element) {
                    if ($element.length) {
                        var node = getClosestNodeWithContext($element.get(0));
                        return ko.dataFor(node)
                    }
                },
                nestedComponentOptions: function(component) {
                    return {
                        modelByElement: component.option("modelByElement"),
                        nestedComponentOptions: component.option("nestedComponentOptions")
                    }
                },
                _optionChangedCallbacks: optionChangedCallbacks,
                integrationOptions: {
                    watchMethod: function(fn, callback, options) {
                        options = options || {};
                        var skipCallback = options.skipImmediate;
                        var watcher = ko.computed(function() {
                            var newValue = ko.unwrap(fn());
                            if (!skipCallback) {
                                callback(newValue)
                            }
                            skipCallback = false
                        });
                        return function() {
                            watcher.dispose()
                        }
                    },
                    templates: {
                        "dx-polymorph-widget": {
                            render: function(options) {
                                var widgetName = ko.utils.unwrapObservable(options.model.widget);
                                if (!widgetName) {
                                    return
                                }
                                if ("button" === widgetName || "tabs" === widgetName || "dropDownMenu" === widgetName) {
                                    var deprecatedName = widgetName;
                                    widgetName = inflector.camelize("dx-" + widgetName);
                                    errors.log("W0001", "dxToolbar - 'widget' item field", deprecatedName, "16.1", "Use: '" + widgetName + "' instead")
                                }
                                var markup = $("<div>").attr("data-bind", widgetName + ": options").get(0);
                                $(options.container).append(markup);
                                ko.applyBindings(options.model, markup)
                            }
                        }
                    },
                    createTemplate: function(element) {
                        return new KoTemplate(element)
                    }
                }
            };
            var optionNameToModelMap = {};
            var applyModelValueToOption = function(optionName, modelValue, unwrap) {
                var locks = $element.data(LOCKS_DATA_KEY);
                var optionValue = unwrap ? ko.unwrap(modelValue) : modelValue;
                if (ko.isWriteableObservable(modelValue)) {
                    optionNameToModelMap[optionName] = modelValue
                }
                if (component) {
                    if (locks.locked(optionName)) {
                        return
                    }
                    locks.obtain(optionName);
                    try {
                        if (ko.ignoreDependencies) {
                            ko.ignoreDependencies(component.option, component, [optionName, optionValue])
                        } else {
                            component.option(optionName, optionValue)
                        }
                    } finally {
                        locks.release(optionName)
                    }
                } else {
                    ctorOptions[optionName] = optionValue
                }
            };
            var handleOptionChanged = function(args) {
                var optionName = args.fullName;
                var optionValue = args.value;
                if (!(optionName in optionNameToModelMap)) {
                    return
                }
                var $element = this._$element;
                var locks = $element.data(LOCKS_DATA_KEY);
                if (locks.locked(optionName)) {
                    return
                }
                locks.obtain(optionName);
                try {
                    optionNameToModelMap[optionName](optionValue)
                } finally {
                    locks.release(optionName)
                }
            };
            var createComponent = function() {
                optionChangedCallbacks.add(handleOptionChanged);
                $element.data(CREATED_WITH_KO_DATA_KEY, true).data(LOCKS_DATA_KEY, new Locker);
                new componentClass($element, ctorOptions);
                ctorOptions = null
            };
            var unwrapModelValue = function(currentModel, propertyName, propertyPath) {
                if (propertyPath === isBindingPropertyPredicateName) {
                    return
                }
                if (!isBindingPropertyPredicate || isBindingPropertyPredicate(propertyPath, propertyName, currentModel)) {
                    var unwrappedPropertyValue;
                    ko.computed(function() {
                        var propertyValue = currentModel[propertyName];
                        applyModelValueToOption(propertyPath, propertyValue, true);
                        unwrappedPropertyValue = ko.unwrap(propertyValue)
                    }, null, {
                        disposeWhenNodeIsRemoved: domNode
                    });
                    if (isPlainObject(unwrappedPropertyValue)) {
                        if (!optionsByReference[propertyPath]) {
                            unwrapModel(unwrappedPropertyValue, propertyPath)
                        }
                    }
                } else {
                    applyModelValueToOption(propertyPath, currentModel[propertyName], false)
                }
            };
            var unwrapModel = function(model, propertyPath) {
                for (var propertyName in model) {
                    if (Object.prototype.hasOwnProperty.call(model, propertyName)) {
                        unwrapModelValue(model, propertyName, propertyPath ? [propertyPath, propertyName].join(".") : propertyName)
                    }
                }
            };
            createComponent();
            return {
                controlsDescendantBindings: componentClass.subclassOf(Widget)
            }
        }
    };
    if ("dxValidator" === componentName) {
        ko.bindingHandlers.dxValidator.after = editorsBindingHandlers
    }
};
registerComponentCallbacks.add(function(name, componentClass) {
    registerComponentKoBinding(name, componentClass)
});
