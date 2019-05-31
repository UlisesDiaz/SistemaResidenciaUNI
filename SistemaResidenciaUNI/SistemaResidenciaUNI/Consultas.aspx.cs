using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
            //if(!IsPostBack)
            //ObtenerCuartosPorSp();
        }

        //void ObtenerCuartosPorSp()
        //{
        //    ddListaCuartos.DataSource = negCuarto.ObtnerCuartoPorSp();
        //    ddListaCuartos.DataTextField = "CUA_NUMERO";
        //    ddListaCuartos.DataValueField = "CUA_ID";
        //    ddListaCuartos.DataBind();
        //}

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
    }
}



