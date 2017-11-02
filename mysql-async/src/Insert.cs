using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;

namespace MySQLAsync
{
    class Insert : Operation<object>
    {
        public Insert(string connectionString) : base(connectionString)
        {
        }

        protected override object Reader(MySqlCommand command)
        {
            command.ExecuteNonQuery();

            using (var lastInsertCommand = command.Connection.CreateCommand())
            {
                lastInsertCommand.CommandText = "SELECT LAST_INSERT_ID()";

                return lastInsertCommand.ExecuteScalar();
            }
        }

        protected async override Task<object> ReaderAsync(MySqlCommand command)
        {
            await command.ExecuteNonQueryAsync();

            using (var lastInsertCommand = command.Connection.CreateCommand())
            {
                lastInsertCommand.CommandText = "SELECT LAST_INSERT_ID()";

                return await lastInsertCommand.ExecuteScalarAsync();
            }
        }
    }
}
