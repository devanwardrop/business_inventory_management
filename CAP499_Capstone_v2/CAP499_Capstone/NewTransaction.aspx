<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewTransaction.aspx.cs" Inherits="CAP499_Capstone.NewTransaction" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h2>New Transaction</h2>

        <asp:Table ID="tblNewTransaction" runat="server" >
            <asp:TableRow>
                <asp:TableCell>
                    <asp:DropDownList ID="ddlItem" runat="server" DataSourceID="SqlDataSource_InventoryItem" DataTextField="Item" DataValueField="Item"></asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblItem" runat="server" Text="Item"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:DropDownList ID="ddlType" runat="server" DataSourceID="SqlDataSource_TransactionType" DataTextField="Description" DataValueField="Description"></asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblType" runat="server" Text="Transaction Type"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:TextBox ID="txtCount" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblCount" runat="server" Text="Count"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click"/>
                    &emsp;
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>

        <asp:Label ID="lblWarning" runat="server" Text=""></asp:Label>
    </div>
    <div>
        <asp:SqlDataSource ID="SqlDataSource_InventoryItem" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString4 %>" ProviderName="<%$ ConnectionStrings:ConnectionString4.ProviderName %>" SelectCommand="SELECT [Item] FROM [Inventory] ORDER BY [Item]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource_TransactionType" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString4 %>" ProviderName="<%$ ConnectionStrings:ConnectionString4.ProviderName %>" SelectCommand="SELECT [Description] FROM [Transaction_Types] ORDER BY [Description]"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
