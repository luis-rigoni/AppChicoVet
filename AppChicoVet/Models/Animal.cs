using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppChicoVet.Models
{
    public class Animal
    {

        [PrimaryKey, AutoIncrement]
        public int aniId { get; set; }

        public string aniImagem { get; set; }

        public string aniNome { get; set; } 

        public string aniApelido { get; set; }

        public DateTime aniDataNasc { get; set; }

        public string aniGenero { get; set; }

        public string aniEspecie { get; set; }

        public string aniObservacoes { get; set; }

        public string aniDono { get; set; }

    }
}
