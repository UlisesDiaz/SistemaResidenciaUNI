<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Estudiante.aspx.cs" Inherits="SistemaResidenciaUNI.Estudiante.Estudiante" %>

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
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="panel panel-primary">
                <div class="panel-heading">Información Estudiante (Nuevo Residente )</div>
                <div class="panel-body">

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group row">
                                <label for="lblperFoto" class="col-sm-6 col-form-label">Foto</label>
                                <div class="col-sm-10">
                                    <img src="../dist/img/grupo.jpg" class="img-responsive img-thumbnail" alt="Foto Est" style="width: 180px; height: auto;">
                                    <asp:FileUpload ID="FilUpImagen" runat="server" onchange="OnChangeUpload(this);" />

                                </div>
                            </div>

                        </div>
                        <div class="col-md-6">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group row">
                                <label for="lblTipId" class="col-sm-6 col-form-label">Tipo de Identificación</label>
                                <div class="col-sm-10">
                                    <asp:DropDownList ID="ddlTipId" CssClass="form-control" runat="server"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group row">
                                <label for="lblCarrera" class="col-sm-6 col-form-label">(*)Carrera</label>
                                <div class="col-sm-10">
                                    <asp:DropDownList ID="ddCarId" CssClass="form-control" runat="server"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">

                        <div class="col-md-6">
                            <div class="form-group row">
                                <label for="lblGenId" class="col-sm-6 col-form-label">Género</label>
                                <div class="col-sm-10">
                                    <asp:DropDownList ID="ddlGenId" CssClass="form-control" runat="server"></asp:DropDownList>
                                </div>
                            </div>

                        </div>
                        <div class="col-md-6">
                            <div class="form-group row">
                                <label for="lblperCedula" class="col-sm-6 col-form-label">Identificación</label>
                                <div class="col-sm-10">
                                    <asp:TextBox runat="server" ID="txtPerCedula" CssClass="form-control" placeholder="Ingrese Identificación  del Estudiante" />
                                    <asp:RequiredFieldValidator ControlToValidate="txtPerCedula" runat="server" CssClass="text-danger" ErrorMessage="El Campo Identificación deve ser llenado "></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group row">
                                <label for="lblperPrimerNombre" class="col-sm-6 col-form-label">Primer Nombre del Estudiante</label>
                                <div class="col-sm-10">
                                    <asp:TextBox runat="server" ID="txtPerPrimerNombre" CssClass="form-control" placeholder="Primer Nombre del Estudiante" />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPerSegundoNombre" ErrorMessage="Deve Ingresar letras" ValidationExpression="[A-Za-z]*"></asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPerPrimerNombre"
                                        CssClass="text-danger" ErrorMessage="El campo Primer Nombre del Estudiante es requerido." />
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group row">
                                <label for="lblperSegundoNombre" class="col-sm-6 col-form-label">Segundo Nombre del Estudiante</label>
                                <div class="col-sm-10">
                                    <asp:TextBox runat="server" ID="txtPerSegundoNombre" CssClass="form-control" placeholder="Segundo Nombre del Estudiante" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPerSegundoNombre"
                                        CssClass="text-danger" ErrorMessage="El campo Segundo Nombre del Estudiante es requerido." />
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group row">
                                <label for="lblPerPrimerApellido" class="col-sm-6 col-form-label">Primer Apellido</label>
                                <div class="col-sm-10">
                                    <asp:TextBox runat="server" ID="txtPerPrimerApellido" CssClass="form-control" placeholder="Primer Apellido del Estudiante" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPerPrimerApellido"
                                        CssClass="text-danger" ErrorMessage="El campo Primer Apellido del Estudiante es requerido." />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">

                            <div class="form-group row">
                                <label for="lblPerSegundoApellido" class="col-sm-6 col-form-label">Segundo Apellido</label>
                                <div class="col-sm-10">
                                    <asp:TextBox runat="server" ID="txtPerSegundoApellido" CssClass="form-control" placeholder="Segundo Apellido del Estudiante" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPerSegundoApellido"
                                        CssClass="text-danger" ErrorMessage="El campo Segundo Apellido del Estudiante es requerido." />
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group row">
                                <label for="lblPerFechaNacimiento" class="col-sm-6 col-form-label">Fecha de Nacimiento del Estudiante</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="txtPerFechaNacimiento" runat="server" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask />
                                </div>
                                <!-- /.input group -->
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group row">
                                <label for="ddlNumeroCuarto" class="col-sm-6 col-form-label">Lista de Cuarto Disponibles</label>
                                <div class="col-sm-10">
                                    <asp:DropDownList ID="ddlNumeroCuarto" CssClass="form-control" runat="server"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group row">
                                <label for="txtEstCarnet" class="col-sm-6 col-form-label">Número de Carnet</label>
                                <div class="col-sm-10">
                                    <asp:TextBox runat="server" ID="txtEstCarnet" CssClass="form-control" placeholder="Ingrese carnet" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEstCarnet"
                                        CssClass="text-danger" ErrorMessage="El campo Número de Carnet es requerido." />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                        </div>
                    </div>


            

                </div>
            </div>




            <div class="panel panel-primary">
                <div class="panel-heading">Informacìon de Contacto</div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group row">
                                <label for="lblTelNumero" class="col-sm-6 col-form-label">Número Telefónico</label>
                                <div class="col-sm-10">

                                    <asp:TextBox runat="server" ID="txtTelNumero" CssClass="form-control" TextMode="Phone" placeholder="Número Telefónico" />
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group row">
                                <label for="lblCorDefinicion" class="col-sm-6 col-form-label">Correo</label>
                                <div class="col-sm-10">
                                    <asp:TextBox runat="server" ID="TextCorDefinicion" CssClass="form-control" TextMode="Email" placeholder="Correo Electrónico" />
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group row">
                                <label for="lblcompDescripcion" class="col-sm-6 col-form-label">Compañía Descripción</label>
                                <div class="col-sm-10">
                                    <asp:DropDownList ID="ddlcompDescripcion" CssClass="form-control" runat="server"></asp:DropDownList>
                                </div>
                            </div>
                        </div>



                    </div>

                </div>


            </div>



            <div class="panel panel-primary">
                <div class="panel-heading">Dirección(Nuevo)</div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group row">
                                <label for="lblDepartamento" class="col-sm-6 col-form-label">(*)Departamento</label>
                                <div class="col-sm-10">
                                    <asp:DropDownList ID="dllDepNombre" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="dllDepNombre_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group row">
                                <label for="lblMunicipio" class="col-sm-6 col-form-label">(*)Municipio</label>
                                <div class="col-sm-10">
                                    <asp:DropDownList ID="ddlMunicipio" CssClass="form-control" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlMunicipio_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group row">
                                <label for="lblBarrio" class="col-sm-6 col-form-label">(*)Barrio</label>
                                <div class="col-sm-10">
                                    <asp:DropDownList ID="ddlBarrio" CssClass="form-control" runat="server"></asp:DropDownList>
                                </div>
                            </div>

                        </div>
                        <div class="col-lg-6">
                            <div class="form-group row">
                                <label for="lblNumeroCasa" class="col-sm-6 col-from-label">Número Casa </label>
                                <div class="col-sm-10">
                                    <asp:TextBox runat="server" ID="txtNumCasa" CssClass="form-control" placeholder="Numero de Casa" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group row">
                                <label for="lblDireccion" class="col-sm-6 col-from-label">Dirección</label>
                                <div class="col-sm-10">
                                    <textarea id="txtDireccion" class="form-control" runat="server" placeholder="Descripción..."> </textarea>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                        </div>
                    </div>
                </div>

            </div>
            <div class="panel panel-primary">
                <div class="panel-heading">Listado de Estudiantes</div>
                <div class="panel-body">
                    <div class="row">
                        <asp:GridView ID="gvListaEstudiante"  runat="server" Width="95%" AutoGenerateColumns="False" CssClass="table table-hover table-bordered table-responsive table-striped">
                            <Columns>
                                <asp:BoundField DataField="EST_CARNET" HeaderText="Carnet Estudiante" SortExpression="EST_CARNET" />
                                <asp:BoundField DataField="PER_IDENTIFICACION" HeaderText="Identificación" SortExpression="PER_IDENTIFICACION" />
                                <asp:BoundField DataField="NOMBRE_COMPLETO" HeaderText="Nombre Estudiante" SortExpression="NOMBRE_COMPLETO" />
                                <asp:BoundField DataField="GEN_DESCRIPCION" HeaderText="Género" SortExpression="GEN_DESCRIPCION" />
                                <asp:BoundField DataField="EST_FECHA_INICIAL" HeaderText="Fecha de Inicio" SortExpression="EST_FECHA_INICIAL" />
                                <asp:BoundField DataField="COR_DEFINICION" HeaderText="Correo Estudiante" SortExpression="COR_DEFINICION" />
                                <asp:BoundField DataField="DIR_DESCRIPCION" HeaderText="Dirección Estudiante" SortExpression="PER_PRIMER_NOMBRE" />

                            </Columns>
                        </asp:GridView>

                    </div>
                </div>
            </div>
            <div class="panel panel-primary">
                <div class="panel-heading">Operaciones</div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <asp:Button runat="server" OnClick="GuardarEstudiante_Click"
                                    Text="Guardar" CssClass="btn btn-primary" ID="btnGuardadEstudiante" />
                            </div>
                        </div>
                        <div class="col-md-6">
                        </div>
                    </div>
                </div>
            </div>

            <!-- ./wrapper -->
        </ContentTemplate>
    </asp:UpdatePanel>
    <style type="text/css">
        #gvListaEstudiante {
            margin-left: 5px!important;
        }
    </style>
</asp:Content>
