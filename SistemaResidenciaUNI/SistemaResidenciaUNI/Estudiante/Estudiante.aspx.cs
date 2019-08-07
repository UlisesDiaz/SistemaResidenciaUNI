
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaNegocio;
using CapaEntidades;
using System.IO;
using System.Web.Script.Services;
using System.Web.Services;


namespace SistemaResidenciaUNI.Estudiante
{
    public partial class Estudiante : System.Web.UI.Page
    {
        NegocioEstudiante negocioEstudiante = new NegocioEstudiante();
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
            ListarEstudiantes();
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
            //info sobre persona
            EntidadPersona entidadPersona = new EntidadPersona();

            entidadPersona.PER_IDENTIFICACION = txtPerCedula.Text;
            entidadPersona.TIP_IDE_ID = int.Parse(ddlTipId.SelectedValue);
            entidadPersona.GEN_ID = int.Parse(ddlGenId.SelectedValue);
            entidadPersona.PER_PRIMER_NOMBRE = txtPerPrimerNombre.Text;
            entidadPersona.PER_SEGUNDO_NOMBRE = txtPerSegundoNombre.Text;
            entidadPersona.PER_PRIMER_APELLIDO = txtPerPrimerApellido.Text;
            entidadPersona.PER_SEGUNDO_APELLIDO = txtPerSegundoApellido.Text.Trim();
            entidadPersona.PER_FECHA_NACIMIENTO = DateTime.Parse(txtPerFechaNacimiento.Value.ToString());
            entidadPersona.PER_ESTADO = true;
            entidadPersona.EST_CIV_ID = int.Parse(ddListEstadoCivil.SelectedValue); //???No veo el control para capturar el estado civil

            entidadEstudiante.TBL_PERSONA = entidadPersona; //pasando info sobre persona en estudiante (persona q es estudiante)
            //info sobre estudiante
            //cuarto
            EntidadHisEstudianteCuarto entiHisEstCuarto = new EntidadHisEstudianteCuarto();
            entiHisEstCuarto.CUA_ID = int.Parse(ddlNumeroCuarto.SelectedValue);
            entiHisEstCuarto.HIS_EST_CUA_DESRIPCION = string.Empty;
            entiHisEstCuarto.HIS_EST_CUA_FECHA_INICIAL = DateTime.Now;
            entiHisEstCuarto.USU_ID = 2; //revisar q ese id exista en tbl_usuario
            entiHisEstCuarto.HIS_EST_CUA_ESTADO = true;

            List<EntidadHisEstudianteCuarto> listHisEstCuarto = new List<EntidadHisEstudianteCuarto>();
            listHisEstCuarto.Add(entiHisEstCuarto);
            //asociando cuarto
            entidadEstudiante.TBL_HIS_ESTUDIANTE_CUARTO = listHisEstCuarto;

            entidadEstudiante.CUA_ID = int.Parse(ddlNumeroCuarto.SelectedValue);
            entidadEstudiante.CAR_ID = int.Parse(ddCarId.SelectedValue);
            entidadEstudiante.EST_CARNET = txtEstCarnet.Text.Trim();
            entidadEstudiante.EST_FECHA_INICIAL = DateTime.Now;
            entidadEstudiante.EST_ESTADO = true;

            //info básica de contacto correo, direccion, tele etc
            EntidadCorreo entCorreo = new EntidadCorreo(); //aquì solo se pide un correo, pero la estructura  puede ser una lista uno a muchos
            entCorreo.COR_DEFINICION = string.Empty; // ni idea donde està ese control q pide el correo al usuario por eso lo mando vacio
            entCorreo.COR_ESTADO = true;

            List<EntidadCorreo> lisEntCorreo = new List<EntidadCorreo>();
            lisEntCorreo.Add(entCorreo);
            //relacionando info sobre correo
            entidadPersona.TBL_CORREO = lisEntCorreo;
            //info sobre telefono
            EntidadTelefono entTelefono = new EntidadTelefono();
            entTelefono.COM_ID = int.Parse(ddlcompDescripcion.SelectedValue);
            entTelefono.TEL_NUMERO = txtTelNumero.Text;
            entTelefono.TEL_PERSONAL = true;
            entTelefono.TEL_ESTADO = true;

