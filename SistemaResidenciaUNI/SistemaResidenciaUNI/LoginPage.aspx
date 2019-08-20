<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="SistemaResidenciaUNI.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login SISREUNI</title>
    <link rel="stylesheet" href="Jquery/StyleLogin.css" type="text/css"/>
</head>
<body>

    <form id="form1" runat="server"> 
        <%--<asp:Login ID="LoginUser" runat="server" EnableViewState="false" OnAuthenticate="LoginUser_Authenticate">
            <LayoutTemplate>--%>
            <div class="Content-all">
            <asp:Login ID="LoginUser" runat="server" EnableViewState="false" OnAuthenticate="LoginUser_Authenticate">
            <LayoutTemplate>
                    <div class="Content-Form">
                            <img src="dist/img/UNI-LOGO-1024x764.png" alt="Photo by Toa Heftiba on Unsplash" class="logo"/>
                            <h1 class="Title">Inicio de Sesión</h1>
            
                            <div class="form-group">
                                <%--<form action="">--%>
                                <label for="lblUser">Email</label>
                                <input id="txtuser" type="text"/>
                                <label for="lblpass">Contreseña</label>
                                <input id="txtPassword" type="password"/>
                                
                
                                <input id="btnSubmit" type="submit" value="Iniciar Sesion"/>
                            <%--</form>--%>
                            </div>
            
                            <span class="Text-Footer">Olvidaste tu Contraseña? <a href="#">Has click aquí</a>

                            </span>
                     </div>
        
                    <div class="Content-Text">
                        <div class="Content-Capa"></div>
                            <h1 class="Title-des">Sistema de Residencia &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp UNI</h1>
            
                            <p class="Text-Des">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptate consequuntur atque voluptas harum animi et, eum saepe nobis pariatur natus, voluptates in qui esse repellendus doloremque modi quisquam, beatae. Molestiae!</p>
            
                    </div>

                        </LayoutTemplate>
                    </asp:Login>
                </div>

        </form>
    
    
    
</body>
</html>
