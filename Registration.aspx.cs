using System;
using System.Collections.Generic;
using System.Linq;
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
using System.Drawing;
using System.Web.Mail;

public partial class Registration : System.Web.UI.Page
{
    public static string constring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    public static SqlConnection con = new SqlConnection(constring);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void submit_Click(object sender, EventArgs e)
    {
        if (txtpass.Text == txtrepass.Text)
        {
            Label1.Text = "";
            if (checkid(storeid.Text) == 0)
            {
                if (checkemail(txtemail.Text) == 0)
                {
                    if (photoupload.HasFile)
                    {
                        try
                        {
                            string strname = photoupload.FileName.ToString();
                            photoupload.PostedFile.SaveAs(Server.MapPath("~/photoid/") + strname);
                            SqlCommand cmd = new SqlCommand("insert into store (storeid, sname, email, mobile, password, address, city, state, zipcode, photoid) values ('" + storeid.Text + "', '" + storename.Text + "', '" + txtemail.Text + "', '" + txtmob.Text + "', '" + txtpass.Text + "', '" + txtaddress.Text + "', '" + city.Text + "', '" + state.Text + "', '" + zipcode.Text + "' , '" + strname + "')", con);
                            if (con.State == ConnectionState.Closed)
                            {
                                con.Open();
                            }
                            if (con.State == ConnectionState.Open)
                            {
                                cmd.ExecuteNonQuery();
                            }
                            if (con.State == ConnectionState.Open)
                            {
                                con.Close();
                            }

                            Response.Redirect("log-in.aspx?q=success");
                        }
                        catch (Exception ex)
                        {
                            Label1.ForeColor = System.Drawing.Color.Red;
                            Label1.Text = "Some Error Occured Try Again";
                        }
                    }
                    else
                    {
                        Label1.ForeColor = System.Drawing.Color.Red;
                        Label1.Text = "Please Upload The Photo Id Proof";
                    }

                }
                else
                {
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Text = "Email already registered";
                }
            }
            else
            {
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "Id already Registered";
            }
        }
        else
        {
            Label1.ForeColor = System.Drawing.Color.Red;
            Label1.Text = "Password and Retype Password must be same";
        }
    }
    public static int checkid(string r)
    {
        int chk = 0;
        SqlCommand cmd = new SqlCommand("select storeid from store", con);
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        if (con.State == ConnectionState.Open)
        {
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                if (r == dr["storeid"].ToString().Trim())
                    chk = 1;
            }
            dr.Close();
        }
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        return chk;
    }
    public static int checkemail(string r)
    {
        int chk = 0;
        SqlCommand cmd = new SqlCommand("select email from store", con);
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        if (con.State == ConnectionState.Open)
        {
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                if (r == dr["email"].ToString().Trim())
                    chk = 1;
            }
            dr.Close();
        }
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        return chk;
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("log-in.aspx");
    }
}
