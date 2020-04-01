<?php

require_once('../config/config.php');
include_once $_SERVER['DOCUMENT_ROOT'] . _SG;

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Historial de Ventas</title>

    <style>
        @import "../resources/CSS/bulma/css/bulma.css";
        @import "../resources/devextreme/dist/css/dx.common.css";
        @import "../resources/devextreme/dist/css/dx.light.css";
    </style>

    <?php
    include "../resources/Includes/BootstrapHTML5.php";
    include "../resources/Includes/devxtreme.php";
    ?>

</head>

<body>

    <div id="gridContainer"></div>
    <script src="../resources/JS/funciones.min.js"></script>
    <script>
        $(function() {

            var store = new DevExpress.data.CustomStore({
                key: "id",
                load: function(loadOptions) {
                    var deferred = $.Deferred();
                    $.get(aplicacion + '/ajax/ajx.historial_ventas.php', loadOptions).done(function(data) {
                        deferred.resolve(data, {totalCount: data.length });  
                    });
                    return deferred.promise();
                }
            });

            $("#gridContainer").dxDataGrid({
                dataSource: store,
                showBorders: true,
                remoteOperations: true,
                paging: {
                    pageSize: 12
                },
                pager: {
                    showPageSizeSelector: true,
                    allowedPageSizes: [8, 12, 20]
                },
                columns: [{
                    dataField: "idPac",
                    dataType: "number"
                }, {
                    dataField: "fnac",
                    dataType: "date"
                },]
            }).dxDataGrid("instance");
        });
    </script>

</body>

</html>