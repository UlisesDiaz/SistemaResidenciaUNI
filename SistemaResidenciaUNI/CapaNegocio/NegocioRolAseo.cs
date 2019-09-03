using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;
using CapaEntidades;

namespace CapaNegocio
{
    public class NegocioRolAseo
    {
        DatoRolAseo RolAseo = new DatoRolAseo();

        public Resultado GuardarRolAseo(EntidadRolAseo entidadRolAseo)
        {
            Resultado resultado = new Resultado();

            try
            {

                resultado = RolAseo.GuardarRolAseo(entidadRolAseo);
            }

            catch
            {
                throw new Exception(resultado.mensaje);
            }

            return resultado;

        }

        public object ObtenerListaFrecuencia()
        {

            return RolAseo.ObtenerListaFrecuencia();
        }

        public List<EntidadEstuCantidadAsignada> ListarCantAsignacion(int idcuarto)
        {

            return RolAseo.CantidadAseosp(idcuarto);

        }

        public bool UpdateMail(int IDEstu, string NewMail)
        {

            return RolAseo.ModificarCorreo(IDEstu, NewMail);
        }

    }
}
