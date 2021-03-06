/**
 * DevExtreme (ui/drawer/ui.drawer.rendering.strategy.overlap.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var _uiDrawerRendering = require("./ui.drawer.rendering.strategy");
var _uiDrawerRendering2 = _interopRequireDefault(_uiDrawerRendering);
var _renderer = require("../../core/renderer");
var _renderer2 = _interopRequireDefault(_renderer);
var _translator = require("../../animation/translator");
var _translator2 = _interopRequireDefault(_translator);
var _overlay = require("../overlay");
var _overlay2 = _interopRequireDefault(_overlay);
var _common = require("../../core/utils/common");
var _extend = require("../../core/utils/extend");
var _type = require("../../core/utils/type");
var _inflector = require("../../core/utils/inflector");
var _z_index = require("../overlay/z_index");
var zIndexPool = _interopRequireWildcard(_z_index);

function _getRequireWildcardCache() {
    if ("function" !== typeof WeakMap) {
        return null
    }
    var cache = new WeakMap;
    _getRequireWildcardCache = function() {
        return cache
    };
    return cache
}

function _interopRequireWildcard(obj) {
    if (obj && obj.__esModule) {
        return obj
    }
    if (null === obj || "object" !== _typeof(obj) && "function" !== typeof obj) {
        return {
            "default": obj
        }
    }
    var cache = _getRequireWildcardCache();
    if (cache && cache.has(obj)) {
        return cache.get(obj)
    }
    var newObj = {};
    var hasPropertyDescriptor = Object.defineProperty && Object.getOwnPropertyDescriptor;
    for (var key in obj) {
        if (Object.prototype.hasOwnProperty.call(obj, key)) {
            var desc = hasPropertyDescriptor ? Object.getOwnPropertyDescriptor(obj, key) : null;
            if (desc && (desc.get || desc.set)) {
                Object.defineProperty(newObj, key, desc)
            } else {
                newObj[key] = obj[key]
            }
        }
    }
    newObj.default = obj;
    if (cache) {
        cache.set(obj, newObj)
    }
    return newObj
}

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
var OverlapStrategy = function(_DrawerStrategy) {
    _inherits(OverlapStrategy, _DrawerStrategy);
    var _super = _createSuper(OverlapStrategy);

    function OverlapStrategy() {
        _classCallCheck(this, OverlapStrategy);
        return _super.apply(this, arguments)
    }
    _createClass(OverlapStrategy, [{
        key: "renderPanelContent",
        value: function(whenPanelContentRendered) {
            delete this._initialPosition;
            var drawer = this.getDrawerInstance();
            var _drawer$option = drawer.option(),
                opened = _drawer$option.opened,
                minSize = _drawer$option.minSize;
            drawer._overlay = drawer._createComponent(drawer.content(), _overlay2.default, {
                shading: false,
                container: drawer.getOverlayTarget(),
                position: this._getOverlayPosition(),
                width: opened ? "auto" : minSize || 0,
                height: "100%",
                templatesRenderAsynchronously: drawer.option("templatesRenderAsynchronously"),
                animation: {
                    show: {
                        duration: 0
                    }
                },
                onPositioned: function(e) {
                    this._fixOverlayPosition(e.component.$content())
                }.bind(this),
                contentTemplate: drawer.option("template"),
                onContentReady: function() {
                    whenPanelContentRendered.resolve();
                    if (drawer.option("shading")) {
                        drawer.updateZIndex(opened)
                    }
                },
                visible: true,
                propagateOutsideClick: true
            })
        }
    }, {
        key: "_fixOverlayPosition",
        value: function($overlayContent) {
            var position = (0, _common.ensureDefined)(this._initialPosition, {
                left: 0,
                top: 0
            });
            _translator2.default.move($overlayContent, position);
            if ("right" === this.getDrawerInstance().calcTargetPosition()) {
                $overlayContent.css("left", "auto")
            }
        }
    }, {
        key: "_getOverlayPosition",
        value: function() {
            var drawer = this.getDrawerInstance();
            var panelPosition = drawer.calcTargetPosition();
            var result = {};
            switch (panelPosition) {
                case "left":
                    result = {
                        my: "top left",
                        at: "top left"
                    };
                    break;
                case "right":
                    result = {
                        my: drawer.option("rtlEnabled") ? "top left" : "top right",
                        at: "top right"
                    };
                    break;
                case "top":
                case "bottom":
                    result = {
                        my: panelPosition,
                        at: panelPosition
                    }
            }
            result.of = drawer.getOverlayTarget();
            return result
        }
    }, {
        key: "refreshPanelElementSize",
        value: function(calcFromRealPanelSize) {
            var drawer = this.getDrawerInstance();
            var overlay = drawer.getOverlay();
            if (drawer.isHorizontalDirection()) {
                overlay.option("height", "100%");
                overlay.option("width", calcFromRealPanelSize ? drawer.getRealPanelWidth() : this._getPanelSize(drawer.option("opened")))
            } else {
                overlay.option("width", overlay.option("container").width());
                overlay.option("height", calcFromRealPanelSize ? drawer.getRealPanelHeight() : this._getPanelSize(drawer.option("opened")))
            }
        }
    }, {
        key: "_setupContent",
        value: function($content, position) {
            $content.css("padding" + (0, _inflector.camelize)(position, true), this.getDrawerInstance().option("minSize"));
            $content.css("transform", "inherit")
        }
    }, {
        key: "_slidePositionRendering",
        value: function(config, _, animate) {
            var drawer = this.getDrawerInstance();
            this._initialPosition = drawer.isHorizontalDirection() ? {
                left: config.panelOffset
            } : {
                top: config.panelOffset
            };
            var position = drawer.calcTargetPosition();
            this._setupContent(config.$content, position, config.drawer);
            if (animate) {
                var animationConfig = (0, _extend.extend)(config.defaultAnimationConfig, {
                    $element: config.$panel,
                    position: config.panelOffset,
                    duration: drawer.option("animationDuration"),
                    direction: position
                });
                _uiDrawerRendering.animation.moveTo(animationConfig)
            } else {
                if (drawer.isHorizontalDirection()) {
                    _translator2.default.move(config.$panel, {
                        left: config.panelOffset
                    })
                } else {
                    _translator2.default.move(config.$panel, {
                        top: config.panelOffset
                    })
                }
            }
        }
    }, {
        key: "_expandPositionRendering",
        value: function(config, _, animate) {
            var drawer = this.getDrawerInstance();
            this._initialPosition = {
                left: 0
            };
            var position = drawer.calcTargetPosition();
            this._setupContent(config.$content, position);
            _translator2.default.move(config.$panelOverlayContent, {
                left: 0
            });
            if (animate) {
                var animationConfig = (0, _extend.extend)(config.defaultAnimationConfig, {
                    $element: config.$panelOverlayContent,
                    size: config.size,
                    duration: drawer.option("animationDuration"),
                    direction: position,
                    marginTop: config.marginTop
                });
                _uiDrawerRendering.animation.size(animationConfig)
            } else {
                if (drawer.isHorizontalDirection()) {
                    (0, _renderer2.default)(config.$panelOverlayContent).css("width", config.size)
                } else {
                    (0, _renderer2.default)(config.$panelOverlayContent).css("height", config.size);
                    if ("bottom" === position) {
                        (0, _renderer2.default)(config.$panelOverlayContent).css("marginTop", config.marginTop)
                    }
                }
            }
        }
    }, {
        key: "_getPositionRenderingConfig",
        value: function(isDrawerOpened) {
            var drawer = this.getDrawerInstance();
            var config = _get(_getPrototypeOf(OverlapStrategy.prototype), "_getPositionRenderingConfig", this).call(this, isDrawerOpened);
            return (0, _extend.extend)(config, {
                panelOffset: this._getPanelOffset(isDrawerOpened) * this.getDrawerInstance()._getPositionCorrection(),
                $panelOverlayContent: drawer.getOverlay().$content(),
                marginTop: drawer.getRealPanelHeight() - config.size
            })
        }
    }, {
        key: "getPanelContent",
        value: function() {
            return (0, _renderer2.default)(this.getDrawerInstance().getOverlay().content())
        }
    }, {
        key: "isViewContentFirst",
        value: function(position) {
            return "right" === position || "bottom" === position
        }
    }, {
        key: "updateZIndex",
        value: function() {
            _get(_getPrototypeOf(OverlapStrategy.prototype), "updateZIndex", this).call(this);
            if (!(0, _type.isDefined)(this._panelZIndex)) {
                this._panelZIndex = zIndexPool.base() + 501;
                this._drawer._$panelContentWrapper.css("zIndex", this._panelZIndex)
            }
        }
    }, {
        key: "clearZIndex",
        value: function() {
            if ((0, _type.isDefined)(this._panelZIndex)) {
                this._drawer._$panelContentWrapper.css("zIndex", "");
                delete this._panelZIndex
            }
            _get(_getPrototypeOf(OverlapStrategy.prototype), "clearZIndex", this).call(this)
        }
    }]);
    return OverlapStrategy
}(_uiDrawerRendering2.default);
module.exports = OverlapStrategy;
