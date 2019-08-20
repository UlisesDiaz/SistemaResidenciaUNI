<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="InfoResidencia.aspx.cs" Inherits="SistemaResidenciaUNI.InfoResidencia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="aa" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="panel panel-primary bordeInfo" style="background: transparent">
                <div class="panel panel-heading">Universidad Nacional De Ingenieria    (Informacion de Residencia UNI)</div>
                <body>
                    <section class="content">

                        <!-- Small boxes (Stat box) -->
                        <div class="row">
                            <div class="col-lg-3 col-xs-6">
                                <!-- small box -->
                                <div class="small-box  bg-maroon EfectoColor" style="border-radius: 15px;">
                                    <div class="inner">
                                        <h3 id="cantiMujeres"></h3>
                                        <p>
                                            Muestra la Cantidad de Mujeres
                                            <br>
                                            Activas en Residencia
                                        </p>
                                    </div>
                                    <div class="icon">
                                        <i style="color: #FADBD8" class=" fa fa-female"></i>
                                    </div>
                                    <a href="#modalInfo" class="small-box-footer" style="border-radius: 15px">Mas info <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                            <!-- ./col -->
                            <div class="col-lg-3 col-xs-6">
                                <!-- small box -->
                                <div class="small-box bg-yellow  EfectoColor" style="border-radius: 15px;">
                                    <div class="inner">
                                        <h3 id="TotalActivos"></h3>
                                        <p>
                                            Muestra la Cantidad de Mujeres
                                            <br />
                                            y Varones Activos en Residencia
                                        </p>
                                    </div>

                                    <div class="icon">
                                        <i class="ion ion-stats-bars" style="color: #1E8449"></i>
                                    </div>
                                    <a href="#" class="small-box-footer" style="border-radius: 15px">Mas info <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                            <!-- ./col -->
                            <div class="col-lg-3 col-xs-6">
                                <!-- small box -->
                                <div class="small-box bg-blue EfectoColor" style="border-radius: 15px;">
                                    <div class="inner">
                                        <h3 id="chombres">44</h3>
                                        <p>
                                            Muestra la Cantidad de Hombres
                                            <br />
                                            Activos en Residencia
                                        </p>
                                    </div>
                                    <div class="icon">
                                        <i style="color: #CACFD2" class="fa fa-male"></i>
                                    </div>
                                    <a href="#" id="hom" class="small-box-footer" style="border-radius: 15px">Mas info <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                            <div class="col-lg-3 col-xs-6">
                                <!-- small box -->
                                <div class="small-box  bg-green EfectoColor" style="border-radius: 15px;">
                                    <div class="inner">
                                        <h3>98</h3>
                                        <p>
                                            Muestra  la Cantidad
                                            <br />
                                            Total Recidentes UNI
                                        </p>
                                    </div>
                                    <div class="icon">
                                        <i style="color: #D4EFDF" class="fa fa-users"></i>
                                    </div>
                                    <a href="#" class="small-box-footer" style="border-radius: 15px">Mas info <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                            <!-- ./col -->
                            <div class="col-lg-3 col-xs-6"></div>
                            <!-- small box -->


                            <!-- small box -->
                            <label id="mostrar"></label>
                        </div>
                        <div class="panel panel-primary">
                            <div class="panel-heading">Infomacion Estudiantes Recidensia</div>
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
                </body>
        </ContentTemplate>

    </asp:UpdatePanel>
    <style type="text/css">
        .EfectoColor :hover {
            color: black;
        }
    </style>

    <script type="text/javascript">

        jQuery_382(document).ready(function () {
            infoRecidenciAjax();
            DetalleEstudianteRecidencia();

        });

        
        function infoRecidenciAjax() {

            jQuery.ajax({
                type: "post",
                url: 'InfoResidencia.aspx/ResultadosInfoResidencia',
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({}),
                dataType: "json",
                success: function (result) {
                    var datosExtraidos = JSON.parse(result.d);

                    $("#cantiMujeres").text(datosExtraidos.data.TotalMujeres + " " + "Mujeres");

                    $("#chombres").text(datosExtraidos.data.TotalVarones + " " + "Varones");
                    $("#TotalActivos").text(datosExtraidos.data.TotalFinal + " " + "Activos");
                }
            });
        }

        function DetalleEstudianteRecidencia() {
            jQuery.ajax({
                type: "post",
                url: 'InfoResidencia.aspx/Detalle_Estudiantes',
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({}),
                dataType: "json",
                success: function (result) {
                
                    var js = JSON.parse(result.d);
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
                        "aaData": js.Data,
                        "columns": [
                                    { data: "NOMBRE_COMPLETO" },
                                    { data: "Cuarto" },
                                    { data: "carnet" },
                                    { data: "carrera" },
                                    { data: "recinto" },
                                    { data: "telefono" },
                                    { data: "compania" },
                                    { data: "departamento" },
                                    { data: "municipio" },
                                  ],
                        dom: 'Bfrtip',
                        buttons: ['excel', 'pdf', 'print'
                        ]
                    });

                }, error: function (er) {
                    alert(er);
                }
            });
        }
    </script>
</asp:Content>


