/**
 * DevExtreme (viz/tree_map/tiling.slice_and_dice.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var tiling = require("./tiling");

function sliceAndDice(data) {
    var items = data.items;
    var sidesData = tiling.buildSidesData(data.rect, data.directions, data.isRotated ? 1 : 0);
    tiling.calculateRectangles(items, 0, data.rect, sidesData, {
        sum: data.sum,
        count: items.length,
        side: sidesData.variedSide
    })
}
tiling.addAlgorithm("sliceanddice", sliceAndDice);
module.exports = sliceAndDice;
