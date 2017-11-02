using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;

namespace MySQLAsync
{
    class FetchScalar : Operation<object>
    {
        public FetchScalar(string connectionString) : base(connectionString)
        {
        }

        protected override object Reader(MySqlCommand command)
        {
            return command.ExecuteScalar();
        }

        protected override Task<object> ReaderAsync(MySqlCommand command)
        {
            return command.ExecuteScalarAsync();
        }
    }
}
