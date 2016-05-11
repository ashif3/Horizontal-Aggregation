/*
 * PROJECT/admin/store-transaction.aspx.cs
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_store_transaction : System.Web.UI.Page
{
    public static string constring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    public static SqlConnection con = new SqlConnection(constring);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminUser"] == "NotAvailable")
        {
            Response.Redirect("adminlogin.aspx");
        }
        Label2.Visible = false;
        if (!this.IsPostBack)
        {
            SqlCommand cmd = new SqlCommand("select storeid, sname from store", con);
            if (con.State == ConnectionState.Closed) con.Open();
            if (con.State == ConnectionState.Open)
            {
                dropdownstore.DataSource = cmd.ExecuteReader();
                dropdownstore.DataTextField = "storeid";
                dropdownstore.DataValueField = "storeid";
                dropdownstore.DataBind();
            }
            if (con.State == ConnectionState.Open) con.Close();
            dropdownstore.Items.Insert(0, new ListItem("--Select--", "0"));
        }
    }

    protected void dropdownstore_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (dropdownstore.SelectedItem.Text.ToString().Equals("--Select--"))
        {
            gvtransaction.DataSource = null; gvtransaction.DataBind(); Label2.Visible = false;
        }
        else
        {
            string storeid = dropdownstore.SelectedItem.Text.ToString();
            Label2.Visible = true;
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand("select transid as Transaction_Id,date as Date,department as Department,numitems as Items,saleamt as Sale_Amount from querytable where storeid='"+ storeid +"'", con);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            gvtransaction.DataSource = ds;
            gvtransaction.DataBind();
        }
    }
}