using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaEntidades;
using CapaNegocio;

namespace SistemaResidenciaUNI
{
    public partial class PruebaDatatable : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {



        }


        [WebMethod]
        public static object ListaEstu(string n)
        {

            NegocioEstudiante estd = new NegocioEstudiante();
            List<EntidadPersona> lista = new List<EntidadPersona>();

            int id = Convert.ToInt32(n);
            lista = estd.ObtnerEstudiantePorCuarto(id);
            object JSON = new { data = lista };

            return JSON;
        }

        [WebMethod]

        public static string MostrarEstudianteGuardados()
        {
            List<EntidadspEstudiantesGuardados> lista = new List<EntidadspEstudiantesGuardados>();

            NegocioEstudiante nEstudiante = new NegocioEstudiante();
            var serializer = new JavaScriptSerializer();
            var json = string.Empty;
            try
            {
                lista = nEstudiante.N_MostraEstudianteGuardados();
                json = serializer.Serialize(new { Data = lista, error = "" });

            }
            catch (Exception ex)
            {
                json = serializer.Serialize(new { Data = lista, error = ex.Message });

            }
            return json;

        }

    }
}