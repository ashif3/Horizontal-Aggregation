<%@ Page Title="Registration" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 200px;
            color:white;
            font-family:Lucida Sans, Lucida Sans Regular, Lucida Grande, Lucida Sans Unicode, Geneva, Verdana, sans-serif;
        }
        .auto-style2 {
            width: 120px;
            font-size: 10px;

        }
     
        .auto-style3 {
            width: 200px;
            color: white;
            font-family: Lucida Sans, Lucida Sans Regular, Lucida Grande, Lucida Sans Unicode, Geneva, Verdana, sans-serif;
            height: 26px;
        }
        .auto-style4 {
            height: 26px;
        }
        .auto-style5 {
            width: 120px;
            height: 26px;
        }
     
        .auto-style6 {
            width: 200px;
            color: white;
            font-family: Lucida Sans, Lucida Sans Regular, Lucida Grande, Lucida Sans Unicode, Geneva, Verdana, sans-serif;
            height: 32px;
        }
        .auto-style7 {
            height: 32px;
        }
        .auto-style8 {
            width: 120px;
            font-size: 10px;
            height: 32px;
        }
     
        .auto-style9 {
            height: 51px;
        }
        .auto-style10 {
            width: 120px;
            font-size: 10px;
            height: 51px;
        }
        .auto-style11 {
            width: 200px;
            color: white;
            font-family: Lucida Sans, Lucida Sans Regular, Lucida Grande, Lucida Sans Unicode, Geneva, Verdana, sans-serif;
            height: 31px;
        }
        .auto-style12 {
            height: 31px;
        }
     
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width:100px; height:40px; margin-left:20px; ">
        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/img/backbtn.png" width="100px" height="40px" OnClick="ImageButton1_Click" />
    </div>
    <div style="width:500px; height:500px; background-image: url('img/registerbg.jpg'); margin-left: auto; margin-right: auto; margin-bottom: 30px; padding-top:8px;">
    <h2 style="color: #FFFFFF; text-align: center; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;">Registration
    </h2>
    <div style="width:430px; margin: 0 auto;">
        <table>

            <tr>
                <td class="auto-style1">Store Id:
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="storeid" runat="server" ValidationGroup="profile" Height="22px" Width="180px" BorderColor="#FFCC66" BorderStyle="Solid" BorderWidth="1px" Font-Size="17px"></asp:TextBox>
                </td>
                <td class="auto-style2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="storeid" ErrorMessage="*" ForeColor="Red" ValidationGroup="reg">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Store Name:
                </td>
                <td>
                    <asp:TextBox ID="storename" runat="server" ValidationGroup="profile" Height="22px" Width="180px" BorderColor="#FFCC66" BorderStyle="Solid" BorderWidth="1px" Font-Size="17px"></asp:TextBox>
                </td>
                <td class="auto-style2">
                    
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="storename" ErrorMessage="*" ForeColor="Red" ValidationGroup="reg">*</asp:RequiredFieldValidator>
                    
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Email ID:
                </td>
                <td>
                    <asp:TextBox ID="txtemail" runat="server" ValidationGroup="profile" Height="22px" Width="180px" BorderColor="#FFCC66" BorderStyle="Solid" BorderWidth="1px" Font-Size="17px"></asp:TextBox>
                </td>
                <td class="auto-style2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtemail"
                        ErrorMessage="*" ForeColor="Red" ValidationGroup="reg"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail"
                        ErrorMessage="Invalid Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="reg"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">Mobile No:
                </td>
                <td class="auto-style7">
                    <asp:TextBox ID="txtmob" runat="server" ValidationGroup="profile" Height="22px" Width="180px" BorderColor="#FFCC66" BorderStyle="Solid" BorderWidth="1px" Font-Size="17px"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtmob" ErrorMessage="*" ForeColor="Red" ValidationGroup="reg">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ValidationExpression="\d{10}" ControlToValidate="txtmob" ValidationGroup="reg">Invalid Number</asp:RegularExpressionValidator>
                </td>
            </tr>
            
            <tr>
                <td class="auto-style3">Password:
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtpass" runat="server" TextMode="Password" Height="22px" Width="180px" BorderColor="#FFCC66" BorderStyle="Solid" BorderWidth="1px" Font-Size="17px"></asp:TextBox>
                </td>
                <td class="auto-style5">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtpass"
                        ErrorMessage="*" ForeColor="Red" ValidationGroup="reg">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Retype Password:
                </td>
                <td>
                    <asp:TextBox ID="txtrepass" runat="server" TextMode="Password" Height="22px" Width="180px" BorderColor="#FFCC66" BorderStyle="Solid" BorderWidth="1px" Font-Size="17px"></asp:TextBox>
                </td>
                <td class="auto-style2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtrepass"
                        ErrorMessage="*" ForeColor="Red" ValidationGroup="reg">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Address:
                </td>
                <td>
                    <asp:TextBox ID="txtaddress" runat="server" TextMode="MultiLine" Height="22px" Width="180px" BorderColor="#FFCC66" BorderStyle="Solid" BorderWidth="1px" Font-Size="17px"></asp:TextBox>
                </td>
                <td class="auto-style2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtaddress"
                        ErrorMessage="*" ForeColor="Red" ValidationGroup="reg">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">City:
                </td>
                <td>
                    <asp:TextBox ID="city" runat="server" ValidationGroup="profile" Height="22px" Width="180px" BorderColor="#FFCC66" BorderStyle="Solid" BorderWidth="1px" Font-Size="17px"></asp:TextBox>
                </td>
                <td class="auto-style2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="city"
                        ErrorMessage="*" ForeColor="Red" ValidationGroup="reg">*</asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td class="auto-style1">State:
                </td>
                <td>
                    <asp:TextBox ID="state" runat="server" ValidationGroup="profile" Height="22px" Width="180px" BorderColor="#FFCC66" BorderStyle="Solid" BorderWidth="1px" Font-Size="17px"></asp:TextBox>
                </td>
                <td class="auto-style2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="state"
                        ErrorMessage="*" ForeColor="Red" ValidationGroup="reg">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Zip Code:
                </td>
                <td>
                    <asp:TextBox ID="zipcode" runat="server" ValidationGroup="profile" Height="22px" Width="180px" BorderColor="#FFCC66" BorderStyle="Solid" BorderWidth="1px" Font-Size="17px"></asp:TextBox>
                </td>
                <td class="auto-style2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="zipcode"
                        ErrorMessage="*" ForeColor="Red" ValidationGroup="reg">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="zipcode invalid" ForeColor="Red" ValidationExpression="\d{6}" ControlToValidate="zipcode" ValidationGroup="reg"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style11">Photo Id:
                </td>
                <td class="auto-style12">
                    <asp:FileUpload ID="photoupload" runat="server" Height="22px" Width="180px" BorderColor="#FFCC66" BorderStyle="Solid" BorderWidth="1px" />
                </td>
            </tr>


            
            
            <tr>
                <td colspan='2' align='center' class="auto-style9">
                    <asp:Button ID="Button1" runat="server" Text="Submit" ValidationGroup="reg" OnClick="submit_Click" Font-Bold="False" Font-Size="15px" Width="105px" />
                </td>
                <td class="auto-style10"></td>
            </tr>
            <tr>
                <td colspan='3' align='center'>
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                </td>
            </tr>
        </table>
    </div>
        </div>
</asp:Content>

