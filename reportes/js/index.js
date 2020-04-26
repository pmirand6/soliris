$(function () {
  var url = aplicacion + "/reportes/php/service.php";
  var db = DevExpress.data.AspNet.createStore({
    key: "id",
    loadUrl: url,
    insertUrl: url,
    updateUrl: url,
    deleteUrl: url,
  });

  var pivotGridChart = $("#pivotgrid-chart")
    .dxChart({
      commonSeriesSettings: {
        type: "bar",
      },
      tooltip: {
        enabled: true,
        format: "currency",
        customizeTooltip: function (args) {
          return {
            html:
              args.seriesName +
              " | Total<div class='currency'>" +
              args.valueText +
              "</div>",
          };
        },
      },
      size: {
        height: 200,
      },
      adaptiveLayout: {
        width: 450,
      },
    })
    .dxChart("instance");

  var pivotGrid = $("#pivotgrid")
    .dxPivotGrid({
      allowSortingBySummary: true,
      allowFiltering: true,
      showBorders: true,
      showColumnGrandTotals: true,
      showRowGrandTotals: true,
      showRowTotals: true,
      showColumnTotals: true,
      export: {
        enabled: true,
        fileName: "reporte_360",
      },
      fieldChooser: {
        enabled: true,
        height: 400,
      },
      dataSource: {
        fields: [
          {
            caption: "Tipo Venta",
            width: 120,
            dataField: "tipo_venta",
            area: "row",
            sortBySummaryField: "Total",
          },
          {
            caption: "Paciente",
            dataField: "paciente",
            width: 150,
            area: "row",
            sortBySummaryField: "Total",
          },
          {
            caption: "Id Venta",
            dataField: "id",
            width: 150,
            area: "row",
            sortBySummaryField: "Total",
            selector: function (data) {
              return data.id + " (" + data.canal + ")";
            },
          },
          {
            caption: "Documentación",
            dataField: "doc_venta",
            width: 150,
            area: "row",
            selector: function (data) {
              let idPac = data.paciente_id;
              let idVenta = data.id;
              let campo = '<ul class="docs">';
              let dataDoc = data.doc_venta;
              if (dataDoc == null) {
                dataDoc = "Sin Documentación";
              }
              if (dataDoc.indexOf(",") > -1) {
                var string = dataDoc.split(",");
                campo = "";
                for (pos = 0; pos < string.length; pos++) {
                  campo += l_docs_icon(string[pos], idVenta, idPac);
                }
              } else {
                campo += l_docs_icon(dataDoc, idVenta);
              }
              return campo + "</ul>";
            },
          },
          {
            dataField: "fecha_venta",
            dataType: "date",
            area: "column",
          },
          {
            groupName: "fecha_venta", // esto era date
            groupInterval: "month",
            visible: false,
          },
          {
            caption: "Total",
            dataField: "unidades",
            dataType: "number",
            summaryType: "sum",
            //format: "currency",
            area: "data",
          },
        ],
        store: db,
      },
    })
    .dxPivotGrid("instance");
  pivotGrid.option("encodeHtml", false);

  pivotGrid.bindChart(pivotGridChart, {
    dataFieldsDisplayMode: "splitPanes",
    alternateDataFields: false,
  });

  function expand() {
    var dataSource = pivotGrid.getDataSource();
    dataSource.expandHeaderItem("row", ["RI"]);
    dataSource.expandHeaderItem("column", [2020]);
  }

  function l_docs_icon(value, idVenta = null, idPac = null) {
    if (value.indexOf("Sin Documentación") == -1) {
      var dir =
        aplicacion +
        "/documentacion/venta/" +
        idPac +
        "/" +
        idVenta +
        "/" +
        value;
      var campo = value.split(".");

      var t_titulo = campo[0].split("_");
      var titulo = t_titulo[0];

      var ext = campo[campo.length - 1];
      var extension = ext.toLowerCase();

      var icon = "TBL TBL-file_extension_" + extension;

      var ret =
        '<a href="' +
        dir +
        '" target="_blank"><li class="btn btn-default" style="cursor:pointer;" title="' +
        titulo +
        '"><span class="' +
        icon +
        '" style="cursor:pointer;")"></span></li>';

      return ret;
    }
  }

  setTimeout(expand, 0);
});
