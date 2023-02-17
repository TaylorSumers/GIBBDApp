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
using System.Xml.Linq;

namespace GIBBDApp
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        //GIBDDEntities cont = new GIBDDEntities();
        public MainWindow()
        {
            InitializeComponent();
            DriversFrame.Content = new DriversPage();
            CarsFrame.Content = new CarsPage();
            TheftsFrame.Content = new TheftsPage();
        }
    }
}
