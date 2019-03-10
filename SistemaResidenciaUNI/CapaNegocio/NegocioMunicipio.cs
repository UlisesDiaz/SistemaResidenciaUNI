using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;
using CapaEntidades;
namespace CapaNegocio
{
    public class NegocioMunicipio
    {

        DatoMunicipio datoMunicipio = new DatoMunicipio();

        public Resultado ObtenerMunicipioPorDepartamentoId(int depId)
        {
            return datoMunicipio.ObtenerMunicipioPorDepartamentoId(depId);
        }


    }
}
