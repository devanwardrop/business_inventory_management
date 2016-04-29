using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CAP499_Capstone
{
    public partial class Suppliers : System.Web.UI.Page
    {
        int success = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            success = (int)Session["Success"];

            if (success == 1)
            {
                lblNewSupplierSuccess.Text = "----------New supplier successfully added!----------";
            }
            else
            {
                lblNewSupplierSuccess.Text = "";
            }
        }

        protected void btnNewSupplier_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddNewSupplier.aspx");
        }

        protected void btnMainMenu_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}