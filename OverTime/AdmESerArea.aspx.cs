using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AdmESerArea : System.Web.UI.Page
{
    SqlConnection mssqlconn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    int a, b, c = 1;
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Visible = false;
        if (Session["User"] == null)
        {
            Response.Redirect("MainHome.aspx?err=Please_Login!");
        }
        else
        {
            Label1002.Text = Session["User"].ToString();
            mssqlconn.Open();
            string sql = "select * from adminmaster where psno='" + Session["User"] + "'";
            SqlCommand cmd = new SqlCommand(sql, mssqlconn);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read() == true)
            {
                Label1003.Text = dr[5].ToString();
            }
            dr.Close();
            mssqlconn.Close();
            if (Label1003.Text == "Admin")
            {
                mssqlconn.Open();
                string sql1 = "select * from adminmaster where psno='" + Session["User"] + "'";
                SqlCommand cmd1 = new SqlCommand(sql1, mssqlconn);
                SqlDataReader dr1 = cmd1.ExecuteReader();
                if (dr1.Read() == true)
                {
                    Label1001.Text = dr1[2].ToString();
                    Button3.Enabled = false;
                    Button2.Enabled = false;
                    Button1.Enabled = false;
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
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        TextBox2.Text = null;
        mssqlconn.Open();
        string str = "select * from areamaster where area='" + TextBox1.Text + "'";


        SqlCommand cmd3 = new SqlCommand(str, mssqlconn);
        SqlDataReader dr7 = cmd3.ExecuteReader();

        if (dr7.Read() == true)
        {
            TextBox2.Text = dr7[1].ToString();
            Button1.Enabled = false;
            Button2.Enabled = true;
            Button3.Enabled = true;
        }
        else
        {
            Button1.Enabled = true;
            Button2.Enabled = false;
            Button3.Enabled = false;
        }
        mssqlconn.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        mssqlconn.Open();
        string qw = "select max(srno) from areamaster";
        SqlCommand qwe = new SqlCommand(qw, mssqlconn);
        SqlDataReader qwer = qwe.ExecuteReader();
        qwer.Read();
        a = 0;
        b = 0;
        c = 1;
        a = Convert.ToInt32(qwer[0].ToString());
        b = a + c;
        b.ToString();
        mssqlconn.Close();
        mssqlconn.Open();

        string query = "insert into areamaster values (" + b + ",'" + TextBox2.Text + "','" + TextBox1.Text + "')";
        SqlCommand cmd4 = new SqlCommand(query, mssqlconn);
        int flg = cmd4.ExecuteNonQuery();
        if (flg > 0)
        {
            Label1.Text = "Record Has Added Sucessfully";
            Label1.Visible = true;

            TextBox1.Text = null;
            TextBox2.Text = null;
            mssqlconn.Close();

        }
        else
        {
            Label1.Text = "Record Not Added Sucessfully";
            Label1.Visible = true;

            TextBox1.Text = null;
            TextBox2.Text = null;
            mssqlconn.Close();
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        mssqlconn.Open();

        string query = "update areamaster set code= '" + TextBox2.Text + "' where area='" + TextBox1.Text + "'";
        SqlCommand cmd4 = new SqlCommand(query, mssqlconn);
        int flg = cmd4.ExecuteNonQuery();
        if (flg > 0)
        {
            Label1.Text = "Record Has Sucessfully Updated";
            Label1.Visible = true;

            TextBox1.Text = null;
            TextBox2.Text = null;
            mssqlconn.Close();
            Button1.Enabled = true;
        }
        else
        {
            Label1.Text = "Only Code Of Area Can Be Updated";
            Label1.Visible = true;
            Button1.Enabled = true;
            TextBox1.Text = null;
            TextBox2.Text = null;
            mssqlconn.Close();
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        mssqlconn.Open();
        string str = "delete from areamaster where area='" + TextBox1.Text + "'";


        SqlCommand cmd3 = new SqlCommand(str, mssqlconn);
        int i = cmd3.ExecuteNonQuery();
        if (i > 0)
        {
            Label1.Text = "Record delete Sucessfully";
            mssqlconn.Close();
            TextBox1.Text = null;
            TextBox2.Text = null;
            Label1.Visible = true;
            Button1.Enabled = true;
        }

        else
        {
            Label1.Text = "Record not delete Sucessfully";
            Label1.Visible = true;
            Button1.Enabled = true;
            mssqlconn.Close();
        }
    }
    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {
        
    }
}