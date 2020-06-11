using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AdmESerEmp : System.Web.UI.Page
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
        mssqlconn.Open();
        string str = "select * from wbempentry where psno='" + TextBox1.Text + "'";

        SqlCommand cmd3 = new SqlCommand(str, mssqlconn);
        SqlDataReader dr7 = cmd3.ExecuteReader();

        if (dr7.Read() == true)
        {
            TextBox2.Text = dr7[2].ToString();
            DropDownList1.SelectedValue = dr7[3].ToString();
            TextBox3.Text = dr7[4].ToString();
            Button1.Enabled = false;

            Button2.Enabled = true;
            Button3.Enabled = true;
        }
        else
        {
            Button1.Enabled = true;
            DropDownList1.SelectedIndex = 0;
            TextBox3.Text = null;
            TextBox2.Text = null;
            Button2.Enabled = false;
            Button3.Enabled = false;
        }
        mssqlconn.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        mssqlconn.Open();
        string str = "select max(srno) from wbempentry";

        SqlCommand cmd3 = new SqlCommand(str, mssqlconn);
        SqlDataReader dr7 = cmd3.ExecuteReader();

        dr7.Read();
        a = Convert.ToInt32(dr7[0].ToString());
        b = a + c;
        b.ToString();
        mssqlconn.Close();
        mssqlconn.Open();

        string query = "insert into wbempentry values ('" + b.ToString() + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + DropDownList1.SelectedValue + "','" + TextBox3.Text + "')";
        SqlCommand cmd4 = new SqlCommand(query, mssqlconn);
        int flg = cmd4.ExecuteNonQuery();
        if (flg > 0)
        {
            Label1.Text = "Record Has Added Sucessfully";
            Label1.Visible = true;
            DropDownList1.SelectedIndex = 0;
            TextBox1.Text = null;
            TextBox3.Text = null;
            TextBox2.Text = null;
            mssqlconn.Close();
        }
        else
        {
            Label1.Text = "Record Not Added Sucessfully";
            Label1.Visible = true;
            DropDownList1.SelectedIndex = 0;
            TextBox1.Text = null;
            TextBox3.Text = null;
            TextBox2.Text = null;
            mssqlconn.Close();
        }
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        mssqlconn.Open();

        string query = "update wbempentry set name= '" + TextBox2.Text + "', dept = '" + DropDownList1.SelectedValue + "', desig = '" + TextBox3.Text + "' where psno='" + TextBox1.Text + "'";
        SqlCommand cmd4 = new SqlCommand(query, mssqlconn);
        int flg = cmd4.ExecuteNonQuery();
        if (flg > 0)
        {
            Label1.Text = "Record Has Sucessfully Updated";
            Label1.Visible = true;
            DropDownList1.SelectedIndex = 0;
            TextBox1.Text = null;
            TextBox3.Text = null;
            TextBox2.Text = null;
            mssqlconn.Close();
            Button1.Enabled = true;
        }
        else
        {
            Label1.Text = "Only Code & Description Of department Can Be Updated";
            Label1.Visible = true;
            Button1.Enabled = true;
            DropDownList1.SelectedIndex = 0;
            TextBox1.Text = null;
            TextBox3.Text = null;
            TextBox2.Text = null;
            mssqlconn.Close();
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        mssqlconn.Open();
        string str = "delete from wbempentry where psno='" + TextBox1.Text + "'";


        SqlCommand cmd3 = new SqlCommand(str, mssqlconn);
        int i = cmd3.ExecuteNonQuery();
        if (i > 0)
        {
            Label1.Text = "Record delete Sucessfully";
            mssqlconn.Close();
            DropDownList1.SelectedIndex = 0;
            TextBox1.Text = null;
            TextBox3.Text = null;
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

}