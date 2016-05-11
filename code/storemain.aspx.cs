using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class profile1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] == "NotAvailable")
        {
            Response.Redirect("log-in.aspx");
        }
        Label1.Text = "Test";
    }
}