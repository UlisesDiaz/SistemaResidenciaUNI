using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
  public   class EntidadCompañia
    {

        public int COM_ID { get; set; }
        public string COM_DESCRIPCION { get; set; }
        
        public virtual ICollection<EntidadTelefono> TBL_TELEFONO { get; set; }
    }
}
