using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using CitizenFX.Core;
using MySql.Data.MySqlClient;

namespace MySQLAsync
{
    class Transaction : Operation<bool>
    {
        public Transaction(string connectionString) : base(connectionString) { }

        public bool ExecuteTransaction(IList<string> querys, IDictionary<string, object> parameters = null, bool debug = false)
        {
            bool result = false;
            Stopwatch stopwatch = new Stopwatch();

            try
            {
                stopwatch.Start();

                using (var connection = new MySqlConnection(ConnectionString))
                {
                    connection.Open();
                    var ConnectionTime = stopwatch.ElapsedMilliseconds;
                    stopwatch.Restart();

                    using (var command = connection.CreateCommand())
                    {
                        foreach (var parameter in parameters ?? Enumerable.Empty<KeyValuePair<string, object>>())
                            command.Parameters.AddWithValue(parameter.Key, parameter.Value);
                        var QueryTime = stopwatch.ElapsedMilliseconds;
                        stopwatch.Restart();

                        using (var transaction = connection.BeginTransaction())
                        {
                            command.Transaction = transaction;

                            try
                            {
                                foreach (string commandText in querys)
                                {
                                    command.CommandText = commandText;
                                    command.ExecuteNonQuery();
                                }
                                transaction.Commit();
                                result = true;
                            }
                            catch (Exception ex)
                            {
                                transaction.Rollback();
                                CitizenFX.Core.Debug.Write(string.Format("[ERROR] [{0}] [{1}] {2}\n", "MySQL", "Transaction", ex.Message));
                            }
                        }

                        stopwatch.Stop();

                        if (debug)
                        {
                            Console.WriteLine(string.Format("[{0}] [C: {1}ms, Q: {2}ms, R: {3}ms] {4}", "MySQL", ConnectionTime, QueryTime, stopwatch.ElapsedMilliseconds, QueryToString("Transaction", parameters)));
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

                CitizenFX.Core.Debug.Write(string.Format("[ERROR] [{0}] An error happens on MySQL for query \"{1}\": {2}\n", "MySQL", QueryToString("Transaction", parameters), firstException.Message));
            }
            catch (MySqlException mysqlException)
            {
                CitizenFX.Core.Debug.Write(string.Format("[ERROR] [{0}] An error happens on MySQL for query \"{1}\": {2}\n", "MySQL", QueryToString("Transaction", parameters), mysqlException.Message));
            }
            catch (Exception exception)
            {
                CitizenFX.Core.Debug.Write(string.Format("[ERROR] [{0}] An critical error happens on MySQL for query \"{1}\": {2} {3}\n", "MySQL", QueryToString("Transaction", parameters), exception.Message, exception.StackTrace));
            }

            return result;
        }

        public async void ExecuteTransactionAsync(IList<string> querys, IDictionary<string, object> parameters = null, CallbackDelegate callback = null, bool debug = false)
        {
            bool result = false;
            Stopwatch stopwatch = new Stopwatch();

            try
            {
                stopwatch.Start();

                using (var connection = new MySqlConnection(ConnectionString))
                {
                    await connection.OpenAsync();
                    var ConnectionTime = stopwatch.ElapsedMilliseconds;
                    stopwatch.Restart();

                    using (var command = connection.CreateCommand())
                    {
                        foreach (var parameter in parameters ?? Enumerable.Empty<KeyValuePair<string, object>>())
                            command.Parameters.AddWithValue(parameter.Key, parameter.Value);
                        var QueryTime = stopwatch.ElapsedMilliseconds;
                        stopwatch.Restart();

                        using (var transaction = await connection.BeginTransactionAsync())
                        {
                            command.Transaction = transaction;

                            try
                            {
                                foreach (string commandText in querys)
                                {
                                    command.CommandText = commandText;
                                    await command.ExecuteNonQueryAsync();
                                }
                                await transaction.CommitAsync();
                                result = true;
                            }
                            catch (Exception ex)
                            {
                                await transaction.RollbackAsync();
                                CitizenFX.Core.Debug.Write(string.Format("[ERROR] [{0}] [{1}] {2}\n", "MySQL", "Transaction", ex.Message));
                            }
                        }

                        stopwatch.Stop();

                        if (debug)
                        {
                            Console.WriteLine(string.Format("[{0}] [C: {1}ms, Q: {2}ms, R: {3}ms] {4}", "MySQL", ConnectionTime, QueryTime, stopwatch.ElapsedMilliseconds, QueryToString("Transaction", parameters)));
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

                CitizenFX.Core.Debug.Write(string.Format("[ERROR] [{0}] An error happens on MySQL for query \"{1}\": {2}\n", "MySQL", QueryToString("Transaction", parameters), firstException.Message));
            }
            catch (MySqlException mysqlException)
            {
                CitizenFX.Core.Debug.Write(string.Format("[ERROR] [{0}] An error happens on MySQL for query \"{1}\": {2}\n", "MySQL", QueryToString("Transaction", parameters), mysqlException.Message));
            }
            catch (Exception exception)
            {
                CitizenFX.Core.Debug.Write(string.Format("[ERROR] [{0}] An critical error happens on MySQL for query \"{1}\": {2} {3}\n", "MySQL", QueryToString("Transaction", parameters), exception.Message, exception.StackTrace));
            }

            callback?.Invoke(result);
        }

        protected override bool Reader(MySqlCommand command) => throw new NotImplementedException();
        protected override Task<bool> ReaderAsync(MySqlCommand command) => throw new NotImplementedException();

    }
}
