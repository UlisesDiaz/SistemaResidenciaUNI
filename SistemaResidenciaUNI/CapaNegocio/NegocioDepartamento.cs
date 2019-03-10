using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;
using CapaEntidades;
namespace CapaNegocio
{
  public  class NegocioDepartamento
    {
        DatoDepartamento datoDepartamento = new DatoDepartamento();
        public Resultado ObtenerDepartamento()
        {
            return datoDepartamento.ObtenerDepartamentos();
        }
    }
}
