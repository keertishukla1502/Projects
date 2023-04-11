using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace TicketService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "ITicketWCF" in both code and config file together.
    [ServiceContract]
    public interface ITicketWCF
    {
        [OperationContract]
        List<Dictionary<string, string>> GetData<T>(string Storeprocedure, string id = "0") where T : class, new();
    }
}
