using CitizenFX.Core;
using System.Collections.Concurrent;
using System.Threading;

namespace MySQLAsync
{
    public class MySQLThread : BaseScript
    {
        internal BlockingCollection<dynamic> queryCollection = new BlockingCollection<dynamic>();
        internal ConcurrentDictionary<uint, dynamic> resultCollection = new ConcurrentDictionary<uint, dynamic>();
        internal uint NextId { get { uint result = nextId; nextId++; return result; } }
        private uint nextId = 0;
        private readonly Thread queryThread = null;

        private static MySQLThread instance;

        public MySQLThread()
        {
            instance = this;
            queryThread = new Thread(new ThreadStart(Execute));
            if (!queryThread.IsAlive)
                queryThread.Start();
        }

        public static MySQLThread GetInstance() => instance;

        private void Execute()
        {
            foreach (dynamic query in queryCollection.GetConsumingEnumerable())
                resultCollection[query.ThreadedId] = (object)query.Execute();
        }
    }
}
