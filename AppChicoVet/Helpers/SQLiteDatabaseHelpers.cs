using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using SQLite;
using AppChicoVet.Models;

namespace AppChicoVet.Helpers
{
    class SQLiteDatabaseHelpers
    {

        readonly SQLiteAsyncConnection _connection;

        public SQLiteDatabaseHelpers(string path)
        {
            _connection = new SQLiteAsyncConnection(path);
            _connection.CreateTableAsync<Especie>().Wait();
            _connection.CreateTableAsync<Animal>().Wait();
            _connection.CreateTableAsync<Cliente>().Wait();
        }

            public Task<int> Insert(Especie p)
            {
                return _connection.InsertAsync(p);
            }

            public Task<List<Especie>> Update(Especie p)
            {
                string sql = "UPDATE Especie SET Nome=? WHERE Codigo=?";
                return _connection.QueryAsync<Especie>(sql, p.espNome, p.espId);
            }

            public Task<List<Especie>> Delete(int p)
            {

                // _connection.Table<Especie>().DeleteAsync(i => i.Codigo == p);

                string sql = "DELETE Especie WHERE Codigo=?";
                return _connection.QueryAsync<Especie>(sql, p);
            }

            public Task<List<Especie>> GetAll()
            {

                return _connection.Table<Especie>().ToListAsync();

                //string sql = "SELECT * FROM Especie";
                //return _connection.QueryAsync<Especie>(sql, p);

            }

            public Task<List<Especie>> Search(string p)
            {
                string sql = "SELECT * FROM Especie WHERE espNome LIKE %'" + p + "'% ";
                return _connection.QueryAsync<Especie>(sql);
            }

    }
}
