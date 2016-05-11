<%--
      /PROJECT/add-transaction.aspx
--%>

<%@ Page Title="Add Transaction" Language="C#" MasterPageFile="~/storeuser.master" AutoEventWireup="true" CodeFile="add_data.aspx.cs" Inherits="add_data" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
    <div style="width: 586px; height: 490px; background-image: url('img/addtransbg.jpg'); margin-bottom: 30px; padding-top: 8px; margin-top: 10px;">
        <h2 style="color: #008000; text-align: center; font-family: 'Lucida Sans'">Transactions</h2>
        <div style="width: 458px; margin: 0 auto;">
            <table style="width: 448px; margin-left: 35px;">
                <tr>
                    <td style="width: 142px">Transaction Id:</td>
                    <td>
                        <asp:TextBox ID="transactionid" runat="server" ValidationGroup="trans" Height="22px" Width="180px" BorderColor="#FFCC66" BorderStyle="Solid" BorderWidth="1px" Font-Size="17px"></asp:TextBox>
                    </td>
                    <td style="width: 116px">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="transactionid" ErrorMessage="*" ForeColor="Red" ValidationGroup="trans">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 142px">Date:</td>
                    <td>
                        <ajaxtoolkit:ToolkitScriptManager ID="scrptmngr" runat="server"></ajaxtoolkit:ToolkitScriptManager>
                        <asp:TextBox ID="txtdate" runat="server" Height="22px" Width="180px" BorderColor="#FFCC66" BorderStyle="Solid" BorderWidth="1px" Font-Size="17px" ValidationGroup="trans"></asp:TextBox>
                    </td>
                    <td style="width: 116px">
                        <asp:ImageButton ID="imgcal" runat="server" Height="25px" Width="25px" ImageUrl="~/img/calicon.png" />
                        <ajaxtoolkit:CalendarExtender ID="txtdate_CalendarExtender" runat="server" BehaviorID="txtdate_CalendarExtender" TargetControlID="txtdate" PopupButtonID="imgcal" Format="dd/MM/yyyy">
                        </ajaxtoolkit:CalendarExtender>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtdate" ErrorMessage="*" ForeColor="Red" ValidationGroup="trans">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 142px">Weekday:</td>
                    <td>
                        <asp:DropDownList ID="dropdownday" runat="server" Height="28px" Width="120px" BorderColor="#FFCC66" BorderStyle="Solid" BorderWidth="1px" Font-Size="17px">
                            <asp:ListItem Selected="True">Monday</asp:ListItem>
                            <asp:ListItem>Tuesday</asp:ListItem>
                            <asp:ListItem>Wednesday</asp:ListItem>
                            <asp:ListItem>Thursday</asp:ListItem>
                            <asp:ListItem>Friday</asp:ListItem>
                            <asp:ListItem>Saturday</asp:ListItem>
                            <asp:ListItem>Sunday</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td style="width: 116px"></td>
                </tr>
                <tr>
                    <td style="width: 142px">Department:</td>
                    <td>
                        <asp:DropDownList ID="dropdowndept" runat="server" Height="28px" Width="167px" BorderColor="#FFCC66" BorderStyle="Solid" BorderWidth="1px" Font-Size="17px">
                            <asp:ListItem Selected="True">Electronics</asp:ListItem>
                            <asp:ListItem>Books</asp:ListItem>
                            <asp:ListItem>Clothing</asp:ListItem>
                            <asp:ListItem>Home_Appliances</asp:ListItem>
                            <asp:ListItem>Cosmetics</asp:ListItem>
                            <asp:ListItem>Food</asp:ListItem>
                            <asp:ListItem>Gardening</asp:ListItem>
                            <asp:ListItem>Sports</asp:ListItem>
                            <asp:ListItem>Paint</asp:ListItem>
                            <asp:ListItem>Movie_Games</asp:ListItem>
                            <asp:ListItem>Hardware</asp:ListItem>
                            <asp:ListItem>Jewelry</asp:ListItem>
                            <asp:ListItem>Baby_Toys</asp:ListItem>
                            <asp:ListItem>Health_Gourmet</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td style="width: 116px"></td>
                </tr>

                <tr>
                    <td style="width: 142px">Number of Items:</td>
                    <td>
                        <asp:TextBox ID="txtnumitems" runat="server" Height="22px" Width="120px" BorderColor="#FFCC66" BorderStyle="Solid" BorderWidth="1px" Font-Size="17px" ValidationGroup="trans"></asp:TextBox>
                    </td>
                    <td style="width: 116px">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtnumitems" ErrorMessage="*" ForeColor="Red" ValidationGroup="trans">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtnumitems" ErrorMessage="*Integer" Font-Size="13px" ForeColor="Red" ValidationExpression="^[1-9]\d*$" ValidationGroup="trans"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 142px">Sale Amount:</td>
                    <td>
                        <asp:TextBox ID="saleamt" runat="server" ValidationGroup="trans" Height="22px" Width="180px" BorderColor="#FFCC66" BorderStyle="Solid" BorderWidth="1px" Font-Size="17px"></asp:TextBox>
                    </td>
                    <td style="width: 116px">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="saleamt" ErrorMessage="*" ForeColor="Red" ValidationGroup="trans">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="saleamt" ErrorMessage="Invalid Amount" Font-Size="13px" ForeColor="Red" ValidationExpression="^\d*\.?\d*$" ValidationGroup="trans"></asp:RegularExpressionValidator>
                    </td>
                </tr>

                <tr>
                    <td style="width: 142px; height: 15px;">-------------------------</td>
                    <td style="height: 15px"></td>
                    <td style="width: 116px; height: 15px;"></td>
                </tr>

                <tr>
                    <td style="width: 142px">Customer Name:</td>
                    <td>
                        <asp:TextBox ID="custname" runat="server" ValidationGroup="trans" Height="22px" Width="180px" BorderColor="#FFCC66" BorderStyle="Solid" BorderWidth="1px" Font-Size="17px"></asp:TextBox>
                    </td>
                    <td style="width: 116px">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="custname" ErrorMessage="*" ForeColor="Red" ValidationGroup="trans">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 142px">Contact Number:</td>
                    <td>
                        <asp:TextBox ID="txtmobile" runat="server" ValidationGroup="trans" Height="22px" Width="180px" BorderColor="#FFCC66" BorderStyle="Solid" BorderWidth="1px" Font-Size="17px"></asp:TextBox>
                    </td>
                    <td style="width: 116px">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtmobile" ErrorMessage="*" ForeColor="Red" ValidationGroup="trans">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 142px">Pincode:</td>
                    <td>
                        <asp:TextBox ID="txtpin" runat="server" ValidationGroup="trans" Height="22px" Width="180px" BorderColor="#FFCC66" BorderStyle="Solid" BorderWidth="1px" Font-Size="17px"></asp:TextBox>
                    </td>
                    <td style="width: 116px">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtpin" ErrorMessage="*" ForeColor="Red" ValidationGroup="trans">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan='2' align='center' class="auto-style9" style="height: 51px">
                        <asp:Button ID="btnsubmit" runat="server" Text="Submit" Font-Bold="False" Font-Size="15px" Width="105px" OnClick="btnsubmit_Click" ValidationGroup="trans" />
                    </td>
                    <td class="auto-style10" style="height: 51px; width: 116px"></td>
                </tr>
                <tr>
                    <td colspan='2' align='center' style="height: 27px">
                        <asp:Label ID="labelresult" runat="server"></asp:Label>
                    </td>
                    <td></td>
                </tr>
            </table>
        </div>
    </div>

</asp:Content>