/**
 * DevExtreme (exporter/pdf_creator.js)
 * Version: 19.2.7
 * Build date: Thu Mar 26 2020
 *
 * Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
 * Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
 */
"use strict";
var VERSION = require("../core/version");
var window = require("../core/utils/window").getWindow();
var imageCreator = require("./image_creator").imageCreator;
var isFunction = require("../core/utils/type").isFunction;
var extend = require("../core/utils/extend").extend;
var mainPageTemplate = "%PDF-1.3\r\n2 0 obj\r\n<</ProcSet[/PDF/ImageB/ImageC/ImageI]/XObject<</I0 5 0 R>>>>\r\nendobj\r\n4 0 obj\r\n<</Type/Pages/Kids[1 0 R]/Count 1>>\r\nendobj\r\n7 0 obj\r\n<</OpenAction[1 0 R /FitH null]/Type/Catalog/Pages 4 0 R/PageLayout/OneColumn>>\r\nendobj\r\n1 0 obj\r\n<</Type/Page/Resources 2 0 R/MediaBox[0 0 _width_ _height_]/Contents 3 0 R/Parent 4 0 R>>\r\nendobj\r\n";
var contentTemplate = "3 0 obj\r\n<</Length 52>>stream\r\n0.20 w\n0 G\nq _width_ 0 0 _height_ 0.00 0.00 cm /I0 Do Q\r\nendstream\r\nendobj\r\n";
var infoTemplate = "6 0 obj\r\n<</CreationDate _date_/Producer(DevExtreme _version_)>>\r\nendobj\r\n";
var imageStartTemplate = "5 0 obj\r\n<</Type/XObject/Subtype/Image/Width _width_/Height _height_/ColorSpace/DeviceRGB/BitsPerComponent 8/Filter/DCTDecode/Length _length_>>stream\r\n";
var imageEndTemplate = "\r\nendstream\r\nendobj\r\n";
var trailerTemplate = "trailer\r\n<<\r\n/Size 8\r\n/Root 7 0 R\r\n/Info 6 0 R\r\n>>\r\nstartxref\r\n_length_\r\n%%EOF";
var xrefTemplate = "xref\r\n0 8\r\n0000000000 65535 f\r\n0000000241 00000 n\r\n0000000010 00000 n\r\n_main_ 00000 n\r\n0000000089 00000 n\r\n_image_ 00000 n\r\n_info_ 00000 n\r\n0000000143 00000 n\r\n";
var pad = function pad(str, len) {
    return str.length < len ? pad("0" + str, len) : str
};
var composePdfString = function(imageString, options, curDate) {
    var margin = 2 * (options.margin || 0);
    var width = options.width + margin;
    var height = options.height + margin;
    var widthPt = (.75 * width).toFixed(2);
    var heightPt = (.75 * height).toFixed(2);
    var mainPage = mainPageTemplate.replace("_width_", widthPt).replace("_height_", heightPt);
    var content = contentTemplate.replace("_width_", widthPt).replace("_height_", heightPt);
    var info = infoTemplate.replace("_date_", curDate).replace("_version_", VERSION);
    var image = imageStartTemplate.replace("_width_", width).replace("_height_", height).replace("_length_", imageString.length) + imageString + imageEndTemplate;
    var xref = getXref(mainPage.length, content.length, info.length);
    var mainContent = mainPage + content + info + image;
    var trailer = trailerTemplate.replace("_length_", mainContent.length);
    return mainContent + xref + trailer
};
var getXref = function(mainPageLength, contentLength, infoLength) {
    return xrefTemplate.replace("_main_", pad(mainPageLength + "", 10)).replace("_info_", pad(mainPageLength + contentLength + "", 10)).replace("_image_", pad(mainPageLength + contentLength + infoLength + "", 10))
};
var getCurDate = function() {
    return new Date
};
var getBlob = function(binaryData) {
    var i = 0;
    var dataArray = new Uint8Array(binaryData.length);
    for (; i < binaryData.length; i++) {
        dataArray[i] = binaryData.charCodeAt(i)
    }
    return new window.Blob([dataArray.buffer], {
        type: "application/pdf"
    })
};
var getBase64 = function(binaryData) {
    return window.btoa(binaryData)
};
exports.getData = function(data, options) {
    return imageCreator.getImageData(data, extend({}, options, {
        format: "JPEG"
    })).then(function(imageString) {
        var binaryData = composePdfString(imageString, options, getCurDate());
        var pdfData = isFunction(window.Blob) ? getBlob(binaryData) : getBase64(binaryData);
        return pdfData
    })
};