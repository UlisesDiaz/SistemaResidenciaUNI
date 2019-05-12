<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="RolDeAseo.aspx.cs" Inherits="SistemaResidenciaUNI.Rol_Aseo.RolDeAseo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>

            .defecto {

            background:#367FA9;
        }

    </style>

        <div class="panel panel-primary"> 

          <div class="panel-heading text-bold text-center defecto mb-5">Asignacion de Rol Aseo</div>

         <div class="panel-body mt-4">

             <div class="row ">

                 <div class="col-md-6">

                     <div class="form-group row justify-content-center">

                         <label for="lblcarnetrolaseo" class="col-sm-6 col-form-label text-bold">Carnet del Estudiante</label>

                         <div class="col-sm-10">

                             <asp:TextBox runat="server" ID="txtEsCarnetrolaseo" CssClass="form-control" placeholder="Carnet del Estudiante" />

                         </div><%--findivtxtrolaseo--%>

                     </div><%--finformgroup--%>

                 </div><%--fincolasigna--%>


                        <div class="col-md-6">

                     <div class="form-group row">

                         <label for="lbltiporolaseo" class="col-sm-6 col-form-label text-bold ml-3">Tipo de Aseo</label>

                         <div class="col-sm-10">

                             <asp:DropDownList ID="ddlRolaseo" CssClass="form-control" runat="server"></asp:DropDownList> 

                         </div><%--findivtxtrolaseo2--%>

                     </div><%--finformgroup2--%>

                 </div><%--fincolasigna2--%>


             </div><%--finfilasignacion--%>


             <%--segundafilafecharolaseo--%>


             <div class="row justify-content-center mt-4">

                 <div class="col-md-6">

                     <div class="form-group row justify-content-center">

                         <label for="lblfecharolaseo" class="col-sm-6 col-form-label text-bold">Fecha de Aseo</label>

                         <div class="col-sm-10">

                             <asp:TextBox runat="server" ID="txtfechaseo" CssClass="form-control" placeholder="Ingrese Fecha Aseo" />

                         </div><%--findivtxtrolaseo--%>

                     </div><%--finformgroup--%>

                 </div><%--fincolasigna--%>


                        <div class="col-md-6">

                     <div class="form-group row">

                         <label for="lbldiaaseo" class="col-sm-6 col-form-label text-bold ml-3">Dia de Aseo</label>

                         <div class="col-sm-10">

                             <asp:TextBox runat="server" ID="txtdiaaseo" CssClass="form-control" placeholder="Ingrese Dia de aseo" />

                         </div><%--findivtxtrolaseo2--%>

                     </div><%--finformgroup2--%>

                 </div><%--fincolasigna2--%>


             </div><%--finfilasignacion--%>

             <div class="row  mt-5">

                 <div class="col-md-6">

                     <div class="form-group row justify-content-center">

                         

                             <div class="col-md-1"> 

                             </div>
                         <div class="col-md-2">
                             <asp:Button runat="server" Text="ASIGNAR" CssClass="btn btn-primary" ID="btnestudianterolaseo" />
                         </div>
                                      

                     </div><%--formgroupboton--%>

                 </div><%--colbotonrolaseo--%>


             </div> <%--filabotonrolaseo--%>


            

         </div><%--finpanelbody--%>
     
     
     </div> <%--finpanelprimary--%>

    

  </asp:Content>
