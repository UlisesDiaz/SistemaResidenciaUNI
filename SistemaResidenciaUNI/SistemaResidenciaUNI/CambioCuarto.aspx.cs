using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
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

        }
        void listaEstudiante()
        {
            //if (txtNumCarnet.Text.Trim().Equals(string.Empty))
            //{
            //    throw new Exception(Util.Exception.carnetVacio);
            //}
            //else
            //{
            //    gridEstudianteAmover.DataSource = negocioEstudiante.N_obtenerInfoEstudianteAmover(txtNumCarnet.Text);
            //    gridEstudianteAmover.DataBind();
            //}
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

        public static string ajaxHistorialCuaroEstudiante(string carnet)
        {
            var serializer = new JavaScriptSerializer();
            var json = string.Empty;

            List<EntidadHistorialCuarto> histoerialCuarto = null;
            try
            {
                histoerialCuarto = (new NegocioEstudiante()).N_HistorialEstudianteCuarto(carnet);
                json = serializer.Serialize(histoerialCuarto);
            }
            catch (Exception ex )
            {
                
            }


            return json;


        }
    }
}

