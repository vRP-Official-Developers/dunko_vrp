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
            var result = command.ExecuteScalar();

            if (result != null && result.GetType() == typeof(DBNull))
            {
                result = null;
            }

            return result;
        }

        protected override async Task<object> ReaderAsync(MySqlCommand command)
        {
            var result = await command.ExecuteScalarAsync();

            if (result != null && result.GetType() == typeof(DBNull))
            {
                result = null;
            }

            return result;
        }
    }
}
