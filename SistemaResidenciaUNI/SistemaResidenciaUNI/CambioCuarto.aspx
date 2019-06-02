<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="CambioCuarto.aspx.cs" Inherits="SistemaResidenciaUNI.CambioCuarto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panelprimary">
        <div class="panel-heading text-bold">Cambio de Cuarto(Estudiante)</div>
        <div class="panel-body mt-3">

            <div class="row">

                <div class="col-md-5">

                    <div class=" form-group row">

                        <label for="lblEscarnetcuarto" class="col-sm-4 col-form-label">Ingrese el Carnet</label>

                        <div class="col-sm-6">

                            <asp:TextBox runat="server" ID="txtCarnetId" CssClass="form-control" placeholder="Ingrese Carnet del Estudiante" />

                        </div>


                        <div class="col-sm-2">

                            <asp:Button runat="server"
                                Text="Buscar" CssClass="btn btn-primary" ID="btnGuardadEstudiante" />

                        </div>

                    </div>

                </div>

            </div>

            <div class="row ">

                <h1></h1>

                <div class="row ">

                    <div class="col-md-5">

                        <div class="form-group row">

                            <label for="lblNumCuarto " class="col-sm-4 col-form-label"> Cuarto Actual del Estudiante</label>

                            <div class="col-sm-4">

                                <asp:TextBox runat="server" ID="txtNumCuarto" CssClass="form-control" placeholder="-" />

                            </div>




                        </div>

                    </div>

                </div>
                <%--finfila2--%>
            </div>

        </div>
</asp:Content>
