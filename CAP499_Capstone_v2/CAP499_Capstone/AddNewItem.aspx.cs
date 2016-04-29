using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;

namespace CAP499_Capstone
{
    public partial class AddNewItem : System.Web.UI.Page
    {
        OleDbConnection myConn;
        bool newCategory = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            newCategory = (bool)Session["NewCategory"];
        }
        
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            OleDbCommand cmdSelect, cmdInsert;
            OleDbDataReader reader;
            string sqlStringSelect, sqlStringInsert, itemName, itemDesc, svCategory, svSupplier;
            int readerInt, initialStock;
            //string msg = "This is a test";

            //"sv" stands for "selected value"
            itemName = txtItemName.Text.Replace("'", "''");
            itemDesc = txtItemDesc.Text.Replace("'", "''");
            svSupplier = ddlSupplier.SelectedValue.ToString().Replace("'", "''");

            if (txtInitialStock.Text == "")
            {
                initialStock = 0;
            }
            else
            {
                initialStock = Convert.ToInt32(txtInitialStock.Text);
            }

            if (newCategory == false)
            {
                svCategory = ddlCategory.SelectedValue.ToString().Replace("'", "''");
            }
            else
            {
                svCategory = txtNewCategory.Text.Replace("'", "''");
            }


            //myConn = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source='C: \\Users\\Devan\\Dropbox\\SHC\\Mod 2016 - 02 - 08 - CAP 499 - Capstone(Jeremiah Pineda)\\CAP499_Capstone_v2\\InventoryDatabase3.accdb'");
            myConn = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\\InventoryDatabase2.accdb");

            myConn.Open();
            sqlStringSelect = "SELECT ID FROM Suppliers WHERE Company_Name = '" + svSupplier + "'";
            cmdSelect = new OleDbCommand(sqlStringSelect, myConn);
            reader = cmdSelect.ExecuteReader();
            reader.Read();
            readerInt = (int)reader.GetValue(0);
            //readerStr = reader[0].ToString();
            //readerStr = reader.GetInt32(0).ToString();
            //readerInt = Convert.ToInt32(reader[1]));
            //readerInt = reader.GetOrdinal("Home Depot");
            /*DataSet ds = new DataSet();
            ds = reader;*/

            sqlStringInsert = "INSERT INTO Inventory (Item, Description, Category, Supplier, Stock) VALUES ('" + itemName + "','" + itemDesc + "','" + svCategory + "'," + readerInt + "," + initialStock + ")";
            cmdInsert = new OleDbCommand(sqlStringInsert, myConn);
            cmdInsert.ExecuteNonQuery();
            myConn.Close();

            Session["Success"] = 1;
            Response.Redirect("Inventory.aspx");

            //Response.Write("<script>alert('" + msg + "')</script>");
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
        }

        protected void btnAddNewCategory_Click(object sender, EventArgs e)
        {
            txtNewCategory.Visible = true;
            btnCancelNewCategory.Visible = true;
            ddlCategory.Enabled = false;
            newCategory = true;
            Session["NewCategory"] = newCategory;
        }

        protected void btnCancelNewCategory_Click(object sender, EventArgs e)
        {
            txtNewCategory.Visible = false;
            btnCancelNewCategory.Visible = false;
            ddlCategory.Enabled = true;
            newCategory = false;
            Session["NewCategory"] = newCategory;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Session["Success"] = 0;
            Response.Redirect("Inventory.aspx");
            myConn.Close();
        }

        /*
        protected void ddlAddRemove_SelectedIndexChanged(object sender, EventArgs e)
        {
            string svAddRemove = ddlAddRemove.SelectedValue;
            if (svAddRemove == "Remove")
            {
                ddlItem.Visible = true;
                lblItem.Visible = true;
                txtBxItemName.Visible = false;
                lblItemName.Visible = false;
                ddlCategory.Visible = false;
                lblCategory.Visible = false;
                ddlSupplier.Visible = false;
                lblSupplier.Visible = false;
            }
            else if (svAddRemove == "Add")
            {
                ddlItem.Visible = false;
                lblItem.Visible = false;
                txtBxItemName.Visible = true;
                lblItemName.Visible = true;
                ddlCategory.Visible = true;
                lblCategory.Visible = true;
                ddlSupplier.Visible = true;
                lblSupplier.Visible = true;
            }
        }*/

    }
}