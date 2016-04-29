<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="CAP499_Capstone.Inventory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Inventory</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h2>Inventory</h2>
        <asp:TextBox ID="txtSearch" runat="server" Width="230px"></asp:TextBox>
        &nbsp;
        <asp:Button ID="btnSearch" runat="server" Text="Search" />
        &emsp;
        <asp:Button ID="btnAddNewItem" runat="server" Text="Add New Item" OnClick="btnAddNewItem_Click" />
        <br />
        <br />
        &emsp;&emsp;&emsp;<asp:Label ID="lblNewItemSuccess" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
        <br />
    </div>
    <div>

        <asp:GridView ID="GridViewInventory" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource_Inventory2" EmptyDataText="There are no data records to display." AllowPaging="True" AllowSorting="True" CellPadding="1" ForeColor="#333333" GridLines="Both" PageSize="25">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" >
                <ItemStyle Width="15px" />
                </asp:BoundField>
                <asp:BoundField DataField="Item" HeaderText="Item" SortExpression="Item" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                <asp:BoundField DataField="Supplier" HeaderText="Supplier" SortExpression="Supplier" />
                <asp:BoundField DataField="Stock" HeaderText="Stock" SortExpression="Stock" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#66FF33" Font-Bold="True" ForeColor="Black" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource_Inventory2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString4 %>" DeleteCommand="DELETE FROM [Inventory] WHERE [ID] = ?" InsertCommand="INSERT INTO [Inventory] ([ID], [Item], [Description], [Category], [Supplier], [Stock]) VALUES (?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString4.ProviderName %>" SelectCommand="SELECT i.ID, i.Item, i.Description, i.Category, s.Company_Name as Supplier, i.Stock From Inventory i, Suppliers s where i.Supplier = s.ID order by i.ID" UpdateCommand="UPDATE [Inventory] SET [Item] = ?, [Description] = ?, [Category] = ?, [Supplier] = ?, [Stock] = ? WHERE [ID] = ?" FilterExpression="Item LIKE '{0}%'">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ID" Type="Int32" />
                <asp:Parameter Name="Item" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Category" Type="String" />
                <asp:Parameter Name="Supplier" Type="Int32" />
                <asp:Parameter Name="Stock" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Item" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Category" Type="String" />
                <asp:Parameter Name="Supplier" Type="Int32" />
                <asp:Parameter Name="Stock" Type="Int32" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
            <FilterParameters>
                <asp:ControlParameter Name="Item" ControlID="txtSearch" PropertyName="Text" />
            </FilterParameters>
        </asp:SqlDataSource>

    </div>
    <div>
        <br />
        <asp:Button ID="btnMainMenu" runat="server" Text="Main Menu" OnClick="btnMainMenu_Click" />
    </div>
    </form>
</body>
</html>
