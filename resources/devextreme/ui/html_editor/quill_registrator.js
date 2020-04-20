/**
 * DevExtreme (ui/html_editor/quill_registrator.js)
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
var _quill_importer = require("./quill_importer");

function _classCallCheck(instance, Constructor) {
    if (!(instance instanceof Constructor)) {
        throw new TypeError("Cannot call a class as a function")
    }
}

function _defineProperties(target, props) {
    for (var i = 0; i < props.length; i++) {
        var descriptor = props[i];
        descriptor.enumerable = descriptor.enumerable || false;
        descriptor.configurable = true;
        if ("value" in descriptor) {
            descriptor.writable = true
        }
        Object.defineProperty(target, descriptor.key, descriptor)
    }
}

function _createClass(Constructor, protoProps, staticProps) {
    if (protoProps) {
        _defineProperties(Constructor.prototype, protoProps)
    }
    if (staticProps) {
        _defineProperties(Constructor, staticProps)
    }
    return Constructor
}
var QuillRegistrator = function() {
    function QuillRegistrator() {
        _classCallCheck(this, QuillRegistrator);
        if (QuillRegistrator.initialized) {
            return
        }
        var quill = this.getQuill();
        var BaseTheme = require("./themes/base").default;
        var Image = require("./formats/image").default;
        var Link = require("./formats/link").default;
        var FontStyle = require("./formats/font").default;
        var SizeStyle = require("./formats/size").default;
        var AlignStyle = require("./formats/align").default;
        var Mention = require("./formats/mention").default;
        var Toolbar = require("./modules/toolbar").default;
        var DropImage = require("./modules/dropImage").default;
        var Variables = require("./modules/variables").default;
        var Resizing = require("./modules/resizing").default;
        var MentionsModule = require("./modules/mentions").default;
        var DirectionStyle = quill.import("attributors/style/direction");
        quill.register({
            "formats/align": AlignStyle,
            "formats/direction": DirectionStyle,
            "formats/font": FontStyle,
            "formats/size": SizeStyle,
            "formats/extendedImage": Image,
            "formats/link": Link,
            "formats/mention": Mention,
            "modules/toolbar": Toolbar,
            "modules/dropImage": DropImage,
            "modules/variables": Variables,
            "modules/resizing": Resizing,
            "modules/mentions": MentionsModule,
            "themes/basic": BaseTheme
        }, true);
        this._customModules = [];
        QuillRegistrator._initialized = true
    }
    _createClass(QuillRegistrator, [{
        key: "createEditor",
        value: function(container, config) {
            var quill = this.getQuill();
            return new quill(container, config)
        }
    }, {
        key: "registerModules",
        value: function(modulesConfig) {
            var isModule = RegExp("modules/*");
            var quill = this.getQuill();
            var isRegisteredModule = function(modulePath) {
                return !!quill.imports[modulePath]
            };
            for (var modulePath in modulesConfig) {
                if (isModule.test(modulePath) && !isRegisteredModule(modulePath)) {
                    this._customModules.push(modulePath.slice(8))
                }
            }
            quill.register(modulesConfig, true)
        }
    }, {
        key: "getRegisteredModuleNames",
        value: function() {
            return this._customModules
        }
    }, {
        key: "getQuill",
        value: function() {
            return (0, _quill_importer.getQuill)()
        }
    }]);
    return QuillRegistrator
}();
exports.default = QuillRegistrator;
