using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class EntidadGenero
    {
        public int GEN_ID { get; set; }
        public string GEN_DESCRIPCION { get; set; }
        public virtual ICollection<EntidadPersona> TBL_PERSONA { get; set; }
    }
}
