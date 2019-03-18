using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
   public class DatoBarrio
    {
        dbResidenciaEntities dbResidencia = new dbResidenciaEntities();
        public Resultado ObtenerBarrioPorMunicipioId(int munId)
        {
            Resultado resultado = new Resultado();

            try
            {
                List<EntidadBarrio> barrioList = new List<EntidadBarrio>();

                dbResidencia.TBL_BARRIO.Where(dr => dr.MUN_ID == munId).ToList().ForEach(dr =>
                {
                    EntidadBarrio barrio = new EntidadBarrio();

                    barrio.BAR_ID = dr.BAR_ID;
                    barrio.MUN_ID = dr.MUN_ID;
                    barrio.BAR_NOMBRE = dr.BAR_NOMBRE;

                    barrioList.Add(barrio);
                });

                resultado.data = barrioList;
                resultado.esError = false;

            }
            catch (Exception ex)
            {

                resultado.esError = true;
                resultado.mensaje = ex.Message + "  A ocurrido un error";
            }

            return resultado;
        }
    }
}
