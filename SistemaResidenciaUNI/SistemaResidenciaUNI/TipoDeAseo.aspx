<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="TipoDeAseo.aspx.cs" Inherits="SistemaResidenciaUNI.TipoDeAseo" %>

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
                <div class="panel-heading">Registro Tipo de Aseo</div>
                <div class="panel-body">

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group row">
                                <label for="lblTipAseDescripcion" class="col-sm-6 col-form-label">Tipo de aseo</label>
                                <div class="col-sm-10">
                                    <asp:TextBox runat="server" ID="txtTipAseDescripcion" CssClass="form-control" placeholder="Tipo de aseo" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                        </div>
                    </div>

                </div>
            </div>
             <div class="panel panel-primary">
                <div class="panel-heading">Operaciones</div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <asp:Button runat="server" OnClick="btnGuardadTipoAseo_Click"
                                    Text="Guardar" CssClass="btn btn-primary" ID="btnGuardadTipoAseo" />
                            </div>
                        </div>
                        <div class="col-md-6">
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
