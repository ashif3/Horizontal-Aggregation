/*
 *    PROJECT/admin/execute-query.aspx.cs
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

public partial class executequery : System.Web.UI.Page
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
    protected void dropdowngroupby_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        if (dropdowngroupby.SelectedItem.Text.ToString() == "Month")
        {
            dropdownyear.Visible = true; Label3.Visible = true;
        }
        else
        {
            dropdownyear.Visible = false; Label3.Visible = false;
        }
    }
    protected void Button1_Click(object sender, System.EventArgs e)
    {
        string storeid = Session["User"].ToString();
        DataSet ds = new DataSet();
        con.Open(); SqlCommand cmd;
        if (dropdownyear.Visible == false)
        {
            if (dropdownaggregation.SelectedItem.Text.ToString() == "SUM" && dropdowngroupby.SelectedItem.Text.ToString() == "Year")
            {
                cmd = new SqlCommand("select year as Year, sum(numitems) as Total_Items, sum(saleamt) as Total_Sale_Amt from querytable where storeid='" + storeid + "' group by year", con);
            }
            else if (dropdownaggregation.SelectedItem.Text.ToString() == "Minimum" && dropdowngroupby.SelectedItem.Text.ToString() == "Year")
            {
                cmd = new SqlCommand("select year as Year, min(saleamt) as Minimum_Sale_Amt from querytable where storeid='" + storeid + "' group by year", con);
            }
            else if (dropdownaggregation.SelectedItem.Text.ToString() == "Maximum" && dropdowngroupby.SelectedItem.Text.ToString() == "Year")
            {
                cmd = new SqlCommand("select year as Year, max(saleamt) as Maximum_Sale_Amt from querytable where storeid='" + storeid + "' group by year", con);
            }
            else if (dropdownaggregation.SelectedItem.Text.ToString() == "Average" && dropdowngroupby.SelectedItem.Text.ToString() == "Year")
            {
                cmd = new SqlCommand("select year as Year, avg(saleamt) as Average_Sale_Amt from querytable where storeid='" + storeid + "' group by year", con);
            }
            else if (dropdownaggregation.SelectedItem.Text.ToString() == "SUM" && dropdowngroupby.SelectedItem.Text.ToString() == "Department")
            {
                cmd = new SqlCommand("select department as Department, sum(numitems) as Total_Items, sum(saleamt) as Total_Sale_Amt from querytable where storeid='" + storeid + "' group by department", con);
            }
            else if (dropdownaggregation.SelectedItem.Text.ToString() == "Minimum" && dropdowngroupby.SelectedItem.Text.ToString() == "Department")
            {
                cmd = new SqlCommand("select department as Department, min(saleamt) as Minimum_Sale_Amt from querytable where storeid='" + storeid + "' group by department", con);
            }
            else if (dropdownaggregation.SelectedItem.Text.ToString() == "Maximum" && dropdowngroupby.SelectedItem.Text.ToString() == "Department")
            {
                cmd = new SqlCommand("select department as Department, max(saleamt) as Maximum_Sale_Amt from querytable where storeid='" + storeid + "' group by department", con);
            }
            else
            {
                cmd = new SqlCommand("select department as Department, avg(saleamt) as Average_Sale_Amt from querytable where storeid='" + storeid + "' group by department", con);
            }

        }
        else
        {
            string year = dropdownyear.SelectedItem.Text.ToString();
            if (dropdownaggregation.SelectedItem.Text.ToString() == "SUM")
            {
                cmd = new SqlCommand("select month as Month, sum(numitems) as Total_Items, sum(saleamt) as Total_Sale_Amt from querytable where storeid='" + storeid + "' and year='" + year + "' group by month", con);
            }
            else if (dropdownaggregation.SelectedItem.Text.ToString() == "Minimum")
            {
                cmd = new SqlCommand("select month as Month, min(saleamt) as Minimum_Sale_Amt from querytable where storeid='" + storeid + "' and year='" + year + "' group by month", con);
            }
            else if (dropdownaggregation.SelectedItem.Text.ToString() == "Maximum")
            {
                cmd = new SqlCommand("select month as Month, max(saleamt) as Maximum_Sale_Amt from querytable where storeid='" + storeid + "' and year='" + year + "' group by month", con);
            }
            else
            {
                cmd = new SqlCommand("select month as Month, avg(saleamt) as Average_Sale_Amt from querytable where storeid='" + storeid + "' and year='" + year + "' group by month", con);
            }
        }
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con.Close();
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
}