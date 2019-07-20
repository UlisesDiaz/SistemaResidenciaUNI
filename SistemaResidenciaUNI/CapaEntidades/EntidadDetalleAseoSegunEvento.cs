using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
   public  class EntidadDetalleAseoSegunEvento
    {
        public int EST_ID { get; set; }
        public string NOMBRE { get; set; }
        public string TIP_ASE_DESCRIPCION { get; set; }
        public Nullable<System.TimeSpan> ROL_ASE_HORA { get; set; }
    }
}
