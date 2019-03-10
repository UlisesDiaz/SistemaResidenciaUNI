using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;
using CapaEntidades;
namespace CapaNegocio
{
    public class NegocioEstudiante
    {
        DatoEstudiante datoEstudiante = new DatoEstudiante();
        public Resultado GuardarNuevoEstudiante(EntidadEstudiante entidadEstudiante)
        {
            Resultado resul = new Resultado();
            try
            {
                resul = datoEstudiante.GuardarNuevoEstudiante(entidadEstudiante);
            }
            catch 
            {
                throw new Exception(resul.mensaje);
            }

            return resul;
        }

        public List<EntidadPersona> ObtenerPersonas()
        {
            return datoEstudiante.ObtenerPersonas();
        }
    }
}
