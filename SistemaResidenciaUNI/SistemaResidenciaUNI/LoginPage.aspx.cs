using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaResidenciaUNI
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginUser_Authenticate(object sender, AuthenticateEventArgs e)
        {
            TextBox User = (TextBox)LoginUser.FindControl("txtuser");
            TextBox Password = (TextBox)LoginUser.FindControl("txtPassword");

            bool Auth = Membership.ValidateUser(User.Text,Password.Text);

            if (Auth)
            {

            }

        }
    }
}