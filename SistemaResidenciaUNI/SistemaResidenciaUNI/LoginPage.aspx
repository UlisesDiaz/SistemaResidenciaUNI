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
            <div class="Content-all">
       
                    <div class="Content-Form">
                            <img src="dist/img/uniLogo.jpg" alt="Photo by Toa Heftiba on Unsplash" class="logo"/>
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
            
                            <span id="forgotPass" class="Text-Footer">Olvidaste tu Contraseña? <a href="#">Has click aquí</a>

                            </span>
                     </div>
        
                    <div class="Content-Text">
                        <div class="Content-Capa"></div>
                            <h1 id="TitleDecoration" class="Title-des">Sistema de Residencia &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp UNI</h1>

                    </div>

                  <%--      </LayoutTemplate>
                    </asp:Login>--%>
                </div>

        </form>
    
    <style type="text/css">

        #btnSubmit{
            border-radius:15px;
        }
        #forgotPass:hover{
            color:blue;
        }

    </style>
    
</body>
</html>
