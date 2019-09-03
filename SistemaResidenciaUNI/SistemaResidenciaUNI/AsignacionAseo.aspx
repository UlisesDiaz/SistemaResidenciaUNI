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
                                        <div class="col-md-1">
                                            <br />
                                        </div>
                                        <div class="col-md-5">
                                            <div class="form-group row">
                                                <label for="lblCuarto" class="col-sm-10 col-form-label">Seleccione Un Cuarto</label>
                                                <div class="col-sm-7">
                                                    <asp:DropDownList runat="server" AutoPostBack="True" ID="ddlCuarto" CssClass="form-control" OnSelectedIndexChanged="ddlCuarto_SelectedIndexChanged"></asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="form-group row">
                                                <label for="lblEstu" class="col-sm-8 col-form-label">Seleccione Un Estudiante</label>
                                                <div class="col-sm-7">
                                                    <asp:DropDownList runat="server" ID="ddlEstu" CssClass="form-control"></asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-1">
                                            <br />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-1">
                                            <br />
                                        </div>
                                        <div class="col-md-5">
                                            <div class="form-group row">
                                                <label for="lblTipoAseo" class="col-sm-8 col-form-label">Seleccione el Tipo de Aseo</label>
                                                <div class="col-sm-7">
                                                    <asp:DropDownList runat="server" ID="ddlTipoAseo" CssClass="form-control"></asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="form-group row">
                                                <label for="lblFrecuencia" class="col-sm-8 col-form-label">Seleccione la Frecuencia</label>
                                                <div class="col-sm-7">
                                                    <asp:DropDownList CssClass="form-control" runat="server" ID="ddlFrecuencia"></asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-1">
                                            <br />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-1">
                                            <br />
                                        </div>
                                        <div class="col-md-5">
                                            <div class="form-group row">
                                                <label class="col-sm-8 col-form-label" for="lblFechaIni">Fecha de inicio del Aseo</label>
                                                <div class="col-sm-7">
                                                    
                                                    <asp:TextBox ID="TxtFechaIni" runat="server" CssClass=" Limpiar Fecha form-control" ></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="form-group row">
                                                <label for="lblFechaFin" class="col-sm-8 col-form-label">Fecha de Finalizacion del Aseo</label>
                                                <div class="col-sm-7">
                                           
                                                    <asp:TextBox runat="server" CssClass=" Limpiar Fecha form-control" ID="TxtFechaFin"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-1">
                                            <br />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-1">
                                            <br />
                                        </div>
                                        <div class="col-md-5 ">
                                            <div class="form-group row">
                                                <label for="lblDia" class="col-sm-8 col-form-label">Ingrese el Dia</label>
                                            <div class="col-sm-7">
                                                
                                                    <asp:TextBox ID="TxtDia" runat="server" CssClass=" dia form-control"></asp:TextBox>
                                                    
                        
                                                
                                                
                                            </div>

                                            </div>
                                            
                                        </div>
                                        <div class="col-md-1">
                                            <br />
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
                                    <table id="DTCantidadAsignacion" cellpadding='10' class="table table-bordered table-hover table-responsive" style="width:100%; text-align:center;">

                                                        <thead>
                                                            <tr>
                                                                <th>Codigo</th>
                                                                <th>Carnet</th>
                                                                <th>Nombre y Apellido</th>
                                                                <th>Cantidad de Aseos Asignados</th>
                                                                <th>Correo Electronico</th>
                                                                <th>Notificar</th>
                                                                <th>Actualizar Correo</th>
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


    <%--*****************************MODAL PARA EDITAR ASEO*********************************--%>

       <div class="row">
           <br />
            <br />
            <div class="col-md-6 col-md-offset-3">
                    
        
            <div class="modal fade" id="ModificarCorre">
                <div class="modal-dialog">
                    <div class="modal-content ">
                        <div class="modal-header bg-light-blue">
                        <button type="button" class="close bg-red-active" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h2 class="modal-tittle">Modificar Aseo</h2>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-4">
                                    <br
                                        />
                                </div>
                                <div class="col-sm-5" >
                                    <div class="form-group row">
                                        <label for="lbltipo" class="col-sm-8 col-form-label text-center">Correo del Alumno a Modificar</label>
                                        <div class="col-sm-6">
                                            <asp:TextBox runat="server" ID="TxtCorreo" Enabled="false"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                             
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <br
                                        />
                                </div>
                                <div class="col-sm-5" >
                                    <div class="form-group row">
                                        <label for="lbltipo" class="col-sm-8 col-form-label text-center">Nueva Direccion de Correo</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox CssClass=" Limpiar form-control" runat="server" ID="TxtEditCorreo"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                             
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" id="btnsavesMail" class="btn btn-primary" data-dismiss="modal">Guardar Cambios</button>
                            <button type="button"  class="btn btn-primary" data-dismiss="modal">Cancelar</button>
                        </div>
                    
                    </div>
                </div>
            </div>
                    </div>
                </div>



    <script type="text/javascript">

        jQuery_382(document).ready(function () {

            $('.Fecha').mask('00/00/0000');
            $('.dia').mask('00');

            $('#form1').bootstrapValidator({
		       
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        excluded: ':disabled',
		        fields: {
		            <%=TxtFechaIni.UniqueID%>: {
		                message: 'Seleccione la Fecha de Inicio del Aseo',
		                validators: {
		                    notEmpty: {
		                        message: 'El Campo No puede Estar Vacio'
		                    },
                        
		                }
		            },
		            <%=TxtFechaFin.UniqueID%>: {
		                message: 'Seleccione La Fecha de Finalizacion',
		                validators: {
		                    notEmpty: {
		                        message: 'El Campo No puede Estar Vacio'}
		                }
		            },
                    <%=TxtDia.UniqueID%>: {
                        message: 'Seleccione el Dia',
                        validators: {
                            notEmpty: {
                                message: 'El Campo No puede Estar Vacio'
                            }
                        }
                    }
		        
                            
		           
		        } //findeField
		    });




            //

            $('#TxtDia').datepicker({
                format: "dd",
                language: 'es',
                locale: 'es-es'

            }).on('changeDate', function (ev) {
                $(this).datepicker('hide');
                
            });
        
            var getDate = function (input) {
                return new Date(input.date.valueOf());
            }

            $('#TxtFechaIni, #TxtFechaFin').datepicker({
                format: "dd/mm/yyyy",
                language: 'es',
                locale:'es-es'
               
            }).on('changeDate', function (ev) {
                $(this).datepicker('hide');
            });

            $('#TxtFechaIni').datepicker({
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
