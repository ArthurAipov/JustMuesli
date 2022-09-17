using JustMuesli.DataBase;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
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
    /// Interaction logic for Menu.xaml
    /// </summary>
    public partial class Menu : Page
    {
        public User User;
        public Menu(DataBase.User user)
        {
            InitializeComponent();
            User = user;
        }

        private void ButtonExit_Click(object sender, RoutedEventArgs e)
        {
            App.Current.Shutdown();
        }

        private void ButtonOrder_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new OrderPage(User));

        }

        private void ButtonEditCustomerDetails_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new EditCustomerDetailsPage(User));

        }

        private void ButtonMix_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new MixPage(User, new MuesliMix()));
        }

        private void ButtonMyMuesliMix_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new MyMixPage(User));

        }
    }
}
