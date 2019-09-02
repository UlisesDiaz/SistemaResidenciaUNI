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

        public List<EntidadCuarto> CambioCuartosDispibles(int idGenero)
        {


            List<EntidadCuarto> cuartoList = new List<EntidadCuarto>();

            if (idGenero == Util.GenerosID.Femenino)
            {
                dbResidencia.TBL_CUARTO.OrderBy(orden => orden.CUA_NUMERO).Where(cua => cua.CUA_ESTADO == true && cua.CUA_NUMERO >= 22 && cua.CUA_NUMERO < 30).ToList().ForEach(fila =>
                {

                    EntidadCuarto cadaCuarto = new EntidadCuarto();
                    cadaCuarto.CUA_ID = fila.CUA_ID;
                    cadaCuarto.CUA_NUMERO = fila.CUA_NUMERO;

                    cuartoList.Add(cadaCuarto);

                });
            }
            else if (idGenero == Util.GenerosID.Masculino)
            {
                dbResidencia.TBL_CUARTO.OrderBy(orden => orden.CUA_NUMERO).Where(cua => cua.CUA_ESTADO == true && cua.CUA_NUMERO >= 1 && cua.CUA_NUMERO < 29).ToList().ForEach(fila =>
                {
                    EntidadCuarto cadaCuarto = new EntidadCuarto();
                    cadaCuarto.CUA_ID = fila.CUA_ID;
                    cadaCuarto.CUA_NUMERO = fila.CUA_NUMERO;
                    cuartoList.Add(cadaCuarto);
                });
            }
            return cuartoList;
        }

        public int ObtenerUltimoIdCuarto()
        {
            return dbResidencia.TBL_CUARTO.OrderByDescending(dr => dr.CUA_ID).Select(dr => dr.CUA_ID).First();
        }

        //    Procedimiento Mostrar Cuartos
        public List<EntidadCuarto> ObtnerCuartoPorSp()
        {
            return dbResidencia.spMostrarCuartosDisponibles().Select(dr => new EntidadCuarto
            {
                CUA_ID = dr.CUA_ID,
                CUA_NUMERO = dr.CUA_NUMERO,
                CUA_ESTADO = dr.CUA_ESTADO
            }).ToList();
        }
        public List<EntidadEstudianteCuartoSP> ListarEstuCuarto(int n)
        {
            return dbResidencia.ListadoEstuCuartoSP(n).Select(dr => new EntidadEstudianteCuartoSP
            {
                PER_ID = dr.PER_ID,
                PER_PRIMER_NOMBRE = dr.PER_PRIMER_NOMBRE,
                PER_PRIMER_APELLIDO = dr.PER_PRIMER_APELLIDO,
                PER_SEGUNDO_APELLIDO = dr.PER_SEGUNDO_APELLIDO

            }).ToList();
        }

        //public   object mostrarCuartosPorGenero()
        //{
        //    object numeroCuarto=null;

        //    var cuarto = from c in dbResidencia.TBL_CUARTO
        //                 where c.CUA_ESTADO==true && c.CUA_NUMERO >=22 && c.CUA_NUMERO<30 
        //                 select c;
        //       foreach(var c in cuarto)
        //        {
        //          numeroCuarto = c;      

        //        }
        //    return numeroCuarto;
        //    }

    }

}

