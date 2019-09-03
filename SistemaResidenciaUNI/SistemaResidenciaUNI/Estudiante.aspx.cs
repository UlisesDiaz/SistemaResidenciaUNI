
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
using System.Configuration;
using System.Data.SqlClient;

namespace SistemaResidenciaUNI
{
    public partial class Estudiante : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Resultado GuardarEstudiante()
        //{

        //    NegocioEstudiante negocioEstudiante = new NegocioEstudiante();
        //    EntidadEstudiante entidadEstudiante = new EntidadEstudiante();

        //    //info sobre persona
        //    EntidadPersona entidadPersona = new EntidadPersona();

        //    entidadPersona.PER_IDENTIFICACION = txtPerCedula.Text;
        //    entidadPersona.TIP_IDE_ID = int.Parse(ddlTipId.SelectedValue);
        //    entidadPersona.GEN_ID = int.Parse(ddlGenId.SelectedValue);
        //    entidadPersona.PER_PRIMER_NOMBRE = txtPerPrimerNombre.Text;
        //    entidadPersona.PER_SEGUNDO_NOMBRE = txtPerSegundoNombre.Text;
        //    entidadPersona.PER_PRIMER_APELLIDO = txtPerPrimerApellido.Text;
        //    entidadPersona.PER_SEGUNDO_APELLIDO = txtPerSegundoApellido.Text.Trim();
        //    entidadPersona.PER_FECHA_NACIMIENTO = DateTime.Parse(txtPerFechaNacimiento.Value.ToString());
        //    entidadPersona.PER_ESTADO = true;
        //    entidadPersona.EST_CIV_ID = int.Parse(ddListEstadoCivil.SelectedValue); //???No veo el control para capturar el estado civil

        //    entidadEstudiante.TBL_PERSONA = entidadPersona; //pasando info sobre persona en estudiante (persona q es estudiante)
        //    //info sobre estudiante
        //    //cuarto
        //    EntidadHisEstudianteCuarto entiHisEstCuarto = new EntidadHisEstudianteCuarto();
        //    entiHisEstCuarto.CUA_ID = int.Parse(ddlNumeroCuarto.SelectedValue);
        //    entiHisEstCuarto.HIS_EST_CUA_DESRIPCION = string.Empty;
        //    entiHisEstCuarto.HIS_EST_CUA_FECHA_INICIAL = DateTime.Now;
        //    entiHisEstCuarto.USU_ID = 2; //revisar q ese id exista en tbl_usuario
        //    entiHisEstCuarto.HIS_EST_CUA_ESTADO = true;

        //    List<EntidadHisEstudianteCuarto> listHisEstCuarto = new List<EntidadHisEstudianteCuarto>();
        //    listHisEstCuarto.Add(entiHisEstCuarto);
        //    //asociando cuarto
        //    entidadEstudiante.TBL_HIS_ESTUDIANTE_CUARTO = listHisEstCuarto;

        //    entidadEstudiante.CUA_ID = int.Parse(ddlNumeroCuarto.SelectedValue);
        //    entidadEstudiante.CAR_ID = int.Parse(ddCarId.SelectedValue);
        //    entidadEstudiante.EST_CARNET = txtEstCarnet.Text.Trim();
        //    entidadEstudiante.EST_FECHA_INICIAL = DateTime.Now;
        //    entidadEstudiante.EST_ESTADO = true;

        //    //info básica de contacto correo, direccion, tele etc
        //    EntidadCorreo entCorreo = new EntidadCorreo(); //aquì solo se pide un correo, pero la estructura  puede ser una lista uno a muchos
        //    entCorreo.COR_DEFINICION = TextCorDefinicion.Text; // ni idea donde està ese control q pide el correo al usuario por eso lo mando vacio
        //    entCorreo.COR_ESTADO = true;

        //    List<EntidadCorreo> lisEntCorreo = new List<EntidadCorreo>();
        //    lisEntCorreo.Add(entCorreo);
        //    //relacionando info sobre correo
        //    entidadPersona.TBL_CORREO = lisEntCorreo;
        //    //info sobre telefono
        //    EntidadTelefono entTelefono = new EntidadTelefono();
        //    entTelefono.COM_ID = int.Parse(ddlcompDescripcion.SelectedValue);
        //    entTelefono.TEL_NUMERO = txtTelNumero.Text;
        //    entTelefono.TEL_PERSONAL = true;
        //    entTelefono.TEL_ESTADO = true;

        //    List<EntidadTelefono> listEntTelefono = new List<EntidadTelefono>();
        //    listEntTelefono.Add(entTelefono);

