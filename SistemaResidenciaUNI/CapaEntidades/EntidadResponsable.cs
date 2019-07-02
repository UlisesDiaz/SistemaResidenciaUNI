using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
  public  class EntidadResponsable
    {
        public int PER_ID { get; set; }
        public int TIP_ARE_RES_ID { get; set; }
        public System.DateTime RES_FECHA_INICIAL { get; set; }
        public Nullable<System.DateTime> RES_FECHA_FINAL { get; set; }
        public bool RES_ESTADO { get; set; }

        public virtual EntidadTipoAreaResponsable TBL_TIPO_AREA_RESPONSABLE { get; set; }
        public virtual ICollection<EntidadUsuario> TBL_USUARIO { get; set; }
    }
}