            List<EntidadTelefono> listEntTelefono = new List<EntidadTelefono>();
            listEntTelefono.Add(entTelefono);

            //relacionando lista de telefonos a la persona estudiante
            entidadPersona.TBL_TELEFONO = listEntTelefono;
            //info sobre dirección
            EntidadDireccion entDireccion = new EntidadDireccion();
            entDireccion.BAR_ID = int.Parse(ddlBarrio.SelectedValue);
            entDireccion.DIR_DESCRIPCION = txtDireccion.InnerText;
            entDireccion.DIR_NO_CASA = txtNumCasa.Text;
            entDireccion.DIR_ESTADO = true;

            List<EntidadDireccion> lisEntDireccion = new List<EntidadDireccion>();
            lisEntDireccion.Add(entDireccion);

            entidadPersona.TBL_DIRECCION = lisEntDireccion;

            return negocioEstudiante.GuardarNuevoEstudiante(entidadEstudiante);
        }

        void EnlazarListas()
        {
            //llenar ddl de personas


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
            ddlDepNombre.DataSource = depLis.OrderBy(dr => dr.DEP_NOMBRE);
            ddlDepNombre.DataTextField = "DEP_NOMBRE";
            ddlDepNombre.DataValueField = "DEP_ID";
            ddlDepNombre.DataBind();

            //Lista de Generos
            ddlGenId.DataSource = negocioEstudiante.ObtenerListaGenero();
            ddlGenId.DataTextField = "GEN_DESCRIPCION";
            ddlGenId.DataValueField = "GEN_ID";
            ddlGenId.DataBind();

            //Lista Tipo de Identificación
            ddlTipId.DataSource = negocioEstudiante.ObtenerListaTipoIdentificacion();
            ddlTipId.DataTextField = "TIP_IDE_DESCRIPCION";
            ddlTipId.DataValueField = "TIP_IDE_ID";
            ddlTipId.DataBind();

            //Lista Carreras
            ddCarId.DataSource = negocioEstudiante.ObtenerListaCarrera();
            ddCarId.DataTextField = "CAR_DESCRIPCION";
            ddCarId.DataValueField = "CAR_ID";
            ddCarId.DataBind();

            //Lista de compañias telefónicas
            ddlcompDescripcion.DataSource = negocioEstudiante.ObtenerListaCompañiaTelefonica();
            ddlcompDescripcion.DataTextField = "COM_DESCRIPCION";
            ddlcompDescripcion.DataValueField = "COM_ID";
            ddlcompDescripcion.DataBind();

            //Estado Civil de Personas
            ddListEstadoCivil.DataSource = negocioEstudiante.ObtenerEstadoCivil();
            ddListEstadoCivil.DataTextField = "EST_CIV_DESCRI";
            ddListEstadoCivil.DataValueField = "EST_CIV_ID";
            ddListEstadoCivil.DataBind();


        }

        void LimpiarControles()
        {
            EnlazarListas();
            txtPerCedula.Text = string.Empty;
            txtEstCarnet.Text = string.Empty;
            txtPerPrimerNombre.Text = string.Empty;
            txtPerSegundoNombre.Text= string.Empty;
            txtPerPrimerApellido.Text= string.Empty;
            txtPerSegundoApellido.Text= string.Empty;
            txtTelNumero.Text =string.Empty;
            txtNumCasa.Text = string.Empty;
            txtDireccion.InnerText = string.Empty;
            Response.Write("<script>alert('El estudiante se ha Guardado Correctamente!')</script>");
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
            ObtenerMunicipiosPorDepartamentoId(int.Parse(ddlDepNombre.SelectedValue));
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



        void ListarEstudiantes()
        {


            //gvListaEstudiante.DataSource = negocioEstudiante.ObtenerListaEstudiantes();
            //gvListaEstudiante.DataBind();
        }

        [WebMethod]

        public static Object MostrarEstudianteGuardados()
        {
            List<EntidadspEstudiantesGuardados> lista = new List<EntidadspEstudiantesGuardados>();

            NegocioEstudiante nEstudiante = new NegocioEstudiante();
            lista = nEstudiante.N_MostraEstudianteGuardados();
            object json = new { data = lista };
            return json;

        }


    }
}