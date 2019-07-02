using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class EntidadPerRelation
    {
        public int PER_REL_ID { get; set; }
        public int TIP_PER_REL_ID { get; set; }
        public int PER_ORIGEN { get; set; }
        public int PER_DESTINO { get; set; }
        public System.DateTime PER_REL_FECHA_INICIAL { get; set; }
        public Nullable<System.DateTime> PER_REL_FECHA_FINAL { get; set; }
        public bool PER_REL_ESTADO { get; set; }

        public virtual EntidadPersona TBL_PERSONA { get; set; }
        public virtual EntidadTipPerRelation TBL_TIP_PER_RELACION { get; set; }
    }
}
