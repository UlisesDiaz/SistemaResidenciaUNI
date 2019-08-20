<%@ Page Title="" Language="C#" ClientIDMode="Static" EnableEventValidation="false" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="AsignacionAseo.aspx.cs" Inherits="SistemaResidenciaUNI.AsignacionAseo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
    <asp:ScriptManager runat="server" ID="ScriptManager2" EnablePageMethods="True" EnablePartialRendering="true" AsyncPostBackTimeout="600" />



    <div class="container">
        <div class="row">
            <div class="col-md-1"><br /></div>
            <div class="col-md-10">
                <div role="tabpanel">
                    <ul class="nav nav-tabs nav-justified" role="tablist">
                        <li class="active" role="presentation"><a href="#AsignarAseo" aria-controls="AsignarAseo" data-toggle="tab" role="tab">Asignacion de Aseo</a></li>

                         <li  role="presentation"><a href="#ListarAsignacion" aria-controls="ListarAsignacion" data-toggle="tab" role="tab">Listado de Asignaciones</a></li>
                    </ul>
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="AsignarAseo">
                            <br />

                            <div class="panel panel-primary">
                                <div class="panel-heading"><h4>Asignaciones</h4></div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="lblCuarto" class="col-sm-10 col-form-label">Seleccione Un Cuarto</label>
                                                <div class="col-sm-7">
                                                    <asp:DropDownList runat="server" AutoPostBack="True" ID="ddlCuarto" CssClass="form-control" OnSelectedIndexChanged="ddlCuarto_SelectedIndexChanged"></asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="lblEstu" class="col-sm-8 col-form-label">Seleccione Un Estudiante</label>
                                                <div class="col-sm-7">
                                                    <asp:DropDownList runat="server" ID="ddlEstu" CssClass="form-control"></asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="lblTipoAseo" class="col-sm-8 col-form-label">Seleccione el Tipo de Aseo</label>
                                                <div class="col-sm-7">
                                                    <asp:DropDownList runat="server" ID="ddlTipoAseo" CssClass="form-control"></asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="lblFrecuencia" class="col-sm-8 col-form-label">Seleccione la Frecuencia</label>
                                                <div class="col-sm-7">
                                                    <asp:DropDownList CssClass="form-control" runat="server" ID="ddlFrecuencia"></asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label class="col-sm-8 col-form-label" for="lblFechaIni">Fecha de inicio del Aseo</label>
                                                <div class="col-sm-7">
                                                    <input type="text" runat="server"  id="TxtFechaIni" placeholder="Fecha de Inicio"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="lblFechaFin" class="col-sm-8 col-form-label">Fecha de Finalizacion del Aseo</label>
                                                <div class="col-sm-7">
                                                    <input type="text" runat="server"  id="TxtFechaFin" placeholder="Fecha Finalizacion"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 ">
                                            <div class="form-group row">
                                                <label for="lblDia" class="col-sm-8 col-form-label">Ingrese el Dia</label>
                                            <div class="col-sm-7">
                        
                                                <asp:TextBox ID="TxtDia" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>

                                            </div>
                                            
                                        </div>
                                    </div>
                                    <br />
                                    <br />
                                    <div class="row">
                                        <div class="col-md-6 col-md-offset-2">
                                            <div class="form-group row">
                                                <asp:Button runat="server" ID="BtnAsignar" CssClass="form-control btn btn-primary btn-lg" Text="Realizar Asignacion" OnClick="BtnAsignar_Click"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <%--Segunda Pestaña contenedora--%>

                        <div role="tabpanel" class="tab-pane" id="ListarAsignacion">
                            <br />
                            
                            <div class="panel panel-primary">
                                <div class="panel-heading">Listado de Asignaciones de Aseo</div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-4 col-offset-4">
                                            <div class="form-group row">
                                                <label for="lblCuarto" class="col-sm-10 col-form-label">Seleccione Un Cuarto</label>
                                                <div class="col-sm-7">
                                                    <asp:DropDownList ID="DdlCuartoEstu" CssClass="form-control" runat="server"></asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                    <br />
                                    <table id="DTCantidadAsignacion" class="table table-bordered table-hover table-responsive" style="width:100%;">

                                                        <thead class="text-center">
                                                            <tr class="text-center">
                                                                <th>Codigo</th>
                                                                <th>Carnet</th>
                                                                <th>Nombre y Apellido</th>
                                                                <th>Cantidad de Aseos Asignados</th>
                                                                <th>Correo Electronico</th>
                                                                <th>Notificar</th>
                                                            </tr>

                            

                                                        </thead>
                                                        <tbody id="tbody-Listar"></tbody>
                                                    </table>


                                </div>
                            </div>

                            <%--<asp:Button runat="server" ID="pruebabtn" CssClass="form-control btn btn-primary" Text="correo" OnClick="pruebabtn_Click"/>--%>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-md-1"><br /></div>
        </div>
    </div>

    <script type="text/javascript">

        jQuery_382(document).ready(function (){
        
            var getDate = function (input) {
                return new Date(input.date.valueOf());
            }

            $('#TxtDia, #TxtFechaFin').datepicker({
                format: "dd/mm/yyyy",
                language: 'es',
                locale:'es-es'
               
            });

            $('#TxtDia').datepicker({
                startDate: '+5d',
                endDate: '+35d',
            }).on('changeDate',
                function (selected) {
                    $('#TxtFechaFin').datepicker('setStartDate', getDate(selected));
                });

            $('#TxtFechaFin').datepicker({
                startDate: '+6d',
                endDate: '+36d',
            }).on('changeDate',
                function (selected) {
                    $('#TxtDia').datepicker('setEndDate', getDate(selected));
                });


            
        
        })

       
        

    </script>

</asp:Content>
