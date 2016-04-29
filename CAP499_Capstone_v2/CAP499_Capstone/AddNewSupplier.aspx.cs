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
    public partial class AddNewSupplier : System.Web.UI.Page
    {
        OleDbConnection myConn;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            OleDbCommand cmdInsert;
            string sqlStringInsert, companyName, phone, street, city, state, zip;

            companyName = txtCompanyName.Text.Replace("'", "''");
            phone = txtPhone.Text.Replace("'", "-");
            street = txtStreet.Text.Replace("'", "''");
            city = txtCity.Text.Replace("'", "''");
            state = txtState.Text.Replace("'", "''");
            zip = txtZip.Text.Replace("'", "-");

            myConn = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\\InventoryDatabase2.accdb");

            myConn.Open();

            sqlStringInsert = "INSERT INTO Suppliers (Company_Name, Phone, Street, City, State, Zip) VALUES ('" + companyName + "','" + phone + "','" + street + "','" + city + "','" + state + "','" + zip + "')";
            //(@" + companyName + ", @" + phone + ", @" + street + ", @" + city + ", @" + state + ", @" + zip + ")";
            cmdInsert = new OleDbCommand(sqlStringInsert, myConn);
            cmdInsert.ExecuteNonQuery();
            myConn.Close();

            Session["Success"] = 1;
            Response.Redirect("Suppliers.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Session["Success"] = 0;
            Response.Redirect("Suppliers.aspx");
            myConn.Close();
        }
    }
}

