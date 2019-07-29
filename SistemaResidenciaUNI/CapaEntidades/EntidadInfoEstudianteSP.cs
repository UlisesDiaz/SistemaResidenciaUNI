using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class EntidadInfoEstudianteSP
    {

        public string PER_PRIMER_NOMBRE { get; set; }
        public string PER_SEGUNDO_NOMBRE { get; set; }
        public string PER_PRIMER_APELLIDO { get; set; }
        public string PER_SEGUNDO_APELLIDO { get; set; }
        public System.DateTime PER_FECHA_NACIMIENTO { get; set; }
        public string GEN_DESCRIPCION { get; set; }
        public string DIR_DESCRIPCION { get; set; }
        public string BAR_NOMBRE { get; set; }
        public string MUN_NOMBRE { get; set; }
        public string DEP_NOMBRE { get; set; }
        public string COR_DEFINICION { get; set; }
        public string TEL_NUMERO { get; set; }
        public string COM_DESCRIPCION { get; set; }
        public string CAR_DESCRIPCION { get; set; }
        public string EST_CIVIL { get; set; }
        public string REC_DESCRIPCION { get; set; }
        public Nullable<int> CUA_NUMERO { get; set; }

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
