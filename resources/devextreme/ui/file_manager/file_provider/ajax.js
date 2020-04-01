/**
 * DevExtreme (ui/file_manager/file_provider/ajax.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var _ajax = require("../../../core/utils/ajax");
var _ajax2 = _interopRequireDefault(_ajax);
var _common = require("../../../core/utils/common");
var _deferred = require("../../../core/utils/deferred");
var _extend = require("../../../core/utils/extend");
var _file_provider = require("./file_provider");
var _array = require("./array");
var _array2 = _interopRequireDefault(_array);

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
var AjaxFileProvider = function(_FileProvider) {
    _inherits(AjaxFileProvider, _FileProvider);
    var _super = _createSuper(AjaxFileProvider);

    function AjaxFileProvider(options) {
        var _this;
        _classCallCheck(this, AjaxFileProvider);
        options = (0, _common.ensureDefined)(options, {});
        _this = _super.call(this, options);
        _this._options = options;
        _this._provider = null;
        return _this
    }
    _createClass(AjaxFileProvider, [{
        key: "getItems",
        value: function(pathInfo) {
            var _this2 = this;
            return this._doActionAfterDataAcquired(function() {
                return _this2._provider.getItems(pathInfo)
            })
        }
    }, {
        key: "renameItem",
        value: function(item, name) {
            var _this3 = this;
            return this._doActionAfterDataAcquired(function() {
                return _this3._provider.renameItem(item, name)
            })
        }
    }, {
        key: "createFolder",
        value: function(parentDir, name) {
            var _this4 = this;
            return this._doActionAfterDataAcquired(function() {
                return _this4._provider.createFolder(parentDir, name)
            })
        }
    }, {
        key: "deleteItems",
        value: function(items) {
            var _this5 = this;
            return this._doActionAfterDataAcquired(function() {
                return _this5._provider.deleteItems(items)
            })
        }
    }, {
        key: "moveItems",
        value: function(items, destinationFolder) {
            var _this6 = this;
            return this._doActionAfterDataAcquired(function() {
                return _this6._provider.moveItems(items, destinationFolder)
            })
        }
    }, {
        key: "copyItems",
        value: function(items, destinationFolder) {
            var _this7 = this;
            return this._doActionAfterDataAcquired(function() {
                return _this7._provider.copyItems(items, destinationFolder)
            })
        }
    }, {
        key: "uploadFileChunk",
        value: function(fileData, chunksInfo, destinationDirectory) {
            var _this8 = this;
            return this._doActionAfterDataAcquired(function() {
                return _this8._provider.uploadFileChunk(fileData, chunksInfo, destinationDirectory)
            })
        }
    }, {
        key: "abortFileUpload",
        value: function(fileData, chunksInfo, destinationDirectory) {
            var _this9 = this;
            return this._doActionAfterDataAcquired(function() {
                return _this9._provider.abortFileUpload(fileData, chunksInfo, destinationDirectory)
            })
        }
    }, {
        key: "_doActionAfterDataAcquired",
        value: function(action) {
            return this._ensureDataAcquired().then(action.bind(this))
        }
    }, {
        key: "_ensureDataAcquired",
        value: function() {
            var _this10 = this;
            if (this._provider) {
                return (new _deferred.Deferred).resolve().promise()
            }
            return this._getData().done(function(data) {
                var arrayOptions = (0, _extend.extend)(_this10._options, {
                    data: data
                });
                _this10._provider = new _array2.default(arrayOptions)
            })
        }
    }, {
        key: "_getData",
        value: function() {
            return _ajax2.default.sendRequest({
                url: this._options.url,
                dataType: "json",
                cache: false
            })
        }
    }]);
    return AjaxFileProvider
}(_file_provider.FileProvider);
module.exports = AjaxFileProvider;
module.exports.default = module.exports;
