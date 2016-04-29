<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddNewItem.aspx.cs" Inherits="CAP499_Capstone.Add_Remove_Item" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h2>Add New Inventory Item</h2>

        <asp:Table ID="tblAddNewInventoryItem" runat="server" >
            <asp:TableRow>
                <asp:TableCell>
                    <asp:TextBox ID="txtItemName" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblItemName" runat="server" Text="Item Name"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:TextBox ID="txtItemDesc" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblItemDesc" runat="server" Text="Item Description"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:DropDownList ID="ddlCategory" runat="server" DataSourceID="SqlDataSource_Category" DataTextField="Category" DataValueField="Category"></asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblCategory" runat="server" Text="Category"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Button ID="btnAddNewCategory" runat="server" Text="Add New Category" OnClick="btnAddNewCategory_Click" />
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtNewCategory" runat="server" Visible="False"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Button ID="btnCancelNewCategory" runat="server" Text="Cancel New Category" Visible="False" OnClick="btnCancelNewCategory_Click" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:DropDownList ID="ddlSupplier" runat="server" DataSourceID="SqlDataSource_Supplier" DataTextField="Company_Name" DataValueField="Company_Name"></asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblSupplier" runat="server" Text="Supplier"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:TextBox ID="txtInitialStock" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblInitialStock" runat="server" Text="Initial Stock"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                        &emsp;
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <br />
    </div>
    <div>

        <asp:SqlDataSource ID="SqlDataSource_Category" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString4 %>" ProviderName="<%$ ConnectionStrings:ConnectionString4.ProviderName %>" SelectCommand="SELECT DISTINCT [Category] FROM [Inventory] ORDER BY [Category]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource_Supplier" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString4 %>" ProviderName="<%$ ConnectionStrings:ConnectionString4.ProviderName %>" SelectCommand="SELECT Company_Name FROM Suppliers ORDER BY Company_Name"></asp:SqlDataSource>
        
        <br />
        
    </div>
    </form>
</body>
</html>
