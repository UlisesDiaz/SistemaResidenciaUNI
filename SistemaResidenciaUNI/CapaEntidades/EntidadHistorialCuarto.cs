﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
  public  class EntidadHistorialCuarto
    {

        public string PER_PRIMER_NOMBRE { get; set; }
        public string PER_SEGUNDO_NOMBRE { get; set; }
        public string PER_PRIMER_APELLIDO { get; set; }
        public string  HIS_EST_CUA_FECHA_INICIAL { get; set; }
        public string HIS_EST_CUA_FECHA_FINAL { get; set; }
        public int CUA_NUMERO { get; set; }
        public string  HIS_EST_CUA_ESTADO { get; set; }
        public string HIS_EST_CUA_DESRIPCION { get; set; }
    }
}
