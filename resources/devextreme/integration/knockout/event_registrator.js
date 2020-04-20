/**
 * DevExtreme (integration/knockout/event_registrator.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var $ = require("../../core/renderer");
var eventsEngine = require("../../events/core/events_engine");
var ko = require("knockout");
var isPlainObject = require("../../core/utils/type").isPlainObject;
var eventRegistratorCallbacks = require("../../events/core/event_registrator_callbacks");
var eventUtils = require("../../events/utils");
eventRegistratorCallbacks.add(function(name) {
    var koBindingEventName = eventUtils.addNamespace(name, name + "Binding");
    ko.bindingHandlers[name] = {
        update: function(element, valueAccessor, allBindingsAccessor, viewModel) {
            var $element = $(element);
            var unwrappedValue = ko.utils.unwrapObservable(valueAccessor());
            var eventSource = unwrappedValue.execute ? unwrappedValue.execute : unwrappedValue;
            eventsEngine.off($element, koBindingEventName);
            eventsEngine.on($element, koBindingEventName, isPlainObject(unwrappedValue) ? unwrappedValue : {}, function(e) {
                eventSource.call(viewModel, viewModel, e)
            })
        }
    }
});
