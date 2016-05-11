<%--
      /PROJECT/store-profile.aspx
--%>

<%@ Page Title="Profile" Language="C#" MasterPageFile="~/storeuser.master" AutoEventWireup="true" CodeFile="storeprofile.aspx.cs" Inherits="storeprofile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
    <div style="margin-left: 90px; margin-top: 40px;">
        <asp:FormView ID="FormView1" runat="server" AllowPaging="True" DataKeyNames="storeid" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333">
            <EditItemTemplate>
                <table style="width: 400px; font-size: 16px; border-width: 1px; border-color: GrayText; border-style: solid;">
                    <tr style="height: 10px;">
                        <td></td>
                        <td></td>
                    </tr>
                    <tr style="height: 30px">
                        <td style="padding-left: 20px;">Store Id:</td>
                        <td>
                            <asp:Label ID="storeidLabel1" runat="server" Text='<%# Eval("storeid") %>' /></td>
                    </tr>
                    <tr style="height: 30px">
                        <td style="padding-left: 20px;">Store Name:</td>
                        <td>
                            <asp:TextBox ID="snameTextBox" runat="server" Text='<%# Bind("sname") %>' /></td>
                    </tr>
                    <tr style="height: 30px">
                        <td style="padding-left: 20px;">Email Id:</td>
                        <td>
                            <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' /></td>
                    </tr>
                    <tr style="height: 30px">
                        <td style="padding-left: 20px;">Mobile Number:</td>
                        <td>
                            <asp:TextBox ID="mobileTextBox" runat="server" Text='<%# Bind("mobile") %>' /></td>
                    </tr>
                    <tr style="height: 30px">
                        <td style="padding-left: 20px;">Address:</td>
                        <td>
                            <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' TextMode="MultiLine" /></td>
                    </tr>
                    <tr style="height: 30px">
                        <td style="padding-left: 20px;">City:</td>
                        <td>
                            <asp:TextBox ID="cityTextBox" runat="server" Text='<%# Bind("city") %>' /></td>
                    </tr>
                    <tr style="height: 30px">
                        <td style="padding-left: 20px;">State:</td>
                        <td>
                            <asp:TextBox ID="stateTextBox" runat="server" Text='<%# Bind("state") %>' /></td>
                    </tr>
                    <tr style="height: 30px">
                        <td style="padding-left: 20px;">Pincode:</td>
                        <td>
                            <asp:TextBox ID="zipcodeTextBox" runat="server" Text='<%# Bind("zipcode") %>' /></td>
                    </tr>
                    <tr style="height: 10px;">
                        <td></td>
                        <td></td>
                    </tr>
                    <tr style="height: 30px">
                        <td style="padding-left: 15px;">
                            <asp:ImageButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" ImageUrl="~/img/updatebtn.png" Height="35px" Width="90px" />
                        </td>
                        <td>
                            <asp:ImageButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" ImageUrl="~/img/cancelbtn.png" Height="35px" Width="90px" />
                        </td>
                    </tr>
                </table>
            </EditItemTemplate>
            <EditRowStyle BackColor="#336699" ForeColor="white" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />

            <ItemTemplate>
                <table style="width: 400px; font-size: 16px; border-width: 1px; border-color: GrayText; border-style: solid;">
                    <tr style="height: 10px;">
                        <td></td>
                        <td></td>

                    </tr>
                    <tr style="height: 25px;">
                        <td style="padding-left: 20px;">Store Id:</td>
                        <td>
                            <asp:Label ID="storeidLabel" runat="server" Text='<%# Eval("storeid") %>' /></td>
                    </tr>
                    <tr style="height: 25px">
                        <td style="padding-left: 20px;">Store Name:</td>
                        <td>
                            <asp:Label ID="snameLabel" runat="server" Text='<%# Bind("sname") %>' /></td>
                    </tr>
                    <tr style="height: 25px">
                        <td style="padding-left: 20px;">Email:</td>
                        <td>
                            <asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>' /></td>
                    </tr>
                    <tr style="height: 25px">
                        <td style="padding-left: 20px;">Mobile Number:</td>
                        <td>
                            <asp:Label ID="mobileLabel" runat="server" Text='<%# Bind("mobile") %>' /></td>
                    </tr>
                    <tr style="height: 25px">
                        <td style="padding-left: 20px;">Address:</td>
                        <td>
                            <asp:Label ID="addressLabel" runat="server" Text='<%# Bind("address") %>' /></td>
                    </tr>
                    <tr style="height: 25px">
                        <td style="padding-left: 20px;">City:</td>
                        <td>
                            <asp:Label ID="cityLabel" runat="server" Text='<%# Bind("city") %>' /></td>
                    </tr>
                    <tr style="height: 25px">
                        <td style="padding-left: 20px;">State:</td>
                        <td>
                            <asp:Label ID="stateLabel" runat="server" Text='<%# Bind("state") %>' /></td>
                    </tr>
                    <tr style="height: 25px">
                        <td style="padding-left: 20px;">Pincode:</td>
                        <td>
                            <asp:Label ID="zipcodeLabel" runat="server" Text='<%# Bind("zipcode") %>' /></td>
                    </tr>
                    <tr style="height: 10px;">
                        <td></td>
                        <td></td>

                    </tr>
                    <tr style="height: 25px">
                        <td style="padding-left: 15px;">
                            <asp:ImageButton ID="editbtn" runat="server" CausesValidation="False" CommandName="Edit" ImageUrl="~/img/editbtn.png" Height="40px" Width="110px" />
                            <td></td>
                    </tr>
                </table>
            </ItemTemplate>
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [storeid], [sname], [email], [mobile], [address], [city], [state], [zipcode] FROM [store] WHERE ([storeid] = @storeid)" UpdateCommand="UPDATE [store] SET [sname] = @sname, [email] = @email, [mobile] = @mobile, [address] = @address, [city] = @city, [state] = @state, [zipcode] = @zipcode WHERE [storeid] = @storeid">

            <SelectParameters>
                <asp:SessionParameter Name="storeid" SessionField="User" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="sname" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="mobile" Type="String" />
                <asp:Parameter Name="address" Type="String" />
                <asp:Parameter Name="city" Type="String" />
                <asp:Parameter Name="state" Type="String" />
                <asp:Parameter Name="zipcode" Type="String" />
                <asp:Parameter Name="storeid" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
