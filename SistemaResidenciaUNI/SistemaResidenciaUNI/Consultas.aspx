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
                    $('#tableData tbody tr').empty();
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
                                for (var ind = 0; ind < dataj.length; ind++) {

                                    var row = '';
                                    row += '<tr>'
                                    row += '<td> ' + dataj[ind].NOMBRE + ' </td>'
                                    row += '<td> ' + dataj[ind].TIP_ASE_DESCRIPCION + ' </td>'

                                    if (dataj[ind].ROL_ASE_HORA == null)
                                        row += '<td>N/D</td>'
                                    else
                                        row += '<td> ' + dataj[ind].ROL_ASE_HORA + ' </td>'
                                    row += '<td> <input type="checkbox"></input> </td>'
                                    row += '<td> <textarea></textarea></td>'
                                    row += '</tr>'

                                    $('#tableData tbody').append(row);
                                }
                            }
                        }
                    });

                    $('#modalDatos').modal();
                }
            })
        });

    </script>
    <!-- Modal -->
    <div class="modal fade" id="modalDatos" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title alert alert-info " id="tituloEvento"></h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <table id="tableData" class="table table-hover table-bordered table-responsive table-striped">
                        <thead>
                            <tr>
                                <th>Nombre Estudiante</th>
                                <th>Tipo de Aseo</th>
                                <th>Hora de Aseo</th>
                                <th>Cumple?</th>
                                <th>Observaciones</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Aceptar</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
