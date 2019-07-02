using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
  public  class EntidadHisRolAseo
    {
        public int HIS_ROL_ASE_ID { get; set; }
        public int ROL_ASE_ID { get; set; }
        public int USU_ID { get; set; }
        public bool HIS_ROL_ASE_CUMPLE { get; set; }
        public System.DateTime HIS_ROL_ASE_FECHA { get; set; }
        public string HIS_ROL_ASE_DESCRIPCION { get; set; }
        public bool HIS_ROL_ASE_ESTADO { get; set; }

        public virtual EntidadRolAseo TBL_ROL_ASEO { get; set; }
        public virtual EntidadUsuario TBL_USUARIO { get; set; }
    }
}
