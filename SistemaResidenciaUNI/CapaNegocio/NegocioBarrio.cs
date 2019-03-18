using CapaDatos;
using CapaEntidades;
namespace CapaNegocio
{
    public class NegocioBarrio
    {
        DatoBarrio dataBarrio = new DatoBarrio();
        public Resultado ObtenerBarrioPorMunicipioId(int munId)
        {
            return (dataBarrio.ObtenerBarrioPorMunicipioId(munId));
        }
    }
}
