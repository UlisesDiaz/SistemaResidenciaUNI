﻿using System;
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
                EntidadPersona entPer = (new NegocioEstudiante()).InfoEstudiantePorCarnet(txtNumCarnet.Text);
                if (entPer != null)
                {
                    lblNombres.Text = entPer.PER_NOM_APE_COMPLETO == null ? string.Empty : entPer.PER_NOM_APE_COMPLETO.ToUpper();
                    lblApellidos.Text = entPer.PER_APELLI_COMPLETO.ToUpper();
                    lblFechaNacimiento.Text = entPer.PER_FECHA_NACIMIENTO.ToString("dd/MM/yyyy");
                    lblGenero.Text = entPer.PER_GENERO.ToUpper();
                    lblEstadoCivil.Text = string.Empty;
                    lblDirecion.Text = entPer.PER_DIECCION == null ? string.Empty : entPer.PER_DIECCION.ToUpper();
                    lblTelefono1.Text = entPer.PER_CELULAR == null ? string.Empty : entPer.PER_CELULAR;
                    lblCorreo.Text = entPer.PER_CORREO == null ? string.Empty : entPer.PER_CORREO;
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
            lblNombres.Text =string.Empty;
            lblApellidos.Text = string.Empty;
            lblFechaNacimiento.Text = string.Empty;
            lblGenero.Text = string.Empty;
            lblEstadoCivil.Text = string.Empty;
            lblDirecion.Text = string.Empty;
            lblTelefono1.Text = string.Empty;
            lblCorreo.Text = string.Empty;
        }
        protected void btnBuscarCarnet_Click(object sender, EventArgs e)
        {
            MostrarEstudiante();
        }
    }
}