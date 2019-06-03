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
        public string PER_GENERO { get; set; }
        public string PER_DIECCION { get; set; }
        public string PER_CELULAR { get; set; }
        public string PER_CELULAR_COMPANIA { get; set; }
        public string PER_CORREO { get; set; }
        public string PER_CARRERA { get; set; }
        public string PER_RECINTO { get; set; }
        public string PER_BARRIO { get; set; }
        public string PER_MUNICIPIO { get; set; }
        public string PER_DEPARTAMENTO { get; set; }
        public System.DateTime PER_FECHA_NACIMIENTO { get; set; }
        public bool PER_ESTADO { get; set; }
        public byte[] PER_IMAGEN { get; set; }
        public string PER_NOM_APE_COMPLETO
        {
            get { return this.PER_PRIMER_NOMBRE + " " + this.PER_SEGUNDO_NOMBRE + " " + this.PER_SEGUNDO_APELLIDO; }
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
