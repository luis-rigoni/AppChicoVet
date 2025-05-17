using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SQLite;

namespace AppChicoVet.Models
{
    public class Especie
    {

        [PrimaryKey, AutoIncrement]
        public int espId { get; set; }

        public string espNome { get; set; }

    }
}
