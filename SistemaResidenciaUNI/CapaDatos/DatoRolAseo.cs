using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidades;

namespace CapaDatos
{
    public class DatoRolAseo
    {
        dbResidenciaEntities dbResidencia = new dbResidenciaEntities();
        Resultado resultado = new Resultado();


        public Resultado GuardarRolAseo(EntidadRolAseo entidadRolAseo)
        {

            resultado = new Resultado();
            TBL_ROL_ASEO TBL_ROL_ASEO = new TBL_ROL_ASEO();
            //TBL_HIS_ROL_ASEO HIS_ROL_ASEO = new TBL_HIS_ROL_ASEO();

            try
            {

                //int UltimoRolAseo = ObtenerUltimoRoldeAseo();
                //HIS_ROL_ASEO.ROL_ASE_ID = UltimoRolAseo;
                //HIS_ROL_ASEO.HIS_ROL_ASE_ESTADO = entidadRolAseo.TBL_HIS_ROL_ASEO.Select(dr => dr.HIS_ROL_ASE_ESTADO).FirstOrDefault();
                //HIS_ROL_ASEO.USU_ID = entidadRolAseo.TBL_HIS_ROL_ASEO.Select(dr => dr.USU_ID).FirstOrDefault();
                //HIS_ROL_ASEO.HIS_ROL_ASE_DESCRIPCION = entidadRolAseo.TBL_HIS_ROL_ASEO.Select(dr => dr.HIS_ROL_ASE_DESCRIPCION).FirstOrDefault();  

                //List<TBL_HIS_ROL_ASEO> ListHisRolAseo= new List<TBL_HIS_ROL_ASEO>();
                //ListHisRolAseo.Add(HIS_ROL_ASEO);

                TBL_ROL_ASEO.TIP_ASE_ID = entidadRolAseo.TIP_ASE_ID;
                TBL_ROL_ASEO.FRE_ID = entidadRolAseo.FRE_ID;
                TBL_ROL_ASEO.EST_ID = entidadRolAseo.EST_ID;
                TBL_ROL_ASEO.USU_ID = entidadRolAseo.USU_ID;
                TBL_ROL_ASEO.ROL_ASE_FECHA_INICIAL = entidadRolAseo.ROL_ASE_FECHA_INICIAL;
                TBL_ROL_ASEO.ROL_ASE_FECHA_FINAL = entidadRolAseo.ROL_ASE_FECHA_FINAL;
                TBL_ROL_ASEO.ROL_ASE_HORA = entidadRolAseo.ROL_ASE_HORA;
                TBL_ROL_ASEO.ROL_ASE_FECHA_DESHABILITADO = entidadRolAseo.ROL_ASE_FECHA_DESHABILITADO;
                TBL_ROL_ASEO.ROL_ASE_DIA = entidadRolAseo.ROL_ASE_DIA;
                TBL_ROL_ASEO.ROL_ASE_ESTADO = true;

                //    int IdUltimoEst = ObtenerUltimoIdEstudiante();
                bool AseoExis = dbResidencia.TBL_ROL_ASEO.Where(fila => fila.EST_ID.Equals(entidadRolAseo.EST_ID) && (fila.ROL_ASE_ESTADO == true) && (fila.TIP_ASE_ID.Equals(entidadRolAseo.TIP_ASE_ID)) && (fila.ROL_ASE_FECHA_INICIAL.Equals(entidadRolAseo.ROL_ASE_FECHA_INICIAL))).Count() > 0;
                if (AseoExis)
                    throw new Exception("Ya se le asigno este rol al estudiante: ");
                dbResidencia.TBL_ROL_ASEO.Add(TBL_ROL_ASEO);
                dbResidencia.SaveChanges();

                resultado.esError = false;

                resultado.mensaje = "Se ha insertado de manera exitosa el registro";

            }

            catch (Exception ex)
            {

                resultado.esError = true;
                resultado.mensaje = "Ha Ocurrido un Error al Momento de Almacenar El Rol de Aseo: " + ex.Message;

                throw new Exception(resultado.mensaje);

            }

            return resultado;

        }


        public int ObtenerUltimoRoldeAseo()
        {
            return dbResidencia.TBL_ROL_ASEO.OrderByDescending(dr => dr.ROL_ASE_ID).Select(dr => dr.ROL_ASE_ID).First();

        }

        public int ObtenerUltimoIdEstudiante()
        {
            return dbResidencia.TBL_ROL_ASEO.OrderByDescending(dr => dr.EST_ID).Select(dr => dr.EST_ID).First();
        }


        public object ObtenerListaFrecuencia()
        {
            object Frecuencia = null;
            try
            {
                Frecuencia = dbResidencia.TBL_FRECUENCIA.Select(dr => new
                {
                    dr.FRE_ID,
                    dr.FRE_DESCRIPCION,

                }).ToList();

            }
            catch (Exception)
            {
            }
            return Frecuencia;
        }

        public List<EntidadEstuCantidadAsignada> CantidadAseosp(int n)
        {

            return dbResidencia.MostarEstuAsignacionSP(n).Select(dr => new EntidadEstuCantidadAsignada
            {
                EST_ID = dr.EST_ID.HasValue ? dr.EST_ID.Value : 0,
                EST_CARNET = dr.EST_CARNET,
                Estudiante = dr.Estudiante,
                Cantidad_de_Aseos_Asignados = dr.Cantidad_de_Aseos_Asignados.HasValue ? dr.Cantidad_de_Aseos_Asignados.Value : 0,
                COR_DEFINICION =dr.COR_DEFINICION

            }).ToList();

        }



    }
}
