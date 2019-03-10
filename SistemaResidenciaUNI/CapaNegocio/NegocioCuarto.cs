using CapaDatos;
using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{

    public class NegocioCuarto
    {
        DatoCuarto datoCuarto = new DatoCuarto();
        public Resultado GuardarNuevoCuarto(EntidadCuarto entidadCuarto)
        {
            Resultado resul = new Resultado();
            try
            {
                resul = datoCuarto.GuardarNuevoCuarto(entidadCuarto);

            }
            catch 
            {

                throw new Exception(resul.mensaje);
            }

            return resul;
        }
        public List<EntidadCuarto> ObtenerCuartos()
        {
            return datoCuarto.ObtenerCuartos();
        }
    }
}
