using JustMuesli.DataBase;
using JustMuesli.Pages;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace JustMuesli.Models
{
    public class OrderItem : INotifyPropertyChanged
    {
        private bool? size;
        public bool? Size
        {
            get
            {
                return size;
            }
            set
            {
                size = value;
                NotifyPropertyChanged();
                NotifyPropertyChanged("TotalPrice");
                OrderPage.orderPage.Refresh();
            }
        }

        private double quantity;
        public double Quantity
        {
            get
            {
                return quantity;
            }
            set
            {
                quantity = value;
                NotifyPropertyChanged();
                NotifyPropertyChanged("TotalPrice");
                OrderPage.orderPage.Refresh();
            }
        }

        public MuesliMix MuesliMix { get; set; }
        public double TotalPrice
        {
            get
            {
                double totalPrice = 0;
                if (Size == true)
                    totalPrice = double.Parse(MuesliMix.Price) * 4 * Quantity;
                else
                    totalPrice = double.Parse(MuesliMix.Price) * Quantity;
              
                return totalPrice;
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;

        private void NotifyPropertyChanged([CallerMemberName] String propertyName = "")
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
            
        }
    }
}
