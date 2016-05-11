<%--
    /PROJECT/admin/store-detail.aspx
--%>

<%@ Page Title="Store Detail" Language="C#" MasterPageFile="~/admin/admin1.master" AutoEventWireup="true" CodeFile="store-detail.aspx.cs" Inherits="admin_store_detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 810px; overflow: auto;">
        <div style="margin-top: 20px; float: right; width: 810px; margin-bottom: 20px;">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowSorting="True" CellPadding="4" DataKeyNames="storeid" AllowPaging="True" Font-Size="15px" HorizontalAlign="Center" Width="1100px" DataSourceID="SqlDataSource1" ForeColor="#333333">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="storeid" HeaderText="Store Id" ReadOnly="True" SortExpression="storeid" />
                    <asp:BoundField DataField="sname" HeaderText="Store Name" SortExpression="sname" />
                    <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                    <asp:BoundField DataField="mobile" HeaderText="Mobile" SortExpression="mobile" />
                    <asp:BoundField DataField="password" HeaderText="Password" SortExpression="password" />
                    <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address" />
                    <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
                    <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                    <asp:BoundField DataField="zipcode" HeaderText="Zipcode" SortExpression="zipcode" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle HorizontalAlign="Center" BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [store] WHERE [storeid] = @storeid" SelectCommand="SELECT [storeid], [sname], [email], [mobile], [password], [address], [city], [state], [zipcode] FROM [store]" UpdateCommand="UPDATE [store] SET [sname] = @sname, [email] = @email, [mobile] = @mobile, [password] = @password, [address] = @address, [city] = @city, [state] = @state, [zipcode] = @zipcode WHERE [storeid] = @storeid">
                <DeleteParameters>
                    <asp:Parameter Name="storeid" Type="String" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="sname" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="mobile" Type="String" />
                    <asp:Parameter Name="password" Type="String" />
                    <asp:Parameter Name="address" Type="String" />
                    <asp:Parameter Name="city" Type="String" />
                    <asp:Parameter Name="state" Type="String" />
                    <asp:Parameter Name="zipcode" Type="String" />
                    <asp:Parameter Name="storeid" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>