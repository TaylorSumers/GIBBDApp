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
        GIBDDEntities cont = new GIBDDEntities();
        static int DriverID = 0;
        public DriverAddWindow(int DrID)
        {
            InitializeComponent();
            DriverID = DrID;

            //Заполнение комбобоксов
            cbxRegion.ItemsSource = cont.Region.ToList();
            cbxCity.ItemsSource = cont.City.ToList();
            cbxStreet.ItemsSource = cont.Street.ToList();
            cbxPassOrg.ItemsSource = cont.OrgName.ToList();
            cbxLicOrg.ItemsSource = cont.OrgName.ToList();

            //Если DriverID > 0, будем изменять информацию о существующем водителе
            if (DriverID > 0)
                EditingDriver(DriverID);
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            if (DriverID == 0)
            {
                CreatingDriver(); 
            }

            SafeSave();
        }
        private void CreatingDriver()
        {
            //Поиск организации выдачи паспорта в базе
            var PasIssOrgs = cont.DocumentsIssueOrganization.Where(el => el.OrgName == (int)cbxPassOrg.SelectedValue && el.DeptCode == tbxPassDept.Text).ToList();
            DocumentsIssueOrganization PasOrg;
            if (PasIssOrgs.Count == 0) //Если нет, создание новой
            {
                PasOrg = new DocumentsIssueOrganization
                {
                    OrgName = (int)cbxPassOrg.SelectedValue,
                    DeptCode = tbxPassDept.Text
                };
                cont.DocumentsIssueOrganization.Add(PasOrg);
                cont.SaveChanges();
            }
            else //Если есть
            {
                PasOrg = PasIssOrgs[0];
            }

            //Поиск организации выдачи прав в базе
            var LicIssOrgs = cont.DocumentsIssueOrganization.Where(el => el.OrgName == (int)cbxLicOrg.SelectedValue && el.DeptCode == tbxLicDept.Text).ToList();
            DocumentsIssueOrganization LicOrg;
            if (LicIssOrgs.Count == 0) //Если нет, создание новой
            {
                LicOrg = new DocumentsIssueOrganization
                {
                    OrgName = (int)cbxLicOrg.SelectedValue,
                    DeptCode = tbxLicDept.Text
                };
                cont.DocumentsIssueOrganization.Add(LicOrg);
            }
            else //Если есть
            {
                LicOrg = LicIssOrgs[0];
            }


            //Создание водителя
            Driver NewDriver = new Driver()
            {
                DriverSurname = tbxSurname.Text,
                DriverName = tbxName.Text,
                DriverPatronymic = tbxPatronymic.Text,
                DriverExperience = Convert.ToInt32(tbxExperience.Text),
                DriverDateOfBirth = dtpDateOfBirth.SelectedDate
            };

            //Создание адреса
            Address NewAddress = new Address()
            {
                PostCode = Convert.ToInt32(tbxPostCode.Text),
                Region = Convert.ToInt32(cbxRegion.SelectedValue),
                City = Convert.ToInt32(cbxCity.SelectedValue),
                Street = Convert.ToInt32(cbxStreet.SelectedValue),
                House = tbxHouse.Text
            };

            //Поиск адреса в базе
            var Adrs = cont.Address.Where(el => el.PostCode == NewAddress.PostCode &&
                                                el.Region == NewAddress.Region &&
                                                el.City == NewAddress.City &&
                                                el.Street == NewAddress.Street &&
                                                el.House == NewAddress.House).ToList();

            if (Adrs.Count == 0) //Если нет, назначение водителю созданного адреса
            {
                cont.Address.Add(NewAddress);
                NewDriver.Address = NewAddress;
            }
            else //Если есть, назначение существующего
            {
                NewDriver.Address = Adrs[0];
            }

            //Создание паспорта
            Passport NewPassport = new Passport
            {
                PassportSeries = Convert.ToInt32(tbxPassSeries.Text),
                PassportNum = Convert.ToInt32(tbxPassNum.Text),
                DocumentsIssueOrganization = PasOrg,
                Driver = NewDriver
            };

            //Создание прав
            DriverLicense NewLicense = new DriverLicense
            {
                LicensetSeries = Convert.ToInt32(tbxLicSeries.Text),
                LicensetNum = Convert.ToInt32(tbxLicNum.Text),
                DocumentsIssueOrganization = LicOrg,
                Driver = NewDriver
            };

            //Внесение изменений в базу
            cont.Driver.Add(NewDriver);
            cont.Passport.Add(NewPassport);
            cont.DriverLicense.Add(NewLicense);
        } 
        private void EditingDriver(int DriverID)
        {
            //Установление контекста всем текстбоксам в окне
            Driver EditingDriver = cont.Driver.Where(item => item.DriverID == DriverID).Single();
            Passport EditingDriverPassport = cont.Passport.Where(item => item.PassportDriver == DriverID).Single();
            DriverLicense EditingDriverLicense = cont.DriverLicense.Where(item => item.LicneseDriver == DriverID).Single();
            Address EditingDriverAddress = cont.Address.Where(item => item.AddressID == EditingDriver.DriverAddress).Single();
            DocumentsIssueOrganization PasIssOrg = cont.DocumentsIssueOrganization.Where(item => item.OrgID == EditingDriverPassport.PassportIssueOrg).Single();
            DocumentsIssueOrganization LicIssOrg = cont.DocumentsIssueOrganization.Where(item => item.OrgID == EditingDriverLicense.LicenseIssueOrg).Single();

            tbxName.DataContext = EditingDriver;
            tbxSurname.DataContext = EditingDriver;
            tbxPatronymic.DataContext = EditingDriver;
            tbxExperience.DataContext = EditingDriver;
            dtpDateOfBirth.DataContext = EditingDriver;
            tbxPostCode.DataContext = EditingDriverAddress;
            cbxRegion.DataContext = EditingDriverAddress;
            cbxCity.DataContext = EditingDriverAddress;
            cbxStreet.DataContext = EditingDriverAddress;
            tbxHouse.DataContext = EditingDriverAddress;
            tbxPassSeries.DataContext = EditingDriverPassport;
            tbxPassNum.DataContext = EditingDriverPassport;
            cbxPassOrg.DataContext = PasIssOrg;
            tbxPassDept.DataContext = PasIssOrg;
            tbxLicSeries.DataContext = EditingDriverLicense;
            tbxLicNum.DataContext = EditingDriverLicense;
            cbxLicOrg.DataContext = LicIssOrg;
            tbxLicDept.DataContext = LicIssOrg;
        } 
        private void SafeSave() //Метод сохранения изменений
        {
            try
            {
                cont.SaveChanges();
                MessageBox.Show("Изменения сохранены", "Info", MessageBoxButton.OK, MessageBoxImage.Information);
                this.Close();
            }
            catch
            {
                MessageBox.Show("Ошибка сохранения", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
