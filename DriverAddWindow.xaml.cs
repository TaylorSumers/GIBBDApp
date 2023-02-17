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
using System.Windows.Shapes;

namespace GIBBDApp
{
    /// <summary>
    /// Interaction logic for DriverAddWindow.xaml
    /// </summary>
    public partial class DriverAddWindow : Window
    {
        GIBDD_Suv_DorEntities cont = new GIBDD_Suv_DorEntities();
        public DriverAddWindow()
        {
            InitializeComponent();
            cbxRegion.ItemsSource = cont.Region.ToList();
            cbxCity.ItemsSource = cont.City.ToList();
            cbxStreet.ItemsSource = cont.Street.ToList();
            cbxPassOrg.ItemsSource = cont.OrgName.ToList();
            cbxLicOrg.ItemsSource = cont.OrgName.ToList();
            /*
            Driver NewDriver = new Driver();
            NewDriver.DriverSurname = "xxx";
            Address NewAddress = new Address();
            NewAddress.PostCode = 123;
            tbxPostCode.DataContext = NewAddress;
            */
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            Driver NewDriver = new Driver();
            NewDriver.DriverSurname = tbxSurname.Text;
            NewDriver.DriverName = tbxName.Text;
            NewDriver.DriverPatronymic = tbxPatronymic.Text;
            NewDriver.DriverExperience = Convert.ToInt32(tbxExperience.Text);
            NewDriver.DriverDateOfBirth = dtpDateOfBirth.SelectedDate;

            Address NewAddress = new Address();
            NewAddress.PostCode = Convert.ToInt32(tbxPostCode.Text);
            NewAddress.Region = Convert.ToInt32(cbxRegion.SelectedValue);
            NewAddress.City = Convert.ToInt32(cbxCity.SelectedValue);
            NewAddress.Street = Convert.ToInt32(cbxStreet.SelectedValue);
            NewAddress.House = tbxHouse.Text;

            Passport NewPassport = new Passport
            {
                PassportSeries = Convert.ToInt32(tbxPassSeries.Text),
                PassportNum = Convert.ToInt32(tbxPassNum.Text),
                PassportIssueOrg = Convert.ToInt32(cbxPassOrg.SelectedValue),
                Driver = NewDriver
            };

            DriverLicense NewLicense = new DriverLicense
            {
                LicensetSeries = Convert.ToInt32(tbxPassSeries.Text),
                LicensetNum = Convert.ToInt32(tbxPassNum.Text),
                LicenseIssueOrg = Convert.ToInt32(cbxPassOrg.SelectedValue),
                Driver = NewDriver
            };

            NewDriver.Address = NewAddress;

            cont.Address.Add(NewAddress);
            cont.Driver.Add(NewDriver);
            cont.Passport.Add(NewPassport);
            cont.DriverLicense.Add(NewLicense);
            cont.SaveChanges();
        }
    }
}
