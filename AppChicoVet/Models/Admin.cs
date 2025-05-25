using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppChicoVet.Models
{
    public class Admin
    {

        [PrimaryKey, AutoIncrement]
        public int adminId { get; set; }

        public string adminNome { get; set; }

        public string adminSenha { get; set; }

    }
}
