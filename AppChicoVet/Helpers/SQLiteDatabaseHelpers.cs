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
            _connection.CreateTableAsync<Cliente>().Wait();
            _connection.CreateTableAsync<Especie>().Wait();
        }

        public Task<int> Insert(Animal p)
        {
            return _connection.InsertAsync(p);
        }

        public Task<int> Insert(Cliente p)
        {
            return _connection.InsertAsync(p);
        }

        public Task<int> Insert(Especie p)
        {
            return _connection.InsertAsync(p);
        }

        public Task<int> Update(Animal p)
        {
            return _connection.UpdateAsync(p);
        }

        public Task<int> Update(Cliente p)
        {
            return _connection.UpdateAsync(p);
        }

        public Task<int> Update(Especie p)
        {
            return _connection.UpdateAsync(p);
        }

        public Task<int> Delete(int p)
        {
            string sql = "DELETE FROM Animal WHERE aniId=?";
            return _connection.ExecuteAsync(sql, p);
        }

        public Task<int> DeleteCliente(int p)
        {
            string sql = "DELETE FROM Cliente WHERE cliId=?";
            return _connection.ExecuteAsync(sql, p);
        }

        public Task<int> DeleteEspecie(int p)
        {
            string sql = "DELETE FROM Especie WHERE espId=?";
            return _connection.ExecuteAsync(sql, p);
        }

        public Task<List<Animal>> GetAll()
        {
            return _connection.Table<Animal>().ToListAsync();

            //string sql = "SELECT * FROM Cliente";
            //return _connection.QueryAsync<Cliente>(sql, p);
        }

        public Task<List<Cliente>> GetAllClientes()
        {
            return _connection.Table<Cliente>().ToListAsync();
        }

        public Task<List<Especie>> GetAllEspecies()
        {
            return _connection.Table<Especie>().ToListAsync();
        }

        public Task<List<Animal>> Search(string p)
        {
            string sql = "SELECT * FROM Animal WHERE aniNome LIKE ?";
            return _connection.QueryAsync<Animal>(sql, "%" + p + "%");
        }

        public Task<List<Cliente>> SearchCliente(string p)
        {
            string sql = "SELECT * FROM Cliente WHERE cliNome LIKE ?";
            return _connection.QueryAsync<Cliente>(sql, "%" + p + "%");
        }

        public Task<List<Especie>> SearchEspecie(string p)
        {
            string sql = "SELECT * FROM Especie WHERE espNome LIKE ?";
            return _connection.QueryAsync<Especie>(sql, "%" + p + "%");
        }

    }
}