using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
 public   class EntidadTipoMotivoRegistro
    {
        public int TIP_MOT_REG_ID { get; set; }
        public string TIP_MOT_REG_DESCRIPCION { get; set; }
        public bool TIP_MOT_REG_ESTADO { get; set; }
        
        public virtual ICollection<EntidadHisEstudianteRegistro> TBL_HIS_ESTUDIANTE_REGISTRO { get; set; }
    }
}
