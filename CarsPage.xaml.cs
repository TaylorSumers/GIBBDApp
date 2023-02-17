using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
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
    /// Interaction logic for CarsPage.xaml
    /// </summary>
    public partial class CarsPage : Page
    {
        static GIBDD_Suv_DorEntities cont = new GIBDD_Suv_DorEntities();

        static IEnumerable<dynamic> Cars = (from Car in cont.Car
                      join Driver in cont.Driver on Car.CarOwner equals Driver.DriverID
                      join VehiclePassport in cont.VehiclePassport on Car.CarID equals VehiclePassport.VehiclePassportCar
                      join Brand in cont.Brand on VehiclePassport.CarBrand equals Brand.BrandID
                      join Model in cont.Model on VehiclePassport.CarModel equals Model.ModelID into list
                      from list1 in list.DefaultIfEmpty()
                      select new
                      {
                          Car.CarID,
                          Car.CarRegistrationDate,
                          Car.vin,
                          VehiclePassport.VehiclePassportNum,
                          VehiclePassport.EngineNum,
                          VehiclePassport.CarGovNum,
                          Brand.BrandName,
                          list1.ModelName,
                          VehiclePassport.ManufactureYear,
                          Driver.DriverName,
                          Driver.DriverSurname,
                          Driver.DriverPatronymic
                      }).ToList();

        static IEnumerable<dynamic> Insurances = (from Driver_Insurance in cont.Driver_Insurance
                                                  join Insurance in cont.Insurance on Driver_Insurance.Insurance equals Insurance.InsuranceID
                                                  join Car in cont.Car on Insurance.InsuranceCar equals Car.CarID
                                                  join Company in cont.InsuranceCompany on Insurance.InsuranceCompany equals Company.CompanyID
                                                  join Driver in cont.Driver on Driver_Insurance.Driver equals Driver.DriverID
                                                  select new { Insurance.InsurancePayment, 
                                                              Company.CompanyName, 
                                                              Driver.DriverID, 
                                                              Driver.DriverSurname,
                                                              Driver.DriverName,
                                                              Driver.DriverPatronymic, 
                                                              Car.CarID}).ToList();
        public CarsPage()
        {
            InitializeComponent();

            dtgCars.ItemsSource = Cars;
        }

        private void dtgCars_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            tbDrivers.Text = "";

            tbSurname.Text = Cars.Where(item => item.CarID == (int)dtgCars.SelectedValue).Single().DriverSurname;
            tbName.Text = Cars.Where(item => item.CarID == (int)dtgCars.SelectedValue).Single().DriverName;
            tbPatronymic.Text = Cars.Where(item => item.CarID == (int)dtgCars.SelectedValue).Single().DriverPatronymic;

            tbVin.Text = Cars.Where(item => item.CarID == (int)dtgCars.SelectedValue).Single().vin;
            tbNum.Text = Cars.Where(item => item.CarID == (int)dtgCars.SelectedValue).Single().VehiclePassportNum;
            tbEngineNum.Text = Cars.Where(item => item.CarID == (int)dtgCars.SelectedValue).Single().EngineNum;
            try
            {
                tbCompany.Text = Convert.ToString(Insurances.Where(item => item.CarID == (int)dtgCars.SelectedValue).FirstOrDefault().CompanyName);
                tbPayment.Text = Insurances.Where(item => item.CarID == (int)dtgCars.SelectedValue).FirstOrDefault().InsurancePayment.ToString();
            }
            catch
            {
                tbCompany.Text = "";
                tbPayment.Text = "";
            }
            foreach(var item in Insurances.Where(item=> item.CarID == (int)dtgCars.SelectedValue))
            {
                tbDrivers.Text += String.Concat(item.DriverSurname, " ", item.DriverName, " ", item.DriverPatronymic, ", ");
            }
            try
            {
                tbDrivers.Text = tbDrivers.Text.Substring(0, tbDrivers.Text.Length - 2);
            }
            catch
            {
            }
        }
    }
}
