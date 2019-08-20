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


        public Resultado GuardarNuevoAseo(EntidadTipoAseo entidadTipoAseo)
        {
            Resultado resul = new Resultado();

            try
            {
                resul = datotipoaseo.GuardarTipoAseo(entidadTipoAseo);

            }

            catch
            {
                throw new Exception(resul.mensaje);

            }

            return resul;


        }


        public List<EntidadTipoAseosp> ObtenerTipoAseo()
        {
            return datotipoaseo.ObtenerAseoPorSP();

        }

        public void EliminarTipAseo(int id)
        {
            Resultado resul = new Resultado();
            try
            {

                datotipoaseo.EliminarTipoAseo(id);

            }

            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
        }

        public bool ModificarTipAseo(int id, string descrip)
        {

            Resultado resul = new Resultado();
            bool transac;
            try
            {

                transac = datotipoaseo.EditarTipoAseo(id, descrip);

            }

            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            return transac;
        }


        public bool EliminarAseo(int id)
        {

            Resultado resul = new Resultado();
            bool transac;
            try
            {

                transac = datotipoaseo.EliminarTipoAseo(id);

            }

            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            return transac;
        }

    }
}
