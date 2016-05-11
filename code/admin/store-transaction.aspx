<%--
    /PROJECT/admin/store-transaction.aspx
--%>

<%@ Page Title="Store Transaction" Language="C#" MasterPageFile="~/admin/admin1.master" AutoEventWireup="true" CodeFile="store-transaction.aspx.cs" Inherits="admin_store_transaction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="margin-left: 290px;">
        <asp:Label ID="Label1" runat="server" Text="Select Store Id:  "></asp:Label>
        <asp:DropDownList ID="dropdownstore" runat="server" AutoPostBack="True" OnSelectedIndexChanged="dropdownstore_SelectedIndexChanged"></asp:DropDownList>
    </div>
    <div style="text-align: center; color: #008000; font-size: 18px; font-weight: bold; margin-top: 20px">
        <asp:Label ID="Label2" runat="server" Text="Transactions"></asp:Label>
    </div>
    <div style="margin-top: 20px; float: right; width: 810px; margin-bottom: 20px; overflow: auto">
        <asp:GridView ID="gvtransaction" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" Font-Size="15px" HorizontalAlign="Center" Width="650px">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" HorizontalAlign="Center" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
        </asp:GridView>
    </div>
    <div>
        <p>.</p>
    </div>
</asp:Content>