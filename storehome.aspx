<%--
      /PROJECT/store-home.aspx
--%>

<%@ Page Culture="en-IN" Title="Store Home" Language="C#" MasterPageFile="~/storeuser.master" AutoEventWireup="true" CodeFile="storehome.aspx.cs" Inherits="storehome" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowSorting="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="sno" AllowPaging="True" Font-Size="15px" HorizontalAlign="Center" Width="800px">
        <AlternatingRowStyle BackColor="#99CCFF" />
        <Columns>
            <asp:BoundField DataField="sno" HeaderText="Sl No." SortExpression="sno" InsertVisible="False" Visible="False" ReadOnly="True" />
            <asp:BoundField DataField="transid" HeaderText="Transaction Id" SortExpression="transid" />
            <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" />
            <asp:BoundField DataField="weekday" HeaderText="Weekday" SortExpression="weekday" />
            <asp:BoundField DataField="department" HeaderText="Department" SortExpression="department" />
            <asp:BoundField DataField="numitems" HeaderText="No. of Items" SortExpression="numitems" />
            <asp:BoundField DataField="saleamt" HeaderText="Sale Amt" SortExpression="saleamt" DataFormatString="{0:c}" ItemStyle-Width="120px">
                <ItemStyle Width="120px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="custname" HeaderText="Customer Name" SortExpression="custname" />
            <asp:CommandField ShowEditButton="True" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [transid], [department], [numitems], [saleamt], [sno], [date], [weekday], [custname] FROM [querytable] WHERE ([storeid] = @storeid) ORDER BY [transid]" DeleteCommand="DELETE FROM [querytable] WHERE [sno] = @sno" InsertCommand="INSERT INTO [querytable] ([transid], [department], [numitems], [saleamt], [date], [weekday], [custname]) VALUES (@transid, @department, @numitems, @saleamt, @date, @weekday, @custname)" UpdateCommand="UPDATE [querytable] SET [transid] = @transid, [department] = @department, [numitems] = @numitems, [saleamt] = @saleamt, [date] = @date, [weekday] = @weekday, [custname] = @custname WHERE [sno] = @sno">
        <DeleteParameters>
            <asp:Parameter Name="sno" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="transid" Type="String" />
            <asp:Parameter Name="department" Type="String" />
            <asp:Parameter Name="numitems" Type="Decimal" />
            <asp:Parameter Name="saleamt" Type="Decimal" />
            <asp:Parameter Name="date" Type="String" />
            <asp:Parameter Name="weekday" Type="String" />
            <asp:Parameter Name="custname" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="storeid" SessionField="User" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="transid" Type="String" />
            <asp:Parameter Name="department" Type="String" />
            <asp:Parameter Name="numitems" Type="Decimal" />
            <asp:Parameter Name="saleamt" Type="Decimal" />
            <asp:Parameter Name="date" Type="String" />
            <asp:Parameter Name="weekday" Type="String" />
            <asp:Parameter Name="custname" Type="String" />
            <asp:Parameter Name="sno" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>