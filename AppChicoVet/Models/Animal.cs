using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppChicoVet.Models
{
    class Animal
    {

        [PrimaryKey, AutoIncrement]
        public int aniId { get; set; }

        public string aniNome { get; set; } 

        public string aniApelido { get; set; }

        public int aniDataNasc { get; set; } 

        public string aniObservacoes { get; set; } 

    }
}
