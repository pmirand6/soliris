/**
 * DevExtreme (data/odata/context.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var Class = require("../../core/class");
var extend = require("../../core/utils/extend").extend;
var typeUtils = require("../../core/utils/type");
var each = require("../../core/utils/iterator").each;
var errorsModule = require("../errors");
var ODataStore = require("./store");
var mixins = require("./mixins");
var deferredUtils = require("../../core/utils/deferred");
var when = deferredUtils.when;
var Deferred = deferredUtils.Deferred;
require("./query_adapter");
var ODataContext = Class.inherit({
    ctor: function(options) {
        var that = this;
        that._extractServiceOptions(options);
        that._errorHandler = options.errorHandler;
        each(options.entities || [], function(entityAlias, entityOptions) {
            that[entityAlias] = new ODataStore(extend({}, options, {
                url: that._url + "/" + encodeURIComponent(entityOptions.name || entityAlias)
            }, entityOptions))
        })
    },
    get: function(operationName, params) {
        return this.invoke(operationName, params, "GET")
    },
    invoke: function(operationName, params, httpMethod) {
        params = params || {};
        httpMethod = (httpMethod || "POST").toLowerCase();
        var d = new Deferred;
        var url = this._url + "/" + encodeURIComponent(operationName);
        var payload;
        if (4 === this.version()) {
            if ("get" === httpMethod) {
                url = mixins.formatFunctionInvocationUrl(url, mixins.escapeServiceOperationParams(params, this.version()));
                params = null
            } else {
                if ("post" === httpMethod) {
                    payload = params;
                    params = null
                }
            }
        }
        when(this._sendRequest(url, httpMethod, mixins.escapeServiceOperationParams(params, this.version()), payload)).done(function(r) {
            if (typeUtils.isPlainObject(r) && operationName in r) {
                r = r[operationName]
            }
            d.resolve(r)
        }).fail(this._errorHandler).fail(errorsModule._errorHandler).fail(d.reject);
        return d.promise()
    },
    objectLink: function(entityAlias, key) {
        var store = this[entityAlias];
        if (!store) {
            throw errorsModule.errors.Error("E4015", entityAlias)
        }
        if (!typeUtils.isDefined(key)) {
            return null
        }
        return {
            __metadata: {
                uri: store._byKeyUrl(key, true)
            }
        }
    }
}).include(mixins.SharedMethods);
module.exports = ODataContext;
module.exports.default = module.exports;
