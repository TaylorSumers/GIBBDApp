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
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {

            var PasIsOrg = cont.DocumentsIssueOrganization.Where(el => el.OrgName == (int)cbxPassOrg.SelectedValue && el.DeptCode == tbxPassDept.Text).ToList();
            if (PasIsOrg.Count == 0)
            {
                DocumentsIssueOrganization NewOrg = new DocumentsIssueOrganization
                {
                    OrgName = (int)cbxPassOrg.SelectedValue,
                    DeptCode = tbxPassDept.Text
                };
            }
            //Driver NewDriver = new Driver
            //{
            //    DriverSurname = tbxSurname.Text,
            //    DriverName = tbxName.Text,
            //    DriverPatronymic = tbxPatronymic.Text,
            //    DriverExperience = Convert.ToInt32(tbxExperience.Text),
            //    DriverDateOfBirth = dtpDateOfBirth.SelectedDate
            //};

            //Address NewAddress = new Address()
            //{
            //    PostCode = Convert.ToInt32(tbxPostCode.Text),
            //    Region = Convert.ToInt32(cbxRegion.SelectedValue),
            //    City = Convert.ToInt32(cbxCity.SelectedValue),
            //    Street = Convert.ToInt32(cbxStreet.SelectedValue),
            //    House = tbxHouse.Text
            //};

            //Passport NewPassport = new Passport
            //{
            //    PassportSeries = Convert.ToInt32(tbxPassSeries.Text),
            //    PassportNum = Convert.ToInt32(tbxPassNum.Text),
            //    PassportIssueOrg = Convert.ToInt32(cbxPassOrg.SelectedValue),
            //    Driver = NewDriver
            //};

            //DriverLicense NewLicense = new DriverLicense
            //{
            //    LicensetSeries = Convert.ToInt32(tbxPassSeries.Text),
            //    LicensetNum = Convert.ToInt32(tbxPassNum.Text),
            //    LicenseIssueOrg = Convert.ToInt32(cbxPassOrg.SelectedValue),
            //    Driver = NewDriver
            //};
            //NewDriver.Address = NewAddress;

            //cont.Address.Add(NewAddress);
            //cont.Driver.Add(NewDriver);
            //cont.Passport.Add(NewPassport);
            //cont.DriverLicense.Add(NewLicense);
            //cont.SaveChanges();
        }
    }
}
