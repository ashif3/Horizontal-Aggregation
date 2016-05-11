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

public partial class one_click_data : System.Web.UI.Page
{
    public static string constring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    public static SqlConnection con = new SqlConnection(constring);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    long LongRandom(long min, long max, Random rand)
    {
        long result = rand.Next((Int32)(min >> 32), (Int32)(max >> 32));
        result = (result << 32);
        result = result | (long)rand.Next((Int32)min, (Int32)max);
        return result;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Random rnd = new Random();
        string[] s1={"Zero","One","Two","Three","Four","Five","Six","Seven","Eight","Nine","Ten","Eleven","Twelve","Thirteen","Fourteen","Fifteen","Sixteen","Seventeen","Eighteen","Nineteen","Twenty"};
        string[] s2={"Twenty","Thirty","Forty","Fifty","Sixty","Seventy","Eighty","Ninety"};
        string[] cityarr = { "Mumbai", "Delhi", "Bangalore", "Hyderabad", "Patna", "Kolkata", "Surat", "Pune", "Jaipur", "Lucknow", "Kanpur", "Nagpur", "Indore", "Patna", "Agra", "Gaziabad", "Ranchi", "Allahabad", "Kota", "Mysore", "Noida" };
        string[] statearr = { "Maharastra", "Delhi", "Karnataka", "Telangana", "Bihar", "West Bengal", "Gujrat", "Maharashtra", "Rajasthan", "Uttar Pradesh", "Uttar Pradesh", "Maharashtra", "Madhya Pradesh", "Bihar", "Uttar Pradesh", "Uttar Pradesh", "Jharkhand", "Uttar Pradesh", "Rajasthan", "Karnataka", "Uttar Pradesh" };
        
        for (int i = 1; i <= 800; i++)
        {
            string storeid = "store"+i.ToString();
            string storename="mystore";
            if (i > 100)
            {
                int c = i % 10; int b = (i / 10) % 10; int a = (i / 100) % 10;
                storename = s1[a]+"-"+s1[b]+"-"+s1[c];
            }
            else if (i == 100)
            {
                storename = "Hundred";
            }
            
            else
            {
                if (i <= 20)
                {
                    storename = s1[i];
                }
                else if (i % 10 == 0)
                {
                    int p = i / 10;
                    storename = s2[p - 2];
                }
                else
                {
                    int p = i / 10; int k = i % 10;
                    storename = s2[p - 2] + "-" + s1[k];
                }
            }
            string email = "store"+i.ToString()+"@store.com";
            long r = LongRandom(9000000000, 9999999999, rnd);
            string mobile = r.ToString();
            string password = i.ToString() + "store";
            
            string zipcode = rnd.Next(100000,999999).ToString();
            int index=rnd.Next(0,21);
            string city = cityarr[index];
            string state= statearr[index];
            string address = storename + " store, Street No:" + i + ", City:" + city + ", State: " + state + ", India";
            SqlCommand cmd = new SqlCommand("insert into store (storeid, sname, email, mobile, password, address, city, state, zipcode) values ('" + storeid + "', '" + storename + "', '" + email + "', '" + mobile + "', '" + password + "', '" + address + "', '" + city + "', '" + state + "', '" + zipcode + "')", con);
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
        }
    }
    int dayofweek(int d, int m, int y)
    {
        int[] t = { 0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4 };
        if (m < 3)
        {
            y -= 1;
        }
        y -= 0;
        return ( y + y/4 - y/100 + y/400 + t[m-1] + d) % 7;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        int[] storeidarr=new int[801];
        for (int i=0; i<801; i++) storeidarr[i]=0;
        Random rnd = new Random();
        for (int i = 1; i <= 50000; i++)
        {
            int storeindex = rnd.Next(1, 801);
            string storeid = "store" + storeindex.ToString();
            int transsubid=storeidarr[storeindex]+1; storeidarr[storeindex]++;
            string transid = "transaction" + storeindex.ToString() + "_" + transsubid.ToString();
            int intday = rnd.Next(1, 29);  string day = intday.ToString();
            string[] montharr = { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" };
            int intmonth = rnd.Next(1, 13); string month = montharr[intmonth-1];
            int intyear = rnd.Next(2013, 2016); string year = intyear.ToString();
            string date = day + "/" + intmonth.ToString() + "/" + year;
            string[] weekdayarr = {  "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" };
            int intweekday = dayofweek(intday,intmonth,intyear);
            string weekday=weekdayarr[intweekday];
            string[] departmentarr = { "Electronics", "Books", "Clothing", "Home_Appliances", "Cosmetics", "Food", "Gardening", "Sports", "Paint", "Movie_Games", "Hardware", "Jewelry", "Baby_Toys", "Health_Gourmet" };
            int intdepartment = rnd.Next(0, 14);
            string department = departmentarr[intdepartment];
            int numitems = rnd.Next(1, 30);
            double saleamt = 1+rnd.NextDouble()*1999;
            string custname = "customer" + storeindex.ToString() + "_" + transsubid.ToString();
            long r = LongRandom(9000000000, 9999999999, rnd);
            string contnum = r.ToString();
            string pincode = rnd.Next(100000, 999999).ToString();
            SqlCommand cmd = new SqlCommand("insert into querytable (storeid, transid, day, month, year, date, weekday, department, numitems, saleamt, custname, contnum, pincode) values ('" + storeid + "', '" + transid + "', '" + day + "', '" + month + "', '" + year + "', '" + date + "', '" + weekday + "', '" + department + "', '" + numitems + "', '" + saleamt + "', '" + custname + "', '" + contnum + "', '" + pincode + "')", con);
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
            if (i == 15000) Label2.Text = contnum;

        
        }

    }
}