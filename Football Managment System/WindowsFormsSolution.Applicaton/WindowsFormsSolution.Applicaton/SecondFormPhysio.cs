using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MetroFramework;
using MetroFramework.Forms;
using WindowsFormsSolution.Repo;
using WindowsFormsSolution.Entity; 

namespace WindowsFormsSolution.Applicaton
{
    public partial class SecondFormPhysio : MetroForm
    {
        private PhysioRepo prepo = new PhysioRepo();
        Physio phy = new Physio();
        private DelegateClassForPhysio.GridDelegate dg;

        public SecondFormPhysio(DelegateClassForPhysio.GridDelegate dg)
        {
            InitializeComponent();
            this.dg = dg;
        }

        private void SecondFormPhysio_Load(object sender, EventArgs e)
        {

        }
        private void FillEntity()
        {
            phy.playerid = this.metroTextBox1.Text;
            phy.injury = this.comboBox1.Text;
            phy.fitness = this.metroTextBox3.Text;

        }

        private void metroButton1_Click(object sender, EventArgs e)
        {
            this.FillEntity();
            bool d =prepo.Save(phy);
            if (d == true)
            {
                MessageBox.Show("INSERTION DONE");
            }
            else { 
                MessageBox.Show("INSERTION NOT DONE"); 
            }
            this.dg();
            this.ClearAll();
        }
        private void ClearAll()
        {
            this.metroTextBox1.Clear();
            this.metroTextBox3.Clear();
        }
    }
}
