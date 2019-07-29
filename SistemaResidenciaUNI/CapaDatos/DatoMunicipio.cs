using System;
using System.Collections.Generic;
using System.Linq;
using CapaEntidades;

namespace CapaDatos
{
    public class DatoMunicipio
    {

        dbResidenciaEntities dbResidencia = new dbResidenciaEntities();
        
        public Resultado ObtenerMunicipioPorDepartamentoId(int depId)
        {
            Resultado resultado = new Resultado();

            try
            {
                List<EntidadMunicipio> municipioLista = new List<EntidadMunicipio>();

                dbResidencia.TBL_MUNICIPIO.Where(dr => dr.DEP_ID == depId).ToList().ForEach(dr =>
                {
                    EntidadMunicipio municipio = new EntidadMunicipio();

                    municipio.DEP_ID = dr.DEP_ID;
                    municipio.MUN_ID = dr.MUN_ID;
                    municipio.MUN_NOMBRE = dr.MUN_NOMBRE;

                    municipioLista.Add(municipio);
                });

                resultado.data = municipioLista;
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
