<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="InfoEstudiante.aspx.cs" Inherits="SistemaResidenciaUNI.InfoEstudiante" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="panel panel-primary ">
        <div class="panel-heading text-bold">Buscar Estudiante Por Carnet</div>
        <div class="panel-body  ">

            <div class="row  ">
                <div class="col-md-6">


                    <div class="col-md-5">
                        <asp:Label ID="lblBuscarCarnet" runat="server" class="col-sm-4 col-form-label" CssClass="text text-bold" Text="  Ingrese Carnet del Estudiante"></asp:Label>
                    </div>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtNumCarnet" runat="server" CssClass="form-control" placeholder="Ingrese Carnet"></asp:TextBox>
                    </div>

                </div>

                <div class="col-md-6">
                    <div class="col-md-6">
                        <asp:Button ID="btnBuscarCarnet" runat="server" class="col-sm-4" CssClass="btn btn-primary" Text="Buscar" OnClick="btnBuscarCarnet_Click" />
                    </div>
                </div>
            </div>
        </div>

    </div>

    <div class="panel panel-info">
        <div class="panel panel-heading">Informacion del Estudiante</div>
        <div class="panel panel-body">

            <div class="row photo-right">
                <img src="../dist/img/grupo.jpg" class="img-circle" alt="Foto Est" style="width: 180px; height: 170px">
            </div>

            <div class="row marginRow">
                <div>
                </div>

                <div class="col-md-3 labelWidth">

                    <asp:Label runat="server" CssClass="text text-bold" Text=" Nombre Completo:"></asp:Label>

                </div>
                <div class="col-md-5">
                    <asp:Label ID="lblNombres" runat="server" Text=""></asp:Label>
                </div>

                <div class="col-md-4">
                </div>
            </div>

            <div class="row marginRow">
                <div>
                </div>
                <div class="col-md-3 labelWidth">
                    <asp:Label runat="server" CssClass="text text-bold" Text=" Apellidos:"></asp:Label>
                </div>

                <div class="col-md-5">

                    <asp:Label ID="lblApellidos" runat="server"></asp:Label>
                </div>


            </div>

            <div class="row marginRow">
                <div>
                </div>
                <div class="col-md-3 labelWidth">
                    <asp:Label runat="server" CssClass="text text-bold" Text=" Fecha Naci:"></asp:Label>
                </div>

                <div class="col-md-5">

                    <asp:Label ID="lblFechaNacimiento" runat="server"></asp:Label>
                </div>


            </div>


            <div class="row marginRow">
                <div>
                </div>
                <div class="col-md-3 labelWidth">
                    <asp:Label runat="server" CssClass="text text-bold" Text="Genero:"></asp:Label>
                </div>

                <div class="col-md-5">

                    <asp:Label ID="lblGenero" runat="server"></asp:Label>
                </div>


            </div>

            <div class="row marginRow">
                <div>
                </div>
                <div class="col-md-3 labelWidth">
                    <asp:Label runat="server" CssClass="text text-bold" Text="Estado Civil:"></asp:Label>
                </div>

                <div class="col-md-5">

                    <asp:Label ID="lblEstadoCivil" runat="server"></asp:Label>
                </div>


            </div>

            <div class="row marginRow">
                <div>
                </div>
                <div class="col-md-3 labelWidth">
                    <asp:Label runat="server" CssClass="text text-bold" Text=" Dirección:"></asp:Label>
                </div>

                <div class="col-md-5">

                    <asp:Label ID="lblDirecion" runat="server" Text=""></asp:Label>
                </div>


            </div>


            <div class="row marginRow">
                <div>
                </div>
                <div class="col-md-3 labelWidth">
                    <asp:Label runat="server" CssClass="text text-bold" Text="Celular:"></asp:Label>

                </div>

                <div class="col-md-5">

                    <asp:Label ID="lblTelefono1" runat="server" Text=""></asp:Label>
                </div>

            </div>

            <div class="row marginRow">
                <div>
                </div>
                <div class="col-md-3 labelWidth">
                    <asp:Label runat="server" CssClass="text text-bold" Text="Compañia:"></asp:Label>

                </div>

                <div class="col-md-5">

                    <asp:Label ID="lblCompania" runat="server"></asp:Label>
                </div>

            </div>

            <div class="row marginRow">
                <div>
                </div>
                <div class="col-md-3 labelWidth">
                    <asp:Label runat="server" CssClass="text text-bold" Text="Correo:"></asp:Label>
                </div>

                <div class="col-md-5">

                    <asp:Label ID="lblCorreo" runat="server" Text=""></asp:Label>
                </div>

            </div>
            <div class="row marginRow">
                <div class="col-md-4">
                    <button type="button" id="EditarInfoEstudiante" runat="server" cssclass="btn"><i class="fa fa-edit"></i>Editar</button>

                </div>
            </div>
        </div>

    </div>


    <div class="panel panel-primary">

        <div class="panel panel-heading ">Información de la carrera</div>
        <div class="panel panel-body">

            <div class="row">
                <div class="col-md-6">

                    <div class="col-md-2">
                        <asp:Label ID="Label1" runat="server" CssClass="text text-bold" Text="Carrera:"></asp:Label>
                    </div>
                    <div class="col-md-6">
                        <asp:Label ID="lblNombreCarrera" runat="server" Text=""></asp:Label>
                    </div>

                </div>

                <div class="col-md-6">
                    <div class="col-md-2">
                        <asp:Label ID="Label2" runat="server" CssClass="text text-bold" Text="Recinto:"></asp:Label>
                    </div>
                    
                        <div class="col-md-6">
                            <asp:Label ID="lblRecinto" runat="server" Text=""></asp:Label>
                        </div>
                </div>

            </div>


        </div>

    </div>

</asp:Content>
