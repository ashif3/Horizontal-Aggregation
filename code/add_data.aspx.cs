/*
 *    PROJECT/admin/add-transaction.aspx.cs
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

public partial class add_data : System.Web.UI.Page
{
    public static string constring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    public static SqlConnection con = new SqlConnection(constring);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] == "NotAvailable")
        {
            Response.Redirect("log-in.aspx");
        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string storeid = Session["User"].ToString();
        int numitem = Int32.Parse(txtnumitems.Text);
        double saleamount = Convert.ToDouble(saleamt.Text);
        string caldate = txtdate.Text;
        string[] splitdate = caldate.Split('/');
        string[] montharr = { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" };
        int kk = Int32.Parse(splitdate[1]);
        string month = montharr[kk-1];
        labelresult.Text = "";
        try
        {
            SqlCommand cmd = new SqlCommand("insert into querytable (storeid, transid, day, month, year, date, weekday, department, numitems, saleamt, custname, contnum, pincode) values ('" + storeid + "', '" + transactionid.Text + "', '" + splitdate[0] + "', '" + month + "', '" + splitdate[2] + "', '" + caldate + "', '" + dropdownday.SelectedItem.Text + "', '" + dropdowndept.SelectedItem.Text + "', '" + numitem + "', '" + saleamount + "', '" + custname.Text + "', '" + txtmobile.Text + "', '" + txtpin.Text + "')", con);
            if (con.State == ConnectionState.Closed)
                con.Open();
            
            if (con.State == ConnectionState.Open)
                cmd.ExecuteNonQuery();
            
            if (con.State == ConnectionState.Open)
                con.Close();
            
            labelresult.ForeColor = System.Drawing.Color.Green;
            labelresult.Text = "Successfully Added";

        }
        catch (Exception ex)
        {
            labelresult.ForeColor = System.Drawing.Color.Red;
            labelresult.Text = "Some Error Occured Try Again";
        }

    }
}