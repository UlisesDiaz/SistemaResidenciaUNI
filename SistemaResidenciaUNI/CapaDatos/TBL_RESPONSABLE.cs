//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CapaDatos
{
    using System;
    using System.Collections.Generic;
    
    public partial class TBL_RESPONSABLE
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TBL_RESPONSABLE()
        {
            this.TBL_HIS_ESTUDIANTE_REGISTRO = new HashSet<TBL_HIS_ESTUDIANTE_REGISTRO>();
            this.TBL_USUARIO = new HashSet<TBL_USUARIO>();
        }
    
        public int PER_ID { get; set; }
        public int TIP_ARE_RES_ID { get; set; }
        public System.DateTime RES_FECHA_INICIAL { get; set; }
        public Nullable<System.DateTime> RES_FECHA_FINAL { get; set; }
        public bool RES_ESTADO { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TBL_HIS_ESTUDIANTE_REGISTRO> TBL_HIS_ESTUDIANTE_REGISTRO { get; set; }
        public virtual TBL_TIPO_AREA_RESPONSABLE TBL_TIPO_AREA_RESPONSABLE { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TBL_USUARIO> TBL_USUARIO { get; set; }
    }
}