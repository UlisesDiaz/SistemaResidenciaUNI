using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
  public  class EntidadHisEstudianteRegistro
    {
        public int HIS_EST_REG_ID { get; set; }
        public Nullable<int> EST_ID { get; set; }
        public Nullable<int> USU_ID { get; set; }
        public int TIP_MOT_REG_ID { get; set; }
        public System.DateTime HIS_EST_REG_FECHA_INICIAL { get; set; }
        public System.DateTime HIS_EST_REG_FECHA_FINAL { get; set; }
        public Nullable<System.DateTime> HIS_EST_REG_FECHA_ESTIMADA { get; set; }
        public bool HIS_EST_REG_ACTIVO { get; set; }
        public string HIS_EST_REG_DESCRIPCION { get; set; }
        public bool HIS_EST_REG_ESTADO { get; set; }

        public virtual EntidadTipoMotivoRegistro TBL_TIPO_MOTIVO_REGISTRO { get; set; }
        public virtual EntidadUsuario TBL_USUARIO { get; set; }
    }
}
