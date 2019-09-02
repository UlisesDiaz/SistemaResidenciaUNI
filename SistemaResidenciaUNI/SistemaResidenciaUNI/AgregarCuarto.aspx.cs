using CapaEntidades;
using CapaNegocio;
using System;
using System.Web.UI;

namespace SistemaResidenciaUNI.Cuarto
{
    public partial class AgregarCuarto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GuardarCuarto_Click(object sender, EventArgs e)
        {
            Resultado resultado = GuardarCuarto();
            if (resultado.esError)
            {
                string script = string.Format( "alert('{0}');", resultado.mensaje);
               ClientScript.RegisterClientScriptBlock(typeof(Page), "error", script, true);
            }
            else
            {
                string script = "alert('se ha insertado el registro del cuarto!');";
                ClientScript.RegisterClientScriptBlock(typeof(Page), "successfull", script, true);
            }

        }

        Resultado GuardarCuarto()
        {
            NegocioCuarto negocioCuarto = new NegocioCuarto();
            EntidadCuarto entidadCuarto = new EntidadCuarto();
            entidadCuarto.CUA_NUMERO = int.Parse(txtNumCuarto.Text);
            entidadCuarto.CUA_ESTADO = true;

            return negocioCuarto.GuardarNuevoCuarto(entidadCuarto);
        }
    }
}