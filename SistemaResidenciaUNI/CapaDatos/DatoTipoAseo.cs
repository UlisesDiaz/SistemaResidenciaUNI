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


        public Resultado GuardarTipoAseo(EntidadTipoAseo entidadtipoaseo)
        {
            Resultado resultado = new Resultado();
            TBL_TIPO_ASEO TBL_TIPO_ASEO = new TBL_TIPO_ASEO();
            try
            {
                TBL_TIPO_ASEO.TIP_ASE_DESCRIPCION = entidadtipoaseo.TIP_ASE_DESCRIPCION;
                TBL_TIPO_ASEO.TIP_ASE_ESTADO = true;


                bool AseoExistente = dbRecidencia.TBL_TIPO_ASEO.Where(fila => fila.TIP_ASE_DESCRIPCION.Equals(entidadtipoaseo.TIP_ASE_DESCRIPCION)).Count() > 0;
                if (AseoExistente)
                    throw new Exception("Ya existe este aseo en sistema");

                dbRecidencia.TBL_TIPO_ASEO.Add(TBL_TIPO_ASEO);
                dbRecidencia.SaveChanges();

                resultado.esError = false;
                resultado.mensaje = "Se ha añadido correctamente el nuevo de aseo";

            }

            catch (Exception ex)
            {
                resultado.esError = true;
                resultado.mensaje = "Hubo un error, no se logro guardar el nuevo de aseo" + ex.Message;
                throw new Exception(resultado.mensaje);
            }

            return resultado;


        }


        public List<EntidadTipoAseosp> ObtenerAseoPorSP()
        {

            return dbRecidencia.SPMostrarTipoAseo().Select(dr => new EntidadTipoAseosp
            {
                TIP_ASE_ID = dr.TIP_ASE_ID,
                TIP_ASE_DESCRIPCION = dr.TIP_ASE_DESCRIPCION,
                ESTADO = dr.ESTADO



            }).ToList();


        }

        public bool EliminarTipoAseo(int id)
        {
            bool transac = false;
            Resultado resultado = new Resultado();
            try
            {
                dbRecidencia.SPDeletelogicaAseo(id);
                dbRecidencia.SaveChanges();
                transac = true;
                resultado.esError = false;
                resultado.mensaje = "Se ha Modifico correctamente el  aseo";
            }
            catch (Exception ex)
            {
                transac = false;
                resultado.esError = true;
                resultado.mensaje = "Hubo un error, no se logro Modificar el aseo" + ex.Message;
                throw new Exception(ex.Message);
            }

            return transac;

        }

        public int ObtenerUltimoTipoAseo()
        {

            return dbRecidencia.TBL_TIPO_ASEO.OrderByDescending(dr => dr.TIP_ASE_ID).Select(dr => dr.TIP_ASE_ID).First();

        }

        public bool EditarTipoAseo(int id, string descrip)
        {
            Resultado resultado = new Resultado();
            bool transac = false;

            try
            {
                dbRecidencia.SPModificacionAseo(id, descrip);
                dbRecidencia.SaveChanges();

                transac = true;
                resultado.esError = false;
                resultado.mensaje = "Se ha Modifico correctamente el  aseo";


            }
            catch (Exception ex)
            {
                transac = false;
                resultado.esError = true;
                resultado.mensaje = "Hubo un error, no se logro Modificar el aseo" + ex.Message;
                throw new Exception(resultado.mensaje);
            }

            return transac;
        }



    }




}

