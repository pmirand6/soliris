/**
 * DevExtreme (ui/diagram/ui.diagram.toolbox.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var _message = require("../../localization/message");
var _message2 = _interopRequireDefault(_message);

function _interopRequireDefault(obj) {
    return obj && obj.__esModule ? obj : {
        "default": obj
    }
}
var DiagramToolbox = {
    groups: {
        general: {
            category: "general",
            title: _message2.default.format("dxDiagram-categoryGeneral")
        },
        flowchart: {
            category: "flowchart",
            title: _message2.default.format("dxDiagram-categoryFlowchart")
        },
        orgChart: {
            category: "orgChart",
            title: _message2.default.format("dxDiagram-categoryOrgChart")
        },
        containers: {
            category: "containers",
            title: _message2.default.format("dxDiagram-categoryContainers")
        },
        custom: {
            category: "custom",
            title: _message2.default.format("dxDiagram-categoryCustom")
        }
    },
    getGroups: function(groups) {
        var defaultGroups = this.groups;
        if (groups) {
            return groups.map(function(g) {
                if ("string" === typeof g) {
                    return {
                        category: g,
                        title: defaultGroups[g] && defaultGroups[g].title || g
                    }
                }
                return g
            }).filter(function(g) {
                return g
            })
        }
        return [defaultGroups.general, defaultGroups.flowchart, defaultGroups.orgChart, defaultGroups.containers]
    }
};
module.exports = DiagramToolbox;
