<%--
      /PROJECT/execute-query.aspx
--%>

<%@ Page Title="Execute Query" Language="C#" MasterPageFile="~/storeuser.master" AutoEventWireup="true" CodeFile="executequery.aspx.cs" Inherits="executequery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Aggregation Type  "></asp:Label>
    <asp:DropDownList ID="dropdownaggregation" runat="server">
        <asp:ListItem Value="sum">SUM</asp:ListItem>
        <asp:ListItem Value="min">Minimum</asp:ListItem>
        <asp:ListItem Value="max">Maximum</asp:ListItem>
        <asp:ListItem Value="avg">Average</asp:ListItem>
    </asp:DropDownList>
    <asp:Label ID="Label2" runat="server" Text="Group By  "></asp:Label>
    <asp:DropDownList ID="dropdowngroupby" runat="server" AutoPostBack="True" OnSelectedIndexChanged="dropdowngroupby_SelectedIndexChanged" CausesValidation="True" ValidationGroup="query">
        <asp:ListItem Selected="True">--Select--</asp:ListItem>
        <asp:ListItem Value="month">Month</asp:ListItem>
        <asp:ListItem Value="year">Year</asp:ListItem>
        <asp:ListItem Value="department">Department</asp:ListItem>
    </asp:DropDownList>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" Text="*" Font-Strikeout="False" ControlToValidate="dropdowngroupby" ForeColor="Red" InitialValue="--Select--" ValidationGroup="query"></asp:RequiredFieldValidator>
    <asp:Label ID="Label3" runat="server" Text="Year  "></asp:Label>
    <asp:DropDownList ID="dropdownyear" runat="server" DataSourceID="SqlDataSource1" DataTextField="year" DataValueField="year" AutoPostBack="True">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [year] FROM [querytable] WHERE ([storeid] = @storeid)">
        <SelectParameters>
            <asp:SessionParameter Name="storeid" SessionField="User" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div style="margin-top:20px;">
        <asp:Button ID="Button1" runat="server" Text="Execute" OnClick="Button1_Click" ValidationGroup="query" />
    </div>
    <div style="margin-top:20px; margin-left:120px; ">
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" Width="100px" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
    </div>
</asp:Content>