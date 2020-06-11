using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class HosdSerChangePwd : System.Web.UI.Page
{
    SqlConnection mssqlconn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    public string x;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] == null)
        {
            Response.Redirect("MainHome.aspx?err=Please_Login!");
        }
        else
        {
            Label1002.Text = Session["User"].ToString();
            mssqlconn.Open();
            string sql = "select * from staff_entry where psno='" + Session["User"] + "'";
            SqlCommand cmd = new SqlCommand(sql, mssqlconn);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read() == true)
            {
                Label1001.Text = dr[3].ToString();
                Label1003.Text = dr[8].ToString();
            }
            dr.Close();
            mssqlconn.Close();
            if (Label1003.Text == "Yes")
            {
                string ps = Session["User"].ToString();
                mssqlconn.Open();
                string sql1 = "select * from staff_entry where psno='" + Session["User"] + "'";
                SqlCommand cmd1 = new SqlCommand(sql1, mssqlconn);
                SqlDataReader dr1 = cmd1.ExecuteReader();
                if (dr1.Read() == true)
                {
                    TextBox1.Text = ps;
                }
                mssqlconn.Close();
            }
            else
            {
                Session.Abandon();
                Session["User"] = null;
                Session.Clear();
                Response.Redirect("MainHome.aspx?err=Please_Login!");
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        mssqlconn.Open();
        string sql = "select pwd from staff_entry where psno='" + TextBox1.Text + "' and pwd ='" + TextBox2.Text + "'";
        SqlCommand cmd = new SqlCommand(sql, mssqlconn);
        SqlDataReader dr = cmd.ExecuteReader();
        if (TextBox1.Text != null && TextBox2.Text != null)
        {
            if (dr.Read() == true)
            {
                dr.Close();
                cmd = new SqlCommand("update staff_entry set pwd= '" + TextBox4.Text + "' where psno='" + TextBox1.Text + "'", mssqlconn);
                cmd.ExecuteNonQuery();
                Label5.Text = "Password Updated";
                Label5.Visible = true;
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";
            }
            else
            {
                Label5.Text = "Password is incorrect please use correct password";
                Label5.Visible = true;
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";
            }
        }
        else
        {
            Label5.Text = "Please Enter Correct UserName.";
            Label5.Visible = true;
        }

        mssqlconn.Close();
    }
}