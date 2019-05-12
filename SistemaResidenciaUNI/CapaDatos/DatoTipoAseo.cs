using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidades;

namespace CapaDatos
{
    public class DatoTipoAseo
    {

        dbResidenciaEntities dbRecidencia = new dbResidenciaEntities();

        public Resultado GuardarNuevoTipoAseo(EntidadTipoAseo EntidadTipoAseo)
        {


            Resultado resultado = new Resultado();

            TBL_TIPO_ASEO TBL_TIPO_ASEO = new TBL_TIPO_ASEO();

            try {

                TBL_TIPO_ASEO.TIP_ASE_DESCRIPCION = EntidadTipoAseo.TIP_ASE_DESCRIPCION;
                TBL_TIPO_ASEO.TIP_ASE_ESTADO = true;
                dbRecidencia.TBL_TIPO_ASEO.Add(TBL_TIPO_ASEO);
                dbRecidencia.SaveChanges();
                resultado.esError = false;

            }

            catch (Exception ex) {
                resultado.esError = true;
                resultado.mensaje = "Ha ocurrido un error al momento de almacenar el Tipo Aseo: " + ex.Message;
            }



            return resultado;

        }

        public List<EntidadTipoAseo> ObtenerTipoAseo()
        {

            List<EntidadTipoAseo> TipoAseolista = new List<EntidadTipoAseo>();

            dbRecidencia.TBL_TIPO_ASEO.OrderBy(fila => fila.TIP_ASE_DESCRIPCION).ToList().ForEach(fila =>
            {

                EntidadTipoAseo cadatipoaseo = new EntidadTipoAseo();

                cadatipoaseo.TIP_ASE_ID = fila.TIP_ASE_ID;
                cadatipoaseo.TIP_ASE_DESCRIPCION = fila.TIP_ASE_DESCRIPCION;
                cadatipoaseo.TIP_ASE_ESTADO = fila.TIP_ASE_ESTADO;


                TipoAseolista.Add(cadatipoaseo);


            });

            return TipoAseolista;

        }

        public int ObtenerUltimoTipoAseo()
        {

            return dbRecidencia.TBL_TIPO_ASEO.OrderByDescending(dr => dr.TIP_ASE_ID).Select(dr => dr.TIP_ASE_ID).First();

        }



    }



   
}
    

