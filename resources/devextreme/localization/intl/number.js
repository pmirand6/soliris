/**
 * DevExtreme (localization/intl/number.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var _config = require("../../core/config");
var _config2 = _interopRequireDefault(_config);
var _core = require("../core");
var _version = require("../../core/version");
var _version2 = _interopRequireDefault(_version);
var _version3 = require("../../core/utils/version");
var _open_xml_currency_format = require("../open_xml_currency_format");
var _open_xml_currency_format2 = _interopRequireDefault(_open_xml_currency_format);
var _accounting_formats = require("../cldr-data/accounting_formats");
var _accounting_formats2 = _interopRequireDefault(_accounting_formats);

function _interopRequireDefault(obj) {
    return obj && obj.__esModule ? obj : {
        "default": obj
    }
}
var detectCurrencySymbolRegex = /([^\s0]+)?(\s*)0*[.,]*0*(\s*)([^\s0]+)?/;
var formattersCache = {};
var getFormatter = function(format) {
    var key = (0, _core.locale)() + "/" + JSON.stringify(format);
    if (!formattersCache[key]) {
        formattersCache[key] = new Intl.NumberFormat((0, _core.locale)(), format).format
    }
    return formattersCache[key]
};
var getCurrencyFormatter = function(currency) {
    return new Intl.NumberFormat((0, _core.locale)(), {
        style: "currency",
        currency: currency
    })
};
module.exports = {
    engine: function() {
        return "intl"
    },
    _formatNumberCore: function(value, format, formatConfig) {
        if ("exponential" === format) {
            return this.callBase.apply(this, arguments)
        }
        return getFormatter(this._normalizeFormatConfig(format, formatConfig))(value)
    },
    _normalizeFormatConfig: function(format, formatConfig, value) {
        var config;
        if ("decimal" === format) {
            config = {
                minimumIntegerDigits: formatConfig.precision || void 0,
                useGrouping: false,
                maximumFractionDigits: String(value).length,
                round: value < 0 ? "ceil" : "floor"
            }
        } else {
            config = this._getPrecisionConfig(formatConfig.precision)
        }
        if ("percent" === format) {
            config.style = "percent"
        } else {
            if ("currency" === format) {
                config.style = "currency";
                config.currency = formatConfig.currency || (0, _config2.default)().defaultCurrency
            }
        }
        return config
    },
    _getPrecisionConfig: function(precision) {
        var config;
        if (null === precision) {
            config = {
                minimumFractionDigits: 0,
                maximumFractionDigits: 20
            }
        } else {
            config = {
                minimumFractionDigits: precision || 0,
                maximumFractionDigits: precision || 0
            }
        }
        return config
    },
    format: function(value, _format) {
        if ("number" !== typeof value) {
            return value
        }
        _format = this._normalizeFormat(_format);
        if ("default" === _format.currency) {
            _format.currency = (0, _config2.default)().defaultCurrency
        }
        if (!_format || "function" !== typeof _format && !_format.type && !_format.formatter) {
            return getFormatter(_format)(value)
        }
        return this.callBase.apply(this, arguments)
    },
    parse: function(text, format) {
        if ((0, _version3.compare)(_version2.default, "17.2.8") >= 0) {
            return this.callBase.apply(this, arguments)
        }
        if (!text) {
            return
        }
        if (format && format.parser) {
            return format.parser(text)
        }
        text = this._normalizeNumber(text, format);
        if (text.length > 15) {
            return NaN
        }
        return parseFloat(text)
    },
    _normalizeNumber: function(text, format) {
        var isExponentialRegexp = /^[-+]?[0-9]*.?[0-9]+([eE][-+]?[0-9]+)+$/;
        var legitDecimalSeparator = ".";
        if (this.convertDigits) {
            text = this.convertDigits(text, true)
        }
        if (isExponentialRegexp.test(text)) {
            return text
        }
        var decimalSeparator = this._getDecimalSeparator(format);
        var cleanUpRegexp = new RegExp("[^0-9-\\" + decimalSeparator + "]", "g");
        return text.replace(cleanUpRegexp, "").replace(decimalSeparator, legitDecimalSeparator)
    },
    _getDecimalSeparator: function(format) {
        return getFormatter(format)(.1)[1]
    },
    _getCurrencySymbolInfo: function(currency) {
        var formatter = getCurrencyFormatter(currency);
        return this._extractCurrencySymbolInfo(formatter.format(0))
    },
    _extractCurrencySymbolInfo: function(currencyValueString) {
        var match = detectCurrencySymbolRegex.exec(currencyValueString) || [];
        var position = match[1] ? "before" : "after";
        var symbol = match[1] || match[4] || "";
        var delimiter = match[2] || match[3] || "";
        return {
            position: position,
            symbol: symbol,
            delimiter: delimiter
        }
    },
    getCurrencySymbol: function(currency) {
        if (!currency) {
            currency = (0, _config2.default)().defaultCurrency
        }
        var symbolInfo = this._getCurrencySymbolInfo(currency);
        return {
            symbol: symbolInfo.symbol
        }
    },
    getOpenXmlCurrencyFormat: function(currency) {
        var targetCurrency = currency || (0, _config2.default)().defaultCurrency;
        var currencySymbol = this._getCurrencySymbolInfo(targetCurrency).symbol;
        var closestAccountingFormat = (0, _core.getValueByClosestLocale)(function(locale) {
            return _accounting_formats2.default[locale]
        });
        return (0, _open_xml_currency_format2.default)(currencySymbol, closestAccountingFormat)
    }
};
