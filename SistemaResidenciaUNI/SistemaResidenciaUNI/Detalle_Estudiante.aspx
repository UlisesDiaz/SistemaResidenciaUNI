<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Detalle_Estudiante.aspx.cs" Inherits="SistemaResidenciaUNI.Detalle_Estudiante" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" ID="ScriptManagerDetalleEstudiante" EnablePartialRendering="true" AsyncPostBackTimeout="600" />
    <asp:UpdatePanel ID="UpdatePanelDetalleEstudiante" runat="server">
        <ContentTemplate>
            <div class="panel panel-primary">
                <div class="panel-heading">Infomacion General de Estudiante</div>
                <div class="panel-body">

                    <div class="row">
                        <table id="tblDetalle_Estudiante" class="table table-bordered table-condensed table-hover responsive">
                            <thead class="background-thead">
                                <tr>
                                    <th>Nombre Estudiante</th>
                                    <th> Cuarto</th>
                                    <th>carnet</th>
                                    <th>carrera</th>
                                    <th>Recinto</th>   
                                    <th>Telefono</th>
                                    <th>Compañia</th>
                                    <th>Departamento</th>
                                    <th>Municipio</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            
            <script type="text/javascript">

                jQuery_382(document).ready(function () {

                    LoadStudentBedRoom();

                    function LoadStudentBedRoom() {

                        jQuery.ajax({
                            type: "post",
                            url: 'Detalle_Estudiante.aspx/Detalle_Estudiantes',
                            contentType: "application/json; charset=utf-8",

                            dataType: "json",
                            success: function (result) {
                                if (!!result) {

                                    var dataj = JSON.parse(result.d);
                                    if (dataj.error != "") {
                                        alert('Error: ' + dataj.error);
                                    } else {
                                        console.log(result.d);
                                        $('#tblDetalle_Estudiante').DataTable({
                                            "scrollY": "200px",
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
                                    { data: "NOMBRE_COMPLETO" },
                                    { data: "Cuarto" },
                                    { data: "carnet" },
                                     { data: "carrera" },
                                    { data: "recinto" },
                                    { data: "telefono" },
                                    { data: "compania" },
                                    { data: "departamento"},
                                    { data: "municipio" },

                                  
                                    ],
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
                    }
                

                })
                

            </script>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
