<%--
    /PROJECT/admin/add-store.aspx
--%>

<%@ Page Title="Add Store" Language="C#" MasterPageFile="~/admin/admin1.master" AutoEventWireup="true" CodeFile="add-store.aspx.cs" Inherits="admin_add_store" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 500px; background-image: url('../img/registerbg.png'); margin-left: auto; margin-right: auto; margin-bottom: 30px; padding-top: 8px; overflow: auto">
        <h2 style="color: #FFFFFF; text-align: center; font-family: 'Lucida Sans'">Add Store</h2>
        <div style="width: 430px; margin: 0 auto;">
            <table>
                <tr>
                    <td style="color: white; font-family: 'Lucida Sans'">Store Id:
                    </td>
                    <td>
                        <asp:TextBox ID="storeid" runat="server" ValidationGroup="profile" Height="22px" Width="180px" BorderColor="#FFCC66" BorderStyle="Solid" BorderWidth="1px" Font-Size="17px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="storeid" ErrorMessage="*" ForeColor="Red" ValidationGroup="reg">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="color: white; font-family: 'Lucida Sans'">Store Name:
                    </td>
                    <td>
                        <asp:TextBox ID="storename" runat="server" ValidationGroup="profile" Height="22px" Width="180px" BorderColor="#FFCC66" BorderStyle="Solid" BorderWidth="1px" Font-Size="17px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="storename" ErrorMessage="*" ForeColor="Red" ValidationGroup="reg">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="color: white; font-family: 'Lucida Sans'">Email ID:
                    </td>
                    <td>
                        <asp:TextBox ID="txtemail" runat="server" ValidationGroup="profile" Height="22px" Width="180px" BorderColor="#FFCC66" BorderStyle="Solid" BorderWidth="1px" Font-Size="17px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtemail"
                            ErrorMessage="*" ForeColor="Red" ValidationGroup="reg"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail"
                            ErrorMessage="Invalid Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="reg" Font-Size="13px"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td style="color: white; font-family: 'Lucida Sans'">Mobile No:
                    </td>
                    <td>
                        <asp:TextBox ID="txtmob" runat="server" ValidationGroup="profile" Height="22px" Width="180px" BorderColor="#FFCC66" BorderStyle="Solid" BorderWidth="1px" Font-Size="17px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtmob" ErrorMessage="*" ForeColor="Red" ValidationGroup="reg">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ValidationExpression="\d{10}" ControlToValidate="txtmob" ValidationGroup="reg" Font-Size="13px">Invalid Number</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td style="color: white; font-family: 'Lucida Sans'">Password:
                    </td>
                    <td>
                        <asp:TextBox ID="txtpass" runat="server" TextMode="Password" Height="22px" Width="180px" BorderColor="#FFCC66" BorderStyle="Solid" BorderWidth="1px" Font-Size="17px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtpass"
                            ErrorMessage="*" ForeColor="Red" ValidationGroup="reg">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="color: white; font-family: 'Lucida Sans'; width: 140px;">Retype Password:
                    </td>
                    <td>
                        <asp:TextBox ID="txtrepass" runat="server" TextMode="Password" Height="22px" Width="180px" BorderColor="#FFCC66" BorderStyle="Solid" BorderWidth="1px" Font-Size="17px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtrepass"
                            ErrorMessage="*" ForeColor="Red" ValidationGroup="reg">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="color: white; font-family: 'Lucida Sans'">Address:
                    </td>
                    <td>
                        <asp:TextBox ID="txtaddress" runat="server" TextMode="MultiLine" Height="41px" Width="180px" BorderColor="#FFCC66" BorderStyle="Solid" BorderWidth="1px" Font-Size="17px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtaddress"
                            ErrorMessage="*" ForeColor="Red" ValidationGroup="reg">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="color: white; font-family: 'Lucida Sans'">City:
                    </td>
                    <td>
                        <asp:TextBox ID="city" runat="server" ValidationGroup="profile" Height="22px" Width="180px" BorderColor="#FFCC66" BorderStyle="Solid" BorderWidth="1px" Font-Size="17px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="city"
                            ErrorMessage="*" ForeColor="Red" ValidationGroup="reg">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="color: white; font-family: 'Lucida Sans'">State:
                    </td>
                    <td>
                        <asp:TextBox ID="state" runat="server" ValidationGroup="profile" Height="22px" Width="180px" BorderColor="#FFCC66" BorderStyle="Solid" BorderWidth="1px" Font-Size="17px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="state"
                            ErrorMessage="*" ForeColor="Red" ValidationGroup="reg">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="color: white; font-family: 'Lucida Sans'">Zip Code:
                    </td>
                    <td>
                        <asp:TextBox ID="zipcode" runat="server" ValidationGroup="profile" Height="22px" Width="180px" BorderColor="#FFCC66" BorderStyle="Solid" BorderWidth="1px" Font-Size="17px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="zipcode"
                            ErrorMessage="*" ForeColor="Red" ValidationGroup="reg">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="zipcode invalid" ForeColor="Red" ValidationExpression="\d{6}" ControlToValidate="zipcode" ValidationGroup="reg" Font-Size="13px"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td style="color: white; font-family: 'Lucida Sans'">Photo Id:
                    </td>
                    <td>
                        <asp:FileUpload ID="photoupload" runat="server" Height="22px" Width="180px" BorderColor="#FFCC66" BorderStyle="Solid" BorderWidth="1px" />
                    </td>
                </tr>
                <tr>
                    <td colspan='2' align='center' class="auto-style9" style="height: 50px">
                        <asp:Button ID="submit" runat="server" Text="Submit" ValidationGroup="reg" Font-Size="15px" Width="105px" OnClick="submit_Click" />
                    </td>
                    <td style="height: 50px"></td>
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