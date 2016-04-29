<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Transactions.aspx.cs" Inherits="CAP499_Capstone.Transactions1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Transactions</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h2>Transactions</h2>
        <%--<asp:TextBox ID="txtSearch" runat="server" Width="230px"></asp:TextBox>
        &nbsp;
        <asp:Button ID="btnSearch" runat="server" Text="Search" />
        &emsp;--%>
        <asp:Button ID="btnNewTransaction" runat="server" Text="New Transaction" OnClick="btnNewTransaction_Click" />
        <br />
        <br />
        &emsp;&emsp;&emsp;<asp:Label ID="lblNewTransactionSuccess" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
        <br />
    </div>
    <div>

        <asp:GridView ID="GridViewTransactions" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource_Transactions" EmptyDataText="There are no data records to display." AllowPaging="True" AllowSorting="True" CellPadding="1" ForeColor="#333333" PageSize="25">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" >
                <ItemStyle Width="15px" />
                </asp:BoundField>
                <asp:BoundField DataField="Transaction_Item" HeaderText="Transaction Item" SortExpression="Transaction_Item" />
                <asp:BoundField DataField="Transaction_Type" HeaderText="Transaction Type" SortExpression="Transaction_Type" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                <asp:BoundField DataField="Created_Date" HeaderText="Created Date" SortExpression="Created_Date" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="Aqua" Font-Bold="True" ForeColor="Black" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource_Transactions" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString4 %>" InsertCommand="INSERT INTO [Transactions] ([ID], [Transaction_Item], [Transaction_Type], [Quantity], [Created_Date]) VALUES (?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString4.ProviderName %>" SelectCommand="SELECT t.ID, i.Item AS Transaction_Item, tt.Description AS Transaction_Type, t.Quantity, t.Created_Date From Transactions t, Inventory i, Transaction_Types tt where t.Transaction_Item = i.ID and t.Transaction_Type = tt.ID order by t.ID">
            <InsertParameters>
                <asp:Parameter Name="ID" Type="Int32" />
                <asp:Parameter Name="Transaction_Item" Type="Int32" />
                <asp:Parameter Name="Transaction_Type" Type="Int32" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="Created_Date" Type="DateTime" />
            </InsertParameters>
        </asp:SqlDataSource>
    </div>
    <div>
        <br />
        <asp:Button ID="btnMainMenu" runat="server" Text="Main Menu" OnClick="btnMainMenu_Click" />
    </div>
    </form>
</body>
</html>
