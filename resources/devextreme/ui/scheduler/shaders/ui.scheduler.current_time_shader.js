/**
 * DevExtreme (ui/scheduler/shaders/ui.scheduler.current_time_shader.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var $ = require("../../../core/renderer");
var Class = require("../../../core/class");
var DATE_TIME_SHADER_CLASS = "dx-scheduler-date-time-shader";
var currentTimeShader = Class.inherit({
    render: function(workspace) {
        var _this = this;
        this._workspace = workspace;
        this._$container = workspace._dateTableScrollable.$content();
        this._$shader = this._createShader();
        this._shader = [];
        this._shader.push(this._$shader);
        this._renderShader();
        if (this._$shader && this._workspace.option("crossScrollingEnabled")) {
            this._$shader.css("marginTop", -this._$container.get(0).getBoundingClientRect().height);
            this._$shader.css("height", this._$container.get(0).getBoundingClientRect().height)
        }
        this._shader.forEach(function(shader, index) {
            _this._$container.append(shader)
        })
    },
    _createShader: function() {
        return $("<div>").addClass(DATE_TIME_SHADER_CLASS)
    },
    clean: function() {
        this._$container && this._$container.find("." + DATE_TIME_SHADER_CLASS).remove()
    }
});
module.exports = currentTimeShader;
