using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace XShare.Data.Models
{
    public class Reservation
    {
        public int Id { get; set; }

        public string From { get; set; }

        public string To { get; set; }

        public DateTime Date { get; set; }

        public virtual Car Car { get; set; }
    }
}
