
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaNegocio;
using CapaEntidades;

namespace SistemaResidenciaUNI.Estudiante
{
    public partial class Estudiante : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                EnlazarListas();
        }

        protected void GuardarEstudiante_Click(object sender, EventArgs e)
        {
            Resultado resultado = GuardarEstudiante();
            if (resultado.esError)
            {
                string script = string.Format("alert('{0}');", resultado.mensaje);
                ClientScript.RegisterClientScriptBlock(typeof(Page), "error", script, true);
            }
            else
            {
                LimpiarControles();
                string script = string.Format("alert('{0}');", resultado.mensaje);
                ClientScript.RegisterClientScriptBlock(typeof(Page), "successfull", script, true);
            }
        }

        Resultado GuardarEstudiante()
        {

            NegocioEstudiante negocioEstudiante = new NegocioEstudiante();
            EntidadEstudiante entidadEstudiante = new EntidadEstudiante();
            //entidadEstudiante.PER_ID = int.Parse(ddlPersona.SelectedValue);
            entidadEstudiante.CUA_ID = int.Parse(ddlNumeroCuarto.SelectedValue);
            entidadEstudiante.EST_CARNET = txtEstCarnet.Text;
            entidadEstudiante.EST_ESTADO = chkEstEstado.Checked;
            return negocioEstudiante.GuardarNuevoEstudiante(entidadEstudiante);
        }

        void EnlazarListas()
        {
            //llenar ddl de personas
            NegocioEstudiante negocioEstudiante = new NegocioEstudiante();

            //ddlPersona.DataSource = negocioEstudiante.ObtenerPersonas();
            //ddlPersona.DataTextField = "PER_NOMBRE_COMPLETO";
            //ddlPersona.DataValueField = "PER_ID";
            //ddlPersona.DataBind();

            //LLenar ddl de cuartos
            NegocioCuarto negocioCuarto = new NegocioCuarto();

            ddlNumeroCuarto.DataSource = negocioCuarto.ObtenerCuartos();
            ddlNumeroCuarto.DataTextField = "CUA_NUMERO";
            ddlNumeroCuarto.DataValueField = "CUA_ID";
            ddlNumeroCuarto.DataBind();

        }

        void LimpiarControles()
        {
            EnlazarListas();
            txtEstCarnet.Text = string.Empty;
            chkEstEstado.Checked = false;

        }
    }
}