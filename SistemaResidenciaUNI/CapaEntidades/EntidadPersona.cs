using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class EntidadPersona
    {
        public int PER_ID { get; set; }
        public string PER_CEDULA { get; set; }
        public string PER_PRIMER_NOMBRE { get; set; }
        public string PER_SEGUNDO_NOMBRE { get; set; }
        public string PER_PRIMER_APELLIDO { get; set; }
        public string PER_SEGUNDO_APELLIDO { get; set; }

        public System.DateTime PER_FECHA_NACIMIENTO { get; set; }
        public bool PER_ESTADO { get; set; }
        public byte[] PER_IMAGEN { get; set; }
        public string PER_NOMBRE_COMPLETO { get { return this.PER_PRIMER_NOMBRE + " " + this.PER_SEGUNDO_NOMBRE + " " + this.PER_SEGUNDO_APELLIDO; } set { PER_NOMBRE_COMPLETO = value; } }
    }
}
