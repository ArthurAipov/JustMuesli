using JustMuesli.DataBase;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace JustMuesli.Models
{
    public class MixItem : INotifyPropertyChanged
    {
        public Muesli Muesli { get; set; }
        private float actualWeight;
        public float ActualWeight
        {
            get
            {
                return actualWeight;
            }
            set
            {
                this.actualWeight = value;
                NotifyPropertyChanged();
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;

        private void NotifyPropertyChanged([CallerMemberName] String propertyName = "")
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

    }
}
