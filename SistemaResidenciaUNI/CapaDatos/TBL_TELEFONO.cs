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
    
    public partial class TBL_TELEFONO
    {
        public int TEL_ID { get; set; }
        public int COM_ID { get; set; }
        public Nullable<int> PER_ID { get; set; }
        public string TEL_NUMERO { get; set; }
        public Nullable<bool> TEL_PERSONAL { get; set; }
    
        public virtual TBL_PERSONA TBL_PERSONA { get; set; }
    }
}
