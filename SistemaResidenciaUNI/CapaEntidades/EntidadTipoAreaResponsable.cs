using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
  public  class EntidadTipoAreaResponsable
    {
        public int TIP_ARE__RES_ID { get; set; }
        public string TIP_ARE_RES_DESCRIPCION { get; set; }
        public Nullable<bool> TIP_ARE_RES_ESTADO { get; set; }
        public virtual ICollection<EntidadResponsable> TBL_RESPONSABLE { get; set; }
    }
}
