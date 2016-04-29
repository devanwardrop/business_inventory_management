using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CAP499_Capstone
{
    public partial class Transactions : System.Web.UI.Page
    {
        int success = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            success = (int)Session["Success"];

            if (success == 1)
            {
                lblNewTransactionSuccess.Text = "----------New transaction successfully added!----------";
            }
            else
            {
                lblNewTransactionSuccess.Text = "";
            }
        }

        protected void btnNewTransaction_Click(object sender, EventArgs e)
        {
            Session["Success"] = 0;
            Response.Redirect("NewTransaction.aspx");
        }

        protected void btnMainMenu_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}