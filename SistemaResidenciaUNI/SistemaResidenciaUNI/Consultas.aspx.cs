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
    public partial class Consultas : System.Web.UI.Page
    {
        NegocioCuarto negCuarto = new NegocioCuarto();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                ObtenerCuartosPorSp();
        }

        void ObtenerCuartosPorSp()
        {
            ddListaCuartos.DataSource = negCuarto.ObtnerCuartoPorSp();
            ddListaCuartos.DataTextField = "CUA_NUMERO";
            ddListaCuartos.DataValueField = "CUA_ID";
            ddListaCuartos.DataBind();
        }

        void ObtenerEstudiantePorNumCuarto(int NumCuarto)
        {
            //LLenar lista de Estudiantes Por Numero de Cuarto
            NegocioEstudiante Estudiante = new NegocioEstudiante();
            ddlNombres.DataSource = Estudiante.ObtnerEstudiantePorCuarto(NumCuarto);
            ddlNombres.DataTextField = "PER_NOMBRE_COMPLETO";
            ddlNombres.DataValueField = "PER_ID";
            ddlNombres.DataBind();
        }
        protected void ddListaCuartos_SelectedIndexChanged(object sender, EventArgs e)
        {
            ObtenerEstudiantePorNumCuarto(int.Parse(ddListaCuartos.SelectedValue));
        }

        [System.Web.Services.WebMethod]
        [ScriptMethod()]
        public static string ObtenerEventos(string start, string end)
        {
            DateTime startD = new DateTime(int.Parse(start.Split('-')[0]), int.Parse(start.Split('-')[1]), int.Parse(start.Split('-')[2]));
            DateTime endD = new DateTime(int.Parse(end.Split('-')[0]), int.Parse(end.Split('-')[1]), int.Parse(end.Split('-')[2]));
            var eventos = (new NegocioEstudiante()).ObtenerEventos(startD, endD);

            var serialize = new JavaScriptSerializer();

            var json = serialize.Serialize(eventos);

            return json;
        }
        [System.Web.Services.WebMethod]
        [ScriptMethod()]
        public static string ObtenerDetalleAseoSegunEvento(string cuaNum, string start)
        {
            DateTime startDa = new DateTime(int.Parse(start.Split('-')[0]), int.Parse(start.Split('-')[1]), int.Parse(start.Split('-')[2]));
            var eventos = (new NegocioEstudiante()).ObtenerDetalleAseoSegunEvento(int.Parse(cuaNum), startDa);

            var serialize = new JavaScriptSerializer();

            var json = serialize.Serialize(eventos);

            return json;
        }
    }
}



