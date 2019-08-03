using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class EntidadEvento
    {
        public int id { get; set; }
        public string start { get; set; }
        public string end { get; set; }
        public string title { get { return "Aseo para el cuarto: " + this.id; } }
        public string eventColor { get; set; }
    }
}
