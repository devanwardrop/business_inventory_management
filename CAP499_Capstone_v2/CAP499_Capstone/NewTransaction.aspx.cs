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
    public partial class NewTransaction : System.Web.UI.Page
    {
        OleDbConnection myConn;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            OleDbCommand cmdSelect, cmdInsert;
            OleDbDataReader reader;
            string sqlStringSelect, sqlStringInsert, svItem, svType, sqlStringUpdate;
            int readerItemInt, readerTypeInt, count, currentStock, newStock, numUpOrDown;

            //"sv" stands for "selected value"
            svItem = ddlItem.SelectedValue.ToString().Replace("'", "''");
            svType = ddlType.SelectedValue.ToString().Replace("'", "''");
            count = Convert.ToInt32(txtCount.Text);

            myConn = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\\InventoryDatabase2.accdb");
            
            myConn.Open();
            sqlStringSelect = "SELECT ID FROM Inventory WHERE Item = '" + svItem + "'";
            cmdSelect = new OleDbCommand(sqlStringSelect, myConn);
            reader = cmdSelect.ExecuteReader();
            reader.Read();
            readerItemInt = (int)reader.GetValue(0);

            sqlStringSelect = "SELECT ID FROM Transaction_Types WHERE Description = '" + svType + "'";
            cmdSelect = new OleDbCommand(sqlStringSelect, myConn);
            reader = cmdSelect.ExecuteReader();
            reader.Read();
            readerTypeInt = (int)reader.GetValue(0);

            sqlStringSelect = "SELECT Stock FROM Inventory WHERE Item = '" + svItem + "'";
            cmdSelect = new OleDbCommand(sqlStringSelect, myConn);
            reader = cmdSelect.ExecuteReader();
            reader.Read();
            currentStock = (int)reader.GetValue(0);

            if(readerTypeInt == 2)
            {
                numUpOrDown = count * -1;
            }
            else
            {
                numUpOrDown = count;
            }
            

            if (readerTypeInt == 2 && currentStock < count)
            {
                lblWarning.Text = "Sale count exceeds stock on hand.  Current stock for this item: " + currentStock + ".  Please try again.";
            }
            else
            {
                sqlStringInsert = "INSERT INTO Transactions (Transaction_Item, Transaction_Type, Quantity) VALUES (" + readerItemInt + "," + readerTypeInt + "," + count + ")";
                cmdInsert = new OleDbCommand(sqlStringInsert, myConn);
                cmdInsert.ExecuteNonQuery();
                
                newStock = currentStock + numUpOrDown;

                sqlStringUpdate = "UPDATE Inventory SET Stock=" + newStock + " WHERE Item ='" + svItem + "'";
                cmdInsert = new OleDbCommand(sqlStringUpdate, myConn);
                cmdInsert.ExecuteNonQuery();
                myConn.Close();
                
                Session["Success"] = 1;
                Response.Redirect("Transactions.aspx");
            }
            
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Session["Success"] = 0;
            Response.Redirect("Transactions.aspx");
            myConn.Close();
        }
    }
}