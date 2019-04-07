<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="RolDeAseo.aspx.cs" Inherits="SistemaResidenciaUNI.Rol_Aseo.RolDeAseo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="panel-primary">

        <div class="panel-heading">Roles de Aseo (Estudiantes Residnentes)</div>

        <div class="panel panel-body">


            <div class="row">
                <div class="col-md-6">
                    <div class="form-group row">
                        <label for="lblBuscarCarnet" class="col-sm-6 col-form-label">Busque por Carnet</label>
                        <div class="col-sm-10">

                            <asp:TextBox runat="server" ID="txtEsCarnet" CssClass="form-control" placeholder="Ingrese el Carnet del Estudiante" />

                        </div>
                    </div>

                </div>
                <div class="col-md-6">
                    <div class="form-group row">
                        <div class="col-sm-10">


                            <asp:Button runat="server" Text="Buscar" CssClass="btn btn-primary" ID="btnBuscarEstudiante" />
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>
    <div class="panel panel-primary">

        <div class="panel panel-heading">Generar (Roles de Aseo) </div>
        <div class="panel panel-body">

            <div class="row">
            </div>
            <div class="col-md-6">

                <div class="form-group row">
                    
                   <label for="lblTipAseo" class="col-sm-6 col-form-label">Tipo Aseo</label>
                        
                <asp:DropDownList ID="ddlTipId" CssClass="form-control" runat="server"></asp:DropDownList>                     
                  </div>
                </div>

            </div>

        </div>


  

</asp:Content>
