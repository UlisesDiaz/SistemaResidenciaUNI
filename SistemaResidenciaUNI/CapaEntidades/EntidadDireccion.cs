using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class EntidadDireccion
    {
        public int DIR_ID { get; set; }
        public int BAR_ID { get; set; }
        public Nullable<int> PER_ID { get; set; }
        public string DIR_NO_CASA { get; set; }
        public string DIR_DESCRIPCION { get; set; }
        public bool DIR_ESTADO { get; set; }

        public virtual EntidadBarrio TBL_BARRIO { get; set; }
        public virtual EntidadPersona TBL_PERSONA { get; set; }
    }
}
