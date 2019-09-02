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

        public object ObtenerListaEstudiantes()

        {
            return datoEstudiante.ObtenerListaEstudiantes();
        }

        public object ObtenerListaGenero()
        {
            return datoEstudiante.ObtenerListaGenero();
        }
        public object ObtenerListaTipoIdentificacion()
        { return datoEstudiante.ObtenerListaTipoIdentificacion(); }
        public object ObtenerListaCarrera()
        {
            return datoEstudiante.ObtenerListaCarrera();
        }
        public object ObtenerListaCompañiaTelefonica()
        {
            return datoEstudiante.ObtenerListaCompañiaTelefonica();
        }

        public List<EntidadPersona> ObtnerEstudiantePorCuarto(int Num)
        {
            return datoEstudiante.ObtnerEstudiantePorIdSpCuarto(Num);
        }

        public EntidadInfoEstudianteSP InfoEstudiantePorCarnet(string Ncarnet)
        {

            return datoEstudiante.InfoEstudiantePorCarnet(Ncarnet);

        }
        public object ObtenerEstadoCivil()
        {
            return datoEstudiante.ObtenerEstadoCivil();
        }

        public List<EntidadEvento> ObtenerEventos(DateTime startD, DateTime endD)
        {
            return (new DatoEstudiante()).ObtenerEventos(startD, endD);
        }
        public List<EntidadDetalleAseoSegunEvento> ObtenerDetalleAseoSegunEvento(int cuaNum, DateTime starD)
        {
            return (new DatoEstudiante()).ObtenerDetalleAseoSegunEvento(cuaNum, starD);
        }
        public EntidadspMoverEstudianteDeCuarto N_obtenerInfoEstudianteAmover(string carnet)
        {
            return datoEstudiante.ObtenerInfoEstudianteAmover(carnet);

        }

        public List<EntidadHistorialCuarto> N_HistorialEstudianteCuarto(string carnet)
        {
            
            return datoEstudiante.HistorialCuartoEstudiante(carnet);

        }

        public List<EntidadspEstudiantesGuardados> N_MostraEstudianteGuardados()
        {
            return datoEstudiante.MostrarEstudianteGuardados();

        }
        public object N_infoRecidencia()
        {
            return datoEstudiante.infoRecidencia();

        }

       
        public List<EntidadCuarto> CambioCuartosDisponibles(int IdGenero)
        {
            DatoCuarto Cuarto = new DatoCuarto();
            return Cuarto.CambioCuartosDispibles(IdGenero);
        }

       
        public List<EntidadInfoMujeres> N_InfoResidentesMujeres(string Genero)
        {

            return datoEstudiante.infoREsidenteMujeres(Genero);
        }
    }
}
