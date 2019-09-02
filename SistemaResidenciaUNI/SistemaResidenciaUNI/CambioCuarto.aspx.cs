using System;
using System.Collections.Generic;
using CapaNegocio;
using CapaEntidades;
using System.Web.Script.Services;
using System.Web.Script.Serialization;

namespace SistemaResidenciaUNI
{
    public partial class CambioCuarto : System.Web.UI.Page
    {
        NegocioEstudiante negocioEstudiante = new NegocioEstudiante();
        protected void Page_Load(object sender, EventArgs e)
        {

            cuartosDisponibles();

        }

        void cuartosDisponibles()
        {
            NegocioEstudiante negocioEstudiante = new NegocioEstudiante();

            DdlCuarDis.DataSource = negocioEstudiante.CambioCuartosDisponibles(1);
            DdlCuarDis.DataTextField = "CUA_NUMERO";
            DdlCuarDis.DataValueField = "CUA_ID";
            DdlCuarDis.DataBind();
        }

        [System.Web.Services.WebMethod]
        [ScriptMethod()]
        public static string ajaxInfoEstudianteSegunCarnet(string numCarnet)
        {
            var serializer = new JavaScriptSerializer();
            var json = string.Empty;
            EntidadspMoverEstudianteDeCuarto info = null;
            try
            {
                info = (new NegocioEstudiante()).N_obtenerInfoEstudianteAmover(numCarnet);
                json = serializer.Serialize(new { Data = info, error = "" });

            }
            catch (Exception ex)
            {
                json = serializer.Serialize(new { Data = info, error = ex.Message });

            }
            return json;
        }

        [System.Web.Services.WebMethod]
        [ScriptMethod()]
        public static string ajaxHistorialCuaroEstudiante(string numCarnet)
        {
            var serializer = new JavaScriptSerializer();
            var json = string.Empty;

            List<EntidadHistorialCuarto> historialCuarto = null;
            try
            {
                historialCuarto = (new NegocioEstudiante()).N_HistorialEstudianteCuarto(numCarnet);
                json = serializer.Serialize(new { Data = historialCuarto, error = "" });
            }
            catch (Exception ex)
            {
                json = serializer.Serialize(new { Data = json, error = ex.Message });
            }
            return json;
        }

    }
}

