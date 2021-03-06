/**
 * DevExtreme (bundles/modules/file_providers.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var _core = require("./core");
var _core2 = _interopRequireDefault(_core);
var _remote = require("../../ui/file_manager/file_provider/remote");
var _remote2 = _interopRequireDefault(_remote);
var _custom = require("../../ui/file_manager/file_provider/custom");
var _custom2 = _interopRequireDefault(_custom);

function _interopRequireDefault(obj) {
    return obj && obj.__esModule ? obj : {
        "default": obj
    }
}
module.exports = _core2.default.fileProviders = _core2.default.fileProviders || {};
_core2.default.fileProviders.Remote = _remote2.default;
_core2.default.fileProviders.Custom = _custom2.default;
