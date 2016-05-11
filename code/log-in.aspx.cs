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

public partial class log_in : System.Web.UI.Page
{
    public static string constring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    public static SqlConnection con = new SqlConnection(constring);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] != "NotAvailable")
        {
            Response.Redirect("storemain.aspx");
        }
    }
    private Boolean CheckUser(string storeid)
    {
        SqlParameter p1, p2;
        SqlCommand cmd = new SqlCommand("select storeid from store where storeid=@storeid", con);
        p1 = new SqlParameter();
        p1.ParameterName = "@storeid"; p1.Value = storeid; p1.SqlDbType = SqlDbType.VarChar;
        p1.Size = 50; p1.Direction = ParameterDirection.InputOutput;
        cmd.Parameters.Add(p1);
        string str = "";
        try
        {
            if (cmd.Connection.State != ConnectionState.Open)
            {
                cmd.Connection.Open();
            }
            str = cmd.ExecuteScalar().ToString();

        }
        catch (Exception ex)
        {
            return false;
        }
        finally
        {
            if (cmd.Connection.State != ConnectionState.Closed)
            {
                cmd.Connection.Close();
            }
        }
        if (str != "") return true;
        else return false;
    }
    public string CheckAuthentication(string storeid, string Password)
    {
        if (CheckUser(storeid))
        {
            SqlParameter p1, p2;
            SqlCommand cmd = new SqlCommand("select storeid, password from store where storeid=@storeid AND password=@password", con);

            p1 = new SqlParameter();
            p1.ParameterName = "@storeid"; p1.Value = storeid;
            p1.SqlDbType = SqlDbType.VarChar; p1.Size = 50;
            p1.Direction = ParameterDirection.InputOutput;
            cmd.Parameters.Add(p1);

            p2 = new SqlParameter();
            p2.ParameterName = "@password"; p2.Value = Password;
            p2.SqlDbType = SqlDbType.VarChar; p2.Size = 50;
            p2.Direction = ParameterDirection.InputOutput;
            cmd.Parameters.Add(p2);

            DataTable dt = new DataTable();
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
                string sUser = dt.Rows[0]["storeid"].ToString();
                return sUser;
            }
            else
            {
                return "Fail";
            }
        }
        else
        {
            return "Fail";
        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string strUserName = txtUserName.Text;
        string strPassword = txtPassword.Text;
        string sResult = CheckAuthentication(strUserName, strPassword);
        if (sResult == "Fail")
        {
            lblError.Text = "<li>Either UserName or Password is incorrect!</li>";
        }
        else
        {
            Session["User"] = sResult;
            Response.Redirect("storemain.aspx");
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}