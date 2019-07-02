using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
  public  class EntidadRolAseo
    {
        public int ROL_ASE_ID { get; set; }
        public int TIP_ASE_ID { get; set; }
        public int FRE_ID { get; set; }
        public int EST_ID { get; set; }
        public int USU_ID { get; set; }
        public System.DateTime ROL_ASE_FECHA_INICIAL { get; set; }
        public Nullable<System.DateTime> ROL_ASE_FECHA_FINAL { get; set; }
        public Nullable<System.TimeSpan> ROL_ASE_HORA { get; set; }
        public Nullable<System.DateTime> ROL_ASE_FECHA_DESHABILITADO { get; set; }
        public Nullable<int> ROL_ASE_DIA { get; set; }
        public bool ROL_ASE_ESTADO { get; set; }

        public virtual EntidadEstudiante TBL_ESTUDIANTE { get; set; }
        public virtual EntidadFrecuencia TBL_FRECUENCIA { get; set; }
        public virtual ICollection<EntidadHisRolAseo> TBL_HIS_ROL_ASEO { get; set; }
        public virtual EntidadTipoAseo TBL_TIPO_ASEO { get; set; }
        public virtual EntidadUsuario TBL_USUARIO { get; set; }
    }
}
