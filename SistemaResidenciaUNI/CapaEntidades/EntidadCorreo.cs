using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{

    public class EntidadCorreo
    {
        public int COR_ID { get; set; }
        public int PER_ID { get; set; }
        public string COR_DEFINICION { get; set; }
        public bool COR_ESTADO { get; set; }

        public virtual EntidadPersona TBL_PERSONA { get; set; }

    }
}
