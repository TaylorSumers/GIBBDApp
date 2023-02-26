using System;
using System.Collections.Generic;
using System.Data.Entity.ModelConfiguration.Configuration;
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

namespace GIBBDApp
{
    /// <summary>
    /// Interaction logic for DriversPage.xaml
    /// </summary>
    public partial class DriversPage : Page
    {
        static GIBDDEntities cont;

        static IEnumerable<dynamic> Drivers;
        static IEnumerable<dynamic> Passports;
        static IEnumerable<dynamic> DriverLicenses;
        void DataRefresh() //Метод для обновления информации после добавления/изменения/удаления
        {
            cont = new GIBDDEntities();
            //Информация о водителях
            Drivers = (from Driver in cont.Driver
                       join Address in cont.Address on Driver.DriverAddress equals Address.AddressID
                       join City in cont.City on Address.City equals City.CityID
                       join Street in cont.Street on Address.Street equals Street.StreetID
                       join Region in cont.Region on Address.Region equals Region.RegionID
                       join Passport in cont.Passport on Driver.DriverID equals Passport.PassportDriver
                       join DriverLicense in cont.DriverLicense on Driver.DriverID equals DriverLicense.LicneseDriver
                       select new
                       {
                            Driver.DriverID,
                            Driver.DriverName,
                            Driver.DriverSurname,
                            Driver.DriverPatronymic,
                            Driver.DriverExperience,
                            Driver.DriverDateOfBirth,
                            Address.PostCode,
                            Region.RegionName,
                            City.CityName,
                            Street.StreetName,
                            Address.House,
                            Passport.PassportSeries,
                            Passport.PassportNum,
                            Passport.PassportIssueOrg,
                            DriverLicense.LicensetNum,
                            DriverLicense.LicensetSeries,
                            DriverLicense.LicenseIssueOrg
                        }).ToList();
            Passports = (from Driver in Drivers
                         join Org in cont.DocumentsIssueOrganization on Driver.PassportIssueOrg equals Org.OrgID
                         join OrgName in cont.OrgName on Org.OrgName equals OrgName.OrgNameID
                         select new { Driver.DriverID, Org.DeptCode, OrgName.OrganizationName }).ToList();
            DriverLicenses = (from Driver in Drivers
                              join Org in cont.DocumentsIssueOrganization on Driver.LicenseIssueOrg equals Org.OrgID
                              join OrgName in cont.OrgName on Org.OrgName equals OrgName.OrgNameID
                              select new { Driver.DriverID, Org.DeptCode, OrgName.OrganizationName }).ToList();
            dtgDrivers.ItemsSource = Drivers;
        }

        public DriversPage()
        {
            InitializeComponent();
            DataRefresh();
        }

        private void dtgDrivers_SelectionChanged(object sender, SelectionChangedEventArgs e) //Заполнение полной информации сбоку при изменении выбранного водителя
        {
            if(dtgDrivers.SelectedValue != null)
            {
                var SelectedDriverInfo = Drivers.Where(item => item.DriverID == (int)dtgDrivers.SelectedValue).Single();
                tbPostIndex.Text = SelectedDriverInfo.PostCode.ToString();
                tbRegion.Text = SelectedDriverInfo.RegionName.ToString();
                tbCity.Text = SelectedDriverInfo.CityName.ToString();
                tbStreet.Text = SelectedDriverInfo.StreetName.ToString();
                tbHouse.Text = SelectedDriverInfo.House.ToString();

                var PassportInfo = Passports.Where(item => item.DriverID == (int)dtgDrivers.SelectedValue).Single();
                tbPassNum.Text = SelectedDriverInfo.PassportNum.ToString();
                tbPassSeries.Text = SelectedDriverInfo.PassportSeries.ToString();
                tbPassOrg.Text = PassportInfo.OrganizationName.ToString();
                tbPassDepCode.Text = PassportInfo.DeptCode.ToString();

                var LicenseInfo = DriverLicenses.Where(item => item.DriverID == (int)dtgDrivers.SelectedValue).Single();
                tbLicenseNum.Text = SelectedDriverInfo.LicensetNum.ToString();
                tbLicenseSeries.Text = SelectedDriverInfo.LicensetSeries.ToString();
                tbLicenseOrg.Text = LicenseInfo.OrganizationName.ToString();
                tbLicenseDepCode.Text = LicenseInfo.DeptCode.ToString();
            }

        }

        private void AddDriver_Click(object sender, RoutedEventArgs e) 
        {
            Window w = new DriverAddWindow(0); //При создании нового водителя в окно DriverAddWindow в качестве
            w.ShowDialog();                    //DriverID передаётся 0
            DataRefresh();
        }

        private void dtgDrivers_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            int DriverID = (int)dtgDrivers.SelectedValue; //При двойном клике по водитею в DataGrid
            Window w = new DriverAddWindow(DriverID);     //открывается окно для изменения информации
            w.ShowDialog();
            DataRefresh();
        }

        private void DelDriver_Click(object sender, RoutedEventArgs e)
        {
            int DriverID = (int)dtgDrivers.SelectedValue;
            Driver DelDr = cont.Driver.Where(item => item.DriverID == DriverID).Single();
            MessageBoxResult res = MessageBox.Show("Вы действительно хотите удалить данные об этом водителе?", 
            "Внимание", MessageBoxButton.YesNo, MessageBoxImage.Warning);
            if (res == MessageBoxResult.Yes)
            {
                cont.Driver.Remove(DelDr);
                cont.SaveChanges();
                DataRefresh();
            }

        }
    }
}