        //    //relacionando lista de telefonos a la persona estudiante
        //    entidadPersona.TBL_TELEFONO = listEntTelefono;
        //    //info sobre dirección
        //    EntidadDireccion entDireccion = new EntidadDireccion();
        //    entDireccion.BAR_ID = int.Parse(ddlBarrio.SelectedValue);
        //    entDireccion.DIR_DESCRIPCION = txtDireccion.InnerText;
        //    entDireccion.DIR_NO_CASA = txtNumCasa.Text;
        //    entDireccion.DIR_ESTADO = true;

        //    List<EntidadDireccion> lisEntDireccion = new List<EntidadDireccion>();
        //    lisEntDireccion.Add(entDireccion);

        //    entidadPersona.TBL_DIRECCION = lisEntDireccion;

        //    return negocioEstudiante.GuardarNuevoEstudiante(entidadEstudiante);
        //}


        //JQUERY

        [WebMethod]
        public static object ObtenerListaCuarto()
        {
            NegocioCuarto Cuartos = new NegocioCuarto();
            object DdlCuartos = null;
            //Estado Civil de Personas

            DdlCuartos = new { data = Cuartos.ObtenerCuartos() };

            return DdlCuartos;


        }


        [WebMethod]
        public static object ObtenerDepartamentos()
        {
            NegocioDepartamento Departamentos = new NegocioDepartamento();
            object DdlDepar = null;
            //Estado Civil de Personas

            DdlDepar = new { data = Departamentos.ObtenerDepartamento().data as List<EntidadDepartamento> };

            return DdlDepar;


        }

        [WebMethod]
        public static object ObtenerGenero()
        {
            NegocioEstudiante Genero = new NegocioEstudiante();
            object DdlGen = null;
            //Estado Civil de Personas

            DdlGen = new { data = Genero.ObtenerListaGenero() };

            return DdlGen;


        }


        [WebMethod]
        public static object ObtenerTipoIdentificaccion()
        {
            NegocioEstudiante TipoID = new NegocioEstudiante();
            object DdlIdenti = null;
            //Estado Civil de Personas

            DdlIdenti = new { data = TipoID.ObtenerListaTipoIdentificacion() };

            return DdlIdenti;


        }

        [WebMethod]
        public static object ObtenerCarrera()
        {
            NegocioEstudiante Carrera = new NegocioEstudiante();
            object DdlCarrera = null;
            //Estado Civil de Personas

            DdlCarrera = new { data = Carrera.ObtenerListaCarrera() };

            return DdlCarrera;


        }

        [WebMethod]
        public static object ObtenerComniaTel()
        {
            NegocioEstudiante Compania = new NegocioEstudiante();
            object DdlCompania = null;
            //Estado Civil de Personas

            DdlCompania = new { data = Compania.ObtenerListaCompañiaTelefonica() };

            return DdlCompania;


        }

        [WebMethod]
        public static object ObtenerEstadoCvil()
        {
            NegocioEstudiante Civil = new NegocioEstudiante();
            object DdlEsCivil = null;
            //Estado Civil de Personas

            DdlEsCivil = new { data = Civil.ObtenerEstadoCivil() };

            return DdlEsCivil;


        }


        [WebMethod]
        public static object ObtenerMunicipiosPorDepartamentoId(string depID)
        {
            //LLenar lista de municipios según Departamento
            NegocioMunicipio negocioMunicipio = new NegocioMunicipio();
            int DepId = int.Parse(depID);
            object DdlMunicipio = null;

            DdlMunicipio = new { data = negocioMunicipio.ObtenerMunicipioPorDepartamentoId(DepId).data as List<EntidadMunicipio> };

            return DdlMunicipio;
        }

        [WebMethod]
        public static object ObtenerBarrioPorMunicipioId(string munId)
        {
            //LLenar lista de municipios según Departamento
            NegocioBarrio negocioBarrio = new NegocioBarrio();
            int IdMuni = int.Parse(munId);

            object DdlBarrios = null;

            DdlBarrios = new { data = negocioBarrio.ObtenerBarrioPorMunicipioId(IdMuni).data as List<EntidadBarrio> };

            return DdlBarrios;

        }


        //Jquery

