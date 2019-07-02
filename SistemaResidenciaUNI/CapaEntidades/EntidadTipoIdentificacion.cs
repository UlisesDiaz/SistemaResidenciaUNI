using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
   public class EntidadTipoIdentificacion
    {
        public int TIP_IDE_ID { get; set; }
        public string TIP_IDE_DESCRIPCION { get; set; }
        public virtual ICollection<EntidadPersona> TBL_PERSONA { get; set; }
    }
}
