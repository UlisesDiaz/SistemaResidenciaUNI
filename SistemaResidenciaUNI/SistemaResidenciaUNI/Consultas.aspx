<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Consultas.aspx.cs" Inherits="SistemaResidenciaUNI.Consultas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--PostBack--%>
        <asp:ScriptManager runat="server" ID="ScriptManager1" EnablePartialRendering="true" AsyncPostBackTimeout="600" />
    <asp:UpdateProgress runat="server">
        <ProgressTemplate>
            <div class="loading" style="width: 100%">
                <img src="../dist/img/loading.gif" alt="Cargando..." />
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>

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
                          <asp:DropDownList ID="ddListaCuartos" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddListaCuartos_SelectedIndexChanged"></asp:DropDownList>
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

        </div>

       
    </div>
     <div class="panel panel-primary">
            <div class="panel panel-heading">Lista de Roles de Aseo para el Cuarto ( )</div>
         <div class="panel-body">

         </div>

        </div>

</asp:Content>
