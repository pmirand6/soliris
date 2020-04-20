/**
 * DevExtreme (ui/shared/async_template_mixin.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
module.exports = {
    _waitAsyncTemplates: function(callback) {
        if (this._options.templatesRenderAsynchronously) {
            this._asyncTemplatesTimers = this._asyncTemplatesTimers || [];
            var timer = setTimeout(function() {
                callback.call(this);
                clearTimeout(timer)
            }.bind(this));
            this._asyncTemplatesTimers.push(timer)
        } else {
            callback.call(this)
        }
    },
    _cleanAsyncTemplatesTimer: function() {
        var timers = this._asyncTemplatesTimers || [];
        for (var i = 0; i < timers.length; i++) {
            clearTimeout(timers[i])
        }
        delete this._asyncTemplatesTimers
    }
};
