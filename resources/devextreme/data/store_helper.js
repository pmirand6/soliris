/**
 * DevExtreme (data/store_helper.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var grep = require("../core/utils/common").grep;
var extend = require("../core/utils/extend").extend;
var each = require("../core/utils/iterator").each;
var arrayQuery = require("./array_query");
var normalizeSortingInfo = require("./utils").normalizeSortingInfo;

function multiLevelGroup(query, groupInfo) {
    query = query.groupBy(groupInfo[0].selector);
    if (groupInfo.length > 1) {
        query = query.select(function(g) {
            return extend({}, g, {
                items: multiLevelGroup(arrayQuery(g.items), groupInfo.slice(1)).toArray()
            })
        })
    }
    return query
}

function arrangeSortingInfo(groupInfo, sortInfo) {
    var filteredGroup = [];
    each(groupInfo, function(_, group) {
        var collision = grep(sortInfo, function(sort) {
            return group.selector === sort.selector
        });
        if (collision.length < 1) {
            filteredGroup.push(group)
        }
    });
    return filteredGroup.concat(sortInfo)
}

function queryByOptions(query, options, isCountQuery) {
    options = options || {};
    var filter = options.filter;
    if (filter) {
        query = query.filter(filter)
    }
    if (isCountQuery) {
        return query
    }
    var sort = options.sort;
    var select = options.select;
    var group = options.group;
    var skip = options.skip;
    var take = options.take;
    if (group) {
        group = normalizeSortingInfo(group);
        group.keepInitialKeyOrder = !!options.group.keepInitialKeyOrder
    }
    if (sort || group) {
        sort = normalizeSortingInfo(sort || []);
        if (group && !group.keepInitialKeyOrder) {
            sort = arrangeSortingInfo(group, sort)
        }
        each(sort, function(index) {
            query = query[index ? "thenBy" : "sortBy"](this.selector, this.desc, this.compare)
        })
    }
    if (select) {
        query = query.select(select)
    }
    if (group) {
        query = multiLevelGroup(query, group)
    }
    if (take || skip) {
        query = query.slice(skip || 0, take)
    }
    return query
}
module.exports = {
    multiLevelGroup: multiLevelGroup,
    arrangeSortingInfo: arrangeSortingInfo,
    queryByOptions: queryByOptions
};
