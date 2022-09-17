using JustMuesli.DataBase;
using JustMuesli.Models;
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
    /// Interaction logic for MyMixPage.xaml
    /// </summary>
    public partial class MyMixPage : Page
    {
        public User mainUser;
        public MyMixPage(DataBase.User user)
        {
            InitializeComponent();
            mainUser = user;
            RefreshDataGrid();
        }
        public void RefreshDataGrid()
        {
            DataGridMyMuesliMix.ItemsSource = GlobalSettings.DB.MuesliMix.Where(m => m.UserId == mainUser.Id).ToList();
        }

        private void ButtonBack_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void ButtonEdit_Click(object sender, RoutedEventArgs e)
        {
            var selectedMix = DataGridMyMuesliMix.SelectedItem as MuesliMix ;
            if(selectedMix == null)
            {
                MessageBox.Show("select muesli mix");
                return;
            }
            NavigationService.Navigate(new MixPage(mainUser, selectedMix));
        }

        private void ButtonDelete_Click(object sender, RoutedEventArgs e)
        {
            var selectedMix = DataGridMyMuesliMix.SelectedItem as MuesliMix;
            if (selectedMix == null)
            {
                MessageBox.Show("select muesli mix");
                return;
            }
            GlobalSettings.DB.MuesliMix.Remove(selectedMix);
            
            GlobalSettings.DB.SaveChanges();
            RefreshDataGrid();
        }
    }
}
