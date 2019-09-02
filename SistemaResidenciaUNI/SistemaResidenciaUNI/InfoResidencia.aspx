<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="InfoResidencia.aspx.cs" Inherits="SistemaResidenciaUNI.InfoResidencia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="panel panel-primary bordeInfo" style="background: transparent">
        <div class="panel panel-heading">Universidad Nacional De Ingenieria    (Informacion de Residencia UNI)</div>

        <!-- Small boxes (Stat box) -->
        <div class="row" style="margin-left: 2px; margin-right: 2px">
            <div class="col-lg-3 col-xs-6">
                <!-- small box -->
                <div class="small-box  bg-maroon EfectoColor" style="border-radius: 15px;">
                    <div class="inner">
                        <h3 id="cantiMujeres">Cargando...</h3>
                        <p>
                            Muestra la Cantidad de Mujeres
                                            <br>
                            Activas en Residencia
                        </p>
                    </div>
                    <div class="icon">
                        <i style="color: #FADBD8" class=" fa fa-female"></i>
                    </div>
                    <a onclick="DetalleEstudianteModal(this)" id="InfoMujeres" val="Femenino" text="Detalle de Estudiantes Mujeres Activas" class="small-box-footer" style="border-radius: 15px">Mas info <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-3 col-xs-6">
                <!-- small box -->
                <div class="small-box bg-yellow  EfectoColor" style="border-radius: 15px;">
                    <div class="inner">
                        <h3 id="TotalActivos">Cargando...</h3>
                        <p>
                            Muestra la Cantidad de Mujeres
                                            <br />
                            y Varones Activos en Residencia
                        </p>
                    </div>

                    <div class="icon">
                        <i class="fa fa-bar-chart" style="color: #1E8449"></i>
                    </div>
                    <a href="#menAndWoman" class="small-box-footer" id="precionar" style="border-radius: 15px">Mas info <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-3 col-xs-6">
                <!-- small box -->
                <div class="small-box bg-blue EfectoColor" style="border-radius: 15px;">
                    <div class="inner">
                        <h3 id="chombres">Cargando...</h3>
                        <p>
                            Muestra la Cantidad de Hombres
                                            <br />
                            Activos en Residencia
                        </p>
                    </div>
                    <div class="icon">
                        <i style="color: #CACFD2" class="fa fa-male"></i>
                    </div>
                    <a onclick="DetalleEstudianteModal(this)" id="hom" val="Masculino" text="Detalle de Estudiantes Varones Activos" class="small-box-footer" style="border-radius: 15px">Mas info <i class="fa fa-arrow-circle-right"></i></a>
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
                            Total Residentes UNI
                        </p>
                    </div>
                    <div class="icon">
                        <i style="color: #D4EFDF" class="fa fa-users"></i>
                    </div>
                    <a href="#" class="small-box-footer" style="border-radius: 15px">Mas info <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
            <!-- ./col -->
        </div>

    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">Infomacion Estudiantes Recidensia</div>
        <div class="panel-body">

            <div class="row">
                <table id="tblDetalle_Estudiante" class="table table-bordered table-condensed table-hover responsive">
                    <thead class="background-thead">
                        <tr>
                            <th>Nombre Estudiante</th>
                            <th>Cuarto</th>
                            <th>Carnet</th>
                            <th>Carrera</th>
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
    <style type="text/css">
        .EfectoColor :hover {
            color: black;
        }


        .closedRed {
            color: red;
            background-color: red;
        }
    </style>

    <script type="text/javascript">

        jQuery_382(document).ready(function () {
            var tblInfoEstudiante = null;

            infoRecidenciAjax();
            DetalleEstudianteRecidencia();
            $(document).on('submit', 'form', function (e) { e.preventDefault(); });
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
                    $("#TotalActivos").text(datosExtraidos.data.TotalFinalVaronesYmujeres + " " + "Activos");

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

        function DetalleEstudianteModal(ctr) {
            debugger;
            jQuery.ajax({
                type: "post",
                url: 'InfoResidencia.aspx/ModalInfo',
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ Genero: $('#' + ctr.id).attr('val') }),
                dataType: "json",
                success: function (result) {

                    var js = JSON.parse(result.d);
                    tblInfoEstudiante = $('#tblInfoModal').DataTable({
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
                                    { data: "PER_PRIMER_NOMBRE" },
                                    { data: "EST_CARNET" },
                                    { data: "CUA_NUMERO" },
                                    { "defaultContent": "<button class='form btn btn-primary btn-xs'>Reportar</button>" }
                        ],
                        dom: 'Bfrtip',
                        buttons: [[
    {
        extend: 'excel',
        defaultContent: '',
        title: $('#' + ctr.id).attr('text'),
        text: 'Excel',
        exportOptions: {
            columns: ':visible',
            format: {
                body: function (data, column, row) {
                    debugger;
                    row === 3 ? data = '' : data;

                    return data;
                },
                header: function (data, column, row) {
                    debugger;
                    data === 'Operaciones' ? data = '' : data;

                    return data;
                }
            }
        }
    }
                        ], 'pdf', 'print'
                        ]
                    });
                    $('#titulomodal').text($('#' + ctr.id).attr('text'))
                    window.location.href = '#Ventana';
                    $('#tblInfoModal tbody').on('click', 'button.form', function () {
                        var data_form = tblInfoEstudiante.row($(this).parents("tr")).data();
                        alert(data_form.PER_PRIMER_NOMBRE);
                    });
                }, error: function (er) {
                    alert(er);
                }

            });
        }
    </script>

    <!-- Modal -->
    <div id="Ventana" class="modalDialog">
        <div>
            <a href="#close" title="Close" class="close">X</a>
            <h2 id="titulomodal"></h2>
            <table id="tblInfoModal" class="table table-bordered table-condensed table-hover responsive">
                <thead class="background-thead">
                    <tr>
                        <th>Nombre Completo</th>
                        <th>Carné</th>
                        <th>Numero Cuarto</th>
                        <th>Operaciones</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>

</asp:Content>


