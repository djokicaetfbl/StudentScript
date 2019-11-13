using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace StudentskaSkripta
{
    public partial class LoginForm : Form
    {
        public LoginForm()
        {
            InitializeComponent();
        }

        protected override bool ProcessCmdKey(ref Message msg, Keys keyData)
        {
            if (keyData == Keys.Escape)
            {
                this.Close();
                return true;
            }
            return base.ProcessCmdKey(ref msg, keyData);
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            if(String.IsNullOrEmpty(tbUserName.Text) || String.IsNullOrEmpty(tbPassword.Text))
            {
                MessageBox.Show("Greška!", "Greška prilikom prijave!", MessageBoxButtons.OK, MessageBoxIcon.Error);
            } else
            {
                this.Hide();
                var adminForm = new AdminForm();
                adminForm.Closed += (s, args) => this.Close();
                adminForm.Show();
            }

        }
    }


}
