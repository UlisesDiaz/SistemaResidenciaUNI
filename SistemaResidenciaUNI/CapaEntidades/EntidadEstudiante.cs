
namespace CapaEntidades
{
    public class EntidadEstudiante
    {
        public int EST_ID { get; set; }
        public int PER_ID { get; set; }
        public int CUA_ID { get; set; }
        public string EST_CARNET { get; set; }
        public bool EST_ESTADO { get; set; }
        public virtual EntidadCuarto TBL_CUARTO { get; set; }
        public virtual EntidadPersona TBL_PERSONA { get; set; }
    }
}
