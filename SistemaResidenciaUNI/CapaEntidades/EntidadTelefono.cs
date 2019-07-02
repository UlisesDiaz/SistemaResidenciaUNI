using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
 public    class EntidadTelefono
    {
        public int TEL_ID { get; set; }
        public int COM_ID { get; set; }
        public int PER_ID { get; set; }
        public string TEL_NUMERO { get; set; }
        public bool TEL_PERSONAL { get; set; }
        public bool TEL_ESTADO { get; set; }

        public virtual EntidadCompañia TBL_COMPAÑIA { get; set; }
        public virtual EntidadPersona TBL_PERSONA { get; set; }
    }
}
