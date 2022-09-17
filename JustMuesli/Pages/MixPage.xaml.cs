using JustMuesli.DataBase;
using JustMuesli.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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
    /// Interaction logic for mixPage.xaml
    /// </summary>
    public partial class MixPage : Page
    {
        List<Muesli> muesli;
        ObservableCollection<MixItem> items;
        public double Calories;
        public double Carbohydrate;
        public double Fat;
        public double Protein;
        public int count = 0;
        public bool Basic = false;
        public Muesli SelectedMuesli;
        public double Price;
        public User user;
        public bool IsAdd = true;
        public bool IsRemove = false;
        public DbPropertyValues OldValues;
        public MixPage(DataBase.User mainUser, MuesliMix muesliMix)
        {
            InitializeComponent();
            ListViewMixer.ItemsSource = GlobalSettings.DB.Muesli.Where(m => m.Type.Name == TIBasics.Header.ToString()).ToList();
            ListViewMixerCereals.ItemsSource = GlobalSettings.DB.Muesli.Where(m => m.Type.Name == TICereal.Header.ToString()).ToList();
            ListViewMixerChoco.ItemsSource = GlobalSettings.DB.Muesli.Where(m => m.Type.Name == TIChoco.Header.ToString()).ToList();
            ListViewMixerFruits.ItemsSource = GlobalSettings.DB.Muesli.Where(m => m.Type.Name == TIFruits.Header.ToString()).ToList();
            ListViewMixerNutsCo.ItemsSource = GlobalSettings.DB.Muesli.Where(m => m.TypeId == 4).ToList();
            ListViewMixerSpecials.ItemsSource = GlobalSettings.DB.Muesli.Where(m => m.Type.Name == TISpecials.Header.ToString()).ToList();
            items = new ObservableCollection<MixItem>();
            items.CollectionChanged += Items_CollectionChanged;
            muesli = new List<Muesli>();
            user = mainUser;
            if (muesliMix.Id != 0)
            {
                TBName.IsReadOnly = true;
                IsAdd = false;
                foreach (var m in GlobalSettings.DB.MuesliMixMuesli)
                {
                    if (m.MuesliMixId == muesliMix.Id)
                    {
                        if (m.Muesli.TypeId != 1)
                        {
                            var muesli = new MixItem { Muesli = m.Muesli, ActualWeight = m.Muesli.PortionSize };
                            GlobalSettings.DB.MuesliMixMuesli.Remove(m);
                            items.Add(muesli);
                        }
                        else
                        {
                            var totalWeight = items.Where(i => i.Muesli.TypeId != 1).Sum(i => i.Muesli.PortionSize);
                            var weight = m.Muesli.PortionSize - totalWeight;
                            var muesli = new MixItem { Muesli = m.Muesli, ActualWeight = weight };
                            items.Add(muesli);
                        }
                    }
                }
                OldValues = GlobalSettings.DB.Entry(muesliMix).CurrentValues.Clone();
                ListViewMixItems.ItemsSource = items.OrderByDescending(i => i.Muesli.TypeId);
                Refresh();
            }
            else
            {
                muesliMix = new MuesliMix { Name = TBName.Text, CreateDate = DateTime.Now.Date, UserId = user.Id, Price = Price.ToString() };
            }
            DataContext = muesliMix;
        }

        private void Items_CollectionChanged(object sender, System.Collections.Specialized.NotifyCollectionChangedEventArgs e)
        {
            Refresh();
        }

        public void Refresh()
        {
            double protein = 0;
            double fat = 0;
            double carbohydrate = 0;
            double calories = 0;
            double price = 0;
            foreach (var muesli in items)
            {
                if (muesli.Muesli.TypeId == 1)
                {
                    var totalWeight = items.Where(i => i.Muesli.TypeId != 1).Sum(i => i.Muesli.PortionSize);
                    var weight = muesli.Muesli.PortionSize - totalWeight;
                    muesli.ActualWeight = weight;
                    protein += muesli.Muesli.Protein / 100 * weight;
                    fat += muesli.Muesli.Fat / 100 * weight;
                    carbohydrate += muesli.Muesli.Carbohydrate / 100 * weight;
                    price += muesli.Muesli.Price / 600 * weight;
                }
                else
                {
                    carbohydrate += muesli.Muesli.Carbohydrate / 100 * muesli.Muesli.PortionSize;
                    protein += muesli.Muesli.Protein / 100 * muesli.Muesli.PortionSize;
                    fat += muesli.Muesli.Fat / 100 * muesli.Muesli.PortionSize;
                    price += muesli.Muesli.Price;
                }
            }
            calories = ((protein * 4.1 + fat * 9.3 + carbohydrate * 4.1) / 600) * 100;
            Calories = calories;
            Fat = fat;
            Carbohydrate = carbohydrate;
            Protein = protein;
            ListViewMixItems.ItemsSource = items.OrderByDescending(i => i.Muesli.TypeId);
            TextBlockCalories.Text = calories.ToString() + " kcal / 100g";
            TextBlockPrice.Text = "Fr." + price.ToString() + " / 600g";
        }
        public void RefreshWidth()
        {
            Refresh();
        }

        private void ButtonBack_Click(object sender, RoutedEventArgs e)
        {
            var muesli = DataContext as MuesliMix;
            if (!IsAdd)
            {
                GlobalSettings.DB.Entry(muesli).CurrentValues.SetValues(OldValues);
                GlobalSettings.DB.SaveChanges();
            }
            NavigationService.GoBack();
        }

        private void ButtonDetails_Click(object sender, RoutedEventArgs e)
        {
            var details = "";
            var kj = Calories * 4.184 / 600 * 100;
            var calories = Calories / 600 * 100;
            details += "Carbohydrates : " + ((Carbohydrate / 600) * 100).ToString() + "\n";
            details += "Fat : " + ((Fat / 600) * 100).ToString() + "\n";
            details += "Protein : " + ((Protein / 600) * 100).ToString() + "\n";
            details += "KJ : " + kj.ToString() + "\n";
            details += "Calories : " + calories.ToString() + "\n";
            MessageBox.Show(details);
        }

        private void ButtonSave_Click(object sender, RoutedEventArgs e)
        {
            var muesliMix = DataContext as MuesliMix;
            var errorMessage = "";
            var muesliBasic = items.FirstOrDefault(u => u.Muesli.TypeId == 1);
            if (muesliMix.Name == null)
                errorMessage += "Enter name\n";
            if (items.Count < 0)
                errorMessage += "Enter ingredients\n";
            if (muesliBasic == null)
                errorMessage += "Select basic ingredient\n";
            if (!string.IsNullOrWhiteSpace(errorMessage))
            {
                MessageBox.Show(errorMessage);
                return;
            }
            if (!IsAdd)
            {
                foreach (var m in GlobalSettings.DB.MuesliMixMuesli)
                {
                    if (m.MuesliMixId == muesliMix.Id)
                    {
                        GlobalSettings.DB.MuesliMixMuesli.Remove(m);
                    }
                }
                GlobalSettings.DB.SaveChanges();
                foreach (var m in items)
                {
                    var newMuesliMix = new MuesliMixMuesli { MuesliMixId = muesliMix.Id, MuesliId = m.Muesli.Id };
                    GlobalSettings.DB.MuesliMixMuesli.Add(newMuesliMix);
                }

            }
            else
            {

                var muesli = GlobalSettings.DB.MuesliMix.FirstOrDefault(m => m.Name == TBName.Text);

                if (muesli != null)
                {
                    MessageBox.Show("This name is taken");
                    return;
                }
                var newMuesli = new MuesliMix { CreateDate = DateTime.Now, Name = TBName.Text, Price = Price.ToString(), UserId = user.Id };
                GlobalSettings.DB.MuesliMix.Add(newMuesli);
                GlobalSettings.DB.SaveChanges();
                var muesliMixId = GlobalSettings.DB.MuesliMix.FirstOrDefault(m => m.Name == newMuesli.Name);
                foreach (var mues in items)
                {
                    var mix = new MuesliMixMuesli { MuesliId = mues.Muesli.Id, MuesliMixId = muesliMixId.Id };
                    GlobalSettings.DB.MuesliMixMuesli.Add(mix);
                    GlobalSettings.DB.SaveChanges();

                }
            }
            GlobalSettings.DB.SaveChanges();
            NavigationService.GoBack();
        }



        private void ButtonAddToMuesli_Click(object sender, RoutedEventArgs e)
        {
            var selectedMuesli = (sender as Button).DataContext as Muesli;
            if (selectedMuesli == null)
                return;
            SelectedMuesli = selectedMuesli;
            if (selectedMuesli.TypeId == 1)
            {
                var basicMuesli = items.FirstOrDefault(m => m.Muesli.TypeId == 1);
                if (basicMuesli != null)
                {
                    items.Remove(basicMuesli);
                }
                count = 13;
                var mixItem = new MixItem { Muesli = selectedMuesli, ActualWeight = selectedMuesli.PortionSize };
                items.Add(mixItem);
            }
            else
            {
                if (count == 0)
                {
                    count = 12;
                }
                if (selectedMuesli.PortionSize >= Width)
                {
                    MessageBox.Show("weight this muesli more than basic muesli");
                    return;

                }
                if (items.Count == count && count == 12)
                {
                    MessageBox.Show("you have chosen 12 additional ingredients now choose the base for them", "ok");
                    return;
                }
                if (items.Count == count && count == 13)
                {
                    MessageBox.Show("you have chosen all ingredients", "ok");
                    return;
                }
                if (items.Count <= count)
                {
                    var newMixItemMuesli = new MixItem { Muesli = selectedMuesli, ActualWeight = selectedMuesli.PortionSize };
                    items.Add(newMixItemMuesli);
                    Price += selectedMuesli.Price;
                    Refresh();
                    return;
                }
                Refresh();
            }


        }

        private void ListViewMixItems_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            var muesli = ListViewMixItems.SelectedItem as MixItem;
            if (muesli.Muesli.TypeId == 1)
            {
                MessageBox.Show("you cant remove basic muesli");
                return;
            }
            IsRemove = true;
            items.Remove(muesli);

        }
    }
}