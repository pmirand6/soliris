/**
 * DevExtreme (ui/file_manager/file_provider/custom.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var _common = require("../../../core/utils/common");
var _type = require("../../../core/utils/type");
var _deferred = require("../../../core/utils/deferred");
var _data = require("../../../core/utils/data");
var _file_provider = require("./file_provider");

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

function _get(target, property, receiver) {
    if ("undefined" !== typeof Reflect && Reflect.get) {
        _get = Reflect.get
    } else {
        _get = function(target, property, receiver) {
            var base = _superPropBase(target, property);
            if (!base) {
                return
            }
            var desc = Object.getOwnPropertyDescriptor(base, property);
            if (desc.get) {
                return desc.get.call(receiver)
            }
            return desc.value
        }
    }
    return _get(target, property, receiver || target)
}

function _superPropBase(object, property) {
    while (!Object.prototype.hasOwnProperty.call(object, property)) {
        object = _getPrototypeOf(object);
        if (null === object) {
            break
        }
    }
    return object
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
var CustomFileProvider = function(_FileProvider) {
    _inherits(CustomFileProvider, _FileProvider);
    var _super = _createSuper(CustomFileProvider);

    function CustomFileProvider(options) {
        var _this;
        _classCallCheck(this, CustomFileProvider);
        options = (0, _common.ensureDefined)(options, {});
        _this = _super.call(this, options);
        _this._hasSubDirsGetter = (0, _data.compileGetter)(options.hasSubDirectoriesExpr || "hasSubDirectories");
        _this._getItemsFunction = _this._ensureFunction(options.getItems, function() {
            return []
        });
        _this._renameItemFunction = _this._ensureFunction(options.renameItem);
        _this._createDirectoryFunction = _this._ensureFunction(options.createDirectory);
        _this._deleteItemFunction = _this._ensureFunction(options.deleteItem);
        _this._moveItemFunction = _this._ensureFunction(options.moveItem);
        _this._copyItemFunction = _this._ensureFunction(options.copyItem);
        _this._uploadFileChunkFunction = _this._ensureFunction(options.uploadFileChunk);
        _this._abortFileUploadFunction = _this._ensureFunction(options.abortFileUpload);
        _this._downloadItemsFunction = _this._ensureFunction(options.downloadItems);
        _this._getItemsContentFunction = _this._ensureFunction(options.getItemsContent);
        _this._uploadChunkSize = options.uploadChunkSize;
        return _this
    }
    _createClass(CustomFileProvider, [{
        key: "getItems",
        value: function(pathInfo) {
            var _this2 = this;
            return (0, _deferred.when)(this._getItemsFunction(pathInfo)).then(function(dataItems) {
                return _this2._convertDataObjectsToFileItems(dataItems, pathInfo)
            })
        }
    }, {
        key: "renameItem",
        value: function(item, name) {
            return this._renameItemFunction(item, name)
        }
    }, {
        key: "createFolder",
        value: function(parentDir, name) {
            return this._createDirectoryFunction(parentDir, name)
        }
    }, {
        key: "deleteItems",
        value: function(items) {
            var _this3 = this;
            return items.map(function(item) {
                return _this3._deleteItemFunction(item)
            })
        }
    }, {
        key: "moveItems",
        value: function(items, destinationDirectory) {
            var _this4 = this;
            return items.map(function(item) {
                return _this4._moveItemFunction(item, destinationDirectory)
            })
        }
    }, {
        key: "copyItems",
        value: function(items, destinationFolder) {
            var _this5 = this;
            return items.map(function(item) {
                return _this5._copyItemFunction(item, destinationFolder)
            })
        }
    }, {
        key: "uploadFileChunk",
        value: function(fileData, chunksInfo, destinationDirectory) {
            return this._uploadFileChunkFunction(fileData, chunksInfo, destinationDirectory)
        }
    }, {
        key: "abortFileUpload",
        value: function(fileData, chunksInfo, destinationDirectory) {
            return this._abortFileUploadFunction(fileData, chunksInfo, destinationDirectory)
        }
    }, {
        key: "downloadItems",
        value: function(items) {
            return this._downloadItemsFunction(items)
        }
    }, {
        key: "getItemContent",
        value: function(items) {
            return this._getItemsContentFunction(items)
        }
    }, {
        key: "getFileUploadChunkSize",
        value: function() {
            return (0, _common.ensureDefined)(this._uploadChunkSize, _get(_getPrototypeOf(CustomFileProvider.prototype), "getFileUploadChunkSize", this).call(this))
        }
    }, {
        key: "_hasSubDirs",
        value: function(dataObj) {
            var hasSubDirs = this._hasSubDirsGetter(dataObj);
            return "boolean" === typeof hasSubDirs ? hasSubDirs : true
        }
    }, {
        key: "_getKeyExpr",
        value: function(options) {
            return options.keyExpr || "key"
        }
    }, {
        key: "_ensureFunction",
        value: function(functionObject, defaultFunction) {
            defaultFunction = defaultFunction || _common.noop;
            return (0, _type.isFunction)(functionObject) ? functionObject : defaultFunction
        }
    }]);
    return CustomFileProvider
}(_file_provider.FileProvider);
module.exports = CustomFileProvider;
module.exports.default = module.exports;
