using System;
using System.Collections.Generic;
using System.Linq;
using CapaEntidades;
namespace CapaDatos
{
    public class DatoCuarto
    {
        dbResidenciaEntities dbResidencia = new dbResidenciaEntities();
        public Resultado GuardarNuevoCuarto(EntidadCuarto EntidadCuarto)
        {
            Resultado resultado = new Resultado();
            TBL_CUARTO TBL_CUARTO = new TBL_CUARTO();
            try
            {
                int numCuarto = EntidadCuarto.CUA_NUMERO;

                bool existeCuarto = dbResidencia.TBL_CUARTO.Where(fila => fila.CUA_NUMERO.Equals(numCuarto)).Count() > 0;
                if (existeCuarto)
                    throw new Exception("Ya existe un cuarto con el número: " + numCuarto);
                TBL_CUARTO.CUA_NUMERO = EntidadCuarto.CUA_NUMERO;
                TBL_CUARTO.CUA_ESTADO = EntidadCuarto.CUA_ESTADO;
                dbResidencia.TBL_CUARTO.Add(TBL_CUARTO);
                dbResidencia.SaveChanges();
                resultado.esError = false;
            }
            catch (Exception ex)
            {
                resultado.esError = true;
                resultado.mensaje = "Ha ocurrido un error al momento de almacenar el cuarto: " + ex.Message;
            }

            return resultado;
        }

        public List<EntidadCuarto> ObtenerCuartos()
        {
            List<EntidadCuarto> cuartoLista = new List<EntidadCuarto>();
            //se extrae lista ordenada ascendente y cuartos que estén activos
            dbResidencia.TBL_CUARTO.OrderBy(fila => fila.CUA_NUMERO).Where(fila => fila.CUA_ESTADO == true).ToList().ForEach(fila =>
            {
                EntidadCuarto cadaCuarto = new EntidadCuarto();
                cadaCuarto.CUA_ID = fila.CUA_ID;
                cadaCuarto.CUA_NUMERO = fila.CUA_NUMERO;
                cadaCuarto.CUA_ESTADO = fila.CUA_ESTADO;
                
                cuartoLista.Add(cadaCuarto);
            });
            return cuartoLista;
        }
    }
}
