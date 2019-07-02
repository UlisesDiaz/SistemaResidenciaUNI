using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class EntidadFrecuencia
    {
        public int FRE_ID { get; set; }
        public string FRE_DESCRIPCION { get; set; }
        public bool FRE_ESTADO { get; set; }
        public virtual ICollection<EntidadRolAseo> TBL_ROL_ASEO { get; set; }
    }
}
