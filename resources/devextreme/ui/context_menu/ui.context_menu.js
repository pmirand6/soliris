/**
 * DevExtreme (ui/context_menu/ui.context_menu.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var _renderer = require("../../core/renderer");
var _renderer2 = _interopRequireDefault(_renderer);
var _dom_adapter = require("../../core/dom_adapter");
var _dom_adapter2 = _interopRequireDefault(_dom_adapter);
var _events_engine = require("../../events/core/events_engine");
var _events_engine2 = _interopRequireDefault(_events_engine);
var _guid = require("../../core/guid");
var _guid2 = _interopRequireDefault(_guid);
var _component_registrator = require("../../core/component_registrator");
var _component_registrator2 = _interopRequireDefault(_component_registrator);
var _common = require("../../core/utils/common");
var _type = require("../../core/utils/type");
var _dom = require("../../core/utils/dom");
var _iterator = require("../../core/utils/iterator");
var _array = require("../../core/utils/array");
var _extend = require("../../core/utils/extend");
var _window = require("../../core/utils/window");
var _fx = require("../../animation/fx");
var _fx2 = _interopRequireDefault(_fx);
var _position = require("../../animation/position");
var _devices = require("../../core/devices");
var _devices2 = _interopRequireDefault(_devices);
var _utils = require("../../events/utils");
var _overlay = require("../overlay");
var _overlay2 = _interopRequireDefault(_overlay);
var _ui = require("./ui.menu_base");
var _ui2 = _interopRequireDefault(_ui);
var _deferred = require("../../core/utils/deferred");

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
var DX_MENU_CLASS = "dx-menu";
var DX_MENU_ITEM_CLASS = DX_MENU_CLASS + "-item";
var DX_MENU_ITEM_EXPANDED_CLASS = DX_MENU_ITEM_CLASS + "-expanded";
var DX_MENU_PHONE_CLASS = "dx-menu-phone-overlay";
var DX_MENU_ITEMS_CONTAINER_CLASS = DX_MENU_CLASS + "-items-container";
var DX_MENU_ITEM_WRAPPER_CLASS = DX_MENU_ITEM_CLASS + "-wrapper";
var DX_SUBMENU_CLASS = "dx-submenu";
var DX_CONTEXT_MENU_CLASS = "dx-context-menu";
var DX_HAS_CONTEXT_MENU_CLASS = "dx-has-context-menu";
var DX_STATE_DISABLED_CLASS = "dx-state-disabled";
var DX_STATE_FOCUSED_CLASS = "dx-state-focused";
var DX_STATE_HOVER_CLASS = "dx-state-hover";
var FOCUS_UP = "up";
var FOCUS_DOWN = "down";
var FOCUS_LEFT = "left";
var FOCUS_RIGHT = "right";
var FOCUS_FIRST = "first";
var FOCUS_LAST = "last";
var ACTIONS = ["onShowing", "onShown", "onSubmenuCreated", "onHiding", "onHidden", "onPositioning", "onLeftFirstItem", "onLeftLastItem", "onCloseRootSubmenu", "onExpandLastSubmenu"];
var LOCAL_SUBMENU_DIRECTIONS = [FOCUS_UP, FOCUS_DOWN, FOCUS_FIRST, FOCUS_LAST];
var DEFAULT_SHOW_EVENT = "dxcontextmenu";
var ContextMenu = function(_MenuBase) {
    _inherits(ContextMenu, _MenuBase);
    var _super = _createSuper(ContextMenu);

    function ContextMenu() {
        _classCallCheck(this, ContextMenu);
        return _super.apply(this, arguments)
    }
    _createClass(ContextMenu, [{
        key: "getShowEvent",
        value: function(showEventOption) {
            var result = null;
            if ((0, _type.isObject)(showEventOption)) {
                if (null !== showEventOption.name) {
                    result = showEventOption.name || DEFAULT_SHOW_EVENT
                }
            } else {
                result = showEventOption
            }
            return result
        }
    }, {
        key: "getShowDelay",
        value: function(showEventOption) {
            return (0, _type.isObject)(showEventOption) && showEventOption.delay
        }
    }, {
        key: "_getDefaultOptions",
        value: function() {
            return (0, _extend.extend)(_get(_getPrototypeOf(ContextMenu.prototype), "_getDefaultOptions", this).call(this), {
                showEvent: DEFAULT_SHOW_EVENT,
                closeOnOutsideClick: true,
                position: {
                    at: "top left",
                    my: "top left"
                },
                onShowing: null,
                onShown: null,
                onSubmenuCreated: null,
                onHiding: null,
                onHidden: null,
                onPositioning: null,
                submenuDirection: "auto",
                visible: false,
                target: void 0,
                onLeftFirstItem: null,
                onLeftLastItem: null,
                onCloseRootSubmenu: null,
                onExpandLastSubmenu: null
            })
        }
    }, {
        key: "_defaultOptionsRules",
        value: function() {
            return _get(_getPrototypeOf(ContextMenu.prototype), "_defaultOptionsRules", this).call(this).concat([{
                device: function() {
                    return !(0, _window.hasWindow)()
                },
                options: {
                    animation: null
                }
            }])
        }
    }, {
        key: "_initActions",
        value: function() {
            var _this = this;
            this._actions = {};
            (0, _iterator.each)(ACTIONS, function(index, action) {
                _this._actions[action] = _this._createActionByOption(action) || _common.noop
            })
        }
    }, {
        key: "_setOptionsByReference",
        value: function() {
            _get(_getPrototypeOf(ContextMenu.prototype), "_setOptionsByReference", this).call(this);
            (0, _extend.extend)(this._optionsByReference, {
                animation: true,
                selectedItem: true
            })
        }
    }, {
        key: "_focusInHandler",
        value: function() {}
    }, {
        key: "_itemContainer",
        value: function() {
            return this._overlay ? this._overlay.$content() : (0, _renderer2.default)()
        }
    }, {
        key: "_eventBindingTarget",
        value: function() {
            return this._itemContainer()
        }
    }, {
        key: "itemsContainer",
        value: function() {
            return this._overlay ? this._overlay.$content() : void 0
        }
    }, {
        key: "_supportedKeys",
        value: function() {
            var _this2 = this;
            var selectItem = function() {
                var $item = (0, _renderer2.default)(_this2.option("focusedElement"));
                _this2.hide();
                if (!$item.length || !_this2._isSelectionEnabled()) {
                    return
                }
                _this2.selectItem($item[0])
            };
            return (0, _extend.extend)(_get(_getPrototypeOf(ContextMenu.prototype), "_supportedKeys", this).call(this), {
                space: selectItem,
                esc: this.hide
            })
        }
    }, {
        key: "_getActiveItem",
        value: function() {
            var $availableItems = this._getAvailableItems();
            var $focusedItem = $availableItems.filter(".".concat(DX_STATE_FOCUSED_CLASS));
            var $hoveredItem = $availableItems.filter(".".concat(DX_STATE_HOVER_CLASS));
            var $hoveredItemContainer = $hoveredItem.closest(".".concat(DX_MENU_ITEMS_CONTAINER_CLASS));
            if ($hoveredItemContainer.find(".".concat(DX_MENU_ITEM_CLASS)).index($focusedItem) >= 0) {
                return $focusedItem
            }
            if ($hoveredItem.length) {
                return $hoveredItem
            }
            return _get(_getPrototypeOf(ContextMenu.prototype), "_getActiveItem", this).call(this)
        }
    }, {
        key: "_moveFocus",
        value: function(location) {
            var $items = this._getItemsByLocation(location);
            var $oldTarget = this._getActiveItem(true);
            var $hoveredItem = this.itemsContainer().find(".".concat(DX_STATE_HOVER_CLASS));
            var $focusedItem = (0, _renderer2.default)(this.option("focusedElement"));
            var $activeItemHighlighted = !!($focusedItem.length || $hoveredItem.length);
            var $newTarget;
            switch (location) {
                case FOCUS_UP:
                    $newTarget = $activeItemHighlighted ? this._prevItem($items) : $oldTarget;
                    if ($oldTarget.is($items.first())) {
                        this._actions.onLeftFirstItem($oldTarget)
                    }
                    break;
                case FOCUS_DOWN:
                    $newTarget = $activeItemHighlighted ? this._nextItem($items) : $oldTarget;
                    if ($oldTarget.is($items.last())) {
                        this._actions.onLeftLastItem($oldTarget)
                    }
                    break;
                case FOCUS_RIGHT:
                    $newTarget = this.option("rtlEnabled") ? this._hideSubmenuHandler() : this._expandSubmenuHandler($items, location);
                    break;
                case FOCUS_LEFT:
                    $newTarget = this.option("rtlEnabled") ? this._expandSubmenuHandler($items, location) : this._hideSubmenuHandler();
                    break;
                case FOCUS_FIRST:
                    $newTarget = $items.first();
                    break;
                case FOCUS_LAST:
                    $newTarget = $items.last();
                    break;
                default:
                    return _get(_getPrototypeOf(ContextMenu.prototype), "_moveFocus", this).call(this, location)
            }
            if (0 !== $newTarget.length) {
                this.option("focusedElement", (0, _dom.getPublicElement)($newTarget))
            }
        }
    }, {
        key: "_getItemsByLocation",
        value: function(location) {
            var $activeItem = this._getActiveItem(true);
            var $items;
            if ((0, _array.inArray)(location, LOCAL_SUBMENU_DIRECTIONS) >= 0) {
                $items = $activeItem.closest(".".concat(DX_MENU_ITEMS_CONTAINER_CLASS)).children().children()
            }
            $items = this._getAvailableItems($items);
            return $items
        }
    }, {
        key: "_getAriaTarget",
        value: function() {
            return this.$element()
        }
    }, {
        key: "_refreshActiveDescendant",
        value: function() {
            if ((0, _type.isDefined)(this._overlay)) {
                var $target = this._overlay.$content();
                _get(_getPrototypeOf(ContextMenu.prototype), "_refreshActiveDescendant", this).call(this, $target)
            }
        }
    }, {
        key: "_hideSubmenuHandler",
        value: function() {
            var $curItem = this._getActiveItem(true);
            var $parentItem = $curItem.parents(".".concat(DX_MENU_ITEM_EXPANDED_CLASS)).first();
            if ($parentItem.length) {
                this._hideSubmenusOnSameLevel($parentItem);
                this._hideSubmenu($curItem.closest(".".concat(DX_SUBMENU_CLASS)));
                return $parentItem
            }
            this._actions.onCloseRootSubmenu($curItem);
            return $curItem
        }
    }, {
        key: "_expandSubmenuHandler",
        value: function($items, location) {
            var $curItem = this._getActiveItem(true);
            var itemData = this._getItemData($curItem);
            var node = this._dataAdapter.getNodeByItem(itemData);
            var isItemHasSubmenu = this._hasSubmenu(node);
            var $submenu = $curItem.children(".".concat(DX_SUBMENU_CLASS));
            if (isItemHasSubmenu && !$curItem.hasClass(DX_STATE_DISABLED_CLASS)) {
                if (!$submenu.length || "hidden" === $submenu.css("visibility")) {
                    this._showSubmenu($curItem)
                }
                return this._nextItem(this._getItemsByLocation(location))
            }
            this._actions.onExpandLastSubmenu($curItem);
            return $curItem
        }
    }, {
        key: "_clean",
        value: function() {
            if (this._overlay) {
                this._overlay.$element().remove();
                this._overlay = null
            }
            this._detachShowContextMenuEvents(this._getTarget());
            _get(_getPrototypeOf(ContextMenu.prototype), "_clean", this).call(this)
        }
    }, {
        key: "_initMarkup",
        value: function() {
            this.$element().addClass(DX_HAS_CONTEXT_MENU_CLASS);
            _get(_getPrototypeOf(ContextMenu.prototype), "_initMarkup", this).call(this)
        }
    }, {
        key: "_render",
        value: function() {
            _get(_getPrototypeOf(ContextMenu.prototype), "_render", this).call(this);
            this._renderVisibility(this.option("visible"));
            this._addWidgetClass()
        }
    }, {
        key: "_renderContentImpl",
        value: function() {
            this._detachShowContextMenuEvents(this._getTarget());
            this._attachShowContextMenuEvents()
        }
    }, {
        key: "_attachKeyboardEvents",
        value: function() {
            !this._keyboardProcessor && this._focusTarget().length && _get(_getPrototypeOf(ContextMenu.prototype), "_attachKeyboardEvents", this).call(this)
        }
    }, {
        key: "_renderContextMenuOverlay",
        value: function() {
            if (this._overlay) {
                return
            }
            var overlayOptions = this._getOverlayOptions();
            this._overlay = this._createComponent((0, _renderer2.default)("<div>").appendTo(this._$element), _overlay2.default, overlayOptions);
            var $overlayContent = this._overlay.$content();
            $overlayContent.addClass(DX_CONTEXT_MENU_CLASS);
            this._addCustomCssClass($overlayContent);
            this._addPlatformDependentClass($overlayContent);
            this._attachContextMenuEvent()
        }
    }, {
        key: "_itemContextMenuHandler",
        value: function(e) {
            _get(_getPrototypeOf(ContextMenu.prototype), "_itemContextMenuHandler", this).call(this, e);
            e.stopPropagation()
        }
    }, {
        key: "_addPlatformDependentClass",
        value: function($element) {
            if (_devices2.default.current().phone) {
                $element.addClass(DX_MENU_PHONE_CLASS)
            }
        }
    }, {
        key: "_detachShowContextMenuEvents",
        value: function(target) {
            var showEvent = this.getShowEvent(this.option("showEvent"));
            if (!showEvent) {
                return
            }
            var eventName = (0, _utils.addNamespace)(showEvent, this.NAME);
            if (this._showContextMenuEventHandler) {
                _events_engine2.default.off(_dom_adapter2.default.getDocument(), eventName, target, this._showContextMenuEventHandler)
            } else {
                _events_engine2.default.off((0, _renderer2.default)(target), eventName)
            }
        }
    }, {
        key: "_attachShowContextMenuEvents",
        value: function() {
            var _this3 = this;
            var target = this._getTarget();
            var showEvent = this.getShowEvent(this.option("showEvent"));
            if (!showEvent) {
                return
            }
            var eventName = (0, _utils.addNamespace)(showEvent, this.NAME);
            var contextMenuAction = this._createAction(function(e) {
                var delay = _this3.getShowDelay(_this3.option("showEvent"));
                if (delay) {
                    setTimeout(function() {
                        return _this3._show(e.event)
                    }, delay)
                } else {
                    _this3._show(e.event)
                }
            }, {
                validatingTargetName: "target"
            });
            var handler = function(e) {
                return contextMenuAction({
                    event: e,
                    target: (0, _renderer2.default)(e.currentTarget)
                })
            };
            contextMenuAction = this._createAction(contextMenuAction);
            if ((0, _type.isRenderer)(target) || target.nodeType || (0, _type.isWindow)(target)) {
                this._showContextMenuEventHandler = void 0;
                _events_engine2.default.on(target, eventName, handler)
            } else {
                this._showContextMenuEventHandler = handler;
                _events_engine2.default.on(_dom_adapter2.default.getDocument(), eventName, target, this._showContextMenuEventHandler)
            }
        }
    }, {
        key: "_hoverEndHandler",
        value: function(e) {
            _get(_getPrototypeOf(ContextMenu.prototype), "_hoverEndHandler", this).call(this, e);
            e.stopPropagation()
        }
    }, {
        key: "_renderDimensions",
        value: function() {}
    }, {
        key: "_renderContainer",
        value: function($wrapper, submenuContainer) {
            var $holder = submenuContainer || this._itemContainer();
            $wrapper = (0, _renderer2.default)("<div>");
            $wrapper.appendTo($holder).addClass(DX_SUBMENU_CLASS).css("visibility", submenuContainer ? "hidden" : "visible");
            var $itemsContainer = _get(_getPrototypeOf(ContextMenu.prototype), "_renderContainer", this).call(this, $wrapper);
            if (submenuContainer) {
                return $itemsContainer
            }
            if (this.option("width")) {
                return $itemsContainer.css("minWidth", this.option("width"))
            }
            if (this.option("height")) {
                return $itemsContainer.css("minHeight", this.option("height"))
            }
            return $itemsContainer
        }
    }, {
        key: "_renderSubmenuItems",
        value: function(node, $itemFrame) {
            this._renderItems(this._getChildNodes(node), $itemFrame);
            this._actions.onSubmenuCreated({
                itemElement: (0, _dom.getPublicElement)($itemFrame),
                itemData: node.internalFields.item,
                submenuElement: (0, _dom.getPublicElement)($itemFrame.children(".".concat(DX_SUBMENU_CLASS)))
            })
        }
    }, {
        key: "_getOverlayOptions",
        value: function() {
            var position = this.option("position");
            var overlayOptions = {
                focusStateEnabled: this.option("focusStateEnabled"),
                animation: this.option("animation"),
                innerOverlay: true,
                closeOnOutsideClick: this._closeOnOutsideClickHandler.bind(this),
                propagateOutsideClick: true,
                closeOnTargetScroll: true,
                deferRendering: false,
                position: {
                    at: position.at,
                    my: position.my,
                    of: this._getTarget(),
                    collision: "flipfit"
                },
                shading: false,
                showTitle: false,
                height: "auto",
                width: "auto",
                onShown: this._overlayShownActionHandler.bind(this),
                onHiding: this._overlayHidingActionHandler.bind(this),
                onHidden: this._overlayHiddenActionHandler.bind(this)
            };
            return overlayOptions
        }
    }, {
        key: "_overlayShownActionHandler",
        value: function(arg) {
            this._actions.onShown(arg)
        }
    }, {
        key: "_overlayHidingActionHandler",
        value: function(arg) {
            this._actions.onHiding(arg);
            if (!arg.cancel) {
                this._hideAllShownSubmenus();
                this._setOptionSilent("visible", false)
            }
        }
    }, {
        key: "_overlayHiddenActionHandler",
        value: function(arg) {
            this._actions.onHidden(arg)
        }
    }, {
        key: "_closeOnOutsideClickHandler",
        value: function(e) {
            var closeOnOutsideClick = this.option("closeOnOutsideClick");
            if ((0, _type.isFunction)(closeOnOutsideClick)) {
                return closeOnOutsideClick(e)
            }
            if (!closeOnOutsideClick) {
                return false
            }
            if (_dom_adapter2.default.isDocument(e.target)) {
                return true
            }
            var $activeItemContainer = this._getActiveItemsContainer(e.target);
            var $itemContainers = this._getItemsContainers();
            var $clickedItem = this._searchActiveItem(e.target);
            var $rootItem = this.$element().parents(".".concat(DX_MENU_ITEM_CLASS));
            var isRootItemClicked = $clickedItem[0] === $rootItem[0] && $clickedItem.length && $rootItem.length;
            var isInnerOverlayClicked = this._isIncludeOverlay($activeItemContainer, $itemContainers) && $clickedItem.length;
            if (isInnerOverlayClicked || isRootItemClicked) {
                if ("onClick" === this._getShowSubmenuMode()) {
                    this._hideAllShownChildSubmenus($clickedItem)
                }
                return false
            }
            return true
        }
    }, {
        key: "_getActiveItemsContainer",
        value: function(target) {
            return (0, _renderer2.default)(target).closest(".".concat(DX_MENU_ITEMS_CONTAINER_CLASS))
        }
    }, {
        key: "_getItemsContainers",
        value: function() {
            return this._overlay._$content.find(".".concat(DX_MENU_ITEMS_CONTAINER_CLASS))
        }
    }, {
        key: "_searchActiveItem",
        value: function(target) {
            return (0, _renderer2.default)(target).closest(".".concat(DX_MENU_ITEM_CLASS)).eq(0)
        }
    }, {
        key: "_isIncludeOverlay",
        value: function($activeOverlay, $allOverlays) {
            var isSame = false;
            (0, _iterator.each)($allOverlays, function(index, $overlay) {
                if ($activeOverlay.is($overlay) && !isSame) {
                    isSame = true
                }
            });
            return isSame
        }
    }, {
        key: "_hideAllShownChildSubmenus",
        value: function($clickedItem) {
            var _this4 = this;
            var $submenuElements = $clickedItem.find(".".concat(DX_SUBMENU_CLASS));
            var shownSubmenus = (0, _extend.extend)([], this._shownSubmenus);
            if ($submenuElements.length > 0) {
                (0, _iterator.each)(shownSubmenus, function(index, $submenu) {
                    var $context = _this4._searchActiveItem($submenu.context).parent();
                    if ($context.parent().is($clickedItem.parent().parent()) && !$context.is($clickedItem.parent())) {
                        _this4._hideSubmenu($submenu)
                    }
                })
            }
        }
    }, {
        key: "_showSubmenu",
        value: function($item) {
            var node = this._dataAdapter.getNodeByItem(this._getItemData($item));
            this._hideSubmenusOnSameLevel($item);
            if (!this._hasSubmenu(node)) {
                return
            }
            var $submenu = $item.children(".".concat(DX_SUBMENU_CLASS));
            var isSubmenuRendered = $submenu.length;
            _get(_getPrototypeOf(ContextMenu.prototype), "_showSubmenu", this).call(this, $item);
            if (!isSubmenuRendered) {
                this._renderSubmenuItems(node, $item)
            }
            if (!this._isSubmenuVisible($submenu)) {
                this._drawSubmenu($item)
            }
        }
    }, {
        key: "_hideSubmenusOnSameLevel",
        value: function($item) {
            var $expandedItems = $item.parent(".".concat(DX_MENU_ITEM_WRAPPER_CLASS)).siblings().find(".".concat(DX_MENU_ITEM_EXPANDED_CLASS));
            if ($expandedItems.length) {
                $expandedItems.removeClass(DX_MENU_ITEM_EXPANDED_CLASS);
                this._hideSubmenu($expandedItems.find(".".concat(DX_SUBMENU_CLASS)))
            }
        }
    }, {
        key: "_hideSubmenuGroup",
        value: function($submenu) {
            if (this._isSubmenuVisible($submenu)) {
                this._hideSubmenuCore($submenu)
            }
        }
    }, {
        key: "_isSubmenuVisible",
        value: function($submenu) {
            return "visible" === $submenu.css("visibility")
        }
    }, {
        key: "_drawSubmenu",
        value: function($itemElement) {
            var animation = this.option("animation") ? this.option("animation").show : {};
            var $submenu = $itemElement.children(".".concat(DX_SUBMENU_CLASS));
            var submenuPosition = this._getSubmenuPosition($itemElement);
            if (this._overlay && this._overlay.option("visible")) {
                if (!(0, _type.isDefined)(this._shownSubmenus)) {
                    this._shownSubmenus = []
                }
                if ((0, _array.inArray)($submenu, this._shownSubmenus)) {
                    this._shownSubmenus.push($submenu)
                }
                if (animation) {
                    _fx2.default.stop($submenu)
                }(0, _position.setup)($submenu, submenuPosition);
                if (animation) {
                    if ((0, _type.isPlainObject)(animation.to)) {
                        animation.to.position = submenuPosition
                    }
                    this._animate($submenu, animation)
                }
                $submenu.css("visibility", "visible")
            }
        }
    }, {
        key: "_animate",
        value: function($container, options) {
            _fx2.default.animate($container, options)
        }
    }, {
        key: "_getSubmenuPosition",
        value: function($rootItem) {
            var submenuDirection = this.option("submenuDirection").toLowerCase();
            var $rootItemWrapper = $rootItem.parent(".".concat(DX_MENU_ITEM_WRAPPER_CLASS));
            var position = {
                collision: "flip",
                of: $rootItemWrapper,
                offset: {
                    h: 0,
                    v: -1
                }
            };
            switch (submenuDirection) {
                case "left":
                    position.at = "left top";
                    position.my = "right top";
                    break;
                case "right":
                    position.at = "right top";
                    position.my = "left top";
                    break;
                default:
                    if (this.option("rtlEnabled")) {
                        position.at = "left top";
                        position.my = "right top"
                    } else {
                        position.at = "right top";
                        position.my = "left top"
                    }
            }
            return position
        }
    }, {
        key: "_updateSubmenuVisibilityOnClick",
        value: function(actionArgs) {
            if (!actionArgs.args.length) {
                return
            }
            var itemData = actionArgs.args[0].itemData;
            var node = this._dataAdapter.getNodeByItem(itemData);
            if (!node) {
                return
            }
            var $itemElement = (0, _renderer2.default)(actionArgs.args[0].itemElement);
            var $submenu = $itemElement.find(".".concat(DX_SUBMENU_CLASS));
            var shouldRenderSubmenu = this._hasSubmenu(node) && !$submenu.length;
            if (shouldRenderSubmenu) {
                this._renderSubmenuItems(node, $itemElement);
                $submenu = $itemElement.find(".".concat(DX_SUBMENU_CLASS))
            }
            if ($itemElement.context === $submenu.context && "visible" === $submenu.css("visibility")) {
                return
            }
            var notCloseMenuOnItemClick = itemData && false === itemData.closeMenuOnClick;
            if (!itemData || itemData.disabled || notCloseMenuOnItemClick) {
                return
            }
            this._updateSelectedItemOnClick(actionArgs);
            if (0 === $submenu.length) {
                var $prevSubmenu = (0, _renderer2.default)($itemElement.parents(".".concat(DX_SUBMENU_CLASS))[0]);
                this._hideSubmenu($prevSubmenu);
                if (!actionArgs.canceled && this._overlay && this._overlay.option("visible")) {
                    this.option("visible", false)
                }
            } else {
                if (this._shownSubmenus && this._shownSubmenus.length > 0) {
                    if (this._shownSubmenus[0].is($submenu)) {
                        this._hideSubmenu($submenu)
                    }
                }
                this._showSubmenu($itemElement)
            }
        }
    }, {
        key: "_hideSubmenu",
        value: function($curSubmenu) {
            var _this5 = this;
            var shownSubmenus = (0, _extend.extend)([], this._shownSubmenus);
            (0, _iterator.each)(shownSubmenus, function(index, $submenu) {
                if ($curSubmenu.is($submenu) || (0, _dom.contains)($curSubmenu[0], $submenu[0])) {
                    $submenu.parent().removeClass(DX_MENU_ITEM_EXPANDED_CLASS);
                    _this5._hideSubmenuCore($submenu)
                }
            })
        }
    }, {
        key: "_hideSubmenuCore",
        value: function($submenu) {
            var index = (0, _array.inArray)($submenu, this._shownSubmenus);
            var animation = this.option("animation") ? this.option("animation").hide : null;
            if (index >= 0) {
                this._shownSubmenus.splice(index, 1)
            }
            this._stopAnimate($submenu);
            animation && this._animate($submenu, animation);
            $submenu.css("visibility", "hidden")
        }
    }, {
        key: "_stopAnimate",
        value: function($container) {
            _fx2.default.stop($container, true)
        }
    }, {
        key: "_hideAllShownSubmenus",
        value: function() {
            var _this6 = this;
            var shownSubmenus = (0, _extend.extend)([], this._shownSubmenus);
            var $expandedItems = this._overlay.$content().find(".".concat(DX_MENU_ITEM_EXPANDED_CLASS));
            $expandedItems.removeClass(DX_MENU_ITEM_EXPANDED_CLASS);
            (0, _iterator.each)(shownSubmenus, function(_, $submenu) {
                _this6._hideSubmenu($submenu)
            })
        }
    }, {
        key: "_visibilityChanged",
        value: function(visible) {
            if (visible) {
                this._renderContentImpl()
            }
        }
    }, {
        key: "_optionChanged",
        value: function(args) {
            if ((0, _array.inArray)(args.name, ACTIONS) > -1) {
                this._initActions();
                return
            }
            switch (args.name) {
                case "visible":
                    this._renderVisibility(args.value);
                    break;
                case "showEvent":
                case "position":
                case "submenuDirection":
                    this._invalidate();
                    break;
                case "target":
                    args.previousValue && this._detachShowContextMenuEvents(args.previousValue);
                    this._invalidate();
                    break;
                case "closeOnOutsideClick":
                    break;
                default:
                    _get(_getPrototypeOf(ContextMenu.prototype), "_optionChanged", this).call(this, args)
            }
        }
    }, {
        key: "_renderVisibility",
        value: function(showing) {
            return showing ? this._show() : this._hide()
        }
    }, {
        key: "_toggleVisibility",
        value: function() {}
    }, {
        key: "_show",
        value: function(event) {
            var args = {
                jQEvent: event
            };
            var promise = (new _deferred.Deferred).reject().promise();
            this._actions.onShowing(args);
            if (args.cancel) {
                return promise
            }
            var position = this._positionContextMenu(event);
            if (position) {
                if (!this._overlay) {
                    this._renderContextMenuOverlay();
                    this._overlay.$content().addClass(this._widgetClass());
                    this._renderFocusState();
                    this._attachHoverEvents();
                    this._attachClickEvent();
                    this._renderItems(this._dataAdapter.getRootNodes())
                }
                this._setOptionSilent("visible", true);
                this._overlay.option("position", position);
                promise = this._overlay.show();
                event && event.stopPropagation();
                this._setAriaAttributes()
            }
            return promise
        }
    }, {
        key: "_setAriaAttributes",
        value: function() {
            this._overlayContentId = "dx-".concat(new _guid2.default);
            this.setAria("owns", this._overlayContentId);
            this.setAria({
                id: this._overlayContentId,
                role: "menu"
            }, this._overlay.$content())
        }
    }, {
        key: "_cleanAriaAttributes",
        value: function() {
            this._overlay && this.setAria("id", null, this._overlay.$content());
            this.setAria("owns", void 0)
        }
    }, {
        key: "_getTarget",
        value: function() {
            return this.option("target") || this.option("position").of || (0, _renderer2.default)(_dom_adapter2.default.getDocument())
        }
    }, {
        key: "_getContextMenuPosition",
        value: function() {
            return (0, _extend.extend)({}, this.option("position"), {
                of: this._getTarget()
            })
        }
    }, {
        key: "_positionContextMenu",
        value: function(jQEvent) {
            var position = this._getContextMenuPosition();
            var isInitialPosition = this._isInitialOptionValue("position");
            var positioningAction = this._createActionByOption("onPositioning", actionArgs);
            if (jQEvent && jQEvent.preventDefault && isInitialPosition) {
                position.of = jQEvent
            }
            var actionArgs = {
                position: position,
                event: jQEvent
            };
            positioningAction(actionArgs);
            if (actionArgs.cancel) {
                position = null
            } else {
                if (actionArgs.event) {
                    actionArgs.event.cancel = true;
                    jQEvent.preventDefault()
                }
            }
            return position
        }
    }, {
        key: "_refresh",
        value: function() {
            if (!(0, _window.hasWindow)()) {
                _get(_getPrototypeOf(ContextMenu.prototype), "_refresh", this).call(this)
            } else {
                if (this._overlay) {
                    var lastPosition = this._overlay.option("position");
                    _get(_getPrototypeOf(ContextMenu.prototype), "_refresh", this).call(this);
                    this._overlay && this._overlay.option("position", lastPosition)
                } else {
                    _get(_getPrototypeOf(ContextMenu.prototype), "_refresh", this).call(this)
                }
            }
        }
    }, {
        key: "_hide",
        value: function() {
            var promise;
            if (this._overlay) {
                promise = this._overlay.hide();
                this._setOptionSilent("visible", false)
            }
            this._cleanAriaAttributes();
            this.option("focusedElement", null);
            return promise || (new _deferred.Deferred).reject().promise()
        }
    }, {
        key: "toggle",
        value: function(showing) {
            var visible = this.option("visible");
            showing = void 0 === showing ? !visible : showing;
            return this._renderVisibility(showing)
        }
    }, {
        key: "show",
        value: function() {
            return this.toggle(true)
        }
    }, {
        key: "hide",
        value: function() {
            return this.toggle(false)
        }
    }]);
    return ContextMenu
}(_ui2.default);
(0, _component_registrator2.default)("dxContextMenu", ContextMenu);
module.exports = ContextMenu;
