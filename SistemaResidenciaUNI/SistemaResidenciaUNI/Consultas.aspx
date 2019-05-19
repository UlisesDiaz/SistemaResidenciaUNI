<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Consultas.aspx.cs" Inherits="SistemaResidenciaUNI.Consultas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="panel panel-primary">
        <div class="panel-heading">Asignaciones por Cuarto </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group row">

                        <div class="col-md-3">
                            <label for="lblBusqueda">Buscar Por Cuarto </label>
                        </div>
                        <div class="col-md-3">
                          <asp:DropDownList ID="ddListaCuartos" CssClass="form-control" runat="server"></asp:DropDownList>
                        </div>
                        <div class="col-md-6">
                            <asp:Button ID="btnBuscar" runat="server" CssClass="btn btn-primary" Text="Buscar" />
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group row">
                        <label for="lblNombres" class="col-md-5">Estudiantes Encontrados</label>
                        <div>
                            <label for="lblNombres" class="col-md-5">
                                <asp:DropDownList ID="ddlNombres" CssClass="form-control" runat="server"></asp:DropDownList></label>

                        </div>

                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <div class="form-group row">
                        <div class="col-md-3">
                            <label for="lblBusqueda">Buscar Por Carnet </label>
                        </div>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtBuscarCarnet" runat="server" CssClass="form-control" placeholder="Ingrese Carnet"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <asp:Button ID="btnBuscarCarnet" runat="server" CssClass="btn btn-primary" Text="Buscar" />
                        </div>
                    </div>
                </div>
            </div>

        </div>

       
    </div>
     <div class="panel panel-primary">
            <div class="panel panel-heading">Lista de Roles de Aseo para el Cuarto ( )</div>
         <div class="panel-body">

         </div>

        </div>

</asp:Content>
