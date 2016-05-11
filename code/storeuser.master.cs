/*
 *    PROJECT/admin/storeuser.master.aspx.cs
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class storeuser : System.Web.UI.MasterPage
{
    public static string constring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    public static SqlConnection con = new SqlConnection(constring);
    public string getstorename(string storeid)
    {
        SqlParameter p1;
        SqlCommand cmd = new SqlCommand("select sname from store where storeid=@storeid", con);
        p1 = new SqlParameter(); p1.ParameterName = "@storeid"; p1.Value = storeid;
        p1.SqlDbType = SqlDbType.VarChar; p1.Size = 50; p1.Direction = ParameterDirection.InputOutput;
        cmd.Parameters.Add(p1); DataTable dt = new DataTable();
        try
        {
            if (cmd.Connection.State != ConnectionState.Open)
            {
                cmd.Connection.Open();
            }
            SqlDataReader reader = cmd.ExecuteReader();
            dt.Load(reader);
        }
        catch (Exception ex)
        {
            throw new Exception("Invalid Command !" + ex.Message);
        }
        finally
        {
            if (cmd.Connection.State != ConnectionState.Closed)
            {
                cmd.Connection.Close();
            }
        }
        if (dt.Rows.Count > 0)
        {
            string sUser = dt.Rows[0]["sname"].ToString();
            return sUser;
        }
        else return "Fail";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        string storeid = Session["User"].ToString();
        Label1.Text = "Welcome, "+getstorename(storeid);
    }
    protected void storelogout_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("logout.aspx");
    }
    protected void storehome_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("storehome.aspx");
    }
    protected void storechangepassword_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("changepass.aspx");
    }
    protected void storeprofile_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("storeprofile.aspx");
    }
    protected void addsell_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("add_data.aspx");
    }
    protected void details_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("executequery.aspx");
    }
}
