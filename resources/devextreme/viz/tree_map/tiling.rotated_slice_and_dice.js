/**
 * DevExtreme (viz/tree_map/tiling.rotated_slice_and_dice.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var tiling = require("./tiling");
var sliceAndDiceAlgorithm = tiling.getAlgorithm("sliceanddice");

function rotatedSliceAndDice(data) {
    data.isRotated = !data.isRotated;
    return sliceAndDiceAlgorithm.call(this, data)
}
tiling.addAlgorithm("rotatedsliceanddice", rotatedSliceAndDice);
