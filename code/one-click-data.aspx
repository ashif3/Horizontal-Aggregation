<%@ Page Language="C#" AutoEventWireup="true" CodeFile="one-click-data.aspx.cs" Inherits="one_click_data" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        <asp:Label ID="Label1" runat="server" Text="store"></asp:Label>
    
    </div>
        <div>
    
        
        <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click" />
    
            <asp:Label ID="Label2" runat="server" Text="querytable"></asp:Label>
    
    </div>
    </form>
</body>
</html>
