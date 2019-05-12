using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;
using CapaEntidades;

namespace CapaNegocio
{
    public class NegocioTipoAseo
    {

        DatoTipoAseo datotipoaseo = new DatoTipoAseo();


        public Resultado GuardarNuevoTipoAseo(EntidadTipoAseo entidadTipoAseo)
        {
            Resultado resul= new Resultado();

            try
            {
                resul = datotipoaseo.GuardarNuevoTipoAseo(entidadTipoAseo);

            }

            catch 
            {
                throw new Exception(resul.mensaje);

            }

            return resul;


        }


        public List<EntidadTipoAseo> ObtenerTipoAseo()
        {
            return datotipoaseo.ObtenerTipoAseo();

        }

    }
}
