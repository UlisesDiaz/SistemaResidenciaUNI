using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaEntidades;
using CapaNegocio;
using System.Data;
using System.Text;
using System.Net;
using System.Net.Mail;
using System.Data.SqlClient;

namespace SistemaResidenciaUNI
{

    public partial class AsignacionAseo : System.Web.UI.Page
    {

        NegocioCuarto Cuarto = new NegocioCuarto();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Page.Form.Attributes.Add("enctype", "multipart/form-data");
                if (!Page.IsPostBack)
                {
                    LlenarListas();
                }
            }
            catch (Exception ex)
            {
                string script = string.Format("alert('{0}');", ex.Message);
                ClientScript.RegisterClientScriptBlock(typeof(Page), "PageLoadError", script, true);
            }
            

        }

       

      
        void ListarEstudiantesCuarto(int Cuarto)
        {

            NegocioCuarto Cuar = new NegocioCuarto();

            ddlEstu.DataSource = Cuar.ListadoCuarto(Cuarto);
            ddlEstu.DataTextField = "PER_PRIMER_NOMBRE";
            ddlEstu.DataValueField = "PER_ID";
            ddlEstu.DataBind();
       
        }

        void LlenarListas()
        {

            NegocioRolAseo frecuencia = new NegocioRolAseo();
            NegocioTipoAseo Tipo = new NegocioTipoAseo();

            ddlTipoAseo.DataSource = Tipo.ObtenerTipoAseo();
            ddlTipoAseo.DataTextField = "TIP_ASE_DESCRIPCION";
            ddlTipoAseo.DataValueField = "TIP_ASE_ID";
            ddlTipoAseo.DataBind();

            ddlFrecuencia.DataSource = frecuencia.ObtenerListaFrecuencia();
            ddlFrecuencia.DataTextField = "FRE_DESCRIPCION";
            ddlFrecuencia.DataValueField = "FRE_ID";
            ddlFrecuencia.DataBind();


            ddlCuarto.DataSource = Cuarto.ObtenerCuartos();
            ddlCuarto.DataTextField = "CUA_NUMERO";
            ddlCuarto.DataValueField = "CUA_ID";
            ddlCuarto.DataBind();

        }


        //GUARDAR ASEO***

        Resultado GuardarRolAseo()
        {

            NegocioRolAseo RolAseo = new NegocioRolAseo();
            EntidadRolAseo EntiRolAseo = new EntidadRolAseo();

            //EntidadHisRolAseo HisRolAseo = new EntidadHisRolAseo();
            //HisRolAseo.HIS_ROL_ASE_ESTADO = true;
            //HisRolAseo.USU_ID = 2;
            //HisRolAseo.HIS_ROL_ASE_DESCRIPCION = string.Empty; //Dato cambia Despues de Verificar si se realizo o no el aseo.

            //List<EntidadHisRolAseo> ListaHisRolAseo = new List<EntidadHisRolAseo>();

            //ListaHisRolAseo.Add(HisRolAseo);

            //EntiRolAseo.TBL_HIS_ROL_ASEO = ListaHisRolAseo;


            EntiRolAseo.FRE_ID = int.Parse(ddlFrecuencia.SelectedValue);
            EntiRolAseo.EST_ID = int.Parse(ddlEstu.SelectedValue);
            EntiRolAseo.USU_ID = 2;
            EntiRolAseo.TIP_ASE_ID = int.Parse(ddlTipoAseo.SelectedValue);
            EntiRolAseo.ROL_ASE_FECHA_INICIAL = DateTime.Parse(TxtFechaIni.Value.ToString());
            EntiRolAseo.ROL_ASE_FECHA_FINAL = DateTime.Parse(TxtFechaFin.Value.ToString());

            //Poner Hora caja  no olvidar
            EntiRolAseo.ROL_ASE_HORA = null;
            EntiRolAseo.ROL_ASE_FECHA_DESHABILITADO = null;

            EntiRolAseo.ROL_ASE_DIA = int.Parse(TxtDia.Text);
            EntiRolAseo.ROL_ASE_ESTADO = true;

            return RolAseo.GuardarRolAseo(EntiRolAseo);

        }


        void LlenarEstudianteCuarto(int idcuarto)
        {
            NegocioCuarto Cuarto = new NegocioCuarto();
            ddlEstu.DataSource = Cuarto.ListadoCuarto(idcuarto);
            ddlEstu.DataTextField = "PER_PRIMER_NOMBRE";
            ddlEstu.DataValueField = "PER_ID";
            ddlEstu.DataBind();

        }

        protected void BtnAsignar_Click(object sender, EventArgs e)
        {
            try
            {
                Resultado resul = GuardarRolAseo();

                if (resul.esError)
                {
                    throw new Exception(resul.mensaje);
                }
                else
                {

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

        protected void ddlCuarto_SelectedIndexChanged(object sender, EventArgs e)
        {
            LlenarEstudianteCuarto(int.Parse(ddlCuarto.SelectedValue));

        }


        

        public static string ConvertToHtmlFile(DataTable targetTable)
        {
            string myHtmlFile = "";


            if (targetTable == null)
            {
                throw new System.ArgumentNullException("targetTable");
            }
            else
            {
                //Continue.
            }


            //Get a worker object.
            StringBuilder myBuilder = new StringBuilder();

            
            //Open tags and write the top portion.
            myBuilder.Append("<html xmlns='http://www.w3.org/1999/xhtml'>");
            myBuilder.Append("<head>");
            myBuilder.Append("<title>");
            myBuilder.Append("Page-");
            myBuilder.Append(Guid.NewGuid().ToString());
            myBuilder.Append("</title>");
            myBuilder.Append("</head>");
            

            //inicioPrueba
            myBuilder.Append("<body style='margin: 0; padding: 0;'>");
            myBuilder.Append("<style type='text/css>'");
            myBuilder.Append("@import url('https://fonts.googleapis.com/css?family=Roboto:400,400i,500,700,900i&display=swap');");
            myBuilder.Append("*{font - family: 'Roboto', sans-serif;}");
            myBuilder.Append("</style>");
            myBuilder.Append("<table align='center' border='1' cellpadding='0' cellspacing='0' ; style='border-collapse: collapse;'>");
            myBuilder.Append("<tr>");
            myBuilder.Append("<td bgcolor='#FFFFFF' align='center' style=' padding: 10px 0 10px 0;'>");

            myBuilder.Append("<img src='https://dl.dropboxusercontent.com/s/qn425djksovlzp8/UNI-LOGO-1024x764.png' alt='LogoUNI' width='150' height='100' style='display: block;'>");
            
            myBuilder.Append("</td>");

            myBuilder.Append("</tr>");

            myBuilder.Append("<tr>");
            myBuilder.Append("<td bgcolor='#091C65' align='center' style='border-top-right-radius: 10px; border-top-left-radius: 10px; padding: 10px 0 10px 0;'>");
            myBuilder.Append("<h3 style='color: white;'>Universidad Nacional De Ingenieria</h3>");
            myBuilder.Append("</td>");
            myBuilder.Append("</tr>");

            myBuilder.Append("<tr>");
            myBuilder.Append("<td bgcolor='#66A8D4' align='center'>");
            myBuilder.Append("<table border='0' cellpadding='0' cellspacing='0' width='100%' >");

            myBuilder.Append("<tr width='500'>");
            myBuilder.Append("<td bgcolor='#D5D5D5' align='center'>");
            myBuilder.Append("<img src='https://dl.dropboxusercontent.com/s/2wown7ekeh46rtv/email.png'  alt='LogoRLP' width='700' height='200' style='display: block;'>");
            myBuilder.Append("</td>");
            myBuilder.Append("</tr> ");


            myBuilder.Append("<tr width='500'>");
            myBuilder.Append("<td bgcolor='#091C65' align='center'>");
            myBuilder.Append("<h3 style='color: white;'>Sistema de Residencia UNI</h3>");
            myBuilder.Append("</td>");
            myBuilder.Append("</tr>");

            myBuilder.Append("<tr width='500'>");
            myBuilder.Append("<td bgcolor='#EFEFEF' align='center' style='font-family:sans-serif;'>");
            myBuilder.Append("<h4>Se te han asignado roles de Aseo Abajo se te mostraran tus actividades!</h4>");
            myBuilder.Append("</td>");
            myBuilder.Append("</tr>");//Tabla c# despues de esta linea






            myBuilder.Append("</table>");
            myBuilder.Append("</td>");
            myBuilder.Append("</tr>");
            myBuilder.Append("<tr>");
            myBuilder.Append("<td bgcolor='#D5D5D5'>");
            myBuilder.Append("<table border='1px' cellpadding='5' cellspacing='0' width='100%' >");

            //Add the headings row.


            myBuilder.Append("<tr align='left' valign='top'>");


            foreach (DataColumn myColumn in targetTable.Columns)
            {
                myBuilder.Append("<td align='left' valign='top'>");
                myBuilder.Append(myColumn.ColumnName);
                myBuilder.Append("</td>");
            }


            myBuilder.Append("</tr>");


            //Add the data rows.
            foreach (DataRow myRow in targetTable.Rows)
            {
                myBuilder.Append("<tr align='left' valign='top'>");


                foreach (DataColumn myColumn in targetTable.Columns)
                {
                    myBuilder.Append("<td align='left' valign='top' bgcolor='#D5D5D5'>");
                    myBuilder.Append(myRow[myColumn.ColumnName].ToString());
                    myBuilder.Append("</td>");
                }


                myBuilder.Append("</tr>");
            }


            myBuilder.Append("</table>");
            myBuilder.Append("</td>");
            myBuilder.Append("</tr>");
            myBuilder.Append("</table>");
            myBuilder.Append("</body>");
            myBuilder.Append("</html>");






            //finprueba
            
            //Get the string for return.
            myHtmlFile = myBuilder.ToString();


            return myHtmlFile;
        }

        //protected void pruebabtn_Click(object sender, EventArgs e)
        //{

        //    SqlConnection Conexion= new SqlConnection("Data Source=.;Initial Catalog=dbResidencia;Integrated Security=True");
        //    Conexion.Open();
        //    SqlCommand cmd = new SqlCommand("SpMostrarAsignacion",Conexion);
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    cmd.Parameters.Add(new SqlParameter("@Estudent", 1020));
        //    SqlDataAdapter cm = new SqlDataAdapter(cmd);

           

        //    DataTable dt = new DataTable();
        //    cm.Fill(dt);

        //    Conexion.Close();

        //    String datos = ConvertToHtmlFile(dt);

        //    MailMessage msg = new MailMessage();

        //    msg.To.Add("jacuabarrios@gmail.com");
        //    msg.From = new MailAddress("jonathanacunabarrios@gmail.com", "Jonathan Acuña Barrios", Encoding.UTF8);
        //    msg.Subject = "PRUEBA";
        //    msg.SubjectEncoding = Encoding.UTF8;
        //    msg.Body = datos;
        //    msg.IsBodyHtml = true;
        //    //msg.BodyEncoding = Encoding.UTF8;
            

        //    SmtpClient clienteSmtp = new SmtpClient();
        //    clienteSmtp.EnableSsl = true;
        //    clienteSmtp.UseDefaultCredentials = false;
        //    clienteSmtp.Port = 587;
        //    clienteSmtp.Host = "smtp.gmail.com";

        //    // Este es el código nuevo

        //    clienteSmtp.Credentials = new NetworkCredential("jonathanacunabarrios@gmail.com", "Jacua1197");


        //    try
        //    {

        //        clienteSmtp.Send(msg);
        //        string enviado = "correcto";
        //        string script = string.Format("alert('{0}');",enviado );
        //        ClientScript.RegisterClientScriptBlock(typeof(Page), "error", script, true);
        //    }

        //    catch (Exception ex)
        //    {


        //        string enviado = "fallo";
        //        string script = string.Format("alert('{0}');", enviado);
        //        ClientScript.RegisterClientScriptBlock(typeof(Page), "error", script, true);


        //    }

        //}

            [WebMethod]
        public static void SENDMAIL (string IDEstu, string correoEstu) {

            ClientScriptManager ClientScript = null;

            int EstID = int.Parse(IDEstu);
            string CorreoTo = correoEstu;

            if (CorreoTo == null)
            {
                string enviado = "El Estudiante No Tiene Correo Definido";
                string script = string.Format("alert('{0}');", enviado);
                ClientScript.RegisterClientScriptBlock(typeof(Page), "error", script, true);
            }


            SqlConnection Conexion = new SqlConnection("Data Source=.;Initial Catalog=dbResidencia;Integrated Security=True");
            Conexion.Open();
            SqlCommand cmd = new SqlCommand("SpMostrarAsignacion", Conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@Estudent", EstID));
            SqlDataAdapter cm = new SqlDataAdapter(cmd);



            DataTable dt = new DataTable();
            cm.Fill(dt);

            Conexion.Close();

            String datos = ConvertToHtmlFile(dt);

            MailMessage msg = new MailMessage();

            msg.To.Add("jacuabarrios@gmail.com");
            msg.From = new MailAddress("jonathanacunabarrios@gmail.com", "Jonathan Acuña Barrios", Encoding.UTF8);
            msg.Subject = "PRUEBA";
            msg.SubjectEncoding = Encoding.UTF8;
            msg.Body = datos;
            msg.IsBodyHtml = true;
            //msg.BodyEncoding = Encoding.UTF8;


            SmtpClient clienteSmtp = new SmtpClient();
            clienteSmtp.EnableSsl = true;
            clienteSmtp.UseDefaultCredentials = false;
            clienteSmtp.Port = 587;
            clienteSmtp.Host = "smtp.gmail.com";

            // Este es el código nuevo

            clienteSmtp.Credentials = new NetworkCredential("jonathanacunabarrios@gmail.com", "Jacua1197");

            

            try
            {
                

                clienteSmtp.Send(msg);
                string enviado = "Notificacion por Correo Enviada Exitosamente";
                string script = string.Format("alert('{0}');", enviado);
                ClientScript.RegisterClientScriptBlock(typeof(Page), "error", script, true);
            }

            catch (Exception ex)
            {


                string enviado = "El envio Fallo Verifique la Conexion a Internet o que el Correo sea Valido";
                string script = string.Format("alert('{0}');", enviado);
                ClientScript.RegisterClientScriptBlock(typeof(Page), "error", script, true);


            }

        }

        [WebMethod]
        public static Object ListarCuarto()
        {
            NegocioCuarto Cuarto = new NegocioCuarto();

            

            object JSON = new { data = Cuarto.ObtenerCuartos() };

            return JSON;
        }

        [WebMethod]
        public static Object ListarCantAseo(string idCuarto) {

            NegocioRolAseo Rol = new NegocioRolAseo();

            int CuartoID = int.Parse(idCuarto);

            

            object JSON = new { data = Rol.ListarCantAsignacion(CuartoID) };

            return JSON;

        }


    }
}