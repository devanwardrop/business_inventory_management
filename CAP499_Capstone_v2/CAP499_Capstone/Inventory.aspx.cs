using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CAP499_Capstone
{
    public partial class Inventory : System.Web.UI.Page
    {
        int success = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["NewCategory"] = (bool)false;

            success = (int)Session["Success"];

            if (success == 1)
            {
                lblNewItemSuccess.Text = "----------New item successfully added!----------";
            }
            else
            {
                lblNewItemSuccess.Text = "";
            }
            
        }

        protected void btnMainMenu_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void btnAddNewItem_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddNewItem.aspx");
        }

    }
}