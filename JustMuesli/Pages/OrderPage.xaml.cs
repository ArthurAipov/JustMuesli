using JustMuesli.DataBase;
using JustMuesli.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace JustMuesli.Pages
{
    /// <summary>
    /// Interaction logic for OrderPage.xaml
    /// </summary>
    public partial class OrderPage : Page
    {
        ObservableCollection<OrderItem> SelectedMixes;
        public double Price;
        public double selectedPrice;
        public User mainUser;
        public static OrderPage orderPage; 
        public OrderPage(DataBase.User user)
        {
            InitializeComponent();
            orderPage = this;
            SelectedMixes = new ObservableCollection<OrderItem>();
            foreach (var m in GlobalSettings.DB.MuesliMix)
            {
                SelectedMixes.Add(new OrderItem { MuesliMix = m });
            }
            DataGridMusliMix.ItemsSource = SelectedMixes.ToList();
            mainUser = user;
        }

        public void Refresh()
        {
            double allPrice = 0;
            double fullPrice = 0;
            foreach (var m in SelectedMixes)
            {
                allPrice += m.TotalPrice;
            }
            fullPrice += allPrice;
            PriceForMuesli.Text = allPrice.ToString();
            if (mainUser.Country.Name == "Швейцария")
            {
                TextBlockTaxes.Text = ((allPrice / 100) * 2.5).ToString();
                if (allPrice + (allPrice / 100) * 2.5 > 50)
                {
                    fullPrice += (allPrice / 100) * 2.5;
                    PriceForShipping.Text = "0.00";
                }
                else
                {
                    fullPrice += (allPrice / 100) * 2.5 + 6.00;
                    PriceForShipping.Text = "6.00";
                }
                TextBlockAllPrice.Text = fullPrice.ToString();
            }
            else
            {
                TextBlockTaxes.Text = "0";
                if (allPrice + (allPrice / 100) * 2.5 > 50)
                {
                    PriceForShipping.Text = "0.00";
                }
                else
                {
                    fullPrice += 6.00;
                    PriceForShipping.Text = "6.00";
                }
                TextBlockAllPrice.Text = fullPrice.ToString();
            }

            Price = fullPrice;

        }

        private void ButtonBack_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void ButtonSubmit_Click(object sender, RoutedEventArgs e)
        {
            var order = new Order { Price = Price.ToString(), UserId = mainUser.Id };
            GlobalSettings.DB.Order.Add(order);
            GlobalSettings.DB.SaveChanges();

            foreach (var m in SelectedMixes)
            {
                var muesliMix = new OrderMuesli { MuesliId = m.MuesliMix.Id, OrderId = order.Id, Size = m.Size.Value, Quantity = m.Quantity.ToString() };
                GlobalSettings.DB.OrderMuesli.Add(muesliMix);
            }
            GlobalSettings.DB.SaveChanges();
            NavigationService.GoBack();
        }


       //private void TextBoxQuantity_LostFocus(object sender, RoutedEventArgs e)
       //{
       //    var selectedTextBox = (sender as TextBox);
       //    if (selectedTextBox == null)
       //        return;
       //    var selectedMuesli = DataGridMusliMix.SelectedItem as OrderItem;
       //    var mix = SelectedMixes.FirstOrDefault(m => m.MuesliMix == selectedMuesli.MuesliMix);
       //    var pattern = @"[0-9]";
       //    if (!Regex.IsMatch(selectedTextBox.Text, pattern))
       //    {
       //        MessageBox.Show("Enter correct quantity");
       //        return;
       //    }
       //
       //    var quantity = double.Parse(selectedTextBox.Text);
       //    if (mix.Size == true)
       //        mix.TotalPrice = (double.Parse(mix.MuesliMix.Price) * quantity) * 4;
       //    else
       //        mix.TotalPrice = (double.Parse(mix.MuesliMix.Price) * quantity);
       //    mix.Quantity = quantity;
       //    Refresh();
       //
       //}
       //
       //
       //private void CheckeBoxSize_Checked(object sender, RoutedEventArgs e)
       //{
       //    var check = (sender as CheckBox);
       //    if (check == null)
       //        return;
       //    var selectedMuesli = DataGridMusliMix.SelectedItem as OrderItem;
       //    var mix = SelectedMixes.FirstOrDefault(m => m.MuesliMix == selectedMuesli.MuesliMix);
       //    if(check.IsChecked == true)
       //    {
       //        mix.Size = check.IsChecked;
       //        mix.TotalPrice = (double.Parse(mix.MuesliMix.Price) * mix.Quantity) * 4;
       //    }
       //    else
       //    {
       //        mix.Size = check.IsChecked;
       //        mix.TotalPrice = (double.Parse(mix.MuesliMix.Price) * mix.Quantity);
       //
       //    }
       //    Refresh();
       //}
    }
}
