using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;

namespace MySQLAsync
{
    class FetchAll : Operation<List<Dictionary<string, Object>>>
    {
        public FetchAll(string connectionString) : base(connectionString)
        {
        }

        protected override List<Dictionary<string, object>> Reader(MySqlCommand command)
        {
            var results = new List<Dictionary<string, Object>>();

            using (var reader = command.ExecuteReader())
            {
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        var line = new Dictionary<string, Object>();

                        for (int i = 0; i < reader.FieldCount; i++)
                        {
                            if (reader.IsDBNull(i))
                            {
                                line.Add(reader.GetName(i), null);
                            }
                            else
                            {
                                line.Add(reader.GetName(i), reader.GetValue(i));
                            }
                        }

                        results.Add(line);
                    }
                }
            }

            return results;
        }

        protected async override Task<List<Dictionary<string, object>>> ReaderAsync(MySqlCommand command)
        {
            var results = new List<Dictionary<string, Object>>();

            using (var reader = await command.ExecuteReaderAsync())
            {
                if (reader.HasRows)
                {
                    while (await reader.ReadAsync())
                    {
                        var line = new Dictionary<string, Object>();

                        for (int i = 0; i < reader.FieldCount; i++)
                        {
                            if (reader.IsDBNull(i))
                            {
                                line.Add(reader.GetName(i), null);
                            }
                            else
                            {
                                line.Add(reader.GetName(i), reader.GetValue(i));
                            }
                        }

                        results.Add(line);
                    }
                }
            }

            return results;
        }
    }
}
