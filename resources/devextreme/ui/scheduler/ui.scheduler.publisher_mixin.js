/**
 * DevExtreme (ui/scheduler/ui.scheduler.publisher_mixin.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var publisherMixin = {
    notifyObserver: function(subject, args) {
        var observer = this.option("observer");
        if (observer) {
            observer.fire(subject, args)
        }
    },
    invoke: function() {
        var observer = this.option("observer");
        if (observer) {
            return observer.fire.apply(observer, arguments)
        }
    }
};
module.exports = publisherMixin;
