using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaEntidades;
using CapaNegocio;
using System.IO;

namespace SistemaResidenciaUNI.Rol_Aseo
{
    public partial class RolDeAseo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Enlazarlista();
        }


        void Enlazarlista()
        {
            NegocioTipoAseo negociotipoaseo = new NegocioTipoAseo();

            ddlRolaseo.DataSource = negociotipoaseo.ObtenerTipoAseo();
            ddlRolaseo.DataTextField = "TIP_ASE_DESCRIPCION";
            ddlRolaseo.DataValueField = "TIP_ASE_ID";
            ddlRolaseo.DataBind();

        }

    }
}