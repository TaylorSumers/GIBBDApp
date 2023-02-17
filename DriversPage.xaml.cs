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
        static GIBDD_Suv_DorEntities cont = new GIBDD_Suv_DorEntities();

        static IEnumerable<dynamic> Drivers = (from Driver in cont.Driver
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
        static IEnumerable<dynamic> Passports = (from Driver in Drivers
                        join Org in cont.DocumentsIssueOrganization on Driver.PassportIssueOrg equals Org.OrgID
                        join OrgName in cont.OrgName on Org.OrgName equals OrgName.OrgNameID
                        select new {Driver.DriverID, Org.DeptCode, OrgName.OrganizationName }).ToList();
        static IEnumerable<dynamic> DriverLicenses = (from Driver in Drivers
                        join Org in cont.DocumentsIssueOrganization on Driver.LicenseIssueOrg equals Org.OrgID
                        join OrgName in cont.OrgName on Org.OrgName equals OrgName.OrgNameID
                        select new { Driver.DriverID, Org.DeptCode, OrgName.OrganizationName }).ToList();
        public DriversPage()
        {
            InitializeComponent();

            dtgDrivers.ItemsSource = Drivers;
        }

        private void dtgDrivers_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            tbPostIndex.Text = Drivers.Where(item => item.DriverID == (int)dtgDrivers.SelectedValue).Single().PostCode.ToString();
            tbRegion.Text = Drivers.Where(item => item.DriverID == (int)dtgDrivers.SelectedValue).Single().RegionName.ToString();
            tbCity.Text = Drivers.Where(item => item.DriverID == (int)dtgDrivers.SelectedValue).Single().CityName.ToString();
            tbStreet.Text = Drivers.Where(item => item.DriverID == (int)dtgDrivers.SelectedValue).Single().StreetName.ToString();
            tbHouse.Text = Drivers.Where(item => item.DriverID == (int)dtgDrivers.SelectedValue).Single().House.ToString();

            tbPassNum.Text = Drivers.Where(item => item.DriverID == (int)dtgDrivers.SelectedValue).Single().PassportNum.ToString();
            tbPassSeries.Text = Drivers.Where(item => item.DriverID == (int)dtgDrivers.SelectedValue).Single().PassportSeries.ToString();
            tbPassOrg.Text = Passports.Where(item => item.DriverID == (int)dtgDrivers.SelectedValue).Single().OrganizationName.ToString();
            tbPassDepCode.Text = Passports.Where(item => item.DriverID == (int)dtgDrivers.SelectedValue).Single().DeptCode.ToString();

            tbLicenseNum.Text = Drivers.Where(item => item.DriverID == (int)dtgDrivers.SelectedValue).Single().LicensetNum.ToString();
            tbLicenseSeries.Text = Drivers.Where(item => item.DriverID == (int)dtgDrivers.SelectedValue).Single().LicensetSeries.ToString();
            tbLicenseOrg.Text = DriverLicenses.Where(item => item.DriverID == (int)dtgDrivers.SelectedValue).Single().OrganizationName.ToString();
            tbLicenseDepCode.Text = DriverLicenses.Where(item => item.DriverID == (int)dtgDrivers.SelectedValue).Single().DeptCode.ToString();
        }

        private void AddDriver_Click(object sender, RoutedEventArgs e)
        {
            Window w = new DriverAddWindow();
            w.ShowDialog();
        }

        private void dtgDrivers_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            Driver EditingDriver = cont.Driver.Where(item => item.DriverID == (int)dtgDrivers.SelectedValue).Single();
            Passport EditingDriverPassport = cont.Passport.Where(item=>item.PassportDriver == (int)dtgDrivers.SelectedValue).Single();
            DriverLicense EditingDriverLicense = cont.DriverLicense.Where(item => item.LicneseDriver == (int)dtgDrivers.SelectedValue).Single();
            Address EditingDriverAddress = cont.Address.Where(item=>item.AddressID == EditingDriver.DriverAddress).Single();
        }
    }
}
