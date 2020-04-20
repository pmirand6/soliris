/**
 * DevExtreme (ui/file_manager/file_provider/file_provider.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var _data = require("../../../core/utils/data");
var _uiFile_manager = require("../ui.file_manager.utils");
var _common = require("../../../core/utils/common");
var _date_serialization = require("../../../core/utils/date_serialization");
var _iterator = require("../../../core/utils/iterator");

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

function _toConsumableArray(arr) {
    return _arrayWithoutHoles(arr) || _iterableToArray(arr) || _unsupportedIterableToArray(arr) || _nonIterableSpread()
}

function _nonIterableSpread() {
    throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
}

function _unsupportedIterableToArray(o, minLen) {
    if (!o) {
        return
    }
    if ("string" === typeof o) {
        return _arrayLikeToArray(o, minLen)
    }
    var n = Object.prototype.toString.call(o).slice(8, -1);
    if ("Object" === n && o.constructor) {
        n = o.constructor.name
    }
    if ("Map" === n || "Set" === n) {
        return Array.from(n)
    }
    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) {
        return _arrayLikeToArray(o, minLen)
    }
}

function _iterableToArray(iter) {
    if ("undefined" !== typeof Symbol && Symbol.iterator in Object(iter)) {
        return Array.from(iter)
    }
}

function _arrayWithoutHoles(arr) {
    if (Array.isArray(arr)) {
        return _arrayLikeToArray(arr)
    }
}

function _arrayLikeToArray(arr, len) {
    if (null == len || len > arr.length) {
        len = arr.length
    }
    for (var i = 0, arr2 = new Array(len); i < len; i++) {
        arr2[i] = arr[i]
    }
    return arr2
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
var DEFAULT_FILE_UPLOAD_CHUNK_SIZE = 2e5;
var FileProvider = function() {
    function FileProvider(options) {
        _classCallCheck(this, FileProvider);
        options = (0, _common.ensureDefined)(options, {});
        this._keyGetter = (0, _data.compileGetter)(this._getKeyExpr(options));
        this._nameGetter = (0, _data.compileGetter)(this._getNameExpr(options));
        this._isDirGetter = (0, _data.compileGetter)(this._getIsDirExpr(options));
        this._sizeGetter = (0, _data.compileGetter)(options.sizeExpr || "size");
        this._dateModifiedGetter = (0, _data.compileGetter)(options.dateModifiedExpr || "dateModified");
        this._thumbnailGetter = (0, _data.compileGetter)(options.thumbnailExpr || "thumbnail")
    }
    _createClass(FileProvider, [{
        key: "getItems",
        value: function(pathInfo) {
            return []
        }
    }, {
        key: "renameItem",
        value: function(item, name) {}
    }, {
        key: "createFolder",
        value: function(parentFolder, name) {}
    }, {
        key: "deleteItems",
        value: function(items) {}
    }, {
        key: "moveItems",
        value: function(items, destinationFolder) {}
    }, {
        key: "copyItems",
        value: function(items, destinationFolder) {}
    }, {
        key: "uploadFileChunk",
        value: function(fileData, chunksInfo, destinationDirectory) {}
    }, {
        key: "abortFileUpload",
        value: function(fileData, chunksInfo, destinationDirectory) {}
    }, {
        key: "downloadItems",
        value: function(items) {}
    }, {
        key: "getItemContent",
        value: function(items) {}
    }, {
        key: "getFileUploadChunkSize",
        value: function() {
            return DEFAULT_FILE_UPLOAD_CHUNK_SIZE
        }
    }, {
        key: "_getItemsByType",
        value: function(path, folders) {
            return this.getItems(path).filter(function(item) {
                return item.isDirectory === folders
            })
        }
    }, {
        key: "_convertDataObjectsToFileItems",
        value: function(entries, pathInfo) {
            var _this = this;
            var result = [];
            (0, _iterator.each)(entries, function(_, entry) {
                var fileItem = _this._createFileItem(entry, pathInfo);
                result.push(fileItem)
            });
            return result
        }
    }, {
        key: "_createFileItem",
        value: function(dataObj, pathInfo) {
            var fileItem = new FileManagerItem(pathInfo, this._nameGetter(dataObj), (!!this._isDirGetter(dataObj)));
            fileItem.size = this._sizeGetter(dataObj);
            if (void 0 === fileItem.size) {
                fileItem.size = 0
            }
            fileItem.dateModified = (0, _date_serialization.deserializeDate)(this._dateModifiedGetter(dataObj));
            if (void 0 === fileItem.dateModified) {
                fileItem.dateModified = new Date
            }
            if (fileItem.isDirectory) {
                fileItem.hasSubDirs = this._hasSubDirs(dataObj)
            }
            fileItem.key = this._keyGetter(dataObj);
            if (!fileItem.key) {
                fileItem.key = fileItem.relativeName
            }
            fileItem.thumbnail = this._thumbnailGetter(dataObj) || "";
            fileItem.dataItem = dataObj;
            return fileItem
        }
    }, {
        key: "_hasSubDirs",
        value: function(dataObj) {
            return true
        }
    }, {
        key: "_getKeyExpr",
        value: function(options) {
            return options.keyExpr || this._defaultKeyExpr
        }
    }, {
        key: "_defaultKeyExpr",
        value: function(fileItem) {
            if (2 === arguments.length) {
                fileItem.__KEY__ = arguments[1];
                return
            }
            return Object.prototype.hasOwnProperty.call(fileItem, "__KEY__") ? fileItem.__KEY__ : null
        }
    }, {
        key: "_getNameExpr",
        value: function(options) {
            return options.nameExpr || "name"
        }
    }, {
        key: "_getIsDirExpr",
        value: function(options) {
            return options.isDirectoryExpr || "isDirectory"
        }
    }]);
    return FileProvider
}();
var FileManagerItem = function() {
    function FileManagerItem(pathInfo, name, isDirectory) {
        _classCallCheck(this, FileManagerItem);
        this.name = name;
        this.pathInfo = pathInfo && _toConsumableArray(pathInfo) || [];
        this.parentPath = this._getPathByPathInfo(this.pathInfo);
        this.key = this.relativeName = (0, _uiFile_manager.pathCombine)(this.parentPath, name);
        this.isDirectory = isDirectory || false;
        this.isRoot = false;
        this.size = 0;
        this.dateModified = new Date;
        this.thumbnail = "";
        this.tooltipText = ""
    }
    _createClass(FileManagerItem, [{
        key: "getFullPathInfo",
        value: function() {
            var pathInfo = _toConsumableArray(this.pathInfo);
            !this.isRoot && pathInfo.push({
                key: this.key,
                name: this.name
            });
            return pathInfo
        }
    }, {
        key: "getExtension",
        value: function() {
            return this.isDirectory ? "" : (0, _uiFile_manager.getFileExtension)(this.name)
        }
    }, {
        key: "equals",
        value: function(item) {
            return item && this.key === item.key
        }
    }, {
        key: "createClone",
        value: function() {
            var result = new FileManagerItem(this.pathInfo, this.name, this.isDirectory);
            result.key = this.key;
            result.size = this.size;
            result.dateModified = this.dateModified;
            result.thumbnail = this.thumbnail;
            result.tooltipText = this.tooltipText;
            result.hasSubDirs = this.hasSubDirs;
            result.dataItem = this.dataItem;
            return result
        }
    }, {
        key: "_getPathByPathInfo",
        value: function(pathInfo) {
            return pathInfo.map(function(info) {
                return info.name
            }).join(_uiFile_manager.PATH_SEPARATOR)
        }
    }]);
    return FileManagerItem
}();
var FileManagerRootItem = function(_FileManagerItem) {
    _inherits(FileManagerRootItem, _FileManagerItem);
    var _super = _createSuper(FileManagerRootItem);

    function FileManagerRootItem() {
        var _this2;
        _classCallCheck(this, FileManagerRootItem);
        _this2 = _super.call(this, null, "Files", true);
        _this2.key = "__dxfmroot_394CED1B-58CF-4925-A5F8-042BC0822B31_51558CB8-C170-4655-A9E0-C454ED8EA2C1";
        _this2.relativeName = "";
        _this2.isRoot = true;
        return _this2
    }
    return FileManagerRootItem
}(FileManagerItem);
module.exports.FileProvider = FileProvider;
module.exports.FileManagerItem = FileManagerItem;
module.exports.FileManagerRootItem = FileManagerRootItem;
