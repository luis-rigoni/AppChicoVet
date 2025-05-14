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
            _connection.CreateTableAsync<Cliente>().Wait();
            _connection.CreateTableAsync<Animal>().Wait();
        }

            public Task<int> Insert(Cliente p)
            {
                return _connection.InsertAsync(p);
            }

            public Task<List<Cliente>> Update(Cliente p)
            {
                string sql = "UPDATE Cliente SET Nome=? WHERE cliId=?";
                return _connection.QueryAsync<Cliente>(sql, p.cliNome, p.cliId);
            }

            public Task<List<Cliente>> Delete(int p)
            {

                // _connection.Table<Cliente>().DeleteAsync(i => i.cliId == p);

                string sql = "DELETE Cliente WHERE cliId=?";
                return _connection.QueryAsync<Cliente>(sql, p);
            }

            public Task<List<Cliente>> GetAll()
            {

                return _connection.Table<Cliente>().ToListAsync();

                //string sql = "SELECT * FROM Cliente";
                //return _connection.QueryAsync<Cliente>(sql, p);

            }

            public Task<List<Cliente>> GetInd(int p)
            {
                string sql = "SELECT * FROM Cliente WHERE cliId=?";
                return _connection.QueryAsync<Cliente>(sql, p);
            }

            public Task<List<Cliente>> Search(string p)
            {
                string sql = "SELECT * FROM Cliente WHERE cliNome LIKE %'" + p + "'% ";
                return _connection.QueryAsync<Cliente>(sql);
            }



            // ========== Animal ==========

            public Task<int> InsertAni(Animal p)
            {
                return _connection.InsertAsync(p);
            }

            public Task<List<Animal>> UpdateAni(Animal p)
            {
                string sql = "UPDATE Animal SET Nome=? WHERE aniId=?";
                return _connection.QueryAsync<Animal>(sql, p.aniId, p.aniId);
            }

            public Task<List<Animal>> DeleteAni(int p)
            {

                string sql = "DELETE Animal WHERE aniId=?";
                return _connection.QueryAsync<Animal>(sql, p);
            }

            public Task<List<Animal>> GetAllAni()
            {

                return _connection.Table<Animal>().ToListAsync();

            }

            public Task<List<Animal>> SearchAni(string p)
            {
                string sql = "SELECT * FROM Animal WHERE aniNome LIKE %'" + p + "'% ";
                return _connection.QueryAsync<Animal>(sql);
            }

        }
    }
