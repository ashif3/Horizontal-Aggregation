/*
 * PROJECT/admin/horizontal-view.aspx.cs
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

public partial class admin_horizontal_view : System.Web.UI.Page
{
    public static string constring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    public static SqlConnection con = new SqlConnection(constring);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminUser"] == "NotAvailable")
        {
            Response.Redirect("adminlogin.aspx");
        }
        Label3.Text = "0 ms"; btnexcel.Visible = false;
    }
    protected void btnSpj_Click(object sender, EventArgs e)
    {
        btnexcel.Visible = true;
        var watch = System.Diagnostics.Stopwatch.StartNew();
        string transcolumnval = DropDownList1.SelectedValue.ToString();
        string aggcolumnval = DropDownList2.SelectedValue.ToString();
        DataSet ds = new DataSet();
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        SqlCommand cmd = new SqlCommand("select v_day_num_fv.storeid, Monday,Tuesday, Wednesday,Thursday, Friday, Saturday, Sunday, Total_Items from v_day_num_fv,v_total_number where v_day_num_fv.storeid=v_total_number.storeid;", con);
        if (checkFv.Checked)
        {
            if (transcolumnval == "day" && aggcolumnval == "numitems")
            {
                cmd = new SqlCommand("select v_day_num_fv.storeid, Monday,Tuesday, Wednesday,Thursday, Friday, Saturday, Sunday, Total_Items from v_day_num_fv,v_total_number where v_day_num_fv.storeid=v_total_number.storeid;", con);
            }
            else if (transcolumnval == "month" && aggcolumnval == "numitems")
            {
                cmd = new SqlCommand("select spj_month_num_fv.storeid, Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec, Total_Items from spj_month_num_fv,v_total_number where spj_month_num_fv.storeid=v_total_number.storeid order by spj_month_num_fv.storeid;", con);
            }
            else if (transcolumnval == "department" && aggcolumnval == "numitems")
            {
                cmd = new SqlCommand("select spj_department_num_fv.storeid, Electronics, Books, Clothing, Home_Appliances, Cosmetics, Food, Gardening, Sports, Paint, Movie_Games, Hardware, Jewelry, Baby_Toys, Health_Gourmet, Total_Items from spj_department_num_fv,v_total_number where spj_department_num_fv.storeid=v_total_number.storeid order by spj_department_num_fv.storeid;", con);
            }
            if (transcolumnval == "day" && aggcolumnval == "saleamt")
            {
                cmd = new SqlCommand("select v_day_sale_fv.storeid, Monday,Tuesday, Wednesday,Thursday, Friday, Saturday, Sunday, Total_Amount from v_day_sale_fv,v_total_sale_amt where v_day_sale_fv.storeid=v_total_sale_amt.storeid;", con);
            }
            else if (transcolumnval == "month" && aggcolumnval == "saleamt")
            {
                cmd = new SqlCommand("select v_month_sale_fv.storeid, Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec, Total_Amount from v_month_sale_fv,v_total_sale_amt where v_month_sale_fv.storeid=v_total_sale_amt.storeid;", con);
            }
            else if (transcolumnval == "department" && aggcolumnval == "saleamt")
            {
                cmd = new SqlCommand("select v_department_sale_fv.storeid, Electronics, Books, Clothing, Home_Appliances, Cosmetics, Food, Gardening, Sports, Paint, Movie_Games, Hardware, Jewelry, Baby_Toys, Health_Gourmet, Total_Amount from v_department_sale_fv,v_total_sale_amt where v_department_sale_fv.storeid=v_total_sale_amt.storeid;", con);
            }
        }
        else
        {
            if (transcolumnval == "day" && aggcolumnval == "numitems")
            {
                cmd = new SqlCommand("select spj_day_num.storeid, Monday,Tuesday, Wednesday,Thursday, Friday, Saturday, Sunday, Total_Items from spj_day_num,v_total_number where spj_day_num.storeid=v_total_number.storeid order by spj_day_num.storeid;", con);
            }
            else if (transcolumnval == "month" && aggcolumnval == "numitems")
            {
                cmd = new SqlCommand("select spj_month_num.storeid, Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec, Total_Items from spj_month_num,v_total_number where spj_month_num.storeid=v_total_number.storeid order by spj_month_num.storeid;", con);
            }
            else if (transcolumnval == "department" && aggcolumnval == "numitems")
            {
                cmd = new SqlCommand("select spj_department_num.storeid, Electronics, Books, Clothing, Home_Appliances, Cosmetics, Food, Gardening, Sports, Paint, Movie_Games, Hardware, Jewelry, Baby_Toys, Health_Gourmet, Total_Items from spj_department_num,v_total_number where spj_department_num.storeid=v_total_number.storeid order by spj_department_num.storeid;", con);

            }
            if (transcolumnval == "day" && aggcolumnval == "saleamt")
            {
                cmd = new SqlCommand("select spj_day_sale.storeid, Monday,Tuesday, Wednesday,Thursday, Friday, Saturday, Sunday, Total_Amount from spj_day_sale,v_total_sale_amt where spj_day_sale.storeid=v_total_sale_amt.storeid order by spj_day_sale.storeid;", con);
            }
            else if (transcolumnval == "month" && aggcolumnval == "saleamt")
            {
                cmd = new SqlCommand("select spj_month_sale.storeid, Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec, Total_Amount from spj_month_sale,v_total_sale_amt where spj_month_sale.storeid=v_total_sale_amt.storeid order by spj_month_sale.storeid;", con);
            }
            else if (transcolumnval == "department" && aggcolumnval == "saleamt")
            {
                cmd = new SqlCommand("select spj_department_sale.storeid, Electronics, Books, Clothing, Home_Appliances, Cosmetics, Food, Gardening, Sports, Paint, Movie_Games, Hardware, Jewelry, Baby_Toys, Health_Gourmet, Total_Amount from spj_department_sale,v_total_sale_amt where spj_department_sale.storeid=v_total_sale_amt.storeid order by spj_department_sale.storeid;", con);
            }
        }
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        gridhorizontal.DataSource = ds;
        gridhorizontal.DataBind();
        watch.Stop();
        var elapsedMs = watch.ElapsedMilliseconds;
        Label3.Text = elapsedMs.ToString() + " ms";
        
    }
    protected void btnCase_Click(object sender, EventArgs e)
    {
        btnexcel.Visible = true;
        var watch = System.Diagnostics.Stopwatch.StartNew();
        string transcolumnval = DropDownList1.SelectedValue.ToString();
        string aggcolumnval = DropDownList2.SelectedValue.ToString();
        DataSet ds = new DataSet();
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        SqlCommand cmd = new SqlCommand("select v_day_num_fv.storeid, Monday,Tuesday, Wednesday,Thursday, Friday, Saturday, Sunday, Total_Items from v_day_num_fv,v_total_number where v_day_num_fv.storeid=v_total_number.storeid;", con);
        if (checkFv.Checked)
        {
            if (transcolumnval == "day" && aggcolumnval == "numitems")
            {
                cmd = new SqlCommand("select case_day_num_fv.storeid, Monday,Tuesday, Wednesday,Thursday, Friday, Saturday, Sunday, Total_Items from case_day_num_fv,v_total_number where case_day_num_fv.storeid=v_total_number.storeid order by case_day_num_fv.storeid;", con);
            }
            else if (transcolumnval == "month" && aggcolumnval == "numitems")
            {
                cmd = new SqlCommand("select case_month_num_fv.storeid, Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec, Total_Items from case_month_num_fv,v_total_number where case_month_num_fv.storeid=v_total_number.storeid order by case_month_num_fv.storeid;", con);
            }
            else if (transcolumnval == "department" && aggcolumnval == "numitems")
            {
                cmd = new SqlCommand("select case_department_num_fv.storeid, Electronics, Books, Clothing, Home_Appliances, Cosmetics, Food, Gardening, Sports, Paint, Movie_Games, Hardware, Jewelry, Baby_Toys, Health_Gourmet, Total_Items from case_department_num_fv,v_total_number where case_department_num_fv.storeid=v_total_number.storeid order by case_department_num_fv.storeid;", con);
            }
            if (transcolumnval == "day" && aggcolumnval == "saleamt")
            {
                cmd = new SqlCommand("select case_day_sale_fv.storeid, Monday,Tuesday, Wednesday,Thursday, Friday, Saturday, Sunday, Total_Amount from case_day_sale_fv,v_total_sale_amt where case_day_sale_fv.storeid=v_total_sale_amt.storeid order by case_day_sale_fv.storeid;", con);
            }
            else if (transcolumnval == "month" && aggcolumnval == "saleamt")
            {
                cmd = new SqlCommand("select case_month_sale_fv.storeid, Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec, Total_Amount from case_month_sale_fv,v_total_sale_amt where case_month_sale_fv.storeid=v_total_sale_amt.storeid order by case_month_sale_fv.storeid;", con);
            }
            else if (transcolumnval == "department" && aggcolumnval == "saleamt")
            {
                cmd = new SqlCommand("select case_department_sale_fv.storeid, Electronics, Books, Clothing, Home_Appliances, Cosmetics, Food, Gardening, Sports, Paint, Movie_Games, Hardware, Jewelry, Baby_Toys, Health_Gourmet, Total_Amount from case_department_sale_fv,v_total_sale_amt where case_department_sale_fv.storeid=v_total_sale_amt.storeid order by case_department_sale_fv.storeid;", con);
            }
        }
        else
        {
            if (transcolumnval == "day" && aggcolumnval == "numitems")
            {
                cmd = new SqlCommand("select case_day_num.storeid, Monday,Tuesday, Wednesday,Thursday, Friday, Saturday, Sunday, Total_Items from case_day_num,v_total_number where case_day_num.storeid=v_total_number.storeid order by case_day_num.storeid", con);
            }
            else if (transcolumnval == "month" && aggcolumnval == "numitems")
            {
                cmd = new SqlCommand("select case_month_num.storeid, Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec, Total_Items from case_month_num,v_total_number where case_month_num.storeid=v_total_number.storeid order by case_month_num.storeid;", con);
            }
            else if (transcolumnval == "department" && aggcolumnval == "numitems")
            {
                cmd = new SqlCommand("select case_department_num.storeid, Electronics, Books, Clothing, Home_Appliances, Cosmetics, Food, Gardening, Sports, Paint, Movie_Games, Hardware, Jewelry, Baby_Toys, Health_Gourmet, Total_Items from case_department_num,v_total_number where case_department_num.storeid=v_total_number.storeid order by case_department_num.storeid;", con);
            }
            if (transcolumnval == "day" && aggcolumnval == "saleamt")
            {
                cmd = new SqlCommand("select case_day_sale.storeid, Monday,Tuesday, Wednesday,Thursday, Friday, Saturday, Sunday, Total_Amount from case_day_sale,v_total_sale_amt where case_day_sale.storeid=v_total_sale_amt.storeid order by case_day_sale.storeid;", con);
            }
            else if (transcolumnval == "month" && aggcolumnval == "saleamt")
            {
                cmd = new SqlCommand("select case_month_sale.storeid, Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec, Total_Amount from case_month_sale,v_total_sale_amt where case_month_sale.storeid=v_total_sale_amt.storeid order by case_month_sale.storeid;", con);
            }
            else if (transcolumnval == "department" && aggcolumnval == "saleamt")
            {
                cmd = new SqlCommand("select case_department_sale.storeid, Electronics, Books, Clothing, Home_Appliances, Cosmetics, Food, Gardening, Sports, Paint, Movie_Games, Hardware, Jewelry, Baby_Toys, Health_Gourmet, Total_Amount from case_department_sale,v_total_sale_amt where case_department_sale.storeid=v_total_sale_amt.storeid order by case_department_sale.storeid;", con);
            }
        }
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        gridhorizontal.DataSource = ds;
        gridhorizontal.DataBind();
        watch.Stop();
        var elapsedMs = watch.ElapsedMilliseconds;
        Label3.Text = elapsedMs.ToString()+" ms";
        
    }
    protected void btnPivot_Click(object sender, EventArgs e)
    {
        btnexcel.Visible = true;
        var watch = System.Diagnostics.Stopwatch.StartNew();
        string transcolumnval = DropDownList1.SelectedValue.ToString();
        string aggcolumnval = DropDownList2.SelectedValue.ToString();
        DataSet ds = new DataSet();
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        SqlCommand cmd = new SqlCommand("select v_day_num_fv.storeid, Monday,Tuesday, Wednesday,Thursday, Friday, Saturday, Sunday, Total_Items from v_day_num_fv,v_total_number where v_day_num_fv.storeid=v_total_number.storeid;", con);
        if (checkFv.Checked)
        {
            if (transcolumnval == "day" && aggcolumnval == "numitems")
            {
                cmd = new SqlCommand("select v_day_num_fv.storeid, Monday,Tuesday, Wednesday,Thursday, Friday, Saturday, Sunday, Total_Items from v_day_num_fv,v_total_number where v_day_num_fv.storeid=v_total_number.storeid;", con);
            }
            else if (transcolumnval == "month" && aggcolumnval == "numitems")
            {
                cmd = new SqlCommand("select v_month_num_fv.storeid, Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec, Total_Items from v_month_num_fv,v_total_number where v_month_num_fv.storeid=v_total_number.storeid;", con);
            }
            else if (transcolumnval == "department" && aggcolumnval == "numitems")
            {
                cmd = new SqlCommand("select v_department_num_fv.storeid, Electronics, Books, Clothing, Home_Appliances, Cosmetics, Food, Gardening, Sports, Paint, Movie_Games, Hardware, Jewelry, Baby_Toys, Health_Gourmet, Total_Items from v_department_num_fv,v_total_number where v_department_num_fv.storeid=v_total_number.storeid;", con);
            }
            if (transcolumnval == "day" && aggcolumnval == "saleamt")
            {
                cmd = new SqlCommand("select v_day_sale_fv.storeid, Monday,Tuesday, Wednesday,Thursday, Friday, Saturday, Sunday, Total_Amount from v_day_sale_fv,v_total_sale_amt where v_day_sale_fv.storeid=v_total_sale_amt.storeid;", con);
            }
            else if (transcolumnval == "month" && aggcolumnval == "saleamt")
            {
                cmd = new SqlCommand("select v_month_sale_fv.storeid, Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec, Total_Amount from v_month_sale_fv,v_total_sale_amt where v_month_sale_fv.storeid=v_total_sale_amt.storeid;", con);
            }
            else if (transcolumnval == "department" && aggcolumnval == "saleamt")
            {
                cmd = new SqlCommand("select v_department_sale_fv.storeid, Electronics, Books, Clothing, Home_Appliances, Cosmetics, Food, Gardening, Sports, Paint, Movie_Games, Hardware, Jewelry, Baby_Toys, Health_Gourmet, Total_Amount from v_department_sale_fv,v_total_sale_amt where v_department_sale_fv.storeid=v_total_sale_amt.storeid;", con);
            }
        }
        else
        {
            if (transcolumnval == "day" && aggcolumnval == "numitems")
            {
                cmd = new SqlCommand("select v_day_num.storeid, Monday,Tuesday, Wednesday,Thursday, Friday, Saturday, Sunday, Total_Items from v_day_num,v_total_number where v_day_num.storeid=v_total_number.storeid;", con);
            }
            else if (transcolumnval == "month" && aggcolumnval == "numitems")
            {
                cmd = new SqlCommand("select v_month_num.storeid, Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec, Total_Items from v_month_num,v_total_number where v_month_num.storeid=v_total_number.storeid;", con);
            }
            else if (transcolumnval == "department" && aggcolumnval == "numitems")
            {
                cmd = new SqlCommand("select v_department_num.storeid, Electronics, Books, Clothing, Home_Appliances, Cosmetics, Food, Gardening, Sports, Paint, Movie_Games, Hardware, Jewelry, Baby_Toys, Health_Gourmet, Total_Items from v_department_num,v_total_number where v_department_num.storeid=v_total_number.storeid;", con);
            }
            if (transcolumnval == "day" && aggcolumnval == "saleamt")
            {
                cmd = new SqlCommand("select v_day_sale.storeid, Monday,Tuesday, Wednesday,Thursday, Friday, Saturday, Sunday, Total_Amount from v_day_sale,v_total_sale_amt where v_day_sale.storeid=v_total_sale_amt.storeid;", con);
            }
            else if (transcolumnval == "month" && aggcolumnval == "saleamt")
            {
                cmd = new SqlCommand("select v_month_sale.storeid, Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec, Total_Amount from v_month_sale,v_total_sale_amt where v_month_sale.storeid=v_total_sale_amt.storeid;", con);
            }
            else if (transcolumnval == "department" && aggcolumnval == "saleamt")
            {
                cmd = new SqlCommand("select v_department_sale.storeid, Electronics, Books, Clothing, Home_Appliances, Cosmetics, Food, Gardening, Sports, Paint, Movie_Games, Hardware, Jewelry, Baby_Toys, Health_Gourmet, Total_Amount from v_department_sale,v_total_sale_amt where v_department_sale.storeid=v_total_sale_amt.storeid;", con);
            }
        }
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        gridhorizontal.DataSource = ds;
        gridhorizontal.DataBind();
        watch.Stop();
        var elapsedMs = watch.ElapsedMilliseconds;
        Label3.Text = elapsedMs.ToString() + " ms";
        
    }
    protected void btnexcel_Click(object sender, EventArgs e)
    {
        Response.ClearContent();
        Response.AppendHeader("content-disposition", "attachment; filename=storedata.xls");
        Response.ContentType = "application/excel";

        StringWriter stringWriter = new StringWriter();
        HtmlTextWriter htmlTextWriter = new HtmlTextWriter(stringWriter);

        gridhorizontal.RenderControl(htmlTextWriter);
        Response.Write(stringWriter.ToString());
        Response.End();
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        
    }
}