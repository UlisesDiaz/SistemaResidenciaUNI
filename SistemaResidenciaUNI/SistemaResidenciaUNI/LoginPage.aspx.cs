using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaEntidades;
using CapaNegocio;
//using SistemaResidenciaUNI.Autenticacion;

namespace SistemaResidenciaUNI
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!Page.IsPostBack)
            //{
            //    Session["UserSessionId"] = null;
            //}
        }

        //protected void LoginUser_Authenticate(object sender, AuthenticateEventArgs e)
        //{
        //    bool Auth = Membership.ValidateUser(LoginIser.UserName, LoginIser.Password);

        //    if (Auth)
        //    {
        //        NegocioUsuario User = new NegocioUsuario();
        //        EntidadUsuario objUsuario = User.DatosUsuario(LoginIser.UserName, LoginIser.Password);

        //        if (objUsuario != null)
        //        {
        //            SessionManager _SessionManager = new SessionManager(Session);
        //            //SessionManager.UserSessionId = objEmpleado.ID.ToString();
        //            _SessionManager.UserSessionUsuario = objUsuario;
        //            FormsAuthentication.RedirectFromLoginPage(LoginIser.UserName,false);
        //        }
        //        else
        //        {
        //            Response.Write("<script>alert('USUARIO INCORRECTO.')</script>");
        //        }

        //    }
        //}



        //protected void btnIngresar_Click(object sender, EventArgs e)
        //{
        //    bool Auth = Membership.ValidateUser(UserName.Text,Password.Text);

        //    if (Auth)
        //    {
        //        NegocioUsuario User = new NegocioUsuario();
        //        EntidadUsuario objUsuario = User.DatosUsuario(UserName.Text,Password.Text);

        //        if (objUsuario != null)
        //        {
        //            SessionManager _SessionManager = new SessionManager(Session);
        //            //SessionManager.UserSessionId = objEmpleado.ID.ToString();
        //            _SessionManager.UserSessionUsuario = objUsuario;
        //            FormsAuthentication.RedirectFromLoginPage(UserName.Text, false);
        //        }
        //        else
        //        {
        //            Response.Write("<script>alert('USUARIO INCORRECTO.')</script>");
        //        }

        //    }

        //}
    }
}