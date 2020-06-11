using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AdmESerUser : System.Web.UI.Page
{
    SqlConnection mssqlconn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    int a, b, c = 1;
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
                Button1.Enabled = false;
                Button2.Enabled = false;
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
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        if (DropDownList2.SelectedIndex == 1)
        {
            mssqlconn.Open();
            string str = "select * from staff_entry where psno = '" + TextBox1.Text + "'";


            SqlCommand cmd3 = new SqlCommand(str, mssqlconn);
            SqlDataReader dr7 = cmd3.ExecuteReader();

            if (dr7.Read() == true)
            {
                TextBox1.ReadOnly = true;
                TextBox4.Text = dr7[3].ToString();
                TextBox5.Text = dr7[4].ToString();
                TextBox10.Text = dr7[6].ToString();
                Button1.Enabled = true;
                Button2.Enabled = false;
                Button3.Enabled = false;
                TextBox4.ReadOnly = true;
                TextBox5.ReadOnly = true;
                TextBox10.ReadOnly = true;
                dr7.Close();
                mssqlconn.Close();
                mssqlconn.Open();
                string str1 = "select * from adminmaster where psno = '" + TextBox1.Text + "'";
                SqlCommand cmd4 = new SqlCommand(str1, mssqlconn);
                SqlDataReader dr8 = cmd4.ExecuteReader();

                if (dr8.Read() == true)
                {
                    TextBox6.Text = dr8[6].ToString();
                    TextBox7.Text = dr8[7].ToString();
                    TextBox8.Text = dr8[2].ToString();
                    TextBox9.Text = dr8[4].ToString();
                    TextBox11.Text = dr8[9].ToString();
                    dr8.Close();
                    if (TextBox6.Text == DropDownList2.SelectedValue && TextBox7.Text == TextBox1.Text && TextBox8.Text == TextBox4.Text && TextBox9.Text == TextBox5.Text && TextBox11.Text == TextBox10.Text)
                    {
                        Label1.Text = "User Already Exist. Click Reset to Add Another Admin.";
                        Label1.Visible = true;
                        Button1.Enabled = false;
                        TextBox3.ReadOnly = true;
                        Button2.Enabled = true;
                        Button3.Enabled = true;
                        TextBox10.Text = TextBox11.Text;
                    }
                    else
                    {
                        Button1.Enabled = true;
                        Button2.Enabled = false;
                        Button3.Enabled = false;
                    }
                    
                }
            }
            else
            {
                Button1.Enabled = false;
                TextBox4.Text = null;
                TextBox4.ReadOnly = true;
                TextBox5.ReadOnly = true;
                Button1.Enabled = false;
                Button2.Enabled = false;
                TextBox3.Text = null;
                TextBox5.Text = null;
                Label1.Text = "Only Employees are Allowed. Click Reset.";
                Label1.Visible = true;
            }
            mssqlconn.Close();
        }
        else if (DropDownList2.SelectedIndex == 2)
        {
            mssqlconn.Open();
            string str = "select * from wbempentry where psno = '" + TextBox1.Text + "'";


            SqlCommand cmd3 = new SqlCommand(str, mssqlconn);
            SqlDataReader dr7 = cmd3.ExecuteReader();

            if (dr7.Read() == true)
            {
                TextBox1.ReadOnly = true;
                TextBox4.Text = dr7[2].ToString();
                TextBox5.Text = dr7[3].ToString();
                //TextBox10.Text = dr7[9].ToString();
                Button1.Enabled = true;
                Button2.Enabled = false;
                Button3.Enabled = false;
                TextBox4.ReadOnly = true;
                TextBox5.ReadOnly = true;
                TextBox10.ReadOnly = true;
                dr7.Close();
                mssqlconn.Close();
                mssqlconn.Open();
                string str1 = "select * from adminmaster where psno = '" + TextBox1.Text + "'";
                SqlCommand cmd4 = new SqlCommand(str1, mssqlconn);
                SqlDataReader dr8 = cmd4.ExecuteReader();

                if (dr8.Read() == true)
                {
                    TextBox6.Text = dr8[6].ToString();
                    TextBox7.Text = dr8[7].ToString();
                    TextBox8.Text = dr8[2].ToString();
                    TextBox9.Text = dr8[4].ToString();
                    TextBox10.Text = dr8[9].ToString();
                    dr8.Close();
                    if (TextBox6.Text == DropDownList2.SelectedValue && TextBox7.Text == TextBox1.Text && TextBox8.Text == TextBox4.Text && TextBox9.Text == TextBox5.Text)
                    {
                        Label1.Text = "User Already Exist. Click Reset to Add Another Admin.";
                        Label1.Visible = true;
                        Button1.Enabled = false;
                        TextBox3.ReadOnly = true;
                        Button2.Enabled = true;
                        Button3.Enabled = true;
                    }
                    else
                    {
                        Button1.Enabled = true;
                        Button2.Enabled = false;
                        Button3.Enabled = false;
                    }
                    TextBox10.ReadOnly = true;
                }
            }
            else
            {
                Button1.Enabled = false;
                TextBox4.Text = null;
                TextBox4.ReadOnly = true;
                TextBox5.ReadOnly = true;
                Button1.Enabled = false;
                Button2.Enabled = false;
                TextBox3.Text = null;
                TextBox5.Text = null;
                TextBox10.Text = null;
                Label1.Text = "Only Employees are Allowed. Click Reset.";
                Label1.Visible = true;
            }
            mssqlconn.Close();
        }
        else
        {

            Button1.Enabled = false;
            TextBox4.Text = null;
            TextBox4.ReadOnly = true;
            TextBox5.ReadOnly = true;
            Button1.Enabled = false;
            Button2.Enabled = false;
            TextBox3.Text = null;
            TextBox5.Text = null;
            TextBox10.Text = null;
            Label1.Text = "Only Employees are Allowed. Click Reset.";
            Label1.Visible = true;

        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
            mssqlconn.Open();
            string sql1 = "select pwd from adminmaster";
            SqlCommand cmd1 = new SqlCommand(sql1, mssqlconn);
            SqlDataReader dr1 = cmd1.ExecuteReader();
            if (dr1.Read() == true)
            {
                dr1.Close();
                string sql2 = "select pwd from adminmaster where pwd = '" + TextBox3.Text + "'";
                SqlCommand cmd2 = new SqlCommand(sql2, mssqlconn);
                SqlDataReader dr2 = cmd2.ExecuteReader();
                if (dr2.Read() == true)
                {
                    Label1.Text = "Password Taken Try other One. Click Reset";
                    Label1.Visible = true;
                    Button2.Enabled = false;
                    dr2.Close();
                }
                else
                {

                    dr2.Close();
                    mssqlconn.Close();
                    mssqlconn.Open();
                    string str = "select max(srno) from adminmaster";

                    SqlCommand cmd3 = new SqlCommand(str, mssqlconn);
                    SqlDataReader dr7 = cmd3.ExecuteReader();

                    dr7.Read();
                    a = Convert.ToInt32(dr7[0].ToString());
                    b = a + c;
                    b.ToString();
                    mssqlconn.Close();
                    mssqlconn.Open();

                    string query = "insert into adminmaster values ('" + b.ToString() + "','" + TextBox2.Text + "','" + TextBox4.Text + "','" + TextBox3.Text + "','" + TextBox5.Text + "','" + Label10.Text + "','" + DropDownList2.SelectedValue + "','" + TextBox1.Text + "','" + Label1001.Text + "','"+ TextBox10.Text +"')";
                    SqlCommand cmd4 = new SqlCommand(query, mssqlconn);
                    int flg = cmd4.ExecuteNonQuery();
                    if (flg > 0)
                    {
                        Label1.Text = "Record Has Added Sucessfully. Click Reset";
                        Label1.Visible = true;
                        DropDownList2.SelectedIndex = 0;
                        TextBox1.Text = null;
                        TextBox3.Text = null;
                        TextBox4.Text = null;
                        TextBox5.Text = null;
                        TextBox6.Text = null;
                        TextBox7.Text = null;
                        TextBox8.Text = null;
                        TextBox9.Text = null;
                        TextBox10.Text = null;
                        TextBox11.Text = null;
                        mssqlconn.Close();
                        Button3.Enabled = true;
                    }
                    else
                    {
                        Label1.Text = "Record Not Added Sucessfully. Click Reset and Try Again";
                        Label1.Visible = true;
                        DropDownList2.SelectedIndex = 0;
                        TextBox1.Text = null;
                        TextBox3.Text = null;
                        TextBox4.Text = null;
                        TextBox5.Text = null;
                        TextBox6.Text = null;
                        TextBox7.Text = null;
                        TextBox8.Text = null;
                        TextBox9.Text = null;
                        TextBox10.Text = null;
                        TextBox11.Text = null;
                        mssqlconn.Close();
                        Button3.Enabled = true;
                    }

                }

            }
            //mssqlconn.Close();
        
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        mssqlconn.Open();
        string str = "delete from adminmaster where psno='" + TextBox1.Text + "'";


        SqlCommand cmd3 = new SqlCommand(str, mssqlconn);
        int i = cmd3.ExecuteNonQuery();
        if (i > 0)
        {
            Label1.Text = "Record delete Sucessfully. Click Reset.";
            mssqlconn.Close();
            DropDownList2.SelectedIndex = 0;
            TextBox1.Text = null;
            TextBox3.Text = null;
            TextBox4.Text = null;
            TextBox5.Text = null;
            TextBox6.Text = null;
            TextBox7.Text = null;
            TextBox8.Text = null;
            TextBox9.Text = null;
            TextBox10.Text = null;
            TextBox11.Text = null;
            Label1.Visible = true;
            Button1.Enabled = false;
            Button3.Enabled = true;
        }

        else
        {
            Label1.Text = "Record not delete Sucessfully. Click Reset and Try Again.";
            Label1.Visible = true;
            Button1.Enabled = true;
            mssqlconn.Close();
            Button3.Enabled = true;
        }
        
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        TextBox1.Text = null;
        TextBox3.Text = null;
        TextBox4.Text = null;
        TextBox5.Text = null;
        TextBox6.Text = null;
        TextBox7.Text = null;
        TextBox8.Text = null;
        TextBox9.Text = null;
        TextBox10.Text = null;
        TextBox11.Text = null;
        Label1.Visible = false;
        Button1.Enabled = false;
        Button2.Enabled = false;
        Button3.Enabled = true;
        TextBox1.ReadOnly = false;
        TextBox3.ReadOnly = false;
        TextBox10.ReadOnly = false;
        DropDownList2.SelectedIndex = 0;
    }
}