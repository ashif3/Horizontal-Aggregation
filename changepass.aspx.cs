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
public partial class changepass : System.Web.UI.Page
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
    public static bool iscorrectpass(string storeid, string pass)
    {
        bool chk = false;
        SqlCommand cmd = new SqlCommand("select password from store where storeid='" + storeid + "'", con);
        if (con.State == ConnectionState.Closed)
            con.Open();
        
        if (con.State == ConnectionState.Open)
        {
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                if (pass == dr["password"].ToString().Trim())
                    chk = true;
            }
            dr.Close();
        }
        if (con.State == ConnectionState.Open) con.Close();
        return chk;
    }

    public static bool changepassword(string storeid, string password)
    {
        bool ret = false;
        SqlCommand cmd = new SqlCommand("update store set password='"+ password +"' where storeid='" + storeid + "'", con);
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        if (con.State == ConnectionState.Open)
        {
            try
            {
                cmd.ExecuteNonQuery();
                ret = true;
            }
            catch(Exception e)
            {
                ret = false;
            }
        }
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        return ret;
    }

    protected void buttonchangepass_Click(object sender, EventArgs e)
    {
        if (textnewpass.Text == textreppass.Text)
        {
            string storeid = Session["User"].ToString();
            if (iscorrectpass(storeid, textcurrpass.Text))
            {
                if (changepassword(storeid, textnewpass.Text))
                {
                    labelresult.ForeColor = System.Drawing.Color.Green;
                    labelresult.Text = "Password Successfully Changed..";
                }
                else
                {
                    labelresult.ForeColor = System.Drawing.Color.Red;
                    labelresult.Text = "Some Error Has been Occured..";
                }
            }
            else
            {
                labelresult.ForeColor = System.Drawing.Color.Red;
                labelresult.Text = "Current Password is Not Correct";
            }
        }
        else
        {
            labelresult.ForeColor = System.Drawing.Color.Red;
            labelresult.Text = "Password and Retype Password must be same";
        }
    }
}