<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Suppliers.aspx.cs" Inherits="CAP499_Capstone.Suppliers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Suppliers</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h2>Suppliers</h2>
        <asp:TextBox ID="txtSearch" runat="server" Width="230px"></asp:TextBox>
        &nbsp;
        <asp:Button ID="btnSearch" runat="server" Text="Search" />
        &emsp;
        <asp:Button ID="btnNewSupplier" runat="server" Text="New Supplier" OnClick="btnNewSupplier_Click" />
        <br />
        <br />
        &emsp;&emsp;&emsp;<asp:Label ID="lblNewSupplierSuccess" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
        <br />
    </div>
    <div>

        <asp:GridView ID="GridViewSuppliers" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource_Suppliers" EmptyDataText="There are no data records to display." AllowPaging="True" AllowSorting="True" CellPadding="1" ForeColor="#333333" PageSize="25">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" >
                <ItemStyle Width="15px" />
                </asp:BoundField>
                <asp:BoundField DataField="Company_Name" HeaderText="Company_Name" SortExpression="Company_Name" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                <asp:BoundField DataField="Street" HeaderText="Street" SortExpression="Street" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                <asp:BoundField DataField="Zip" HeaderText="Zip" SortExpression="Zip" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990099" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource_Suppliers" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString4 %>" DeleteCommand="DELETE FROM [Suppliers] WHERE [ID] = ?" InsertCommand="INSERT INTO [Suppliers] ([ID], [Company_Name], [Phone], [Street], [City], [State], [Zip]) VALUES (?, ?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString4.ProviderName %>" SelectCommand="SELECT * FROM [Suppliers] ORDER BY [Company_Name]" UpdateCommand="UPDATE [Suppliers] SET [Company_Name] = ?, [Phone] = ?, [Street] = ?, [City] = ?, [State] = ?, [Zip] = ? WHERE [ID] = ?" FilterExpression="Company_Name LIKE '{0}%'">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ID" Type="Int32" />
                <asp:Parameter Name="Company_Name" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="Street" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="Zip" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Company_Name" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="Street" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="Zip" Type="String" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
            <FilterParameters>
                <asp:ControlParameter Name="Company_Name" ControlID="txtSearch" PropertyName="Text" />
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

