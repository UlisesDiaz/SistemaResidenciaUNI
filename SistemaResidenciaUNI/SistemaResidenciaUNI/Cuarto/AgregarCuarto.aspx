<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Home.Master" CodeBehind="AgregarCuarto.aspx.cs" Inherits="SistemaResidenciaUNI.Cuarto.AgregarCuarto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Sección de Administración de Cuarto</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="panel panel-primary">
        <div class="panel-heading">Registrar Cuarto</div>
        <div class="panel-body">

            <div class="form-group row">
                <label for="txtNumCuarto" class="col-sm-2 col-form-label">Número Cuarto</label>
                <div class="col-sm-10">
                    <asp:TextBox runat="server" ID="txtNumCuarto"  CssClass="form-control" TextMode="number" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNumCuarto"
                        CssClass="text-danger" ErrorMessage="El campo Número Cuarto es obligatorio." />
                </div>
            </div>
            <div class="form-group row">
                <label for="chkEstadoCuarto" class="col-sm-2 col-form-label">Estado</label>
                <div class="col-sm-10">
                    <asp:CheckBox ID="chkEstadoCuarto" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <asp:Button runat="server" OnClick="GuardarCuarto_Click"
                    Text="Guardar" CssClass="btn btn-primary" />
            </div>
        </div>

    </div>
       <div class="panel panel-primary">
        <div class="panel-heading">Listado de Cuartos</div>
        <div class="panel-body">
        </div>
    </div>
</asp:Content>
