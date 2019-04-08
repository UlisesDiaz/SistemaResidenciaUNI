using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;

namespace CapaDatos
{
    public class DatoEstudiante
    {
        dbResidenciaEntities dbResidencia = new dbResidenciaEntities();
        Resultado resultado = new Resultado();
        public Resultado GuardarNuevoEstudiante(EntidadEstudiante EntidadEstudiante)
        {

            DatoCuarto datoCuarto = new DatoCuarto();
            resultado = new Resultado();
            TBL_PERSONA TBL_PERSONA = new TBL_PERSONA();
            TBL_ESTUDIANTE TBL_ESTUDIANTE = new TBL_ESTUDIANTE();

            try
            {

                GuardarNuevaPersona(EntidadEstudiante.TBL_PERSONA);

                TBL_ESTUDIANTE.EST_ID = ObtenerUltimoIdPersona();
                // TBL_ESTUDIANTE.CUA_ID = datoCuarto.ObtenerUltimoIdCuarto();
                TBL_ESTUDIANTE.EST_CARNET = EntidadEstudiante.EST_CARNET;
                TBL_ESTUDIANTE.EST_ESTADO = true;

                int idPersona = EntidadEstudiante.PER_ID;

                bool existeEstudiante = dbResidencia.TBL_ESTUDIANTE.Where(fila => fila.EST_ID.Equals(idPersona)).Count() > 0;
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
                resultado.mensaje = "Ha ocurrido un error al momento de almacenar el Estudiante: " + ex.Message;

                throw new Exception(resultado.mensaje);
            }

            return resultado;
        }
        public List<EntidadPersona> ObtenerPersonas()
        {
            List<EntidadPersona> personas = new List<EntidadPersona>();

            List<int> idEstudiantesRegistrados = new List<int>();
            idEstudiantesRegistrados = dbResidencia.TBL_ESTUDIANTE.ToList().Select(dr => dr.EST_ID).ToList<int>();
            //se extrae lista ordenada ascendente y personas que estén activas
            dbResidencia.TBL_PERSONA.OrderBy(fila => fila.PER_PRIMER_NOMBRE).Where(fila => fila.PER_ESTADO == true).ToList().ForEach(fila =>
                 {
                     EntidadPersona cadaPersona = new EntidadPersona();
                     if (!idEstudiantesRegistrados.Contains(fila.PER_ID))
                     {
                         cadaPersona.PER_ID = fila.PER_ID;
                         cadaPersona.PER_CEDULA = fila.PER_IDENTIFICACION;
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

        public Resultado GuardarNuevaPersona(EntidadPersona entidadPersona)
        {
            resultado = new Resultado();
            using (var dbContextTransaction = dbResidencia.Database.BeginTransaction())
            {
                try
                {
                    resultado.esError = false;
                    TBL_PERSONA TBL_PERSONA = new TBL_PERSONA();
                    TBL_PERSONA.PER_IDENTIFICACION = entidadPersona.PER_CEDULA;
                    TBL_PERSONA.PER_PRIMER_NOMBRE = entidadPersona.PER_PRIMER_NOMBRE;
                    TBL_PERSONA.PER_SEGUNDO_NOMBRE = entidadPersona.PER_SEGUNDO_NOMBRE;
                    TBL_PERSONA.PER_PRIMER_APELLIDO = entidadPersona.PER_PRIMER_APELLIDO;
                    TBL_PERSONA.PER_SEGUNDO_APELLIDO = entidadPersona.PER_SEGUNDO_APELLIDO;
                    TBL_PERSONA.PER_FECHA_NACIMIENTO = entidadPersona.PER_FECHA_NACIMIENTO;
                    TBL_PERSONA.PER_ESTADO = entidadPersona.PER_ESTADO;
                    TBL_PERSONA.PER_IMAGEN = entidadPersona.PER_IMAGEN;

                    dbResidencia.TBL_PERSONA.Add(TBL_PERSONA);
                    dbResidencia.SaveChanges();
                    dbContextTransaction.Commit();
                    resultado.esError = false;
                }
                catch (Exception ex)
                {
                    dbContextTransaction.Rollback();
                    resultado.esError = true;
                    resultado.mensaje = ex.Message;
                }
            }
            return resultado;
        }
        public object ObtenerListaEstudiantes()

        {
            var estudiantes = dbResidencia.TBL_ESTUDIANTE.Select(dr => new
            {
                dr.EST_CARNET,
                NOMBRE_COMPLETO = dr.TBL_PERSONA.PER_PRIMER_NOMBRE + " " + dr.TBL_PERSONA.PER_SEGUNDO_NOMBRE + " " + dr.TBL_PERSONA.PER_PRIMER_APELLIDO + " " + dr.TBL_PERSONA.PER_SEGUNDO_APELLIDO,
                DIR_DESCRIPCION = dr.TBL_PERSONA.TBL_DIRECCION.FirstOrDefault().DIR_DESCRIPCION == null ? "N/D" : dr.TBL_PERSONA.TBL_DIRECCION.FirstOrDefault().DIR_DESCRIPCION,
                dr.TBL_PERSONA.TBL_GENERO.GEN_DESCRIPCION,
                dr.TBL_PERSONA.PER_IDENTIFICACION,
                COR_DEFINICION = dr.TBL_PERSONA.TBL_CORREO.FirstOrDefault().COR_DEFINICION == null ? "N/D" : dr.TBL_PERSONA.TBL_CORREO.FirstOrDefault().COR_DEFINICION,
                dr.EST_FECHA_INICIAL,
                dr.EST_FECHA_FINAL,
                dr.TBL_CARRERA.CAR_DESCRIPCION
            }).ToList();
            return estudiantes;
        }
        public int ObtenerUltimoIdPersona()
        {
            return dbResidencia.TBL_PERSONA.OrderByDescending(dr => dr.PER_ID).Select(dr => dr.PER_ID).First();
        }
    }
}
