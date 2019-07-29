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
            });
        });

        function LoadStudentInfo() {
            var carnet = $('#txtNumCarnet').val();
            jQuery.ajax({
                type: "post",
                url: 'CambioCuarto.aspx/ajaxInfoEstudianteSegunCarnet',
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ numCarnet: carnet }),
                dataType: "json",
                success: function (result) {
                    console.log(result);
                    if (!!result) {

                        var dataj = JSON.parse(result.d);
                        if (dataj.error != "") {
                            alert(dataj.error);
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
                    alert(er);
                }
            });

        }

    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div class="panel panel-primary">
                <div class="panel-heading text-bold">Cambio de Cuarto para Estudiante</div>
                <div class="panel-body  ">
                    <div class="row  ">
                        <div class="col-md-6">
                            <div class="col-md-5">
                                <asp:Label runat="server" label="txtNumCarnet" Font-Bold="true"> Ingrese el Carnet del estudiante</asp:Label>
                            </div>
                            <div class="col-md-6">
                                <input type="text" id="txtNumCarnet" style="height: 28px; width: 200px" autocomplete="on" placeholder="Eje:( 2019-0019U )"> </input>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="col-md-10">
                                <input type="button" id="buscar" value="Buscar" class="btn btn-primary" style="width: 150px; height: 45px" />
                            </div>
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
                        </div>
                    </div>
                </div>
            </div>

            <div>
                <div class="panel panel-primary">
                    <div class="panel panel-heading">Historial Estudiante Cuarto</div>
                    <div class="panel panel-body">
                        <div class="row  ">
                            <%--   <div class="col-md-12">
                                <asp:GridView ID="gridEstudianteAmover" runat="server" AutoGenerateColumns="false" BackColor="#feffff" HeaderText="Carnet Estudiante"
                                    CssClass="table table-hover table-bordered table-responsive table-striped">

                                    <Columns>
                                        <asp:BoundField DataField="PER_PRIMER_NOMBRE" HeaderText="Primer Nombre" SortExpression="PER_PRIMER_NOMBRE" />
                                        <asp:BoundField DataField="PER_SEGUNDO_NOMBRE" HeaderText="Segundo Nombre" SortExpression="PER_SEGUNDO_NOMBRE" />
                                        <asp:BoundField DataField="PER_PRIMER_APELLIDO" HeaderText="Primer Apellido" SortExpression="PER_PRIMER_APELLIDO" />
                                        <asp:BoundField DataField="PER_SEGUNDO_APELLIDO" HeaderText="Segundo Apellido" SortExpression="PER_SEGUNDO_APELLIDO" />
                                        <asp:BoundField DataField="CAR_DESCRIPCION" HeaderText="Carrera" SortExpression="CAR_DESCRIPCION" />
                                        <asp:BoundField DataField="CUA_NUMERO" HeaderText="Cuarto Actual" SortExpression="CUA_NUMERO" />

                                    </Columns>
                            --%>
                            <%-- </asp:GridView>--%>

                            <table class="tab-content">

                                <tr>
                                    <th>Fecha Inicial</th>
                                    
                                    <th>Fecha Final</th>
                                    <th>Cuarto</th>
                                    <th>Estado del Cuarto</th>
                                    <th>Descripcion</th>

                                </tr>

                                <tr>

                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>

                                </tr>
                            </table>
                        </div>
                    </div>

                </div>

            </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

