using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AdmESerChangePwd : System.Web.UI.Page
{
    SqlConnection mssqlconn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
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
                    TextBox1.Text = Session["User"].ToString();
                    //Button2.Enabled = false;
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
        string sql = "select pwd from adminmaster where psno ='" + TextBox1.Text + "' and pwd ='" + TextBox2.Text + "'";
        SqlCommand cmd = new SqlCommand(sql, mssqlconn);
        SqlDataReader dr = cmd.ExecuteReader();
        if (TextBox3.Text == TextBox4.Text)
        {
            if (TextBox1.Text != null && TextBox2.Text != null)
            {
                if (dr.Read() == true)
                {
                    TextBox5.Text = dr[0].ToString();
                    dr.Close();
                    string sql1 = "select pwd from adminmaster";
                    SqlCommand cmd1 = new SqlCommand(sql1, mssqlconn);
                    SqlDataReader dr1 = cmd1.ExecuteReader();
                    if (dr1.Read() == true)
                    {
                        dr1.Close();
                        string sql2 = "select pwd from adminmaster where psno = '"+TextBox1.Text+"' and pwd = '" + TextBox3.Text + "'";
                        SqlCommand cmd2 = new SqlCommand(sql2, mssqlconn);
                        SqlDataReader dr2 = cmd2.ExecuteReader();
                        if (dr2.Read() == true)
                        {
                            Label1.Text = "Password Already Taken Try other One. Click Reset";
                            Label1.Visible = true;
                            Button2.Enabled = false;
                            dr2.Close();
                        }
                        else
                        {
                            if (TextBox3.Text == TextBox4.Text)
                            {
                                dr2.Close();
                                Button2.Enabled = true;
                                Label1.Visible = false;
                                SqlCommand cmd3 = new SqlCommand("update adminmaster set pwd= '" + TextBox4.Text + "' where psno='" + TextBox1.Text + "'", mssqlconn);
                                cmd3.ExecuteNonQuery();
                                Label1.Text = "Password Updated";
                                Label1.Visible = true;
                                TextBox2.Text = null;
                                TextBox3.Text = null;
                                TextBox4.Text = null;
                                TextBox5.Text = null;
                            }
                            else
                            {
                                Label1.Text = "New Password & Confirm Password does not match";
                                Label1.Visible = true;
                            }
                        }
                    }
                }
                else
                {
                    Label1.Text = "Enter all details Correctly";
                    Label1.Visible = true;
                    TextBox2.Text = null;
                    TextBox3.Text = null;
                    TextBox4.Text = null;
                    TextBox5.Text = null;
                    Button2.Enabled = false;
                }
            }
            else
            {
                Label1.Text = "Please Enter Correct UserName.";
                Label1.Visible = true;
                Button2.Enabled = false;
            }
        }
        mssqlconn.Close();
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        Label1.Visible = false;
        Button2.Enabled = false;
        TextBox2.Text = null;
        TextBox3.Text = null;
        TextBox4.Text = null;
        TextBox5.Text = null;
    }
    protected void TextBox4_TextChanged(object sender, EventArgs e)
    {
        if (TextBox2.Text != null && TextBox3.Text != null && TextBox4 != null)
        {
            if (TextBox3.Text == TextBox4.Text)
            {
                Button2.Enabled = true;
            }
            else
            {
                Label1.Text = "New Password & Confirm Password does not match";
                Label1.Visible = true;
            }
        }
        else
        {
            Label1.Text = "Enter all details";
            Label1.Visible = true;
        }

    }
}
