<%@ Page Title="Change Password" Language="C#" MasterPageFile="~/storeuser.master" AutoEventWireup="true" CodeFile="changepass.aspx.cs" Inherits="changepass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
    <div style="width: 400px; height: auto; margin-left: 100px; margin-top: 55px; margin-bottom: 10px;">
        <table>
            <tr>
                <td style="width: 157px; font-family: 'Lucida Sans'">Current Password:
                </td>
                <td>
                    <asp:TextBox ID="textcurrpass" runat="server" ValidationGroup="changepass" Height="22px" Width="180px" BorderColor="#FFCC66" BorderStyle="Solid" BorderWidth="1px" Font-Size="17px" TextMode="Password"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="textcurrpass" ErrorMessage="*" ForeColor="Red" ValidationGroup="changepass">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 157px; font-family: 'Lucida Sans'">New Password:
                </td>
                <td>
                    <asp:TextBox ID="textnewpass" runat="server" ValidationGroup="changepass" Height="22px" Width="180px" BorderColor="#FFCC66" BorderStyle="Solid" BorderWidth="1px" Font-Size="17px" TextMode="Password"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="textnewpass" ErrorMessage="*" ForeColor="Red" ValidationGroup="changepass">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 157px; font-family: 'Lucida Sans'">Repeat Password:
                </td>
                <td>
                    <asp:TextBox ID="textreppass" runat="server" ValidationGroup="changepass" Height="22px" Width="180px" BorderColor="#FFCC66" BorderStyle="Solid" BorderWidth="1px" Font-Size="17px" TextMode="Password"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="textreppass"
                        ErrorMessage="*" ForeColor="Red" ValidationGroup="changepass"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan='2' align='center' style="height: 49px">
                    <asp:Button ID="buttonchangepass" runat="server" Text="Change Password" ValidationGroup="changepass" Font-Size="15px" Width="153px" OnClick="buttonchangepass_Click" />
                </td>
                <td style="height: 49px"></td>
            </tr>
            <tr>
                <td colspan='3' align='center' style="height: 33px">
                    <asp:Label ID="labelresult" runat="server" Text=""></asp:Label>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>