/**
 * DevExtreme (ui/load_indicator.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var $ = require("../core/renderer");
var windowUtils = require("../core/utils/window");
var navigator = windowUtils.getNavigator();
var support = require("../core/utils/support");
var themes = require("./themes");
var extend = require("../core/utils/extend").extend;
var devices = require("../core/devices");
var registerComponent = require("../core/component_registrator");
var Widget = require("./widget/ui.widget");
var LOADINDICATOR_CLASS = "dx-loadindicator";
var LOADINDICATOR_WRAPPER_CLASS = "dx-loadindicator-wrapper";
var LOADINDICATOR_CONTENT_CLASS = "dx-loadindicator-content";
var LOADINDICATOR_ICON_CLASS = "dx-loadindicator-icon";
var LOADINDICATOR_SEGMENT_CLASS = "dx-loadindicator-segment";
var LOADINDICATOR_SEGMENT_INNER_CLASS = "dx-loadindicator-segment-inner";
var LOADINDICATOR_IMAGE_CLASS = "dx-loadindicator-image";
var LoadIndicator = Widget.inherit({
    _getDefaultOptions: function() {
        return extend(this.callBase(), {
            indicatorSrc: "",
            activeStateEnabled: false,
            hoverStateEnabled: false,
            _animatingSegmentCount: 1,
            _animatingSegmentInner: false
        })
    },
    _defaultOptionsRules: function() {
        var themeName = themes.current();
        return this.callBase().concat([{
            device: function() {
                var realDevice = devices.real();
                var obsoleteAndroid = "android" === realDevice.platform && !/chrome/i.test(navigator.userAgent);
                return obsoleteAndroid
            },
            options: {
                viaImage: true
            }
        }, {
            device: function() {
                return themes.isIos7(themeName)
            },
            options: {
                _animatingSegmentCount: 11
            }
        }, {
            device: function() {
                return themes.isMaterial(themeName)
            },
            options: {
                _animatingSegmentCount: 2,
                _animatingSegmentInner: true
            }
        }, {
            device: function() {
                return themes.isGeneric(themeName)
            },
            options: {
                _animatingSegmentCount: 7
            }
        }])
    },
    _init: function() {
        this.callBase();
        this.$element().addClass(LOADINDICATOR_CLASS)
    },
    _initMarkup: function() {
        this.callBase();
        this._renderWrapper();
        this._renderIndicatorContent();
        this._renderMarkup()
    },
    _renderWrapper: function() {
        this._$wrapper = $("<div>").addClass(LOADINDICATOR_WRAPPER_CLASS);
        this.$element().append(this._$wrapper)
    },
    _renderIndicatorContent: function() {
        this._$content = $("<div>").addClass(LOADINDICATOR_CONTENT_CLASS);
        this._$wrapper.append(this._$content)
    },
    _renderMarkup: function() {
        if (support.animation() && !this.option("viaImage") && !this.option("indicatorSrc")) {
            this._renderMarkupForAnimation()
        } else {
            this._renderMarkupForImage()
        }
    },
    _renderMarkupForAnimation: function() {
        var animatingSegmentInner = this.option("_animatingSegmentInner");
        this._$indicator = $("<div>").addClass(LOADINDICATOR_ICON_CLASS);
        this._$content.append(this._$indicator);
        for (var i = this.option("_animatingSegmentCount"); i >= 0; --i) {
            var $segment = $("<div>").addClass(LOADINDICATOR_SEGMENT_CLASS).addClass(LOADINDICATOR_SEGMENT_CLASS + i);
            if (animatingSegmentInner) {
                $segment.append($("<div>").addClass(LOADINDICATOR_SEGMENT_INNER_CLASS))
            }
            this._$indicator.append($segment)
        }
    },
    _renderMarkupForImage: function() {
        var indicatorSrc = this.option("indicatorSrc");
        this._$wrapper.addClass(LOADINDICATOR_IMAGE_CLASS);
        if (indicatorSrc) {
            this._$wrapper.css("backgroundImage", "url(" + indicatorSrc + ")")
        }
    },
    _renderDimensions: function() {
        this.callBase();
        this._updateContentSizeForAnimation()
    },
    _updateContentSizeForAnimation: function() {
        if (!this._$indicator) {
            return
        }
        var width = this.option("width");
        var height = this.option("height");
        if (width || height) {
            width = this.$element().width();
            height = this.$element().height();
            var minDimension = Math.min(height, width);
            this._$wrapper.css({
                height: minDimension,
                width: minDimension,
                fontSize: minDimension
            })
        }
    },
    _clean: function() {
        this.callBase();
        this._removeMarkupForAnimation();
        this._removeMarkupForImage()
    },
    _removeMarkupForAnimation: function() {
        if (!this._$indicator) {
            return
        }
        this._$indicator.remove();
        delete this._$indicator
    },
    _removeMarkupForImage: function() {
        this._$wrapper.css("backgroundImage", "none")
    },
    _optionChanged: function(args) {
        switch (args.name) {
            case "_animatingSegmentCount":
            case "_animatingSegmentInner":
            case "indicatorSrc":
                this._invalidate();
                break;
            default:
                this.callBase(args)
        }
    }
});
registerComponent("dxLoadIndicator", LoadIndicator);
module.exports = LoadIndicator;
module.exports.default = module.exports;