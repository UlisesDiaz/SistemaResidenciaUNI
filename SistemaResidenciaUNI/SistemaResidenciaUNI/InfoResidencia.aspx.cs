using System;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using CapaNegocio;

namespace SistemaResidenciaUNI
{
    public partial class InfoResidencia : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [System.Web.Services.WebMethod]
        [ScriptMethod()]

        public static object ResultadosInfoResidencia()
        {
            var serializer = new JavaScriptSerializer();
            object info = null;
            var jSon = string.Empty;

            try
            {

                info = (new NegocioEstudiante()).N_infoRecidencia();
                jSon = serializer.Serialize(new { data = info });
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return jSon;
        }


        [System.Web.Services.WebMethod]
        [ScriptMethod()]

        public static string Detalle_Estudiantes()
        {
            object Detalle = null;
            var serializer = new JavaScriptSerializer();
            var json = string.Empty;

            try
            {
                Detalle = (new NegocioEstudiante()).ObtenerListaEstudiantes();
                json = serializer.Serialize(new { Data = Detalle, error = "" });
            }
            catch (Exception ex)
            {
                json = serializer.Serialize(new { Data = json, error = ex.Message });
            }
            return json;
        }

        [System.Web.Services.WebMethod]
        [ScriptMethod()]
        public static string ModalInfo(string Genero)
        {
            object ModalInfo = null;
            var serializer = new JavaScriptSerializer();
            var Json = string.Empty;

            try
            {

                ModalInfo = (new NegocioEstudiante().N_InfoResidentesMujeres(Genero));
                Json = serializer.Serialize(new { Data = ModalInfo, error = "" });

            }
            catch (Exception ex)
            {

                Console.WriteLine("Ha Ocurrido un inconveniente " + ex.Message + " " + ex.StackTrace);

            }
            return Json;

        }
    }
}

