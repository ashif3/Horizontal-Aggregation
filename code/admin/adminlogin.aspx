<%--
    /PROJECT/admin/adminlogin.aspx
--%>

<%@ Page Title="Admin Login" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="adminlogin.aspx.cs" Inherits="admin_adminlogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 100px; height: 40px; margin-left: 20px;">
        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/img/backbtn.png" Width="100px" Height="40px" OnClick="ImageButton1_Click" />
    </div>
    <div style="width: 340px; height: 280px; margin-left: auto; margin-right: auto; margin-top: 0px; margin-bottom: 50px; padding-top: 8px; background-color: #122C41;">
        <h2 style="color: white; margin-bottom: 10px; font-family: 'Lucida Sans';">Admin Login</h2>
        <div style="width: 240px; margin: 0 auto; color: white">
            <table cellpadding="2" cellspacing="4" style="width: 100%;">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="User ID" AssociatedControlID="txtUserName"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName" ErrorMessage="" Text="*" ValidationGroup="adminlogin"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="txtUserName" Width="100%" runat="server" ValidationGroup="adminlogin" Height="24px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="padding-top: 5px;">
                        <asp:Label ID="Label2" runat="server" Text="Password" AssociatedControlID="txtPassword"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="" Text="*" ValidationGroup="adminlogin"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="txtPassword" Width="100%" TextMode="Password" runat="server" ValidationGroup="adminlogin" Height="24px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="padding-top: 10px;">
                        <asp:Button ID="btnLogin" Width="100" runat="server" Text="Login" ValidationGroup="adminlogin" Font-Bold="False" Font-Size="Medium" OnClick="btnLogin_Click" />
                    </td>
                </tr>
                <tr>
                    <td style="padding-top: 5px; text-align: center;">
                        <asp:Label ID="lblError" runat="server" ForeColor="Red" EnableViewState="False" Font-Size="Small"></asp:Label>
                    </td>
                </tr>

            </table>
        </div>
    </div>

</asp:Content>