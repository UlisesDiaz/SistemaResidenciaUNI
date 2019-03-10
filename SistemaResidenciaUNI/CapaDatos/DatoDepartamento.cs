using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidades;
namespace CapaDatos
{
    public class DatoDepartamento
    {
        dbResidenciaEntities dbResidencia = new dbResidenciaEntities();

        public Resultado GuardarNuevoDeparamento(EntidadDepartamento EntidadDepartamento)
        {
            using (var dbContextTransaction = dbResidencia.Database.BeginTransaction())
            {
                Resultado resultado = new Resultado();
                TBL_DEPARTAMENTO TBL_DEPARTAMENTO = new TBL_DEPARTAMENTO();
                try
                {
                    TBL_DEPARTAMENTO.DEP_NOMBRE = EntidadDepartamento.DEP_NOMBRE;

                    dbResidencia.TBL_DEPARTAMENTO.Add(TBL_DEPARTAMENTO);
                    dbResidencia.SaveChanges();
                    resultado.esError = false;

                    dbContextTransaction.Commit();
                }
                catch (Exception ex)
                {
                    dbContextTransaction.Rollback();
                    resultado.esError = true;
                    resultado.mensaje = "Ha ocurrido un error al momento de almacenar el Departamento: " + ex.Message;
                }

                return resultado;
            }
        }

        public Resultado ObtenerDepartamentos()
        {
            Resultado resultado = new Resultado();

            try
            {
                List<EntidadDepartamento> departamentoList = new List<EntidadDepartamento>();

                dbResidencia.TBL_DEPARTAMENTO.ToList().ForEach(dr =>
                {
                    EntidadDepartamento departamento = new EntidadDepartamento();
                    departamento.DEP_ID = dr.DEP_ID;
                    departamento.DEP_NOMBRE = dr.DEP_NOMBRE;

                    departamentoList.Add(departamento);

                });
                resultado.data = departamentoList;
                resultado.esError = false;
            }
            catch (Exception ex)
            {

                resultado.esError = true;
                resultado.mensaje = "Ha ocurrido un error al momento de almacenar el Departamento: " + ex.Message;
            }

            return resultado;
        }
    }
}
