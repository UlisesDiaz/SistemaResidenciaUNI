using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class EntidadCarrera
    {
        public int CAR_ID { get; set; }
        public int REC_ID { get; set; }
        public string CAR_DESCRIPCION { get; set; }
        public bool CAR_ESTADO { get; set; }

        public virtual EntidadRecinto TBL_RECINTO { get; set; }
        public virtual ICollection<EntidadEstudiante> TBL_ESTUDIANTE { get; set; }
    }
}
