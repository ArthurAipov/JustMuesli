using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JustMuesli.DataBase
{
    public partial class MuesliMix
    {

        public string Date
        {
            get
            {
                var date = CreateDate.Value.Day.ToString() + "." + CreateDate.Value.Month.ToString() + "." + CreateDate.Value.Year.ToString();
                return date;

            }
        }

    }
}
