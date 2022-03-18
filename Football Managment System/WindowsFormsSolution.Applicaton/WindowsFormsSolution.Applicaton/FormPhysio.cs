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
    public partial class FormPhysio : MetroForm
    {
        private PhysioRepo pRepo { get; set; }
        
       
        public FormPhysio()
        {
            InitializeComponent();
            this.pRepo = new PhysioRepo();
           
        }

        private void FormPhysio_Load(object sender, EventArgs e)
        {
            this.PopulateGridView(); 
        }

        private void PopulateGridView()
        {   
            this.dataGridView1.AutoGenerateColumns = false;
            this.dataGridView1.DataSource = pRepo.GetAll().ToList();
            this.dataGridView1.ClearSelection();

        }
        
        private void metroButton1_Click(object sender, EventArgs e)
        {
            this.PopulateGridView();
        }

        private void metroButton3_Click(object sender, EventArgs e)
        {
            DelegateClassForPhysio.GridDelegate delgrid = PopulateGridView;
            new SecondFormPhysio(delgrid).Visible =true;
        }

        private void addToolStripMenuItem_Click(object sender, EventArgs e)
        {
            DelegateClassForPhysio.GridDelegate delgrid = PopulateGridView;
            new SecondFormPhysio(delgrid).Visible = true;
        }

        private void refreshToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.PopulateGridView();
        }

        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            System.Windows.Forms.Application.ExitThread();
        }

        private void injurySolutionsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Process.Start("https://www.stopsportsinjuries.org/STOP/Prevent_Injuries/Soccer_Injury_Prevention.aspx");
            
        }

        private void exerciseListsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Process.Start("https://www.ertheo.com/blog/en/top-20-soccer-drills-raise-game-today/");
        }

        private void metroButton2_Click(object sender, EventArgs e)
        {
            System.Windows.Forms.Application.ExitThread();
           
        }
    }
}
