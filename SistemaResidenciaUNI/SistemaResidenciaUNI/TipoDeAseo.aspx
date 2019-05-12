<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="TipoDeAseo.aspx.cs" Inherits="SistemaResidenciaUNI.TipoDeAseo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .table-striped {}
    </style>
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
                                <div class="col-sm-8">         
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


           <%-- nuevo panel--%>

                  <div class=" panel panel-primary">
                <div class="panel-heading">Listado</div>
                <div class="panel-body">
                    <div class="row justify-content-center">
                        <div class="col-md-6">
                            <div class="form-group row justify-content-center text-center" >

                                <div class="col-sm-6">


                                </div>

                                <div class="col-sm-6">
                                <asp:GridView ID="gvListaTipoAseo" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-bordered table-responsive table-striped" CellPadding="4" ForeColor="#333333" GridLines="None">  
                                    
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="TIP_ASE_DESCRIPCION" HeaderText="Tipo De Aseo" SortExpression="TIP_ASE_DESCRIPCION" >
                                        
                                        <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        
                                    </Columns>
                                    <EditRowStyle BackColor="#7C6F57" />
                                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#E3EAEB" />
                                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                                    
                                </asp:GridView>
                               </div>
                            </div>
                        </div>
                      
                    </div>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
