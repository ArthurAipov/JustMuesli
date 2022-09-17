using JustMuesli.DataBase;
using JustMuesli.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
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
    /// Interaction logic for EditCustomerDetailsPage.xaml
    /// </summary>
    public partial class EditCustomerDetailsPage : Page
    {
        public DbPropertyValues oldValue;
        public EditCustomerDetailsPage(DataBase.User user)
        {
            InitializeComponent();
            CBCountry.ItemsSource = GlobalSettings.DB.Country.ToList();
            oldValue = GlobalSettings.DB.Entry(user).CurrentValues.Clone();
            DataContext = user;
        }

        private void ButtonBack_Click(object sender, RoutedEventArgs e)
        {
            var user = DataContext as User;
            GlobalSettings.DB.Entry(user).CurrentValues.SetValues(oldValue);
            NavigationService.GoBack();
        }

        private void ButtonSave_Click(object sender, RoutedEventArgs e)
        {
            var user = DataContext as User;
            var pattern = @"[0-9]+";
            var errorMessage = "";
            if (!Regex.IsMatch(user.Zip.ToString(), pattern))
                errorMessage += "Enter Normal Zip";
            if (user.Name == null)
                errorMessage += "Enter Name";
            if (user.City == null)
                errorMessage += "Enter City";
            if (user.Zip.ToString() == null)
                errorMessage += "Enter zip";
            if (user.Address == null)
                errorMessage += "Enter Address";
            if (user.Phone == null)
                errorMessage += "Enter Phone";
            if (user.Email == null)
                errorMessage += "Enter Email";
            if (user.Password == null)
                errorMessage += "Enter Password";
            if (user.Country == null)
                errorMessage += "Select Country";
            if (!string.IsNullOrWhiteSpace(errorMessage))
            {
                MessageBox.Show(errorMessage);
                return;
            }
            user.Country = CBCountry.SelectedItem as Country;
            GlobalSettings.DB.SaveChanges();
            NavigationService.GoBack();
        }
    }
}
