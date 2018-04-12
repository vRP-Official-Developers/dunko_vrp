using CitizenFX.Core;
using CitizenFX.Core.Native;
using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;
using System.Threading.Tasks;
using System.Linq;

namespace MySQLAsync
{
    public class MySQLAsync : BaseScript
    {
        internal String ConnectionString;
        internal bool debug;

        public MySQLAsync()
        {
            Exports.Add("mysql_configure", new Action(() =>
            {
                Configure(
                    Function.Call<string>(Hash.GET_CONVAR, "mysql_connection_string"),
                    Function.Call<string>(Hash.GET_CONVAR, "mysql_debug") == "true"
                );
            }));

            Exports.Add("mysql_execute", new Action<string, IDictionary<string, object>, CallbackDelegate>((query, parameters, callback) =>
            {
                (new Execute(ConnectionString)).ExecuteAsync(query, parameters, callback, debug);
            }));
            Exports.Add("mysql_sync_execute", new Func<string, IDictionary<string, object>, int>((query, parameters) =>
            {
                return (new Execute(ConnectionString)).Execute(query, parameters, debug);
            }));
            Exports.Add("mysql_threaded_execute", new Func<string, IDictionary<string, object>, Task<object>>(async (query, parameters) =>
            {
                return await (new Execute(ConnectionString)).ExecuteThreaded(query, parameters, debug);
            }));

            Exports.Add("mysql_fetch_all", new Action<string, IDictionary<string, object>, CallbackDelegate>((query, parameters, callback) =>
            {
                (new FetchAll(ConnectionString)).ExecuteAsync(query, parameters, callback, debug);
            }));
            Exports.Add("mysql_sync_fetch_all", new Func<string, IDictionary<string, object>, List<Dictionary<string, Object>>>((query, parameters) =>
            {
                return (new FetchAll(ConnectionString)).Execute(query, parameters, debug);
            }));
            Exports.Add("mysql_threaded_fetch_all", new Func<string, IDictionary<string, object>, Task<object>>(async (query, parameters) =>
            {
                return await (new FetchAll(ConnectionString)).ExecuteThreaded(query, parameters, debug);
            }));

            Exports.Add("mysql_fetch_scalar", new Action<string, IDictionary<string, object>, CallbackDelegate>((query, parameters, callback) =>
            {
                (new FetchScalar(ConnectionString)).ExecuteAsync(query, parameters, callback, debug);
            }));
            Exports.Add("mysql_sync_fetch_scalar", new Func<string, IDictionary<string, object>, Object>((query, parameters) =>
            {
                return (new FetchScalar(ConnectionString)).Execute(query, parameters, debug);
            }));
            Exports.Add("mysql_threaded_fetch_scalar", new Func<string, IDictionary<string, object>, Task<object>>(async (query, parameters) =>
            {
                return await (new FetchScalar(ConnectionString)).ExecuteThreaded(query, parameters, debug);
            }));

            Exports.Add("mysql_insert", new Action<string, IDictionary<string, object>, CallbackDelegate>((query, parameters, callback) =>
            {
                (new Insert(ConnectionString)).ExecuteAsync(query, parameters, callback, debug);
            }));
            Exports.Add("mysql_sync_insert", new Func<string, IDictionary<string, object>, Object>((query, parameters) =>
            {
                return (new Insert(ConnectionString)).Execute(query, parameters, debug);
            }));
            Exports.Add("mysql_threaded_insert", new Func<string, IDictionary<string, object>, Task<object>>(async (query, parameters) =>
            {
                return await (new Insert(ConnectionString)).ExecuteThreaded(query, parameters, debug);
            }));

            Exports.Add("mysql_transaction", new Action<IList<object>, IDictionary<string, object>, CallbackDelegate>((querys, parameters, callback) =>
            {
                (new Transaction(ConnectionString)).ExecuteTransactionAsync(querys.Select(q => q.ToString()).ToList(), parameters, callback, debug);
            }));
            Exports.Add("mysql_sync_transaction", new Func<IList<object>, IDictionary<string, object>, bool>((querys, parameters) =>
            {
                return (new Transaction(ConnectionString)).ExecuteTransaction(querys.Select(q => q.ToString()).ToList(), parameters, debug);
            }));
        }

        private void Configure(string connectionStringConfig, bool debug)
        {
            var connectionStringBuilder = new MySqlConnectionStringBuilder(connectionStringConfig);
            connectionStringBuilder.AllowUserVariables = true;

            this.debug = debug;
            ConnectionString = connectionStringBuilder.ToString();
        }
    }
}
