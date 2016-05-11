<%--
    /PROJECT/admin/K-Mean.aspx
--%>

<%@ Page Title="K-Mean Clustering" Language="C#" MasterPageFile="~/admin/admin1.master" AutoEventWireup="true" CodeFile="K-Mean.aspx.cs" Inherits="admin_K_Mean" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="margin-left:330px; margin-top:20px;">
        <asp:Label ID="Label1" runat="server" Text="Value of K "></asp:Label>
        <asp:TextBox ID="txtK" runat="server" Height="20px" Width="65px" BackColor="#99CCFF" CausesValidation="True"  ValidationGroup="kmean" TextMode="Number"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtK" ErrorMessage="*" ForeColor="Red" ValidationGroup="kmean">*</asp:RequiredFieldValidator>
        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtK" ErrorMessage="&gt;0 and &lt;=200" Font-Size="14px" ForeColor="Red" MaximumValue="200" MinimumValue="1" Type="Integer" ValidationGroup="kmean"></asp:RangeValidator>
    </div>
    <div style="margin-top:10px; margin-left:360px">
        <asp:Button ID="btnMain" runat="server" Text="Perform K-Mean" OnClick="btnMain_Click" ValidationGroup="kmean" />
    </div>
    <div style="margin-left:380px; margin-top:20px">
        <asp:Label ID="Label2" runat="server" Text="Clusters"></asp:Label>
    </div>
    <div style="float: right; width: 810px; margin-bottom: 20px; overflow: auto;">
        <asp:GridView ID="gvclusters" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Font-Size="15px" HorizontalAlign="Center" Width="800px">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"/>
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
    </div>

    <div style="margin-top: 15px; float: right; width: 810px; margin-bottom: 20px; overflow: auto;">
        <asp:GridView ID="gvstorecluster" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Font-Size="15px" HorizontalAlign="Center" Width="800px" Caption="Cluster Number And Their Corresponding Stores">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"/>
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
    </div>

    <div>
        <p>.</p>
    </div>

</asp:Content>