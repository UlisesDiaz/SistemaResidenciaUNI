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

                int PER_ID = ObtenerUltimoIdPersona();


                TBL_HIS_ESTUDIANTE_CUARTO hisEstCua = new TBL_HIS_ESTUDIANTE_CUARTO();

                hisEstCua.CUA_ID = EntidadEstudiante.TBL_HIS_ESTUDIANTE_CUARTO.Select(dr => dr.CUA_ID).FirstOrDefault();
                hisEstCua.EST_ID = PER_ID;
                hisEstCua.HIS_EST_CUA_DESRIPCION = EntidadEstudiante.TBL_HIS_ESTUDIANTE_CUARTO.Select(dr => dr.HIS_EST_CUA_DESRIPCION).FirstOrDefault();
                hisEstCua.HIS_EST_CUA_ESTADO = EntidadEstudiante.TBL_HIS_ESTUDIANTE_CUARTO.Select(dr => dr.HIS_EST_CUA_ESTADO).FirstOrDefault();
                hisEstCua.USU_ID = EntidadEstudiante.TBL_HIS_ESTUDIANTE_CUARTO.Select(dr => dr.USU_ID).FirstOrDefault();

                List<TBL_HIS_ESTUDIANTE_CUARTO> listHisEstC = new List<TBL_HIS_ESTUDIANTE_CUARTO>();
                listHisEstC.Add(hisEstCua);

                TBL_ESTUDIANTE.EST_ID = PER_ID;
                //TBL_ESTUDIANTE. = datoCuarto.ObtenerUltimoIdCuarto();
                TBL_ESTUDIANTE.EST_CARNET = EntidadEstudiante.EST_CARNET;
                TBL_ESTUDIANTE.CAR_ID = EntidadEstudiante.CAR_ID;
                TBL_ESTUDIANTE.EST_FECHA_FINAL = EntidadEstudiante.EST_FECHA_FINAL;
                TBL_ESTUDIANTE.EST_ESTADO = true;
                TBL_ESTUDIANTE.TBL_HIS_ESTUDIANTE_CUARTO = listHisEstC;
                bool existeEstudiante = dbResidencia.TBL_ESTUDIANTE.Where(fila => fila.EST_ID.Equals(PER_ID)).Count() > 0;
                if (existeEstudiante)
                    throw new Exception("Ya existe un Estudiante con este ID: " + PER_ID);

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
                         cadaPersona.PER_IDENTIFICACION = fila.PER_IDENTIFICACION;
                         cadaPersona.PER_PRIMER_NOMBRE = fila.PER_PRIMER_NOMBRE;
                         cadaPersona.PER_SEGUNDO_NOMBRE = fila.PER_SEGUNDO_NOMBRE;
                         cadaPersona.PER_PRIMER_APELLIDO = fila.PER_PRIMER_APELLIDO;
                         cadaPersona.PER_SEGUNDO_APELLIDO = fila.PER_SEGUNDO_APELLIDO;
                         cadaPersona.PER_FECHA_NACIMIENTO = fila.PER_FECHA_NACIMIENTO;
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

                    TBL_PERSONA.PER_IDENTIFICACION = entidadPersona.PER_IDENTIFICACION;
                    TBL_PERSONA.TIP_IDE_ID = entidadPersona.TIP_IDE_ID;
                    TBL_PERSONA.GEN_ID = entidadPersona.GEN_ID;
                    TBL_PERSONA.PER_PRIMER_NOMBRE = entidadPersona.PER_PRIMER_NOMBRE;
                    TBL_PERSONA.PER_SEGUNDO_NOMBRE = entidadPersona.PER_SEGUNDO_NOMBRE;
                    TBL_PERSONA.PER_PRIMER_APELLIDO = entidadPersona.PER_PRIMER_APELLIDO;
                    TBL_PERSONA.PER_SEGUNDO_APELLIDO = entidadPersona.PER_SEGUNDO_APELLIDO;
                    TBL_PERSONA.PER_FECHA_NACIMIENTO = entidadPersona.PER_FECHA_NACIMIENTO;
                    TBL_PERSONA.EST_CIV_ID = entidadPersona.EST_CIV_ID;

                    TBL_PERSONA.PER_ESTADO = entidadPersona.PER_ESTADO;
                    TBL_PERSONA.PER_IMAGEN = entidadPersona.PER_IMAGEN;
                    List<TBL_CORREO> LISc = new List<TBL_CORREO>();
                    entidadPersona.TBL_CORREO.ToList().ForEach(dr =>
                    {
                        LISc.Add(new TBL_CORREO { COR_DEFINICION = dr.COR_DEFINICION, COR_ESTADO = dr.COR_ESTADO, PER_ID = dr.PER_ID });
                    });
                    List<TBL_TELEFONO> lisTel = new List<TBL_TELEFONO>();
                    entidadPersona.TBL_TELEFONO.ToList().ForEach(dr =>
                    {
                        lisTel.Add(new TBL_TELEFONO { COM_ID = dr.COM_ID, PER_ID = dr.PER_ID, TEL_NUMERO = dr.TEL_NUMERO, TEL_PERSONAL = dr.TEL_PERSONAL, TEL_ESTADO = dr.TEL_ESTADO });
                    });
                    List<TBL_DIRECCION> listaDirec = new List<TBL_DIRECCION>();
                    entidadPersona.TBL_DIRECCION.ToList().ForEach(dr =>
                    {
                        listaDirec.Add(new TBL_DIRECCION { DIR_ID = dr.DIR_ID, BAR_ID = dr.BAR_ID, DIR_DESCRIPCION = dr.DIR_DESCRIPCION, DIR_ESTADO = true, DIR_NO_CASA = dr.DIR_NO_CASA, PER_ID = dr.PER_ID });
                    });

                    TBL_PERSONA.TBL_TELEFONO = lisTel;
                    TBL_PERSONA.TBL_CORREO = LISc;
                    TBL_PERSONA.TBL_DIRECCION = listaDirec;
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
            object estudiantes = null;
            try
            {
                estudiantes = dbResidencia.TBL_ESTUDIANTE.Select(dr => new
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
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

            return estudiantes;
        }
        public int ObtenerUltimoIdPersona()
        {
            return dbResidencia.TBL_PERSONA.OrderByDescending(dr => dr.PER_ID).Select(dr => dr.PER_ID).First();
        }

        public object ObtenerListaGenero()
        {
            object genero = null;
            try
            {
                genero = dbResidencia.TBL_GENERO.Select(dr => new
                {
                    dr.GEN_ID,
                    dr.GEN_DESCRIPCION
                }).ToList();
            }
            catch (Exception)
            {
            }
            return genero;
        }
        public object ObtenerListaTipoIdentificacion()
        {
            object tipoIdentificacion = null;
            try
            {
                tipoIdentificacion = dbResidencia.TBL_TIPO_IDENTIFICACION.Select(dr => new
                {
                    dr.TIP_IDE_ID,
                    dr.TIP_IDE_DESCRIPCION
                }).ToList();
            }
            catch (Exception)
            {
            }
            return tipoIdentificacion;
        }

        public object ObtenerListaCarrera()
        {
            object carrera = null;
            try
            {
                carrera = dbResidencia.TBL_CARRERA.Select(dr => new
                {
                    dr.CAR_ID,
                    dr.CAR_DESCRIPCION
                }).ToList();
            }
            catch (Exception)
            {
            }
            return carrera;
        }
        public object ObtenerListaCompañiaTelefonica()
        {
            object compañiaTelefonica = null;
            try
            {
                compañiaTelefonica = dbResidencia.TBL_COMPAÑIA.Select(dr => new
                {
                    dr.COM_ID,
                    dr.COM_DESCRIPCION
                }).ToList();
            }
            catch (Exception)
            {
            }
            return compañiaTelefonica;
        }

        public List<EntidadPersona> ObtnerEstudiantePorIdSpCuarto(int NumCuarto)
        {

            return dbResidencia.spBuscarEstudiantePorCuarto(NumCuarto).Select(dr => new EntidadPersona

            {
                PER_PRIMER_NOMBRE = dr.PER_PRIMER_NOMBRE,
                PER_SEGUNDO_NOMBRE = dr.PER_SEGUNDO_NOMBRE,
                PER_PRIMER_APELLIDO = dr.PER_PRIMER_APELLIDO,
                PER_ID = dr.PER_ID
            }).ToList();


        }


        public EntidadInfoEstudianteSP InfoEstudiantePorCarnet(string carnet)
        {
            try
            {


                return dbResidencia.spInfoEstudiante(carnet).Select(dr => new EntidadInfoEstudianteSP
                {
                    PER_PRIMER_NOMBRE = dr.PER_PRIMER_NOMBRE,
                    PER_SEGUNDO_NOMBRE = dr.PER_SEGUNDO_NOMBRE,
                    PER_PRIMER_APELLIDO = dr.PER_PRIMER_APELLIDO,
                    PER_SEGUNDO_APELLIDO = dr.PER_SEGUNDO_APELLIDO,
                    PER_FECHA_NACIMIENTO = dr.PER_FECHA_NACIMIENTO,

                    GEN_DESCRIPCION = dr.GEN_DESCRIPCION,
                    DIR_DESCRIPCION = dr.DIR_DESCRIPCION,
                    BAR_NOMBRE = dr.BAR_NOMBRE,
                    MUN_NOMBRE = dr.MUN_NOMBRE,
                    DEP_NOMBRE = dr.DEP_NOMBRE,
                    TEL_NUMERO = dr.TEL_NUMERO,
                    COM_DESCRIPCION = dr.COM_DESCRIPCION,
                    COR_DEFINICION = dr.COR_DEFINICION,
                    CAR_DESCRIPCION = dr.CAR_DESCRIPCION,
                    REC_DESCRIPCION = dr.REC_DESCRIPCION,






                }).FirstOrDefault();

            }
            catch (Exception ex)
            {

                throw ex;
            }


        }

        public object ObtenerEstadoCivil()
        {
            Object estadoCivil = null;

            try
            {

                estadoCivil = dbResidencia.TBL_ESTADO_CIVIL.Select(dr => new
                {
                    dr.EST_CIV_ID,
                    dr.EST_CIV_DESCRI

                }).ToList();

            }
            catch (Exception ex)
            {
                throw ex;
            }

            return estadoCivil;

        }

        public List<EntidadEvento> ObtenerEventos(DateTime startD, DateTime endD)
        {
            return dbResidencia.spObtenerEventos(startD, endD).Select(dr => new EntidadEvento
            {
                id = dr.CUA_NUMERO,
                start = dr.ROL_ASE_FECHA_INICIAL.ToString("yyyy-MM-dd")
            }).ToList();
        }

        public List<EntidadDetalleAseoSegunEvento> ObtenerDetalleAseoSegunEvento(int cuaNum, DateTime starD)
        {
            return dbResidencia.spObtenerDetalleAseoSegunEvento(cuaNum, starD).Select(dr => new EntidadDetalleAseoSegunEvento
            {
                EST_ID = dr.EST_ID,
                NOMBRE = dr.NOMBRE,
                TIP_ASE_DESCRIPCION = dr.TIP_ASE_DESCRIPCION,
                ROL_ASE_HORA = dr.ROL_ASE_HORA
            }).ToList();
        }

        public EntidadspMoverEstudianteDeCuarto ObtenerInfoEstudianteAmover(string carnet)
        {

            if (dbResidencia.spMoverEstudianteDeCuarto(carnet).Count().Equals(0))
                throw new Exception(string.Format(Util.Exception.estudianteVSCarnetNoEncontrado, carnet));

            return dbResidencia.spMoverEstudianteDeCuarto(carnet).Select(dr => new EntidadspMoverEstudianteDeCuarto
            {

                PER_ID = dr.PER_ID,
                PER_PRIMER_NOMBRE = dr.PER_PRIMER_NOMBRE,
                PER_SEGUNDO_NOMBRE = dr.PER_SEGUNDO_NOMBRE,
                PER_PRIMER_APELLIDO = dr.PER_PRIMER_APELLIDO,
                PER_SEGUNDO_APELLIDO = dr.PER_SEGUNDO_APELLIDO,
                CAR_DESCRIPCION = dr.CAR_DESCRIPCION,
                CUA_NUMERO = dr.CUA_NUMERO
            }).FirstOrDefault();

        }

        public List<EntidadHistorialCuarto> HistorialCuartoEstudiante(string carnet)
        {
            return dbResidencia.spHistorialCuarto(carnet).Select(dr => new EntidadHistorialCuarto
            {
                PER_PRIMER_NOMBRE = dr.PER_PRIMER_NOMBRE,
                PER_SEGUNDO_NOMBRE = dr.PER_SEGUNDO_NOMBRE,
                PER_PRIMER_APELLIDO = dr.PER_PRIMER_APELLIDO,
                HIS_EST_CUA_FECHA_INICIAL = dr.HIS_EST_CUA_FECHA_INICIAL.ToString("dd-MM-yyyy"),
                HIS_EST_CUA_FECHA_FINAL = dr.HIS_EST_CUA_FECHA_FINAL.HasValue ? dr.HIS_EST_CUA_FECHA_FINAL.Value.ToString("dd-MM-yyyy") : string.Empty,
                CUA_NUMERO = dr.CUA_NUMERO,
                HIS_EST_CUA_ESTADO = dr.HIS_EST_CUA_ESTADO ? "Activo" : "Inactivo",
                HIS_EST_CUA_DESRIPCION = dr.HIS_EST_CUA_DESRIPCION
            }).ToList();
        }


        public List<EntidadspEstudiantesGuardados> MostrarEstudianteGuardados()
        {
            return dbResidencia.spEstdianteGuardados().Select(dr => new EntidadspEstudiantesGuardados

            {
                PER_PRIMER_NOMBRE = dr.PER_PRIMER_NOMBRE,
                PER_SEGUNDO_NOMBRE = dr.PER_SEGUNDO_NOMBRE,
                PER_PRIMER_APELLIDO = dr.PER_PRIMER_APELLIDO,
                PER_SEGUNDO_APELLIDO = dr.PER_SEGUNDO_APELLIDO,
                CUA_NUMERO = dr.CUA_NUMERO,
                CAR_DESCRIPCION = dr.CAR_DESCRIPCION


            }

            ).ToList();

        }
    }
}
