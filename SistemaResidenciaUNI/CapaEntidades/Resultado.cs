using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class Resultado
    {
        public bool esError { get; set; }
        public string mensaje { get; set; }
        public object data { get; set; }
    }
}
