<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CAP499_Capstone.Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Inventory Management - Main Menu</title>
    </head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>Inventory Management</h1>
        <h2>Snow Cap Sales, LLC</h2>
        <br />
        <p>Welcome to Inventory Management for Snow Cap Sales, LLC.</p>
        <p>Use this tool to record changes to inventory and suppliers.</p>
    </div>
        <br />
    <div>
        <p>
        <asp:Button ID="btnInventory" runat="server" Text="Inventory" OnClick="btnInventory_Click" BackColor="#66FF33" BorderColor="#66FF33" Height="35px" />
        &emsp;&emsp;&emsp;
        <asp:Button ID="btnSuppliers" runat="server" Text="Suppliers" OnClick="btnSuppliers_Click" BackColor="#CC33FF" BorderColor="#CC33FF" Height="35px" />
        &emsp;&emsp;&emsp;
        <asp:Button ID="btnTransactions" runat="server" Text="Transactions" OnClick="btnTransactions_Click" BackColor="Aqua" BorderColor="Aqua" Height="35px" />
        <%--&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
        <asp:Button ID="btnExit" runat="server" Text="Exit" OnClientClick="javascript:window.close();" OnClick="btnExit_Click" />--%>
        &emsp;
        </p>
    </div>
    <p>
        
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Moraine_Lake_17092005.png" Width="400px" />
        </p>
    </form>
    </body>
</html>
