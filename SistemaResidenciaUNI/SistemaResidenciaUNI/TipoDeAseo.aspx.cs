using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaEntidades;
using CapaNegocio;
using System.IO;

namespace SistemaResidenciaUNI
{
    public partial class TipoDeAseo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGuardadTipoAseo_Click(object sender, EventArgs e)
        {

            try
            {
                Resultado resultado = GuardarTipoAseo();
                if (resultado.esError)
                {
                    throw new Exception(resultado.mensaje);

                }
                else
                {
                    LimpiarControles();
                    string script = string.Format("alert('{0}');", resultado.mensaje);
                    ClientScript.RegisterClientScriptBlock(typeof(Page), "successfull", script, true);
                }

            }

            catch (Exception ex) {

                string script = string.Format("alert('{0}');", ex.Message);
                ClientScript.RegisterClientScriptBlock(typeof(Page), "error", script, true);
            }

        }


        Resultado GuardarTipoAseo()
        {

            NegocioTipoAseo negocioTipoaseo = new NegocioTipoAseo();
            EntidadTipoAseo entidadTipoaseo = new EntidadTipoAseo();

            entidadTipoaseo.TIP_ASE_DESCRIPCION = txtTipAseDescripcion.Text;
            entidadTipoaseo.TIP_ASE_ESTADO = true;

            return negocioTipoaseo.GuardarNuevoTipoAseo(entidadTipoaseo);
        }

        void LimpiarControles()
        {
            
           txtTipAseDescripcion.Text = string.Empty;
        }

    }
}