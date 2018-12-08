using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Umbraco.Core.Models;
//using Umbraco.Web;
using Umbraco.Web.Models;

namespace Models
{
    public class contactModel
    {
        public string contactName { get; set; }
        public string email { get; set; }
        public string phone { get; set; }
        public string subject { get; set; }
        public string message { get; set; }
    }
}
