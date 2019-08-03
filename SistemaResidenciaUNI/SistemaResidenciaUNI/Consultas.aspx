<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Consultas.aspx.cs" Inherits="SistemaResidenciaUNI.Consultas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--PostBack--%>
    <asp:ScriptManager runat="server" ID="ScriptManager1" EnablePartialRendering="true" AsyncPostBackTimeout="600" />
    <asp:UpdateProgress runat="server">
        <ProgressTemplate>
            <div class="loading" style="width: 100%">
                <img src="../dist/img/loading.gif" alt="Cargando..." />
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>

    <div class="panel panel-primary">
        <div class="panel panel-heading">Calendario de Aseo</div>
        <div class="panel-body">
            <div class="row" id="calendarioweb"></div>
        </div>
    </div>
    <script type="text/javascript">
        jQuery_382(document).ready(function () {
            var groupColumn = 1;
            var table = '';
            jQuery_382('#calendarioweb').fullCalendar({
                timeZone: 'local',
                header: {
                    left: 'today,prev,next',
                    center: 'title',
                    right: 'month, basicWeek, basicDay, agendaWeek, agendaDay'
                },
                dayClick: function (date, jsEvent, view) {

                }
                ,
                events: function (start, end, timezone, callback) {

                    var obj = {};
                    obj.start = start.format();
                    obj.end = end.format();
                    jQuery.ajax({
                        type: "post",
                        url: 'Consultas.aspx/ObtenerEventos',
                        contentType: "application/json; charset=utf-8",
                        data: JSON.stringify(obj),
                        dataType: "json",
                        success: function (result) {
                            var events = [];
                            if (!!result) {
                                var dataj = JSON.parse(result.d);
                                for (var ind = 0; ind < dataj.length; ind++) {
                                    events.push({
                                        id: dataj[ind].id,
                                        title: dataj[ind].title,
                                        start: dataj[ind].start,
                                        end: dataj[ind].start
                                    });
                                }

                            }
                            callback(events);
                        }
                    });
                },
                eventClick: function (CalEvent, jsEvent, view) {

                    $('#tituloEvento').html(CalEvent.title);
                    var obj = {};
                    obj.cuaNum = CalEvent.id;
                    obj.start = CalEvent.start.format();
                    jQuery.ajax({
                        type: "post",
                        url: 'Consultas.aspx/ObtenerDetalleAseoSegunEvento',
                        contentType: "application/json; charset=utf-8",
                        data: JSON.stringify(obj),
                        dataType: "json",
                        success: function (result) {
                            if (!!result) {
                                var dataj = JSON.parse(result.d);

                                table = jQuery('#tableData').DataTable({
                                    "scrollY": "400px",
                                    "createdRow": function (row, data, index) {

                                    },
                                    "order": [[groupColumn, 'asc, desc']],
                                    "columnDefs": [
                                   { "visible": false, "targets": groupColumn }
                                    ], "drawCallback": function (settings) {
                                        var api = this.api();
                                        var rows = api.rows({ page: 'current' }).nodes();
                                        var last = null;

                                        api.column(groupColumn, { page: 'current' }).data().each(function (group, i) {
                                            if (last !== group) {
                                                $(rows).eq(i).before(
                                                    '<tr class="group alert alert-success"><td colspan="5">' + group + '</td></tr>'
                                                );
                                                last = group;
                                            }
                                        });
                                    },
                                    language: {
                                        "decimal": "",
                                        "emptyTable": "No hay información",
                                        "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
                                        "infoEmpty": "Mostrando 0 de 0 de 0 Entradas",
                                        "infoFiltered": "(Filtrado de _MAX_ total entradas)",
                                        "infoPostFix": "",
                                        "thousands": ",",
                                        "lengthMenu": "Mostrar _MENU_ Entradas",
                                        "loadingRecords": "Cargando...",
                                        "processing": "Procesando...",
                                        "search": "Buscar:",
                                        "zeroRecords": "Sin resultados encontrados",
                                        "paginate": {
                                            "first": "Primero",
                                            "last": "Ultimo",
                                            "next": "Siguiente",
                                            "previous": "Anterior"
                                        }
                                    },
                                    destroy: true,
                                    responsive: true,
                                    "aaData": dataj,
                                    "columns": [
                            { data: "NOMBRE" },
                            { data: 'TIP_ASE_DESCRIPCION' },
                            { data: "ROL_ASE_HORA" }, ],
                                    dom: 'Bfrtip',
                                    buttons: ['excel', 'pdf', 'print']
                                });


                            }
                        }
                    });

                    window.location.href ='#modalDatos';
                }
            })
            // Order by the grouping
            $('#tableData tbody').on('click', 'tr.group', function () {
                var currentOrder = table.order()[0];
                if (currentOrder[0] === groupColumn && currentOrder[1] === 'asc') {
                    table.order([groupColumn, 'desc']).draw();
                }
                else {
                    table.order([groupColumn, 'asc']).draw();
                }
            });
        });

    </script>
    <!-- Modal -->

    <div id="modalDatos" class="modalDialog">
        <div>
            <a href="#close" title="Close" class="close">X</a>
            <h2 id="tituloEvento"></h2>
            <table id="tableData" class="table table-bordered table-condensed responsive">
                <thead class="background-thead">
                    <tr>
                        <th>Nombre Estudiante</th>
                        <th>Tipo de Aseo</th>
                        <th>Hora de Aseo</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>

</asp:Content>
