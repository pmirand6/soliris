/**
 * DevExtreme (ui/html_editor/formats/link.js)
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
var _type = require("../../../core/utils/type");

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
var quill = (0, _quill_importer.getQuill)();
var Link = quill.import("formats/link");
var ExtLink = function(_Link) {
    _inherits(ExtLink, _Link);
    var _super = _createSuper(ExtLink);

    function ExtLink() {
        _classCallCheck(this, ExtLink);
        return _super.apply(this, arguments)
    }
    _createClass(ExtLink, [{
        key: "formats",
        value: function formats() {
            var formats = _get(_getPrototypeOf(ExtLink.prototype), "formats", this).call(this);
            var _ExtLink$formats = ExtLink.formats(this.domNode),
                href = _ExtLink$formats.href,
                target = _ExtLink$formats.target;
            formats.link = href;
            formats.target = target;
            return formats
        }
    }, {
        key: "format",
        value: function(name, value) {
            if ("link" === name && (0, _type.isObject)(value)) {
                if (value.text) {
                    this.domNode.innerText = value.text
                }
                if (value.target) {
                    this.domNode.setAttribute("target", "_blank")
                } else {
                    this.domNode.removeAttribute("target")
                }
                this.domNode.setAttribute("href", value.href)
            } else {
                _get(_getPrototypeOf(ExtLink.prototype), "format", this).call(this, name, value)
            }
        }
    }], [{
        key: "create",
        value: function(data) {
            var HREF = data && data.href || data;
            var node = _get(_getPrototypeOf(ExtLink), "create", this).call(this, HREF);
            if ((0, _type.isObject)(data)) {
                if (data.text) {
                    node.innerText = data.text
                }
                if (!data.target) {
                    node.removeAttribute("target")
                }
            }
            return node
        }
    }, {
        key: "formats",
        value: function(domNode) {
            return {
                href: domNode.getAttribute("href"),
                target: domNode.getAttribute("target")
            }
        }
    }, {
        key: "value",
        value: function(domNode) {
            return {
                href: domNode.getAttribute("href"),
                text: domNode.innerText,
                target: !!domNode.getAttribute("target")
            }
        }
    }]);
    return ExtLink
}(Link);
exports.default = ExtLink;
