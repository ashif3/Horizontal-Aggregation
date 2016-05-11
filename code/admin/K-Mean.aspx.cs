/*
 * PROJECT/admin/K-Mean.aspx.cs
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

public partial class admin_K_Mean : System.Web.UI.Page
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
    }
    protected void btnMain_Click(object sender, EventArgs e)
    {
        int k = Convert.ToInt32(txtK.Text.ToString());
        SqlCommand cmd = new SqlCommand("select * from v_department_num_fv;", con);
        DataTable dt = new DataTable();
        if (cmd.Connection.State != ConnectionState.Open)
        {
            cmd.Connection.Open();
        }
        SqlDataReader reader = cmd.ExecuteReader();
        dt.Load(reader);
        if (cmd.Connection.State != ConnectionState.Closed)
        {
            cmd.Connection.Close();
        }
        Label2.Visible = true;
        string[] store= new string[dt.Rows.Count];
        int[] clusternumber = new int[dt.Rows.Count];
        double[,] points = new double[dt.Rows.Count, 14];
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            store[i] = dt.Rows[i]["storeid"].ToString();
            if (dt.Rows[i]["Electronics"].ToString() == "") points[i, 0] = 0.0;
            else points[i, 0] = Convert.ToDouble(dt.Rows[i]["Electronics"].ToString());

            if (dt.Rows[i]["Books"].ToString() == "") points[i, 1] = 0.0;
            else points[i, 1] = Convert.ToDouble(dt.Rows[i]["Books"].ToString());

            if (dt.Rows[i]["Clothing"].ToString() == "") points[i, 2] = 0.0;
            else points[i, 2] = Convert.ToDouble(dt.Rows[i]["Clothing"].ToString());

            if (dt.Rows[i]["Home_Appliances"].ToString() == "") points[i, 3] = 0.0;
            else points[i, 3] = Convert.ToDouble(dt.Rows[i]["Home_Appliances"].ToString());

            if (dt.Rows[i]["Cosmetics"].ToString() == "") points[i, 4] = 0.0;
            else points[i, 4] = Convert.ToDouble(dt.Rows[i]["Cosmetics"].ToString());

            if (dt.Rows[i]["Food"].ToString() == "") points[i, 5] = 0.0;
            else points[i, 5] = Convert.ToDouble(dt.Rows[i]["Food"].ToString());

            if (dt.Rows[i]["Gardening"].ToString() == "") points[i, 6] = 0.0;
            else points[i, 6] = Convert.ToDouble(dt.Rows[i]["Gardening"].ToString());

            if (dt.Rows[i]["Sports"].ToString() == "") points[i, 7] = 0.0;
            else points[i, 7] = Convert.ToDouble(dt.Rows[i]["Sports"].ToString());

            if (dt.Rows[i]["Paint"].ToString() == "") points[i, 8] = 0.0;
            else points[i, 8] = Convert.ToDouble(dt.Rows[i]["Paint"].ToString());

            if (dt.Rows[i]["Movie_Games"].ToString() == "") points[i, 9] = 0.0;
            else points[i, 9] = Convert.ToDouble(dt.Rows[i]["Movie_Games"].ToString());

            if (dt.Rows[i]["Hardware"].ToString() == "") points[i, 10] = 0.0;
            else points[i, 10] = Convert.ToDouble(dt.Rows[i]["Hardware"].ToString());

            if (dt.Rows[i]["Jewelry"].ToString() == "") points[i, 11] = 0.0;
            else points[i, 11] = Convert.ToDouble(dt.Rows[i]["Jewelry"].ToString());

            if (dt.Rows[i]["Baby_Toys"].ToString() == "") points[i, 12] = 0.0;
            else points[i, 12] = Convert.ToDouble(dt.Rows[i]["Baby_Toys"].ToString());

            if (dt.Rows[i]["Health_Gourmet"].ToString() == "") points[i, 13] = 0.0;
            else points[i, 13] = Convert.ToDouble(dt.Rows[i]["Health_Gourmet"].ToString());
        }

        double[,] clusters = new double[k,14];

        for (int i = 0; i < k; i++)
        {
            for (int j = 0; j < 14; j++)
            {
                clusters[i, j] = points[i, j];
            }
        }

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            if (i < k) clusternumber[i] = i;
            else
            {
                clusternumber[i] = 0; double distance = 0;
                for (int j = 0; j < 14; j++)
                {
                    distance += Math.Abs(points[i,j]-clusters[0,j]);
                }
                for (int j = 1; j < k; j++)
                {
                    double distance1 = 0;
                    for (int w = 0; w < 14; w++)
                    {
                        distance1 += Math.Abs(points[i, w] - clusters[j, w]);
                    }
                    if (distance1 <= distance)
                    {
                        clusternumber[i] = j; distance = distance1;
                    }
                }
            }
        }

        while (1>0)
        {
            int flag = 0;
            for (int i = 0; i < k; i++)
            {
                for (int j = 0; j < 14; j++)
                {
                    clusters[i, j] = 0;
                }
            }
            int[] count = new int[k]; for (int p = 0; p < k; p++) count[p] = 0;
            for (int i = 0; i < clusternumber.Length; i++)
            {
                int currentcluster = clusternumber[i];
                count[currentcluster] += 1;
                for (int j = 0; j < 14; j++)
                {
                    clusters[currentcluster, j] += points[i, j];
                }

            }
            for (int i = 0; i < k; i++)
            {
                int cnt = count[i];
                if (cnt > 0)
                {
                    for (int j = 0; j < 14; j++)
                    {
                        clusters[i, j] /= cnt;
                    }
                }
            }
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                int currentcluster = clusternumber[i];
                double distance = 0;
                for (int j = 0; j < 14; j++)
                {
                    distance += Math.Abs(points[i, j] - clusters[currentcluster, j]);
                }

                for (int j = 0; j < k; j++)
                {
                    double distance1 = 0;
                    for (int w = 0; w < 14; w++)
                    {
                        distance1 += Math.Abs(points[i, w] - clusters[j, w]);
                    }
                    if (distance1 < distance)
                    {
                        flag = 1;
                        clusternumber[i] = j;
                        distance = distance1;
                    }
                }
            }
            if (flag == 0) break;
        
        }

        DataTable dtcluster = new DataTable();
        dtcluster.Columns.Add("Cluster_Number"); dtcluster.Columns.Add("Electronics");
        dtcluster.Columns.Add("Books"); dtcluster.Columns.Add("Clothing");
        dtcluster.Columns.Add("Home_Appliances"); dtcluster.Columns.Add("Cosmetics");
        dtcluster.Columns.Add("Food"); dtcluster.Columns.Add("Gardening");
        dtcluster.Columns.Add("Sports"); dtcluster.Columns.Add("Paint");
        dtcluster.Columns.Add("Movie_Games"); dtcluster.Columns.Add("Hardware");
        dtcluster.Columns.Add("Jewelry"); dtcluster.Columns.Add("Baby_Toys"); dtcluster.Columns.Add("Health_Gourmet");
        for (int i = 0; i < k; i++)
        {
            dtcluster.Rows.Add();
            dtcluster.Rows[i]["Cluster_Number"] = (i+1).ToString();
            dtcluster.Rows[i]["Electronics"] = Convert.ToInt32(clusters[i, 0]).ToString();
            dtcluster.Rows[i]["Books"] = Convert.ToInt32(clusters[i, 1]).ToString();
            dtcluster.Rows[i]["Clothing"] = Convert.ToInt32(clusters[i, 2]).ToString();
            dtcluster.Rows[i]["Home_Appliances"] = Convert.ToInt32(clusters[i, 3]).ToString();
            dtcluster.Rows[i]["Cosmetics"] = Convert.ToInt32(clusters[i, 4]).ToString();
            dtcluster.Rows[i]["Food"] = Convert.ToInt32(clusters[i, 5]).ToString();
            dtcluster.Rows[i]["Gardening"] = Convert.ToInt32(clusters[i, 6]).ToString();
            dtcluster.Rows[i]["Sports"] = Convert.ToInt32(clusters[i, 7]).ToString();
            dtcluster.Rows[i]["Paint"] = Convert.ToInt32(clusters[i, 8]).ToString();
            dtcluster.Rows[i]["Movie_Games"] = Convert.ToInt32(clusters[i, 9]).ToString();
            dtcluster.Rows[i]["Hardware"] = Convert.ToInt32(clusters[i, 10]).ToString();
            dtcluster.Rows[i]["Jewelry"] = Convert.ToInt32(clusters[i, 11]).ToString();
            dtcluster.Rows[i]["Baby_Toys"] = Convert.ToInt32(clusters[i, 12]).ToString();
            dtcluster.Rows[i]["Health_Gourmet"] = Convert.ToInt32(clusters[i, 13]).ToString();
        }
        gvclusters.DataSource = dtcluster;
        gvclusters.DataBind();

        string[,] storecluster = new string[k, 3];
        for (int i = 0; i < k; i++)
        {
            storecluster[i, 0] = (i + 1).ToString();
            storecluster[i, 1] = ""; storecluster[i, 2] = "";
        }
        int[] countstore = new int[k]; for (int i = 0; i < k; i++) countstore[i] = 0;
        for (int i = 0; i < clusternumber.Length; i++)
        {
            int num = clusternumber[i]; countstore[num] += 1;
            storecluster[num, 1] += store[i] + ", ";
        }
        for (int i = 0; i < k; i++)
        {
            storecluster[i, 2] = countstore[i].ToString();
        }

        DataTable dtstore = new DataTable();
        dtstore.Columns.Add("Cluster_Number"); dtstore.Columns.Add("Store_Id"); 
        dtstore.Columns.Add("Count");
        for (int i = 0; i < k; i++)
        {
            dtstore.Rows.Add();
            dtstore.Rows[i]["Cluster_Number"] = storecluster[i,0];
            dtstore.Rows[i]["Store_Id"] = storecluster[i, 1];
            dtstore.Rows[i]["Count"] = storecluster[i, 2];
        }

        gvstorecluster.DataSource = dtstore;
        gvstorecluster.DataBind();

    }
}