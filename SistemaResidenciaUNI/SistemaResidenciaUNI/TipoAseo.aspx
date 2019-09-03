<%@ Page Title="" Language="C#" ClientIDMode="Static" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="TipoAseo.aspx.cs" Inherits="SistemaResidenciaUNI.TipoAseo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True">
    </asp:ScriptManager> 
        
                                    
                                    <div class="panel panel-primary">
                                                <div class="panel-heading">Agregar Nuevo Aseo</div>
                                                <div class="panel-body">
                                                    <div class="row">
                                                        <div class="col-md-6 col-md-offset-3">
                                                            <a href="#VentanaTipoAseo" class="btn btn-primary btn-lg btn-block" data-toggle="modal">Ingresar Nuevo Aseo</a>
                                                        </div>
                                                    </div>

                                                    <br />
                                                    <br />

                                                </div>

                                            </div>

                                   <%--                ------------COMIENZO DE DATATABLE----------------------------------%>

                                          <div class="panel panel-primary">
                                        <div class="panel panel-heading text-center">Lista Aseo</div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <%--<div class="col-md-1"><br /></div>
                                                <div class="col-md-10">--%>
                                                    <table id="DTListar" class="table table-bordered table-hover table-responsive" style="width:100%; text-align:center;">

                                                        <thead class="text-center">
                                                            <tr class=" text-center">
                                                                <th>Codigo</th>
                                                                <th>Descripcion</th>
                                                                <th>Estado</th>
                                                                <th>Acciones</th>
                                                            </tr>

                            

                                                        </thead>
                                                        <tbody id="tbody-Listar"></tbody>
                                                    </table>
                                               <%-- </div>--%>
                                                <%-- <div class="col-md-1"><br /></div>--%>
                                            </div>
            
                                        </div>
                                    </div> <%--fin panel datatable--%>
 
                                            
                              
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
                    
        
            <div class="modal fade" id="Ventana">
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
                                        <label for="lbltipo" class="col-sm-8 col-form-label text-center">Aseo Seleccionado</label>
                                        <div class="col-sm-6">
                                            <asp:TextBox runat="server" ID="TxtTipoAseo" Enabled="false"></asp:TextBox>
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
                                        <label for="lbltipo" class="col-sm-8 col-form-label text-center">Nueva Descripcion</label>
                                        <div class="col-sm-6">
                                            <asp:TextBox runat="server" ID="TxtEditAseo"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                             
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" id="btnsaveschange" class="btn btn-primary" data-dismiss="modal">Guardar Cambios</button>
                            <button type="button"  class="btn btn-primary" data-dismiss="modal">Cancelar</button>
                        </div>
                    
                    </div>
                </div>
            </div>
                    </div>
                </div>




    <!--MODAL NUEVOASEO-->

<div class="modal fade" id="VentanaTipoAseo" tabindex="-1" role="dialog"  aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
            </div>
           
            <div class="modal-body">
                <div class="form-group">
                <label for="nombre" class="col-form-label">Nuevo Tipo Aseo:</label>
                    <asp:TextBox ID="TxtNuevoAseo" runat="server" CssClass="form-control" placeholder="Nombre Del Aseo"></asp:TextBox>

                </div>
                                           
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light" data-dismiss="modal">Cancelar</button>
                <asp:Button  runat="server" CssClass="btn btn-primary" ID="BtnGuardar" Text="Guardar" OnClick="BtnGuardar_Click"/>
            </div>
           
        </div>
    </div>
</div>



     <%--*******MODAL ELIMINAR******--%>

    <div class="modal" id="MEliminar" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h5 class="modal-title">Eliminar</h5>
                </div>
                <div class="modal-body">
                    <p>¿Seguro que desea eliminar este rol de aseo?</p>
                </div>
                <div class="modal-footer">
                    
                        <button type="button"  class="btn bg-gray" data-dismiss="modal">Cancelar</button>
                        <button type="button" id="btneliminar" class="btn bg-red" data-dismiss="modal">Eliminar</button>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
