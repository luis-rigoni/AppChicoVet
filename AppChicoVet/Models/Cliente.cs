using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppChicoVet.Models
{
    public class Cliente
    {

        [PrimaryKey, AutoIncrement]
        public int cliId { get; set; }

        public string cliNome { get; set; }

        public string cliCPF { get; set; }

        public string cliEmail { get; set; }

        public string cliTelefone { get; set; }

        public string cliGenero { get; set; }

        public DateTime cliDataCadastro { get; set; }

        public DateTime cliDataNascimento { get; set; }

    }
}