        [WebMethod]
        public static bool GuardarEstudian(string Cedula, string TipoID, string TipGene, string PrimerN, string SegunN, string PApellido, string SApellido, string Nacimiento, string Ecivil, string Ncuarto, string Carrera, string Carnet, string Correo, string Tcompania, string TelNum, string barrio, string direc, string Ncasa)
        {

            NegocioEstudiante negocioEstudiante = new NegocioEstudiante();
            EntidadEstudiante entidadEstudiante = new EntidadEstudiante();

            //info sobre persona
            EntidadPersona entidadPersona = new EntidadPersona();

            entidadPersona.PER_IDENTIFICACION = Cedula;
            entidadPersona.TIP_IDE_ID = int.Parse(TipoID);
            entidadPersona.GEN_ID = int.Parse(TipGene);
            entidadPersona.PER_PRIMER_NOMBRE = PrimerN;
            entidadPersona.PER_SEGUNDO_NOMBRE = SegunN;
            entidadPersona.PER_PRIMER_APELLIDO = PApellido;
            entidadPersona.PER_SEGUNDO_APELLIDO = SApellido;
            entidadPersona.PER_FECHA_NACIMIENTO = DateTime.Parse(Nacimiento.ToString());
            entidadPersona.PER_ESTADO = true;
            entidadPersona.EST_CIV_ID = int.Parse(Ecivil); //???No veo el control para capturar el estado civil

            entidadEstudiante.TBL_PERSONA = entidadPersona; //pasando info sobre persona en estudiante (persona q es estudiante)
            //info sobre estudiante
            //cuarto
            EntidadHisEstudianteCuarto entiHisEstCuarto = new EntidadHisEstudianteCuarto();
            entiHisEstCuarto.CUA_ID = int.Parse(Ncuarto);
            entiHisEstCuarto.HIS_EST_CUA_DESRIPCION = string.Empty;
            entiHisEstCuarto.HIS_EST_CUA_FECHA_INICIAL = DateTime.Now;
            entiHisEstCuarto.USU_ID = 2; //revisar q ese id exista en tbl_usuario
            entiHisEstCuarto.HIS_EST_CUA_ESTADO = true;

            List<EntidadHisEstudianteCuarto> listHisEstCuarto = new List<EntidadHisEstudianteCuarto>();
            listHisEstCuarto.Add(entiHisEstCuarto);
            //asociando cuarto
            entidadEstudiante.TBL_HIS_ESTUDIANTE_CUARTO = listHisEstCuarto;

            entidadEstudiante.CUA_ID = int.Parse(Ncuarto);
            entidadEstudiante.CAR_ID = int.Parse(Carrera);
            entidadEstudiante.EST_CARNET = Carnet.Trim();
            entidadEstudiante.EST_FECHA_INICIAL = DateTime.Now;
            entidadEstudiante.EST_ESTADO = true;

            //info básica de contacto correo, direccion, tele etc
            EntidadCorreo entCorreo = new EntidadCorreo(); //aquì solo se pide un correo, pero la estructura  puede ser una lista uno a muchos
            entCorreo.COR_DEFINICION = Correo; // ni idea donde està ese control q pide el correo al usuario por eso lo mando vacio
            entCorreo.COR_ESTADO = true;

            List<EntidadCorreo> lisEntCorreo = new List<EntidadCorreo>();
            lisEntCorreo.Add(entCorreo);
            //relacionando info sobre correo
            entidadPersona.TBL_CORREO = lisEntCorreo;
            //info sobre telefono
            EntidadTelefono entTelefono = new EntidadTelefono();
            entTelefono.COM_ID = int.Parse(Tcompania);
            entTelefono.TEL_NUMERO = TelNum;
            entTelefono.TEL_PERSONAL = true;
            entTelefono.TEL_ESTADO = true;

            List<EntidadTelefono> listEntTelefono = new List<EntidadTelefono>();
            listEntTelefono.Add(entTelefono);

            //relacionando lista de telefonos a la persona estudiante
            entidadPersona.TBL_TELEFONO = listEntTelefono;
            //info sobre dirección
            EntidadDireccion entDireccion = new EntidadDireccion();
            entDireccion.BAR_ID = int.Parse(barrio);
            entDireccion.DIR_DESCRIPCION = direc;
            entDireccion.DIR_NO_CASA = Ncasa;
            entDireccion.DIR_ESTADO = true;

            List<EntidadDireccion> lisEntDireccion = new List<EntidadDireccion>();
            lisEntDireccion.Add(entDireccion);

            entidadPersona.TBL_DIRECCION = lisEntDireccion;

            return negocioEstudiante.GuardarEstudiante(entidadEstudiante);
        }

        //copiaSeguridad
        public void Copia()
        {
            string ConfConexion = ConfigurationManager.ConnectionStrings["dbResidenciaConnectionString"].ConnectionString;
            SqlConnection Conexion = new SqlConnection(ConfConexion);
            string nombre = "dbResidencia " + DateTime.Now.ToString("dd_MM_yyyy") + DateTime.Now.ToString("hh_mm_ss");
            string Backup = "BACKUP DATABASE [dbResidencia] TO  DISK = N'C:\\" + nombre + ".bak'  WITH NOFORMAT, NOINIT,  NAME = N'dbResidencia-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10";
            SqlCommand cmd = new SqlCommand(Backup, Conexion);

            try
            {
                Conexion.Open();
                cmd.ExecuteNonQuery();

            }
            catch (Exception ex)
            {


            }
            Conexion.Close();
        }


    }
}