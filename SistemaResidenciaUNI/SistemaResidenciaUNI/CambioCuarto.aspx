<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="CambioCuarto.aspx.cs" Inherits="SistemaResidenciaUNI.CambioCuarto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" ID="ScriptManager1" EnablePartialRendering="true" AsyncPostBackTimeout="600" />
    <asp:UpdateProgress runat="server">
        <ProgressTemplate>
            <div class="loading" style="width: 100%">
                <img src="../dist/img/loading.gif" alt="Cargando..." />
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>

    <script type="text/javascript">
        jQuery_382(document).ready(function () {
           
            jQuery_382('#buscar').on('click', function () {

         
                LoadStudentInfo();
                LoadStudentBedRoom();
            });
        });

        function CuartosDisponibles() {

            jQuery.ajax({
                type: "post",
                url: 'CambioCuarto.aspx/ajaxMustraCuartosDisponibles',
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ }),
                dataType: "json",
                success: function (result) {
                  
                   
                        var dataj = JSON.parse(result.d);
                        console.log(dataj.d);
                        //$('#DdlCuarDis').text(dataj.Data.CUA_NUMERO);
                    
                }, error: function (er) {
                    alert('Error: ' + er);
                }
            });


        }

       

        function LoadStudentInfo() {
            var carnet = $('#txtNumCarnet').val();
            jQuery.ajax({
                type: "post",
                url: 'CambioCuarto.aspx/ajaxInfoEstudianteSegunCarnet',
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ numCarnet: carnet }),
                dataType: "json",
                success: function (result) {
                    if (!!result) {
                        var dataj = JSON.parse(result.d);
                        if (dataj.error != "") {
                            alert('Error: ' + dataj.error);
                            $('#lblIdPer').text('');
                            $('#lblPrimerNombre').text('');
                            $('#lblSegundoNombre').text('');
                            $('#lblPrimerApellido').text('');
                            $('#lblSegundoApellido').text('');
                            $('#lblCarrera').text('');
                            $('#lblCuarto').text('');
                        } else {
                            $('#lblIdPer').text(dataj.Data.PER_ID);
                            $('#lblPrimerNombre').text(dataj.Data.PER_PRIMER_NOMBRE);
                            $('#lblSegundoNombre').text(dataj.Data.PER_SEGUNDO_NOMBRE);
                            $('#lblPrimerApellido').text(dataj.Data.PER_PRIMER_APELLIDO);
                            $('#lblSegundoApellido').text(dataj.Data.PER_SEGUNDO_APELLIDO);
                            $('#lblCarrera').text(dataj.Data.CAR_DESCRIPCION);
                            $('#lblCuarto').text(dataj.Data.CUA_NUMERO);
                        }
                    }
                }, error: function (er) {
                    alert('Error: ' + er);
                }
            });
        }
        //tabla Historial
        function LoadStudentBedRoom() {
            var carnet = $('#txtNumCarnet').val();
            jQuery.ajax({
                type: "post",
                url: 'CambioCuarto.aspx/ajaxHistorialCuaroEstudiante',
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ numCarnet: carnet }),
                dataType: "json",
                success: function (result) {
                    if (!!result) {

                        var dataj = JSON.parse(result.d);
                        if (dataj.error != "") {
                            alert('Error: ' + dataj.error);
                        } else {
                            $('#tblHistorialCuarto').DataTable({
                                "scrollY": "200px",
                                "createdRow": function (row, data, index) {
                                    if (data.HIS_EST_CUA_ESTADO == 'Activo') {
                                        $(row).addClass('activeRow');
                                    }
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
                                "aaData": dataj.Data,
                                "columns": [
                        { data: "HIS_EST_CUA_DESRIPCION" },
                        {
                            data: 'HIS_EST_CUA_FECHA_INICIAL', render: function (data, type, row) {
                                return data;
                            }
                        },
                        { data: "HIS_EST_CUA_FECHA_FINAL" },
                        {
                            data: "CUA_NUMERO", render: function (data, type, row) {

                                return data; }
                        },
                        {
                            data: 'HIS_EST_CUA_ESTADO', render: function (data, type, row) {
                                return data;
                            }
                        }],
                                dom: 'Bfrtip',
                                buttons: ['excel', 'pdf', 'print'
                                ]
                            });
                        }
                      
                    }

                }, error: function (er) {
                    alert(er);
                }
                 
            });
            $('.p').mask('0000-0000-S');
        }
        <%--fin Tabla Historial--%>


      
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
  
            <div class="panel panel-primary">
                <div class="panel-heading text-bold">Cambio de Cuarto para Estudiante</div>
                <div class="panel-body  ">
                    <div class="row  ">
                        <div class="col-md-6">
                            <div class="col-md-5">
                                <asp:Label runat="server"  label="txtNumCarnet" Font-Bold="true"> Ingrese el Carnet del estudiante</asp:Label>
                            </div>
                            <div class="col-md-6">
                                <input type="text" id="txtNumCarnet" style="text-transform:uppercase" class="form-control p" placeholder="Eje:( 2019-0019U )"> </input>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <input type="button" id="buscar" value="Buscar" class="btn btn-primary" />

                        </div>
                    </div>

                    <div class="row">
                        <br />
                        <div class="col-md-6">
                            <div class="form-group row">

                                <div class="col-sm-10">
                                    <asp:Label runat="server">Primer Nombre</asp:Label>
                                </div>

                            </div>

                            <div class="form-group row">

                                <div class="col-sm-10">
                                    <asp:Label runat="server">Segundo Nombre</asp:Label>
                                </div>

                            </div>

                            <div class="form-group row">

                                <div class="col-sm-10">
                                    <asp:Label runat="server">Primer Apellido</asp:Label>
                                </div>

                            </div>

                            <div class="form-group row">
                                <div class="col-sm-10">
                                    <asp:Label runat="server">Segundo Apellido</asp:Label>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-10">
                                    <asp:Label runat="server">Carrera</asp:Label>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-10">
                                    <asp:Label runat="server">Cuarto Actual</asp:Label>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-10">
                                    <asp:Label runat="server">Cuarto Disponible</asp:Label>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group row">

                                <div class="col-sm-10">
                                    <span id="lblPrimerNombre"></span>
                                    <span id="lblIdPer" class="hide"></span>
                                </div>
                            </div>
                            <div class="form-group row">

                                <div class="col-sm-10">
                                    <span id="lblSegundoNombre"></span>

                                </div>
                            </div>
                            <div class="form-group row">

                                <div class="col-sm-10">
                                    <span id="lblPrimerApellido"></span>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-10">
                                    <span id="lblSegundoApellido"></span>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-10">
                                    <span id="lblCarrera"></span>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-10">
                                    <span id="lblCuarto"></span>
                                </div>
                            </div>
                            <br />
                            <div class="form-group row">
                                <div class="col-sm-5">
                                    <select id="DdlCuarDis" runat="server" class="form-control"></select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                <div class="panel panel-primary">
                    <div class="panel panel-heading">Historial Estudiante Cuarto</div>
                    <div class="panel panel-body">
                        <div class="row">
                            <table id="tblHistorialCuarto" class="table table-bordered table-condensed table-hover responsive">
                                <thead class="background-thead">
                                    <tr>
                                        <th>Observación de Cambio de Cuarto</th>
                                        <th>Fecha Ingreso de Cuarto</th>
                                        <th>Fecha Salida de Cuarto</th>
                                        <th>Número de Cuarto</th>
                                        <th>Estado Detalle</th>
                                    </tr>
                                </thead>
                                <tbody>
                               </tbody>
                            </table>
                        </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

