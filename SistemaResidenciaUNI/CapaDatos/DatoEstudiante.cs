using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Linq;

namespace CapaDatos
{
    public class DatoEstudiante
    {
        dbResidenciaEntities dbResidencia = new dbResidenciaEntities();
        public Resultado GuardarNuevoEstudiante(EntidadEstudiante EntidadEstudiante)
        {
            Resultado resultado = new Resultado();
            TBL_ESTUDIANTE TBL_ESTUDIANTE = new TBL_ESTUDIANTE();
            try
            {
                TBL_ESTUDIANTE.PER_ID = EntidadEstudiante.PER_ID;
                TBL_ESTUDIANTE.CUA_ID = EntidadEstudiante.CUA_ID;
                TBL_ESTUDIANTE.EST_CARNET = EntidadEstudiante.EST_CARNET;
                TBL_ESTUDIANTE.EST_ESTADO = true;

                int idPersona = EntidadEstudiante.PER_ID;

                bool existeEstudiante = dbResidencia.TBL_ESTUDIANTE.Where(fila => fila.PER_ID.Equals(idPersona)).Count() > 0;
                if (existeEstudiante)
                    throw new Exception("Ya existe un Estudiante con este ID: " + idPersona);

                dbResidencia.TBL_ESTUDIANTE.Add(TBL_ESTUDIANTE);
                dbResidencia.SaveChanges();
                resultado.esError = false;
                resultado.mensaje = "Se ha insertado de manera exitosa el registro";
            }
            catch (Exception ex)
            {
                resultado.esError = true;
                resultado.mensaje = "Ha ocurrido un error al momento de almacenar el Estidiante: " + ex.Message;
            }

            return resultado;
        }
        public List<EntidadPersona> ObtenerPersonas()
        {
            List<EntidadPersona> personas = new List<EntidadPersona>();

            List<int> idEstudiantesRegistrados = new List<int>();
            idEstudiantesRegistrados = dbResidencia.TBL_ESTUDIANTE.ToList().Select(dr => dr.PER_ID).ToList<int>();
            //se extrae lista ordenada ascendente y personas que estén activas
            dbResidencia.TBL_PERSONA.OrderBy(fila => fila.PER_PRIMER_NOMBRE).Where(fila => fila.PER_ESTADO == true).ToList().ForEach(fila =>
                 {
                     EntidadPersona cadaPersona = new EntidadPersona();
                     if (!idEstudiantesRegistrados.Contains(fila.PER_ID))
                     {
                         cadaPersona.PER_ID = fila.PER_ID;
                         cadaPersona.PER_CEDULA = fila.PER_CEDULA;
                         cadaPersona.PER_PRIMER_NOMBRE = fila.PER_PRIMER_NOMBRE;
                         cadaPersona.PER_SEGUNDO_NOMBRE = fila.PER_SEGUNDO_NOMBRE;
                         cadaPersona.PER_PRIMER_APELLIDO = fila.PER_PRIMER_APELLIDO;
                         cadaPersona.PER_SEGUNDO_APELLIDO = fila.PER_SEGUNDO_APELLIDO;
                         cadaPersona.PER_FECHA_NACIMIENTO = fila.PER_FECHA_NACIMIENTO;
                         cadaPersona.PER_NOMBRE_COMPLETO = fila.PER_PRIMER_NOMBRE + " " + fila.PER_SEGUNDO_NOMBRE +
                         " " + fila.PER_PRIMER_APELLIDO + " " + fila.PER_SEGUNDO_APELLIDO;
                         cadaPersona.PER_ESTADO = fila.PER_ESTADO;

                         personas.Add(cadaPersona);
                     }
                     else { }
                 });
            return personas;
        }
    }
}
