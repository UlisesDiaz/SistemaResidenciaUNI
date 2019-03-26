
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaNegocio;
using CapaEntidades;
using System.IO;

namespace SistemaResidenciaUNI.Estudiante
{
    public partial class Estudiante : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Page.Form.Attributes.Add("enctype", "multipart/form-data");
                if (!Page.IsPostBack)
                {
                    EnlazarListas();
                }
            }
            catch (Exception ex)
            {
                string script = string.Format("alert('{0}');", ex.Message);
                ClientScript.RegisterClientScriptBlock(typeof(Page), "PageLoadError", script, true);
            }

        }

        protected void GuardarEstudiante_Click(object sender, EventArgs e)
        {
            try
            {
                Resultado resultado = GuardarEstudiante();
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
            catch (Exception ex)
            {

                string script = string.Format("alert('{0}');", ex.Message);
                ClientScript.RegisterClientScriptBlock(typeof(Page), "error", script, true);
            }

        }

        Resultado GuardarEstudiante()
        {

            NegocioEstudiante negocioEstudiante = new NegocioEstudiante();


            EntidadEstudiante entidadEstudiante = new EntidadEstudiante();

            EntidadPersona entidadPersona = new EntidadPersona();

            entidadPersona.PER_CEDULA = txtPerCedula.Text;
            entidadPersona.PER_PRIMER_NOMBRE = txtPerPrimerNombre.Text;
            entidadPersona.PER_SEGUNDO_NOMBRE = txtPerSegundoNombre.Text;
            entidadPersona.PER_PRIMER_APELLIDO = txtPerPrimerApellido.Text;
            entidadPersona.PER_SEGUNDO_APELLIDO = txtPerSegundoApellido.Text.Trim();
            entidadPersona.PER_FECHA_NACIMIENTO = DateTime.Parse(txtPerFechaNacimiento.Value.ToString());
            entidadPersona.PER_ESTADO = true;
            entidadPersona.PER_IMAGEN = ObtenerIMagenByteArray(FilUpImagen.PostedFile.InputStream);

            entidadEstudiante.TBL_PERSONA = entidadPersona;
            entidadEstudiante.CUA_ID = int.Parse(ddlNumeroCuarto.SelectedValue);
            entidadEstudiante.EST_CARNET = txtEstCarnet.Text.Trim();
            entidadEstudiante.EST_ESTADO = true;

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

            //LLenar Departamentos
            NegocioDepartamento negocioDepartamento = new NegocioDepartamento();
            List<EntidadDepartamento> depLis = negocioDepartamento.ObtenerDepartamento().data as List<EntidadDepartamento>;
            dllDepNombre.DataSource = depLis.OrderBy(dr => dr.DEP_NOMBRE);
            dllDepNombre.DataTextField = "DEP_NOMBRE";
            dllDepNombre.DataValueField = "DEP_ID";
            dllDepNombre.DataBind();

        }

        void LimpiarControles()
        {
            EnlazarListas();
            txtEstCarnet.Text = string.Empty;
        }

        void ObtenerMunicipiosPorDepartamentoId(int depID)
        {
            //LLenar lista de municipios según Departamento
            NegocioMunicipio negocioMunicipio = new NegocioMunicipio();
            ddlMunicipio.DataSource = negocioMunicipio.ObtenerMunicipioPorDepartamentoId(depID).data as List<EntidadMunicipio>;
            ddlMunicipio.DataTextField = "MUN_NOMBRE";
            ddlMunicipio.DataValueField = "MUN_ID";
            ddlMunicipio.DataBind();
        }

        void ObtenerBarrioPorMunicipioId(int munId)
        {
            //LLenar lista de municipios según Departamento
            NegocioBarrio negocioBarrio = new NegocioBarrio();
            ddlBarrio.DataSource = negocioBarrio.ObtenerBarrioPorMunicipioId(munId).data as List<EntidadBarrio>;
            ddlBarrio.DataTextField = "BAR_NOMBRE";
            ddlBarrio.DataValueField = "BAR_ID";
            ddlBarrio.DataBind();
        }

        protected void dllDepNombre_SelectedIndexChanged(object sender, EventArgs e)
        {
            ObtenerMunicipiosPorDepartamentoId(int.Parse(dllDepNombre.SelectedValue));
        }

        byte[] ObtenerIMagenByteArray(Stream stream)
        {
            int streamLength = int.Parse(stream.Length.ToString());
            byte[] fileData = new byte[streamLength];

            stream.Read(fileData, 0, streamLength);
            stream.Close();

            return fileData;
        }

        protected void ddlMunicipio_SelectedIndexChanged(object sender, EventArgs e)
        {
            ObtenerBarrioPorMunicipioId((int.Parse(ddlMunicipio.SelectedValue)));
        }
    }
}