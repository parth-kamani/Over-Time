using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AdmESerOS : System.Web.UI.Page
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
        string str = "select * from staff_entry where psno='" + TextBox1.Text + "'";

        SqlCommand cmd3 = new SqlCommand(str, mssqlconn);
        SqlDataReader dr7 = cmd3.ExecuteReader();

        if (dr7.Read() == true)
        {
            TextBox2.Text = dr7[2].ToString();
            TextBox3.Text = dr7[3].ToString();
            DropDownList1.SelectedValue = dr7[4].ToString();
            //TextBox4.Text = dr7[5].ToString();
            DropDownList3.SelectedValue = dr7[5].ToString();
            emp_id.Text = dr7[6].ToString();
            TextBox6.Text = dr7[7].ToString();
            DropDownList2.SelectedValue = dr7[8].ToString();
            TextBox5.Text = dr7[9].ToString();
            Button1.Enabled = false;

            Button2.Enabled = true;
            Button3.Enabled = true;
        }
        else
        {
            Button1.Enabled = true;
            DropDownList1.SelectedIndex = 0;
            DropDownList2.SelectedIndex = 0;
            DropDownList3.SelectedIndex = 0;
            TextBox3.Text = null;
            TextBox2.Text = null;
            //TextBox4.Text = null;
            TextBox5.Text = null;
            TextBox6.Text = null;
            emp_id.Text = null;
            Button2.Enabled = false;
            Button3.Enabled = false;
        }
        mssqlconn.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        mssqlconn.Open();
        string str = "select max(srno) from staff_entry";

        SqlCommand cmd3 = new SqlCommand(str, mssqlconn);
        SqlDataReader dr7 = cmd3.ExecuteReader();

        dr7.Read();
        a = Convert.ToInt32(dr7[0].ToString());
        b = a + c;
        b.ToString();
        mssqlconn.Close();
        mssqlconn.Open();

        string query = "insert into staff_entry values ('" + b.ToString() + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + DropDownList1.SelectedValue + "','" + DropDownList3.SelectedValue + "','" + emp_id.Text + "','" + TextBox6.Text + "','" + DropDownList2.SelectedValue + "','" + TextBox5.Text + "')";
        SqlCommand cmd4 = new SqlCommand(query, mssqlconn);
        int flg = cmd4.ExecuteNonQuery();
        if (flg > 0)
        {
            Label1.Text = "Record Has Added Sucessfully";
            Label1.Visible = true;
            DropDownList1.SelectedIndex = 0;
            DropDownList2.SelectedIndex = 0;
            DropDownList3.SelectedIndex = 0;
            TextBox1.Text = null;
            TextBox3.Text = null;
            TextBox2.Text = null;
            //TextBox4.Text = null;
            TextBox5.Text = null;
            TextBox6.Text = null;
            emp_id.Text = null;
            mssqlconn.Close();
        }
        else
        {
            Label1.Text = "Record Not Added Sucessfully";
            Label1.Visible = true;
            DropDownList1.SelectedIndex = 0;
            DropDownList2.SelectedIndex = 0;
            DropDownList3.SelectedIndex = 0;
            TextBox1.Text = null;
            TextBox3.Text = null;
            TextBox2.Text = null;
            //TextBox4.Text = null;
            TextBox5.Text = null;
            TextBox6.Text = null;
            emp_id.Text = null;
            mssqlconn.Close();
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox2.Text = null;
        mssqlconn.Open();

        string query = "update staff_entry set name= '" + TextBox3.Text + "', dept = '" + DropDownList1.SelectedValue + "', desig = '" + DropDownList3.SelectedValue + "', email = '" + emp_id.Text + "', fhemail = '" + TextBox6.Text + "', autho = '" + DropDownList2.SelectedValue + "', dhemail = '" + TextBox5.Text + "' where psno='" + TextBox1.Text + "'";
        SqlCommand cmd4 = new SqlCommand(query, mssqlconn);
        int flg = cmd4.ExecuteNonQuery();
        if (flg > 0)
        {
            Label1.Text = "Record Has Sucessfully Updated";
            Label1.Visible = true;
            DropDownList1.SelectedIndex = 0;
            DropDownList2.SelectedIndex = 0;
            DropDownList3.SelectedIndex = 0;
            TextBox1.Text = null;
            TextBox3.Text = null;
            TextBox2.Text = null;
            //TextBox4.Text = null;
            TextBox5.Text = null;
            TextBox6.Text = null;
            emp_id.Text = null;
            mssqlconn.Close();
            Button1.Enabled = true;
        }
        else
        {
            Label1.Text = "Only Code & Description Of department Can Be Updated";
            Label1.Visible = true;
            Button1.Enabled = true;
            DropDownList1.SelectedIndex = 0;
            DropDownList2.SelectedIndex = 0;
            DropDownList3.SelectedIndex = 0;
            TextBox1.Text = null;
            TextBox3.Text = null;
            TextBox2.Text = null;
            //TextBox4.Text = null;
            TextBox5.Text = null;
            TextBox6.Text = null;
            emp_id.Text = null;
            mssqlconn.Close();

        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        mssqlconn.Open();
        string str = "delete from staff_entry where psno='" + TextBox1.Text + "'";


        SqlCommand cmd3 = new SqlCommand(str, mssqlconn);
        int i = cmd3.ExecuteNonQuery();
        if (i > 0)
        {
            Label1.Text = "Record delete Sucessfully";
            mssqlconn.Close();
            DropDownList1.SelectedIndex = 0;
            DropDownList2.SelectedIndex = 0;
            DropDownList3.SelectedIndex = 0;
            TextBox1.Text = null;
            TextBox3.Text = null;
            TextBox2.Text = null;
            //TextBox4.Text = null;
            TextBox5.Text = null;
            TextBox6.Text = null;
            emp_id.Text = null;
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