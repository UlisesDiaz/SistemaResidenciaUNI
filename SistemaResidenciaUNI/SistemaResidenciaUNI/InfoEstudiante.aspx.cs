using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaNegocio;
using CapaEntidades;

namespace SistemaResidenciaUNI
{
    public partial class InfoEstudiante : System.Web.UI.Page
    {
        NegocioEstudiante negocioEstudiante = new NegocioEstudiante();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        void MostrarEstudiante()
        {
            try
            {
                if (txtNumCarnet.Text.Trim().Equals(string.Empty))
                    throw new Exception(Util.Exception.carnetVacio);
                EntidadInfoEstudianteSP entPer = (new NegocioEstudiante()).InfoEstudiantePorCarnet(txtNumCarnet.Text);
                
                if (entPer != null)
                {
                    lblNombres.Text = entPer.PER_NOM_APE_COMPLETO == null ? string.Empty : entPer.PER_NOM_APE_COMPLETO.ToUpper();
                    lblApellidos.Text = entPer.PER_APELLI_COMPLETO.ToUpper();
                    lblFechaNacimiento.Text = string.Format("{0}/{1}/{2}", entPer.PER_FECHA_NACIMIENTO.Day, entPer.PER_FECHA_NACIMIENTO.Month, entPer.PER_FECHA_NACIMIENTO.Year);
                    lblGenero.Text = entPer.GEN_DESCRIPCION.ToUpper();
                    lblEstadoCivil.Text = string.Empty;
                    lblDirecion.Text = entPer.DIR_DESCRIPCION == null ? string.Empty : entPer.DIR_DESCRIPCION.ToUpper();
                    lblTelefono1.Text = entPer.TEL_NUMERO == null ? string.Empty : entPer.TEL_NUMERO;
                    lblCorreo.Text = entPer.COR_DEFINICION == null ? string.Empty : entPer.COR_DEFINICION;
                    lblCompania.Text = entPer.COM_DESCRIPCION;
                    lblNombreCarrera.Text = entPer.CAR_DESCRIPCION;

                }
                else
                {
                    throw new Exception(string.Format(Util.Exception.estudianteVSCarnetNoEncontrado, txtNumCarnet.Text));
                }

            }
            catch (Exception ex)
            {
                Limpiar();
                string script = string.Format("alert('{0}');", ex.Message);
                ClientScript.RegisterClientScriptBlock(typeof(Page), "ErrorMess", script, true);
            }


        }

        void Limpiar()
        {
            lblNombres.Text = string.Empty;
            lblApellidos.Text = string.Empty;
            lblFechaNacimiento.Text = string.Empty;
            lblGenero.Text = string.Empty;
            lblEstadoCivil.Text = string.Empty;
            lblDirecion.Text = string.Empty;
            lblTelefono1.Text = string.Empty;
            lblCorreo.Text = string.Empty;
            lblTelefono1.Text = string.Empty;
            lblCompania.Text = string.Empty;
        }
        protected void btnBuscarCarnet_Click(object sender, EventArgs e)
        {
            MostrarEstudiante();
        }
    }
}