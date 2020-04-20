/**
 * DevExtreme (data/odata/store.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var isDefined = require("../../core/utils/type").isDefined;
var config = require("../../core/config");
var odataUtils = require("./utils");
var proxyUrlFormatter = require("../proxy_url_formatter");
var errors = require("../errors").errors;
var query = require("../query");
var Store = require("../abstract_store");
var mixins = require("./mixins");
var deferredUtils = require("../../core/utils/deferred");
var when = deferredUtils.when;
var Deferred = deferredUtils.Deferred;
require("./query_adapter");
var ANONYMOUS_KEY_NAME = "5d46402c-7899-4ea9-bd81-8b73c47c7683";

function expandKeyType(key, keyType) {
    var result = {};
    result[key] = keyType;
    return result
}

function mergeFieldTypesWithKeyType(fieldTypes, keyType) {
    var result = {};
    for (var field in fieldTypes) {
        result[field] = fieldTypes[field]
    }
    for (var keyName in keyType) {
        if (keyName in result) {
            if (result[keyName] !== keyType[keyName]) {
                errors.log("W4001", keyName)
            }
        } else {
            result[keyName] = keyType[keyName]
        }
    }
    return result
}
var ODataStore = Store.inherit({
    ctor: function(options) {
        this.callBase(options);
        this._extractServiceOptions(options);
        var key = this.key();
        var fieldTypes = options.fieldTypes;
        var keyType = options.keyType;
        if (keyType) {
            var keyTypeIsString = "string" === typeof keyType;
            if (!key) {
                key = keyTypeIsString ? ANONYMOUS_KEY_NAME : Object.keys(keyType);
                this._legacyAnonymousKey = key
            }
            if (keyTypeIsString) {
                keyType = expandKeyType(key, keyType)
            }
            fieldTypes = mergeFieldTypesWithKeyType(fieldTypes, keyType)
        }
        this._fieldTypes = fieldTypes || {};
        if (2 === this.version()) {
            this._updateMethod = "MERGE"
        } else {
            this._updateMethod = "PATCH"
        }
    },
    _customLoadOptions: function() {
        return ["expand", "customQueryParams"]
    },
    _byKeyImpl: function(key, extraOptions) {
        var params = {};
        if (extraOptions) {
            params.$expand = odataUtils.generateExpand(this._version, extraOptions.expand, extraOptions.select) || void 0;
            params.$select = odataUtils.generateSelect(this._version, extraOptions.select) || void 0
        }
        return this._sendRequest(this._byKeyUrl(key), "GET", params)
    },
    createQuery: function(loadOptions) {
        var url;
        var queryOptions;
        loadOptions = loadOptions || {};
        queryOptions = {
            adapter: "odata",
            beforeSend: this._beforeSend,
            errorHandler: this._errorHandler,
            jsonp: this._jsonp,
            version: this._version,
            withCredentials: this._withCredentials,
            expand: loadOptions.expand,
            requireTotalCount: loadOptions.requireTotalCount,
            deserializeDates: this._deserializeDates,
            fieldTypes: this._fieldTypes
        };
        if (isDefined(loadOptions.urlOverride)) {
            url = loadOptions.urlOverride
        } else {
            url = this._url
        }
        if (isDefined(this._filterToLower)) {
            queryOptions.filterToLower = this._filterToLower
        }
        if (loadOptions.customQueryParams) {
            var params = mixins.escapeServiceOperationParams(loadOptions.customQueryParams, this.version());
            if (4 === this.version()) {
                url = mixins.formatFunctionInvocationUrl(url, params)
            } else {
                queryOptions.params = params
            }
        }
        return query(url, queryOptions)
    },
    _insertImpl: function(values) {
        this._requireKey();
        var that = this;
        var d = new Deferred;
        when(this._sendRequest(this._url, "POST", null, values)).done(function(serverResponse) {
            d.resolve(config().useLegacyStoreResult ? values : serverResponse || values, that.keyOf(serverResponse))
        }).fail(d.reject);
        return d.promise()
    },
    _updateImpl: function(key, values) {
        var d = new Deferred;
        when(this._sendRequest(this._byKeyUrl(key), this._updateMethod, null, values)).done(function(serverResponse) {
            if (config().useLegacyStoreResult) {
                d.resolve(key, values)
            } else {
                d.resolve(serverResponse || values, key)
            }
        }).fail(d.reject);
        return d.promise()
    },
    _removeImpl: function(key) {
        var d = new Deferred;
        when(this._sendRequest(this._byKeyUrl(key), "DELETE")).done(function() {
            d.resolve(key)
        }).fail(d.reject);
        return d.promise()
    },
    _convertKey: function(value) {
        var result = value;
        var fieldTypes = this._fieldTypes;
        var key = this.key() || this._legacyAnonymousKey;
        if (Array.isArray(key)) {
            result = {};
            for (var i = 0; i < key.length; i++) {
                var keyName = key[i];
                result[keyName] = odataUtils.convertPrimitiveValue(fieldTypes[keyName], value[keyName])
            }
        } else {
            if (fieldTypes[key]) {
                result = odataUtils.convertPrimitiveValue(fieldTypes[key], value)
            }
        }
        return result
    },
    _byKeyUrl: function(value, useOriginalHost) {
        var baseUrl = useOriginalHost ? proxyUrlFormatter.formatLocalUrl(this._url) : this._url;
        var convertedKey = this._convertKey(value);
        return baseUrl + "(" + encodeURIComponent(odataUtils.serializeKey(convertedKey, this._version)) + ")"
    }
}, "odata").include(mixins.SharedMethods);
module.exports = ODataStore;
module.exports.default = module.exports;
