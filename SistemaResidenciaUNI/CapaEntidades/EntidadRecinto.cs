using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class EntidadRecinto
    {

        public int REC_ID { get; set; }
        public string REC_DESCRIPCION { get; set; }
        public virtual ICollection<EntidadCarrera> TBL_CARRERA { get; set; }
    }
}
