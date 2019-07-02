using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class EntidadTipPerRelation
    {
        public int TIP_PER_REL_ID { get; set; }
        public string TIP_PER_REL_DESCRIPCION { get; set; }
        public bool TIP_PER_REL_ESTADO { get; set; }
        public virtual ICollection<EntidadPerRelation> TBL_PER_RELACION { get; set; }
    }
}
