<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="PruebaDatatable.aspx.cs" Inherits="SistemaResidenciaUNI.PruebaDatatable" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True">
    </asp:ScriptManager>

    <div class="panel panel-primary">
        <div class="panel panel-heading">Lista Aseo</div>
        <div class="panel-body">
            <div class="row">
                <div class="col-md-10">
                    <table id="DTListar" class="table table-bordered table-hover row-border" >

                        <thead>
                            <tr>
                                <th>Codigo</th>
                                <th>Descripcion</th>
                                <th>Estado</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody id="tbody-Listar"></tbody>
                    </table>
                </div>
            </div>
            <div class="row">
                <br />
                <br />
                <div class="col-md-6 col-md-offset-3">
                    
        
        <div class="modal fade" id="Ventana">
            <div class="modal-dialog">
                <div class="modal-content ">
                    <div class="modal-header bg-light-blue">
                    <button type="button" class="close bg-red-active" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h2 class="modal-tittle">Nuevo Tipo de Aseo</h2>
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
        </div>
    </div>

    <div class="panel panel-primary">
        <div class="panel panel-heading">Lista Aseo</div>
        <div class="panel-body">
            <div class="row">
                <div class="col-md-10">
                    <table id="DTpruebas" class="table table-bordered table-hover row-border" >

                        <thead>
                            <tr>
                                <th>Primer Nombre</th>
                                <th>Segundo Nombre</th>
                                <th>Primer Apellido</th>
                                <th>Segundo Apellido</th>
                                  <th>Cuarto</th>
                                  <th>Carrera</th>

                            </tr>
                        </thead>
                        <tbody id="tbody-prueba"></tbody>
                    </table>
                </div>
            </div>
            <div class="row">
                <br />
                <br />
                <div class="col-md-6 col-md-offset-3">
     
                </div>
            </div>
        </div>
    </div>

   <script type="text/javascript">
       jQuery_382(document).ready(function () {
         
         
           var table = $("#DTpruebas").DataTable({
              

               language: {
                   "decimal": "",
                   "emptyTable": "No hay información",
                   "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
                   "infoEmpty": "Mostrando 0 to 0 of 0 Entradas",
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
                   ajax: {

                       method: "POST",
                       url: "PruebaDatatable.aspx/MostrarEstudianteGuardados",
                       contentType: "application/json; charset=utf-8",
                       dataType: "json",
                       data: function (d) {

                           return JSON.stringify(d);
                       },
                       dataSrc: "d.data"
                   },
                   columns: [

               { "data": "PER_PRIMER_NOMBRE" },
           { "data": "PER_SEGUNDO_NOMBRE" },
           { "data": "PER_PRIMER_APELLIDO" },
           { "data": "PER_SEGUNDO_APELLIDO" },
           { "data": "CUA_NUMERO" },
           { "data": "CAR_DESCRIPCION" },


                   ]

               });


           
       });
       
   </script>


</asp:Content>
