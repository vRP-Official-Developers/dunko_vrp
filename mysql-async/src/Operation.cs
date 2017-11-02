using CitizenFX.Core;
using CitizenFX.Core.Native;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MySQLAsync
{
    abstract class Operation<TResult>
    {
        internal string ConnectionString;

        public Operation(string connectionString)
        {
            this.ConnectionString = connectionString;
        }

        public TResult Execute(string query, IDictionary<string, object> parameters = null, bool debug = false)
        {
            TResult result = default(TResult);
            Stopwatch stopwatch = new Stopwatch();

            try
            {
                if (debug)
                {
                    stopwatch.Start();
                }

                using (var connection = new MySqlConnection(ConnectionString))
                {
                    connection.Open();

                    using (var command = CreateCommand(query, parameters, connection))
                    {
                        result = Reader(command);

                        if (debug)
                        {
                            stopwatch.Stop();
                            // @TODO Function.Call<string>(Hash.GET_INVOKING_RESOURCE)
                            Console.WriteLine(string.Format("[{0}] [{1}ms] {2}", "", stopwatch.ElapsedMilliseconds, QueryToString(query, parameters)));
                        }
                    }
                }
            }
            catch (AggregateException aggregateException)
            {
                var firstException = aggregateException.InnerExceptions.First();

                if (!(firstException is MySqlException))
                {
                    throw;
                }

                // @TODO Function.Call<string>(Hash.GET_INVOKING_RESOURCE)
                CitizenFX.Core.Debug.Write(string.Format("[ERROR] [{0}] An error happens on MySQL for query \"{1}\": {2}\n", "", QueryToString(query, parameters), firstException.Message));
            }
            catch (MySqlException mysqlException)
            {
                // @TODO Function.Call<string>(Hash.GET_INVOKING_RESOURCE)
                CitizenFX.Core.Debug.Write(string.Format("[ERROR] [{0}] An error happens on MySQL for query \"{1}\": {2}\n", "", QueryToString(query, parameters), mysqlException.Message));
            }
            catch (Exception exception)
            {
                // @TODO Function.Call<string>(Hash.GET_INVOKING_RESOURCE)
                CitizenFX.Core.Debug.Write(string.Format("[ERROR] [{0}] An critical error happens on MySQL for query \"{1}\": {2} {3}\n", "", QueryToString(query, parameters), exception.Message, exception.StackTrace));
            }

            return result;
        }

        public async void ExecuteAsync(string query, IDictionary<string, object> parameters, CallbackDelegate callback, bool debug = false)
        {
            Stopwatch stopwatch = new Stopwatch();

            try
            {
                if (debug)
                {
                    stopwatch.Start();
                }

                using (var connection = new MySqlConnection(ConnectionString))
                {
                    await connection.OpenAsync();

                    using (var command = CreateCommand(query, parameters, connection))
                    {
                        var result = await ReaderAsync(command);

                        if (debug)
                        {
                            stopwatch.Stop();
                            // @TODO Function.Call<string>(Hash.GET_INVOKING_RESOURCE)
                            Console.WriteLine(string.Format("[{0}] [{1}ms] {2}", "", stopwatch.ElapsedMilliseconds, QueryToString(query, parameters)));
                        }

                        if (result != null)
                        {
                            callback.Invoke(result);
                        }
                    }
                }
            }
            catch (AggregateException aggregateException)
            {
                var firstException = aggregateException.InnerExceptions.First();

                if (!(firstException is MySqlException))
                {
                    throw aggregateException;
                }

                // @TODO Function.Call<string>(Hash.GET_INVOKING_RESOURCE)
                CitizenFX.Core.Debug.Write(string.Format("[ERROR] [{0}] An error happens on MySQL for query \"{1}\": {2}\n", "", QueryToString(query, parameters), firstException.Message));
            }
            catch (MySqlException mysqlException)
            {
                // @TODO Function.Call<string>(Hash.GET_INVOKING_RESOURCE)
                CitizenFX.Core.Debug.Write(string.Format("[ERROR] [{0}] An error happens on MySQL for query \"{1}\": {2}\n", "", QueryToString(query, parameters), mysqlException.Message));
            }
            catch (ArgumentNullException)
            {
                // @TODO Function.Call<string>(Hash.GET_INVOKING_RESOURCE)
                CitizenFX.Core.Debug.Write(string.Format("[ERROR] [{0}] Check the error above, an error happens when executing the callback from the query : \"{1}\"\n", "", QueryToString(query, parameters)));
            }
            catch (Exception exception)
            {
                // @TODO Function.Call<string>(Hash.GET_INVOKING_RESOURCE)
                CitizenFX.Core.Debug.Write(string.Format("[ERROR] [{0}] An critical error happens on MySQL for query \"{1}\": {2} {3}\n", "", QueryToString(query, parameters), exception.Message, exception.StackTrace));
            }
        }

        abstract protected TResult Reader(MySqlCommand command);

        abstract protected Task<TResult> ReaderAsync(MySqlCommand command);

        private MySqlCommand CreateCommand(string query, IDictionary<string, object> parameters, MySqlConnection connection)
        {
            MySqlCommand command = (MySqlCommand)connection.CreateCommand();
            command.CommandText = query;

            foreach (var parameter in parameters ?? Enumerable.Empty<KeyValuePair<string, object>>())
            {
                command.Parameters.AddWithValue(parameter.Key, parameter.Value);
            }

            return command;
        }

        private string QueryToString(string query, IDictionary<string, object> parameters)
        {
            return query + " {" + string.Join(";", parameters.Select(x => x.Key + "=" + x.Value).ToArray()) + "}";
        }
    }
}
