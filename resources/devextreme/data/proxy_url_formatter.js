/**
 * DevExtreme (data/proxy_url_formatter.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var each = require("../core/utils/iterator").each;
var domAdapter = require("../core/dom_adapter");
var window = require("../core/utils/window").getWindow();
var callOnce = require("../core/utils/call_once");
var DXPROXY_HOST = "dxproxy.devexpress.com:8000";
var urlMapping = {};
var getUrlParser = callOnce(function() {
    var a = domAdapter.createElement("a");
    var props = ["protocol", "hostname", "port", "pathname", "search", "hash"];
    var normalizePath = function(value) {
        if ("/" !== value.charAt(0)) {
            value = "/" + value
        }
        return value
    };
    return function(url) {
        a.href = url;
        var result = {};
        each(props, function() {
            result[this] = a[this]
        });
        result.pathname = normalizePath(result.pathname);
        return result
    }
});
var parseUrl = function(url) {
    var urlParser = getUrlParser();
    return urlParser(url)
};
var extractProxyAppId = function() {
    return window.location.pathname.split("/")[1]
};
module.exports = {
    parseUrl: parseUrl,
    isProxyUsed: function() {
        return window.location.host === DXPROXY_HOST
    },
    formatProxyUrl: function(localUrl) {
        var urlData = parseUrl(localUrl);
        if (!/^(localhost$|127\.)/i.test(urlData.hostname)) {
            return localUrl
        }
        var proxyUrlPart = DXPROXY_HOST + "/" + extractProxyAppId() + "_" + urlData.port;
        urlMapping[proxyUrlPart] = urlData.hostname + ":" + urlData.port;
        var resultUrl = "http://" + proxyUrlPart + urlData.pathname + urlData.search;
        return resultUrl
    },
    formatLocalUrl: function(proxyUrl) {
        if (proxyUrl.indexOf(DXPROXY_HOST) < 0) {
            return proxyUrl
        }
        var resultUrl = proxyUrl;
        for (var proxyUrlPart in urlMapping) {
            if (Object.prototype.hasOwnProperty.call(urlMapping, proxyUrlPart)) {
                if (proxyUrl.indexOf(proxyUrlPart) >= 0) {
                    resultUrl = proxyUrl.replace(proxyUrlPart, urlMapping[proxyUrlPart]);
                    break
                }
            }
        }
        return resultUrl
    }
};
