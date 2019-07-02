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
        <div class="panel-heading">Asignaciones por Cuarto </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group row">

                        <div class="col-md-3">
                            <label for="lblBusqueda">Buscar Por Cuarto </label>
                        </div>
                        <div class="col-md-3">
                            <asp:DropDownList ID="ddListaCuartos" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddListaCuartos_SelectedIndexChanged"></asp:DropDownList>
                        </div>

                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group row">
                        <label for="lblNombres" class="col-md-5">Estudiantes Encontrados</label>
                        <div>
                            <label for="lblNombres" class="col-md-5">
                                <asp:DropDownList ID="ddlNombres" CssClass="form-control" runat="server"></asp:DropDownList></label>

                        </div>

                    </div>
                </div>
            </div>

        </div>


    </div>
    <div class="panel panel-primary">
        <div class="panel panel-heading">Lista de Roles de Aseo para el Cuarto ( )</div>
        <div class="panel-body">
            <div class="row" id="calendarioweb"></div>
        </div>
    </div>
  
 
    <script type="text/javascript">
        jQuery_382(document).ready(function () {

            jQuery_382('#calendarioweb').fullCalendar({
                header: {
                    left: 'today,prev,next',
                    center: 'title',
                    right: 'month, basicWeek, basicDay, agendaWeek, agendaDay'
                },
                dayClick: function (date, jsEvent, view) {

                    alert('Usted a seleccionado ' + date.format());
                    
                  
                    $('#modalDatos').modal();
                  
                }
                ,
                events: [{

                    
                    title: 'Aseo sala central',
                    descripcion: 'Se deve barrer y lampacear el Area de la Sala Central',
                    start: '2019-06-15'
                }, {
                    title: 'Aseo sala lateral',
                    start: '2019-06-15'
                }],
                eventClick: function (CalEvent, jsEvent, view) {
                    $('#tituloEvento').html(CalEvent.title);
                    $('#decripcionEvento').html(CalEvent.descripcion);
                    $('#modalDatos').modal();
                   
                }
            })
        });

    </script>


    <!-- Ventana modal para Guardar Nuevos eventos de aseo en Residencia -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  Launch demo modal
</button>

<!-- Modal -->
<div class="modal fade" id="modalDatos" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h2 class="modal-title" id="tituloEvento"> </h2>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <div id="decripcionEvento"></div>
      </div>
      <div class="modal-footer">
         <%-- <button type="button" class="btn btn-success" >Agregar</button>
          <button type="button" class="btn btn-secondary">Modificar</button>
          <button type="button" class="btn btn-danger">Borrar</button>
        <button type="button" class="btn btn-primary">Guardar</button>--%>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>
</asp:Content>
