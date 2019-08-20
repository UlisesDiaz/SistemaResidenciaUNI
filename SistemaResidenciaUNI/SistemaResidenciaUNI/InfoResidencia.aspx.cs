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


    }
}

    




