using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
 public    class EntidadHisEstudianteCuarto
    {
        public int HIS_EST_CUA_ID { get; set; }
        public int USU_ID { get; set; }
        public int EST_ID { get; set; }
        public int CUA_ID { get; set; }
        public System.DateTime HIS_EST_CUA_FECHA_INICIAL { get; set; }
        public Nullable<System.DateTime> HIS_EST_CUA_FECHA_FINAL { get; set; }
        public string HIS_EST_CUA_DESRIPCION { get; set; }
        public bool HIS_EST_CUA_ESTADO { get; set; }

        public virtual EntidadCuarto TBL_CUARTO { get; set; }
        public virtual EntidadEstudiante TBL_ESTUDIANTE { get; set; }
        public virtual EntidadUsuario TBL_USUARIO { get; set; }
    }
}
