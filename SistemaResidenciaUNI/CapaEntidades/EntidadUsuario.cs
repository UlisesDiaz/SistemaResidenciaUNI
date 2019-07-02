using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
   public class EntidadUsuario
    {
        public int USU_ID { get; set; }
        public int PER_ID { get; set; }
        public string USU_LOGIN { get; set; }
        public string USU_PASSWORD { get; set; }
        public System.DateTime USU_ULT_INGRESO { get; set; }
        public System.DateTime USU_FECHA_INICIAL { get; set; }
        public Nullable<System.DateTime> USU_FECHA_FINAL { get; set; }
        public bool USU_ESTADO { get; set; }
        public virtual ICollection<EntidadHisEstudianteCuarto> TBL_HIS_ESTUDIANTE_CUARTO { get; set; }
        public virtual ICollection<EntidadHisEstudianteRegistro> TBL_HIS_ESTUDIANTE_REGISTRO { get; set; }
        public virtual ICollection<EntidadHisRolAseo> TBL_HIS_ROL_ASEO { get; set; }
        public virtual EntidadResponsable TBL_RESPONSABLE { get; set; }
        public virtual ICollection<EntidadRolAseo> TBL_ROL_ASEO { get; set; }
    }
}
