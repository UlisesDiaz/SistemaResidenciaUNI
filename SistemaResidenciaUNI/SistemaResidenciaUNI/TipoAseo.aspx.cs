using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using CapaNegocio;
using CapaEntidades;
using System.Web.Services;





namespace SistemaResidenciaUNI
{
    public partial class TipoAseo : System.Web.UI.Page
    {
        NegocioTipoAseo NTipoAseo = new NegocioTipoAseo();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //METODOS**

        protected void BtnGuardar_Click(object sender, EventArgs e)
        {

            try
            {
                Resultado resul = GuardarAseo();

                if (resul.esError)
                {
                    throw new Exception(resul.mensaje);
                }
                else
                {
                    LimpiarControles();
                    string script = string.Format("alert('{0}');", resul.mensaje);
                    ClientScript.RegisterClientScriptBlock(typeof(Page), "successfull", script, true);

                }


            }

            catch (Exception ex)
            {

                string script = string.Format("alert('{0}');", ex.Message);
                ClientScript.RegisterClientScriptBlock(typeof(Page), "error", script, true);
            }


        }


        Resultado GuardarAseo()
        {
            EntidadTipoAseo entidadtipoaseo = new EntidadTipoAseo();

            entidadtipoaseo.TIP_ASE_DESCRIPCION = TxtNuevoAseo.Text;
            entidadtipoaseo.TIP_ASE_ESTADO = true;

            return NTipoAseo.GuardarNuevoAseo(entidadtipoaseo);


        }

        void LimpiarControles()
        {

            TxtTipoAseo.Text = string.Empty;
        }


        [WebMethod]
        public static object listaraseo()
        {
            List<EntidadTipoAseosp> lista = new List<EntidadTipoAseosp>();
            NegocioTipoAseo naseo = new NegocioTipoAseo();

            lista = naseo.ObtenerTipoAseo();

            object Json = new { data = lista };

            return Json;




        }


        [WebMethod]

        public static bool ActualizarTipoAseo(string id, string descrip)
        {
            bool resultado;

            NegocioTipoAseo naseo = new NegocioTipoAseo();
            int idTA = Convert.ToInt32(id);
            resultado = naseo.ModificarTipAseo(idTA, descrip);


            return resultado;

        }


        [WebMethod]

        public static bool DeleteAseo(string id)
        {
            NegocioTipoAseo naseo = new NegocioTipoAseo();
            int IdAseo = Convert.ToInt32(id);
            bool resul = naseo.EliminarAseo(IdAseo);




            return resul;

        }


    }
}