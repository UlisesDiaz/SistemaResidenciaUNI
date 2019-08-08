using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaNegocio;

namespace SistemaResidenciaUNI
{
    public partial class Detalle_Estudiante : System.Web.UI.Page
    {

        NegocioEstudiante negocioEstudiante = new NegocioEstudiante();
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [System.Web.Services.WebMethod]
        [ScriptMethod()]
      
        public static string Detalle_Estudiantes()
        {
            object Detalle=null;
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