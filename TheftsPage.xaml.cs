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

namespace GIBBDApp
{
    /// <summary>
    /// Interaction logic for TheftsPage.xaml
    /// </summary>
    public partial class TheftsPage : Page
    {
        static GIBDD_Suv_DorEntities cont = new GIBDD_Suv_DorEntities();

        static IEnumerable<dynamic> Thefts = (from Theft in cont.TheftFoundedCar
                         join Car in cont.Car on Theft.CaseCar equals Car.CarID
                         join Driver in cont.Driver on Car.CarOwner equals Driver.DriverID
                         join VehiclePassport in cont.VehiclePassport on Car.CarID equals VehiclePassport.VehiclePassportCar
                         join CaseStatus in cont.Status on Theft.CaseStatus equals CaseStatus.StatusID
                         join Address in cont.Address on Theft.CaseAddress equals Address.AddressID
                         join Brand in cont.Brand on VehiclePassport.CarBrand equals Brand.BrandID
                         join Model in cont.Model on VehiclePassport.CarModel equals Model.ModelID into list
                         from list1 in list.DefaultIfEmpty()
                         select new
                         {
                             Driver.DriverName,
                             Driver.DriverSurname,
                             Driver.DriverPatronymic,
                             Theft.CaseAddress,
                             Car.vin,
                             VehiclePassport.VehiclePassportNum,
                             VehiclePassport.EngineNum,
                             Theft.CaseID,
                             Theft.CaseDate,
                             CaseStatus.StatusName,
                             VehiclePassport.CarGovNum,
                             Brand.BrandName,
                             list1.ModelName
                         }).ToList();
        public TheftsPage()
        {
            InitializeComponent();

            dtgThefts.ItemsSource = Thefts;
        }

        private void dtgThefts_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            tbPostIndex.Text = "";
            tbRegion.Text = "";
            tbCity.Text = "";
            tbStreet.Text = "";
            tbHouse.Text = "";
            tbSurname.Text = Thefts.Where(item => item.CaseID == (int)dtgThefts.SelectedValue).Single().DriverSurname;
            tbName.Text = Thefts.Where(item => item.CaseID == (int)dtgThefts.SelectedValue).Single().DriverName;
            tbPatronymic.Text = Thefts.Where(item => item.CaseID == (int)dtgThefts.SelectedValue).Single().DriverPatronymic;

            tbVin.Text = Thefts.Where(item => item.CaseID == (int)dtgThefts.SelectedValue).Single().vin;
            tbNum.Text = Thefts.Where(item => item.CaseID == (int)dtgThefts.SelectedValue).Single().VehiclePassportNum;
            tbEngineNum.Text = Thefts.Where(item => item.CaseID == (int)dtgThefts.SelectedValue).Single().EngineNum;

            int AddressID = Thefts.Where(item=> item.CaseID == (int)dtgThefts.SelectedValue).Single().CaseAddress;
            try
            {
                tbPostIndex.Text = cont.Address.Where(item => item.AddressID == AddressID).Single().PostCode.ToString();
                tbRegion.Text = (from Address in cont.Address
                                 join Region in cont.Region on Address.Region equals Region.RegionID
                                 where Address.AddressID == AddressID
                                 select new { Region.RegionName }).SingleOrDefault().RegionName;
                tbCity.Text = (from Address in cont.Address
                               join City in cont.City on Address.City equals City.CityID
                               where Address.AddressID == AddressID
                               select new { City.CityName }).Single().CityName;
                tbStreet.Text= (from Address in cont.Address
                                join Street in cont.Street on Address.Street equals Street.StreetID
                                where Address.AddressID == AddressID
                                select new { Street.StreetName }).Single().StreetName;
                tbHouse.Text = (from Address in cont.Address
                           where Address.AddressID == AddressID
                           select new { Address.House }).Single().House;

            }
            catch
            { 
            }

        }
    }
}
