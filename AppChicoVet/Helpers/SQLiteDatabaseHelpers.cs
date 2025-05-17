using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using SQLite;
using AppChicoVet.Models;

namespace AppChicoVet.Helpers
{
    public class SQLiteDatabaseHelpers
    {

        readonly SQLiteAsyncConnection _connection;

        public SQLiteDatabaseHelpers(string path)
        {
            _connection = new SQLiteAsyncConnection(path);
            _connection.CreateTableAsync<Animal>().Wait();
        }

        public Task<int> Insert(Animal p)
        {
            return _connection.InsertAsync(p);
        }

        public Task<int> Update(Animal p)
        {
            return _connection.UpdateAsync(p);
        }

        public Task<int> Delete(int p)
        {
            string sql = "DELETE FROM Animal WHERE aniId=?";
            return _connection.ExecuteAsync(sql, p); 
        }

        public Task<List<Animal>> GetAll()
        {
            return _connection.Table<Animal>().ToListAsync();

            //string sql = "SELECT * FROM Cliente";
            //return _connection.QueryAsync<Cliente>(sql, p);
        }

        public Task<List<Animal>> Search(string p)
        {
            string sql = "SELECT * FROM Animal WHERE aniNome LIKE ?";
            return _connection.QueryAsync<Animal>(sql, "%" + p + "%");
        }

    }
}