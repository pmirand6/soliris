/**
 * DevExtreme (ui/diagram/ui.diagram.commands.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var _diagram_importer = require("./diagram_importer");
var _extend = require("../../core/utils/extend");
var _file_saver = require("../../exporter/file_saver");
var _type = require("../../core/utils/type");
var _window = require("../../core/utils/window");
var _message = require("../../localization/message");
var _message2 = _interopRequireDefault(_message);

function _interopRequireDefault(obj) {
    return obj && obj.__esModule ? obj : {
        "default": obj
    }
}
var SEPARATOR = {
    widget: "separator"
};
var CSS_CLASSES = {
    SMALL_SELECT: "dx-diagram-select-sm",
    BUTTON_SELECT: "dx-diagram-select-b",
    BUTTON_COLOR: "dx-diagram-color-b"
};
var DiagramCommands = {
    getAllToolbarCommands: function() {
        var _this = this;
        var _getDiagram = (0, _diagram_importer.getDiagram)(),
            DiagramCommand = _getDiagram.DiagramCommand;
        return this.toolbarCommands || (this.toolbarCommands = {
            separator: SEPARATOR,
            "export": {
                widget: "dxButton",
                icon: "export",
                text: _message2.default.format("dxDiagram-commandExport"),
                hint: _message2.default.format("dxDiagram-commandExport"),
                items: [{
                    command: DiagramCommand.ExportSvg,
                    text: _message2.default.format("dxDiagram-commandExportToSvg"),
                    getParameter: function(widget) {
                        return function(dataURI) {
                            return _this._exportTo(widget, dataURI, "SVG", "image/svg+xml")
                        }
                    }
                }, {
                    command: DiagramCommand.ExportPng,
                    text: _message2.default.format("dxDiagram-commandExportToPng"),
                    getParameter: function(widget) {
                        return function(dataURI) {
                            return _this._exportTo(widget, dataURI, "PNG", "image/png")
                        }
                    }
                }, {
                    command: DiagramCommand.ExportJpg,
                    text: _message2.default.format("dxDiagram-commandExportToJpg"),
                    getParameter: function(widget) {
                        return function(dataURI) {
                            return _this._exportTo(widget, dataURI, "JPEG", "image/jpeg")
                        }
                    }
                }]
            },
            undo: {
                command: DiagramCommand.Undo,
                hint: _message2.default.format("dxDiagram-commandUndo"),
                text: _message2.default.format("dxDiagram-commandUndo"),
                icon: "undo"
            },
            redo: {
                command: DiagramCommand.Redo,
                hint: _message2.default.format("dxDiagram-commandRedo"),
                text: _message2.default.format("dxDiagram-commandRedo"),
                icon: "redo"
            },
            cut: {
                command: DiagramCommand.Cut,
                hint: _message2.default.format("dxDiagram-commandCut"),
                text: _message2.default.format("dxDiagram-commandCut"),
                icon: "cut"
            },
            copy: {
                command: DiagramCommand.Copy,
                hint: _message2.default.format("dxDiagram-commandCopy"),
                text: _message2.default.format("dxDiagram-commandCopy"),
                icon: "copy"
            },
            paste: {
                command: DiagramCommand.PasteInPosition,
                hint: _message2.default.format("dxDiagram-commandPaste"),
                text: _message2.default.format("dxDiagram-commandPaste"),
                icon: "paste",
                getParameter: function(diagramContextMenu) {
                    return diagramContextMenu.clickPosition
                }
            },
            selectAll: {
                command: DiagramCommand.SelectAll,
                hint: _message2.default.format("dxDiagram-commandSelectAll"),
                text: _message2.default.format("dxDiagram-commandSelectAll"),
                icon: "dx-diagram-i-button-select-all dx-diagram-i"
            },
            "delete": {
                command: DiagramCommand.Delete,
                hint: _message2.default.format("dxDiagram-commandDelete"),
                text: _message2.default.format("dxDiagram-commandDelete"),
                icon: "remove"
            },
            fontName: {
                command: DiagramCommand.FontName,
                hint: _message2.default.format("dxDiagram-commandFontName"),
                widget: "dxSelectBox",
                items: ["Arial", "Arial Black", "Helvetica", "Times New Roman", "Courier New", "Courier", "Verdana", "Georgia", "Comic Sans MS", "Trebuchet MS"]
            },
            fontSize: {
                command: DiagramCommand.FontSize,
                hint: _message2.default.format("dxDiagram-commandFontSize"),
                widget: "dxSelectBox",
                items: ["8pt", "9pt", "10pt", "11pt", "12pt", "14pt", "16pt", "18pt", "20pt", "22pt", "24pt", "26pt", "28pt", "36pt", "48pt", "72pt"],
                cssClass: CSS_CLASSES.SMALL_SELECT
            },
            bold: {
                command: DiagramCommand.Bold,
                hint: _message2.default.format("dxDiagram-commandBold"),
                text: _message2.default.format("dxDiagram-commandBold"),
                icon: "bold"
            },
            italic: {
                command: DiagramCommand.Italic,
                hint: _message2.default.format("dxDiagram-commandItalic"),
                text: _message2.default.format("dxDiagram-commandItalic"),
                icon: "italic"
            },
            underline: {
                command: DiagramCommand.Underline,
                hint: _message2.default.format("dxDiagram-commandUnderline"),
                text: _message2.default.format("dxDiagram-commandUnderline"),
                icon: "underline"
            },
            fontColor: {
                command: DiagramCommand.FontColor,
                text: _message2.default.format("dxDiagram-commandTextColor"),
                hint: _message2.default.format("dxDiagram-commandTextColor"),
                widget: "dxColorBox",
                icon: "dx-icon dx-icon-color",
                cssClass: CSS_CLASSES.BUTTON_COLOR
            },
            lineColor: {
                command: DiagramCommand.StrokeColor,
                text: _message2.default.format("dxDiagram-commandLineColor"),
                hint: _message2.default.format("dxDiagram-commandLineColor"),
                widget: "dxColorBox",
                icon: "dx-icon dx-icon-background",
                cssClass: CSS_CLASSES.BUTTON_COLOR
            },
            fillColor: {
                command: DiagramCommand.FillColor,
                text: _message2.default.format("dxDiagram-commandFillColor"),
                hint: _message2.default.format("dxDiagram-commandFillColor"),
                widget: "dxColorBox",
                icon: "dx-diagram-i dx-diagram-i-button-fill",
                cssClass: CSS_CLASSES.BUTTON_COLOR
            },
            textAlignLeft: {
                command: DiagramCommand.TextLeftAlign,
                hint: _message2.default.format("dxDiagram-commandAlignLeft"),
                text: _message2.default.format("dxDiagram-commandAlignLeft"),
                icon: "alignleft"
            },
            textAlignCenter: {
                command: DiagramCommand.TextCenterAlign,
                hint: _message2.default.format("dxDiagram-commandAlignCenter"),
                text: _message2.default.format("dxDiagram-commandAlignCenter"),
                icon: "aligncenter"
            },
            textAlignRight: {
                command: DiagramCommand.TextRightAlign,
                hint: _message2.default.format("dxDiagram-commandAlignRight"),
                text: _message2.default.format("dxDiagram-commandAlignRight"),
                icon: "alignright"
            },
            lock: {
                command: DiagramCommand.Lock,
                hint: _message2.default.format("dxDiagram-commandLock"),
                text: _message2.default.format("dxDiagram-commandLock"),
                icon: "dx-diagram-i-button-lock dx-diagram-i"
            },
            unlock: {
                command: DiagramCommand.Unlock,
                hint: _message2.default.format("dxDiagram-commandUnlock"),
                text: _message2.default.format("dxDiagram-commandUnlock"),
                icon: "dx-diagram-i-button-unlock dx-diagram-i"
            },
            bringToFront: {
                command: DiagramCommand.BringToFront,
                hint: _message2.default.format("dxDiagram-commandBringToFront"),
                text: _message2.default.format("dxDiagram-commandBringToFront"),
                icon: "dx-diagram-i-button-bring-to-front dx-diagram-i"
            },
            sendToBack: {
                command: DiagramCommand.SendToBack,
                hint: _message2.default.format("dxDiagram-commandSendToBack"),
                text: _message2.default.format("dxDiagram-commandSendToBack"),
                icon: "dx-diagram-i-button-send-to-back dx-diagram-i"
            },
            insertShapeImage: {
                command: DiagramCommand.InsertShapeImage,
                text: _message2.default.format("dxDiagram-commandInsertShapeImage"),
                icon: "dx-diagram-i-button-image-insert dx-diagram-i"
            },
            editShapeImage: {
                command: DiagramCommand.EditShapeImage,
                text: _message2.default.format("dxDiagram-commandEditShapeImage"),
                icon: "dx-diagram-i-button-image-edit dx-diagram-i"
            },
            deleteShapeImage: {
                command: DiagramCommand.DeleteShapeImage,
                text: _message2.default.format("dxDiagram-commandDeleteShapeImage"),
                icon: "dx-diagram-i-button-image-delete dx-diagram-i"
            },
            connectorLineType: {
                command: DiagramCommand.ConnectorLineOption,
                widget: "dxSelectBox",
                hint: _message2.default.format("dxDiagram-commandConnectorLineType"),
                items: [{
                    value: 0,
                    icon: "dx-diagram-i-connector-straight dx-diagram-i",
                    hint: _message2.default.format("dxDiagram-commandConnectorLineStraight")
                }, {
                    value: 1,
                    icon: "dx-diagram-i-connector-orthogonal dx-diagram-i",
                    hint: _message2.default.format("dxDiagram-commandConnectorLineOrthogonal")
                }],
                displayExpr: "name",
                valueExpr: "value",
                cssClass: CSS_CLASSES.BUTTON_SELECT
            },
            connectorLineStart: {
                command: DiagramCommand.ConnectorStartLineEnding,
                widget: "dxSelectBox",
                items: [{
                    value: 0,
                    icon: "dx-diagram-i-connector-begin-none dx-diagram-i",
                    hint: _message2.default.format("dxDiagram-commandConnectorLineNone")
                }, {
                    value: 1,
                    icon: "dx-diagram-i-connector-begin-arrow dx-diagram-i",
                    hint: _message2.default.format("dxDiagram-commandConnectorLineArrow")
                }],
                displayExpr: "name",
                valueExpr: "value",
                hint: _message2.default.format("dxDiagram-commandConnectorLineStart"),
                cssClass: CSS_CLASSES.BUTTON_SELECT
            },
            connectorLineEnd: {
                command: DiagramCommand.ConnectorEndLineEnding,
                widget: "dxSelectBox",
                items: [{
                    value: 0,
                    icon: "dx-diagram-i-connector-begin-none dx-diagram-i",
                    hint: _message2.default.format("dxDiagram-commandConnectorLineNone")
                }, {
                    value: 1,
                    icon: "dx-diagram-i-connector-begin-arrow dx-diagram-i",
                    hint: _message2.default.format("dxDiagram-commandConnectorLineArrow")
                }],
                displayExpr: "name",
                valueExpr: "value",
                hint: _message2.default.format("dxDiagram-commandConnectorLineEnd"),
                cssClass: CSS_CLASSES.BUTTON_SELECT
            },
            autoLayout: {
                widget: "dxButton",
                text: _message2.default.format("dxDiagram-commandAutoLayout"),
                showText: "always",
                items: [{
                    text: _message2.default.format("dxDiagram-commandAutoLayoutTree"),
                    items: [{
                        command: DiagramCommand.AutoLayoutTreeVertical,
                        text: _message2.default.format("dxDiagram-commandAutoLayoutVertical")
                    }, {
                        command: DiagramCommand.AutoLayoutTreeHorizontal,
                        text: _message2.default.format("dxDiagram-commandAutoLayoutHorizontal")
                    }]
                }, {
                    text: _message2.default.format("dxDiagram-commandAutoLayoutLayered"),
                    items: [{
                        command: DiagramCommand.AutoLayoutLayeredVertical,
                        text: _message2.default.format("dxDiagram-commandAutoLayoutVertical")
                    }, {
                        command: DiagramCommand.AutoLayoutLayeredHorizontal,
                        text: _message2.default.format("dxDiagram-commandAutoLayoutHorizontal")
                    }]
                }]
            },
            fullScreen: {
                command: DiagramCommand.Fullscreen,
                hint: _message2.default.format("dxDiagram-commandFullscreen"),
                text: _message2.default.format("dxDiagram-commandFullscreen"),
                icon: "dx-diagram-i dx-diagram-i-button-fullscreen",
                cssClass: CSS_CLASSES.BUTTON_COLOR
            }
        })
    },
    getToolbarCommands: function(commandNames) {
        var commands = this.getAllToolbarCommands();
        if (commandNames) {
            return commandNames.map(function(cn) {
                return commands[cn]
            }).filter(function(c) {
                return c
            })
        }
        return [commands.export, commands.separator, commands.undo, commands.redo, commands.separator, commands.fontName, commands.fontSize, commands.separator, commands.bold, commands.italic, commands.underline, commands.separator, commands.fontColor, commands.lineColor, commands.fillColor, commands.separator, commands.textAlignLeft, commands.textAlignCenter, commands.textAlignRight, commands.separator, commands.connectorLineType, commands.connectorLineStart, commands.connectorLineEnd, commands.separator, commands.autoLayout, commands.separator, commands.fullScreen]
    },
    getAllPropertyPanelCommands: function() {
        var _getDiagram2 = (0, _diagram_importer.getDiagram)(),
            DiagramCommand = _getDiagram2.DiagramCommand;
        return this.propertyPanelCommands || (this.propertyPanelCommands = {
            units: {
                command: DiagramCommand.ViewUnits,
                text: _message2.default.format("dxDiagram-commandUnits"),
                widget: "dxSelectBox"
            },
            pageSize: {
                command: DiagramCommand.PageSize,
                text: _message2.default.format("dxDiagram-commandPageSize"),
                widget: "dxSelectBox",
                getValue: function(v) {
                    return JSON.parse(v)
                },
                setValue: function(v) {
                    return JSON.stringify(v)
                }
            },
            pageOrientation: {
                command: DiagramCommand.PageLandscape,
                text: _message2.default.format("dxDiagram-commandPageOrientation"),
                widget: "dxSelectBox",
                items: [{
                    value: true,
                    title: _message2.default.format("dxDiagram-commandPageOrientationLandscape")
                }, {
                    value: false,
                    title: _message2.default.format("dxDiagram-commandPageOrientationPortrait")
                }]
            },
            pageColor: {
                command: DiagramCommand.PageColor,
                text: _message2.default.format("dxDiagram-commandPageColor"),
                widget: "dxColorBox"
            },
            showGrid: {
                command: DiagramCommand.ShowGrid,
                text: _message2.default.format("dxDiagram-commandShowGrid"),
                widget: "dxCheckBox"
            },
            snapToGrid: {
                command: DiagramCommand.SnapToGrid,
                text: _message2.default.format("dxDiagram-commandSnapToGrid"),
                widget: "dxCheckBox"
            },
            gridSize: {
                command: DiagramCommand.GridSize,
                text: _message2.default.format("dxDiagram-commandGridSize"),
                widget: "dxSelectBox"
            },
            zoomLevel: {
                command: DiagramCommand.ZoomLevel,
                text: _message2.default.format("dxDiagram-commandZoomLevel"),
                widget: "dxSelectBox"
            },
            autoZoom: {
                command: DiagramCommand.ToggleAutoZoom,
                text: _message2.default.format("dxDiagram-commandAutoZoom"),
                widget: "dxCheckBox"
            },
            simpleView: {
                command: DiagramCommand.ToggleSimpleView,
                text: _message2.default.format("dxDiagram-commandSimpleView"),
                widget: "dxCheckBox"
            }
        })
    },
    getDefaultPropertyPanelCommandGroups: function() {
        return [{
            commands: ["units"]
        }, {
            commands: ["pageSize", "pageOrientation", "pageColor"]
        }, {
            commands: ["showGrid", "snapToGrid", "gridSize"]
        }, {
            commands: ["zoomLevel", "autoZoom", "simpleView"]
        }]
    },
    getPropertyPanelCommandsByGroups: function(groups) {
        var commands = DiagramCommands.getAllPropertyPanelCommands();
        var result = [];
        groups.forEach(function(g, gi) {
            g.commands.forEach(function(cn, ci) {
                result.push((0, _extend.extend)(commands[cn], {
                    beginGroup: gi > 0 && 0 === ci
                }))
            })
        });
        return result
    },
    getPropertyPanelCommands: function(commandGroups) {
        commandGroups = commandGroups || DiagramCommands.getDefaultPropertyPanelCommandGroups();
        return DiagramCommands.getPropertyPanelCommandsByGroups(commandGroups)
    },
    getAllContextMenuCommands: function() {
        var _getDiagram3 = (0, _diagram_importer.getDiagram)(),
            DiagramCommand = _getDiagram3.DiagramCommand;
        return this.contextMenuCommands || (this.contextMenuCommands = {
            separator: SEPARATOR,
            cut: {
                command: DiagramCommand.Cut,
                text: _message2.default.format("dxDiagram-commandCut"),
                icon: "cut"
            },
            copy: {
                command: DiagramCommand.Copy,
                text: _message2.default.format("dxDiagram-commandCopy"),
                icon: "copy"
            },
            paste: {
                command: DiagramCommand.PasteInPosition,
                text: _message2.default.format("dxDiagram-commandPaste"),
                getParameter: function(diagramContextMenu) {
                    return diagramContextMenu.clickPosition
                },
                icon: "paste"
            },
            selectAll: {
                command: DiagramCommand.SelectAll,
                text: _message2.default.format("dxDiagram-commandSelectAll"),
                icon: "dx-diagram-i-menu-select-all dx-diagram-i"
            },
            "delete": {
                command: DiagramCommand.Delete,
                text: _message2.default.format("dxDiagram-commandDelete"),
                icon: "remove"
            },
            bringToFront: {
                command: DiagramCommand.BringToFront,
                text: _message2.default.format("dxDiagram-commandBringToFront"),
                icon: "dx-diagram-i-menu-bring-to-front dx-diagram-i"
            },
            sendToBack: {
                command: DiagramCommand.SendToBack,
                text: _message2.default.format("dxDiagram-commandSendToBack"),
                icon: "dx-diagram-i-menu-send-to-back dx-diagram-i"
            },
            lock: {
                command: DiagramCommand.Lock,
                text: _message2.default.format("dxDiagram-commandLock"),
                icon: "dx-diagram-i-menu-lock dx-diagram-i"
            },
            unlock: {
                command: DiagramCommand.Unlock,
                text: _message2.default.format("dxDiagram-commandUnlock"),
                icon: "dx-diagram-i-menu-unlock dx-diagram-i"
            },
            insertShapeImage: {
                command: DiagramCommand.InsertShapeImage,
                text: _message2.default.format("dxDiagram-commandInsertShapeImage"),
                icon: "dx-diagram-i-menu-image-insert dx-diagram-i"
            },
            editShapeImage: {
                command: DiagramCommand.EditShapeImage,
                text: _message2.default.format("dxDiagram-commandEditShapeImage"),
                icon: "dx-diagram-i-menu-image-edit dx-diagram-i"
            },
            deleteShapeImage: {
                command: DiagramCommand.DeleteShapeImage,
                text: _message2.default.format("dxDiagram-commandDeleteShapeImage"),
                icon: "dx-diagram-i-menu-image-delete dx-diagram-i"
            }
        })
    },
    getContextMenuCommands: function(commandNames) {
        var commands = this.getAllContextMenuCommands();
        if (commandNames) {
            return commandNames.map(function(cn) {
                return commands[cn]
            }).filter(function(c) {
                return c
            })
        }
        return [commands.cut, commands.copy, commands.paste, commands.delete, commands.separator, commands.selectAll, commands.separator, commands.bringToFront, commands.sendToBack, commands.separator, commands.lock, commands.unlock, commands.separator, commands.insertShapeImage, commands.editShapeImage, commands.deleteShapeImage]
    },
    _exportTo: function(widget, dataURI, format, mimeString) {
        var window = (0, _window.getWindow)();
        if (window && window.atob && (0, _type.isFunction)(window.Blob)) {
            var blob = this._getBlobByDataURI(window, dataURI, mimeString);
            var options = widget.option("export");
            _file_saver.fileSaver.saveAs(options.fileName || "foo", format, blob, options.proxyURL)
        }
    },
    _getBlobByDataURI: function(window, dataURI, mimeString) {
        var byteString = window.atob(dataURI.split(",")[1]);
        var ia = new Uint8Array(byteString.length);
        for (var i = 0; i < byteString.length; i++) {
            ia[i] = byteString.charCodeAt(i)
        }
        return new window.Blob([ia.buffer], {
            type: mimeString
        })
    }
};
module.exports = DiagramCommands;
