using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;

namespace MySQLAsync
{
    class Execute : Operation<int>
    {
        public Execute(string connectionString) : base(connectionString)
        {
        }

        protected override int Reader(MySqlCommand command)
        {
            return command.ExecuteNonQuery();
        }

        protected override Task<int> ReaderAsync(MySqlCommand command)
        {
            return command.ExecuteNonQueryAsync();
        }
    }
}
