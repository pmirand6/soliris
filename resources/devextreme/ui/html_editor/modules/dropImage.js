/**
 * DevExtreme (ui/html_editor/modules/dropImage.js)
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
var _quill_importer = require("../quill_importer");
var _events_engine = require("../../../events/core/events_engine");
var _events_engine2 = _interopRequireDefault(_events_engine);
var _utils = require("../../../events/utils");
var _iterator = require("../../../core/utils/iterator");
var _browser = require("../../../core/utils/browser");
var _browser2 = _interopRequireDefault(_browser);
var _window = require("../../../core/utils/window");

function _interopRequireDefault(obj) {
    return obj && obj.__esModule ? obj : {
        "default": obj
    }
}

function _typeof(obj) {
    "@babel/helpers - typeof";
    if ("function" === typeof Symbol && "symbol" === typeof Symbol.iterator) {
        _typeof = function(obj) {
            return typeof obj
        }
    } else {
        _typeof = function(obj) {
            return obj && "function" === typeof Symbol && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj
        }
    }
    return _typeof(obj)
}

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

function _createSuper(Derived) {
    return function() {
        var result, Super = _getPrototypeOf(Derived);
        if (_isNativeReflectConstruct()) {
            var NewTarget = _getPrototypeOf(this).constructor;
            result = Reflect.construct(Super, arguments, NewTarget)
        } else {
            result = Super.apply(this, arguments)
        }
        return _possibleConstructorReturn(this, result)
    }
}

function _possibleConstructorReturn(self, call) {
    if (call && ("object" === _typeof(call) || "function" === typeof call)) {
        return call
    }
    return _assertThisInitialized(self)
}

function _assertThisInitialized(self) {
    if (void 0 === self) {
        throw new ReferenceError("this hasn't been initialised - super() hasn't been called")
    }
    return self
}

function _isNativeReflectConstruct() {
    if ("undefined" === typeof Reflect || !Reflect.construct) {
        return false
    }
    if (Reflect.construct.sham) {
        return false
    }
    if ("function" === typeof Proxy) {
        return true
    }
    try {
        Date.prototype.toString.call(Reflect.construct(Date, [], function() {}));
        return true
    } catch (e) {
        return false
    }
}

function _getPrototypeOf(o) {
    _getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf : function(o) {
        return o.__proto__ || Object.getPrototypeOf(o)
    };
    return _getPrototypeOf(o)
}

function _inherits(subClass, superClass) {
    if ("function" !== typeof superClass && null !== superClass) {
        throw new TypeError("Super expression must either be null or a function")
    }
    subClass.prototype = Object.create(superClass && superClass.prototype, {
        constructor: {
            value: subClass,
            writable: true,
            configurable: true
        }
    });
    if (superClass) {
        _setPrototypeOf(subClass, superClass)
    }
}

function _setPrototypeOf(o, p) {
    _setPrototypeOf = Object.setPrototypeOf || function(o, p) {
        o.__proto__ = p;
        return o
    };
    return _setPrototypeOf(o, p)
}
var BaseModule = (0, _quill_importer.getQuill)().import("core/module");
var DropImageModule = function(_BaseModule) {
    _inherits(DropImageModule, _BaseModule);
    var _super = _createSuper(DropImageModule);

    function DropImageModule(quill, options) {
        var _this;
        _classCallCheck(this, DropImageModule);
        _this = _super.call(this, quill, options);
        _this.editorInstance = options.editorInstance;
        var widgetName = _this.editorInstance.NAME;
        _events_engine2.default.on(_this.quill.root, (0, _utils.addNamespace)("dragover", widgetName), _this._dragOverHandler.bind(_assertThisInitialized(_this)));
        _events_engine2.default.on(_this.quill.root, (0, _utils.addNamespace)("drop", widgetName), _this._dropHandler.bind(_assertThisInitialized(_this)));
        _events_engine2.default.on(_this.quill.root, (0, _utils.addNamespace)("paste", widgetName), _this._pasteHandler.bind(_assertThisInitialized(_this)));
        return _this
    }
    _createClass(DropImageModule, [{
        key: "_dragOverHandler",
        value: function(e) {
            if (_browser2.default.msie) {
                e.preventDefault()
            }
        }
    }, {
        key: "_dropHandler",
        value: function(e) {
            var dataTransfer = e.originalEvent.dataTransfer;
            var hasFiles = dataTransfer && dataTransfer.files && dataTransfer.files.length;
            e.preventDefault();
            if (hasFiles) {
                this._getImage(dataTransfer.files, this._addImage.bind(this))
            }
        }
    }, {
        key: "_pasteHandler",
        value: function(_ref) {
            var _this2 = this;
            var originalEvent = _ref.originalEvent;
            var clipboardData = originalEvent.clipboardData;
            if (!clipboardData) {
                return
            }
            var hasDataItems = clipboardData.items && clipboardData.items.length;
            var isHtmlData = clipboardData.getData("text/html");
            if (!isHtmlData && hasDataItems) {
                this._getImage(clipboardData.items, function(imageData) {
                    if (_browser2.default.mozilla) {
                        return
                    }
                    if (_browser2.default.msie) {
                        setTimeout(function() {
                            _this2._addImage(imageData)
                        })
                    } else {
                        _this2._addImage(imageData)
                    }
                })
            }
        }
    }, {
        key: "_isImage",
        value: function(file) {
            return !!file.type.match(/^image\/(a?png|bmp|gif|p?jpe?g|svg|vnd\.microsoft\.icon|webp)/i)
        }
    }, {
        key: "_getImage",
        value: function(files, callback) {
            var _this3 = this;
            var window = (0, _window.getWindow)();
            (0, _iterator.each)(files, function(index, file) {
                if (!_this3._isImage(file)) {
                    return
                }
                var reader = new window.FileReader;
                reader.onload = function(_ref2) {
                    var target = _ref2.target;
                    callback(target.result)
                };
                var readableFile = file.getAsFile ? file.getAsFile() : file;
                if (readableFile instanceof window.Blob) {
                    reader.readAsDataURL(readableFile)
                }
            })
        }
    }, {
        key: "_addImage",
        value: function(data) {
            var selection = this.quill.getSelection();
            var pasteIndex = selection ? selection.index : this.quill.getLength();
            this.quill.insertEmbed(pasteIndex, "extendedImage", data, "user")
        }
    }]);
    return DropImageModule
}(BaseModule);
exports.default = DropImageModule;
