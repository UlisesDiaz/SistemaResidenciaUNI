using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
   public class EntidadInfoMujeres
    {
        public string PER_PRIMER_NOMBRE { get; set; }
        public string PER_SEGUNDO_NOMBRE { get; set; }
        public string PER_PRIMER_APELLIDO { get; set; }
        public string PER_SEGUNDO_APELLIDO { get; set; }
        public string EST_CARNET { get; set; }
        public Nullable<int> CUA_NUMERO { get; set; }
    }
}
