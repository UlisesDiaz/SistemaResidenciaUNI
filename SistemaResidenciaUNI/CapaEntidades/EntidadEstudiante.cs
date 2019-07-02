
using System;
using System.Collections.Generic;

namespace CapaEntidades
{
    public class EntidadEstudiante
    {
        public int EST_ID { get; set; }
        public int CAR_ID { get; set; }
        public int PER_ID { get; set; }
        public int CUA_ID { get; set; }
        public string EST_CARNET { get; set; }
        public System.DateTime EST_FECHA_INICIAL { get; set; }
        public Nullable<System.DateTime> EST_FECHA_FINAL { get; set; }
        public bool EST_ESTADO { get; set; }
        
        public virtual EntidadCarrera TBL_CARRERA { get; set; }
        public virtual EntidadPersona TBL_PERSONA { get; set; }
        public virtual ICollection<EntidadHisEstudianteCuarto> TBL_HIS_ESTUDIANTE_CUARTO { get; set; }
        public virtual ICollection<EntidadRolAseo> TBL_ROL_ASEO { get; set; }
    }
}
