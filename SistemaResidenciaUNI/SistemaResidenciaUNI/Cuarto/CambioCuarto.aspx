<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="CambioCuarto.aspx.cs" Inherits="SistemaResidenciaUNI.Cuarto.CambioCuarto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="panel panel-primary">
       
       <div class="panel-heading"> Cambio De Cuarto</div>
       
       <div class="panel-body">
           
           <div class="row">
               
               <div class="col-md-6">
                   
                   <div class="form-group row">
                      
                      <div class="col-sm-1"></div> 
                       <label for="lblCarnetEst" class="col-sm-7" >Carnet del Estudiante</label>
                       
                       <div class="col-sm-6">
                           
                           <asp:TextBox runat="server" ID="TxtCarnetEst" cssClass="form-control" placeholder="Ingrese Carnet del Estudiante"  />
                           
                       </div>
                       
                       <div class="col-sm-6">
                           
                           <asp:Button runat="server"  Text="Verificar" cssClass="btn btn-primary" ID="btnverificarEst"/> 
                           
                       </div>
                       
                       
                       
                   </div>
                   
               </div>
               
           </div> <%--finfila--%>
            
           
            
            <div class="row">
                <div class="col-sm-12"></div>
                
                <div class="col-md-6"> 
                
                    <div class="form-group row"> 
                    
                        <label for="lblcuartoactual" class="col-sm-7">Cuarto Actual</label>
                        
                        <div class="col-sm-6"> 
                        
                            <label for="lblmostraractual" class="col-sm-6" Visible="true">sdsds</label>
                        
                        </div>
                    </div>
                    
                    
                
                </div>
                
                <div class="col-sm-6"> 
                        
                            <div class="form-group row">
                                
                                <label for="lblCuartonuevo" class="col-sm-7">Cuarto Nuevo</label>
                                
                                <div class="col-sm-6">
                                    
                                    <asp:TextBox runat="server" ID="TxtCuartoNuevo" CssClass="form-control" placeholder="Cuarto Nuevo"></asp:TextBox>
                                    
                                </div>
                                
                            </div>
                        
                        </div>
                
            </div>
            
           
       </div>
        
    
    </div> <%--primerpanel--%>
    
    <div class="panel panel-primary">
        
        <div class="panel-heading">Operacion</div>
        
        <div class="panel-body">
            
            <div class="row">
                
                <div class="col-md-6">
                    
                    <div class="form-group row">
                        
                        <div class="col-sm-1"></div>
                        <asp:Button runat="server"  Text="Cambiar Cuarto" cssClass="btn btn-primary" ID="btncambiarCuarto"/>
                        
                    </div>
                </div>
                
            </div>
            
        </div>
        
    </div>
    
    
</asp:Content>
