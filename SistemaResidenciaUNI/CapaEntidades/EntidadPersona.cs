using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class EntidadPersona
    {
        public EntidadPersona()
        {

        }

        public int PER_ID { get; set; }
        public string PER_IDENTIFICACION { get; set; }
        public int TIP_IDE_ID { get; set; }
        public int GEN_ID { get; set; }
        public string PER_PRIMER_NOMBRE { get; set; }
        public string PER_SEGUNDO_NOMBRE { get; set; }
        public string PER_PRIMER_APELLIDO { get; set; }
        public string PER_SEGUNDO_APELLIDO { get; set; }
        public System.DateTime PER_FECHA_NACIMIENTO { get; set; }
        public byte[] PER_IMAGEN { get; set; }
        public bool PER_ESTADO { get; set; }
        public int EST_CIV_ID { get; set; }
        public virtual ICollection<EntidadCorreo> TBL_CORREO { get; set; }
        public virtual ICollection<EntidadDireccion> TBL_DIRECCION { get; set; }
        public virtual EntidadEstudiante TBL_ESTUDIANTE { get; set; }
        public virtual EntidadGenero TBL_GENERO { get; set; }
        public virtual ICollection<EntidadPerRelation> TBL_PER_RELACION { get; set; }
        public virtual EntidadTipoIdentificacion TBL_TIPO_IDENTIFICACION { get; set; }
        public virtual ICollection<EntidadTelefono> TBL_TELEFONO { get; set; }
        public string PER_NOM_APE_COMPLETO
        {
            get { return this.PER_PRIMER_NOMBRE + " " + this.PER_SEGUNDO_NOMBRE; }
        }
        public string PER_NOMBRE_COMPLETO
        {
            get { return this.PER_PRIMER_NOMBRE + " " + this.PER_SEGUNDO_NOMBRE; }

        }
        public string PER_APELLI_COMPLETO
        {
            get { return this.PER_PRIMER_APELLIDO + " " + this.PER_SEGUNDO_APELLIDO; }

        }
    }
}
