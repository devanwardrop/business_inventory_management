using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CAP499_Capstone
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Success"] = 0;
        }

        protected void btnInventory_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inventory.aspx");
        }

        protected void btnSuppliers_Click(object sender, EventArgs e)
        {
            Response.Redirect("Suppliers.aspx");
        }

        protected void btnTransactions_Click(object sender, EventArgs e)
        {
            Response.Redirect("Transactions.aspx");
        }

        protected void btnExit_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(typeof(Page), "closePage", "window.open('close.html', '_self', null);", true);
        }
    }
}