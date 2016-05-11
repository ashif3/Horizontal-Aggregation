<%--
    /PROJECT/admin/horizontal-view.aspx
--%>

<%@ Page Title="Horizontal View" Language="C#" MasterPageFile="~/admin/admin1.master" AutoEventWireup="true" CodeFile="horizontal-view.aspx.cs" Inherits="admin_horizontal_view" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <p style="text-align: center; color: #3E02DB; font-size: 18px;">Horizontal View</p>
    <div style="margin-left: 20px;">
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Transposing Column: "></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" ValidationGroup="view">
                        <asp:ListItem>--Select--</asp:ListItem>
                        <asp:ListItem Value="day">Day</asp:ListItem>
                        <asp:ListItem Value="month">Month</asp:ListItem>
                        <asp:ListItem Value="department">Department</asp:ListItem>
                    </asp:DropDownList></td>
                <td style="width: 40px;">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList1" ErrorMessage="*" ForeColor="Red" InitialValue="--Select--" ValidationGroup="view">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Aggregation Column: "></asp:Label></td>
                <td>
                    <asp:DropDownList ID="DropDownList2" runat="server" ValidationGroup="view">
                        <asp:ListItem>--Select--</asp:ListItem>
                        <asp:ListItem Value="numitems">Number of Items</asp:ListItem>
                        <asp:ListItem Value="saleamt">Sale Amount</asp:ListItem>
                    </asp:DropDownList></td>
                <td style="width: 30px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="DropDownList2" ForeColor="Red" InitialValue="--Select--" ValidationGroup="view">*</asp:RequiredFieldValidator></td>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Compute Fv  "></asp:Label>
                    <asp:CheckBox ID="checkFv" runat="server" />
                </td>
            </tr>

        </table>

    </div>

    <div style="margin-top: 10px; margin-left: 160px;">
        <table>
            <tr>
                <td style="width: 120px;">
                    <asp:Button ID="btnSpj" runat="server" Text="SPJ" Width="80px" OnClick="btnSpj_Click" ValidationGroup="view" />
                </td>
                <td style="width: 120px;">
                    <asp:Button ID="btnCase" runat="server" Text="CASE" Width="80px" OnClick="btnCase_Click" ValidationGroup="view" />
                </td>
                <td style="width: 120px;">
                    <asp:Button ID="btnPivot" runat="server" Text="PIVOT" Width="80px" OnClick="btnPivot_Click" ValidationGroup="view" />
                </td>
                <td style="width: 250px;">
                    <asp:Label ID="Label5" runat="server" Text="Execution Time:"></asp:Label>
                    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    <div style="margin-top: 15px; float: right; width: 810px; margin-bottom: 20px; overflow: auto;">
        <asp:GridView ID="gridhorizontal" runat="server" CellPadding="4" ForeColor="#333333" GridLines="Vertical" Font-Size="15px" HorizontalAlign="Center" Width="800px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
    </div>

    <div style="margin-left: 20px; margin-bottom: 20px;">
        <asp:Button ID="btnexcel" runat="server" Text="Export To Excel" OnClick="btnexcel_Click" />

    </div>

</asp:Content>