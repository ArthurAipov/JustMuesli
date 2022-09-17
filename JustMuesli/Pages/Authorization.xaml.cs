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
    /// Interaction logic for Authorization.xaml
    /// </summary>
    public partial class Authorization : Page
    {
        public Authorization()
        {
            InitializeComponent();
            TextBoxLogin.Text = Properties.Settings.Default.Login;
            TextBoxPassword.Text = Properties.Settings.Default.Password;
            CheckBoxRemember.IsChecked = Properties.Settings.Default.RememberMe;

        }

        private void ButtonLogin_Click(object sender, RoutedEventArgs e)
        {
            var errorMessage = "";
            if (string.IsNullOrWhiteSpace(TextBoxLogin.Text))
                errorMessage += "Enter Login";
            if (string.IsNullOrWhiteSpace(TextBoxPassword.Text))
                errorMessage += "Enter Password";
            if (!string.IsNullOrWhiteSpace(errorMessage))
            {
                MessageBox.Show(errorMessage);
                return;
            }
            var user = GlobalSettings.DB.User.FirstOrDefault(u => u.Password == TextBoxPassword.Text && u.Email == TextBoxLogin.Text);
            if(user != null)
            {
                if(CheckBoxRemember.IsChecked == true)
                {
                    Properties.Settings.Default.Password = TextBoxPassword.Text;
                    Properties.Settings.Default.Login = TextBoxLogin.Text;
                    Properties.Settings.Default.RememberMe = true;
                    Properties.Settings.Default.Save();
                }
                else
                {
                    Properties.Settings.Default.Password = "";
                    Properties.Settings.Default.Login = "";
                    Properties.Settings.Default.RememberMe = false;
                    Properties.Settings.Default.Save();

                }
                NavigationService.Navigate(new Menu(user));
            }
            else
            {
                MessageBox.Show("Wrong password or login");
                return;
            }
        }

        private void ButtonExit_Click(object sender, RoutedEventArgs e)
        {
            App.Current.Shutdown(); 
        }

       
    }
}
