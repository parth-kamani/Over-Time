using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Net;
using System.Net.Mail;

public partial class AdmESerApprovedRptChange : System.Web.UI.Page
{
    SqlConnection mssqlconn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    int a, b, c = 1, g, h, v = 1;
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
                    Button2.Enabled = false;
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
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void DropDownList7_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
    protected void DropDownList12_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void DropDownList20_SelectedIndexChanged(object sender, EventArgs e)
    {
        mssqlconn.Open();
        string sql1 = "select * from otentrytable where srno='" + DropDownList20.SelectedValue + "'";
        SqlCommand cmd1 = new SqlCommand(sql1, mssqlconn);
        SqlDataReader dr1 = cmd1.ExecuteReader();
        if (dr1.Read() == true)
        {
            TextBox1.Text = dr1[2].ToString();
            TextBox2.Text = dr1[3].ToString();
            TextBox3.Text = dr1[5].ToString();
            TextBox5.Text = dr1[4].ToString();
            TextBox6.Text = dr1[9].ToString();
            TextBox7.Text = dr1[10].ToString();
            TextBox8.Text = dr1[8].ToString();
            DropDownList1.SelectedValue = dr1[12].ToString();
            TextBox9.Text = dr1[11].ToString();
            TextBox12.Text = dr1[6].ToString();
            TextBox13.Text = dr1[7].ToString();
            TextBox18.Text = dr1[18].ToString();
            TextBox17.Text = dr1[17].ToString();
            TextBox4.Text = dr1[13].ToString();
            TextBox14.Text = dr1[14].ToString();
            TextBox15.Text = dr1[20].ToString();
            TextBox11.Text = dr1[19].ToString();
            TextBox200.Text = dr1[15].ToString();
            TextBox201.Text = dr1[16].ToString();
            DropDownList21.SelectedValue = dr1[7].ToString();
            //DropDownList9.SelectedValue = dr1[18].ToString();
            DropDownList5.SelectedValue = dr1[23].ToString();
            DropDownList10.SelectedValue = dr1[24].ToString();
            //DropDownList11.SelectedValue = dr1[25].ToString();
            //DropDownList6.SelectedValue = dr1[27].ToString();
            TextBox16.Text = dr1[28].ToString();
            TextBox21.Text = dr1[15].ToString();
            TextBox22.Text = dr1[16].ToString();

            
        }
        else
        {
            TextBox1.Text = "hell";
        }
        mssqlconn.Close();
        dr1.Close();
    }
    
    protected void Button2_Click(object sender, EventArgs e)
    {
        mssqlconn.Open();
        string sql1 = "select * from edit_year where yearnme ='" + DropDownList11.SelectedValue.ToString() + "'";
        SqlCommand cmd1 = new SqlCommand(sql1, mssqlconn);
        SqlDataReader dr1 = cmd1.ExecuteReader();
        if (dr1.Read() == true)
        {
            Label4.Text = dr1[0].ToString();
        }
        mssqlconn.Close();
        if (DropDownList6.SelectedIndex == 1)
        {
            mssqlconn.Open();
            string query1 = "update otentrytable set authoperson = '" + Label1001.Text + "', toapprove = '" + DropDownList6.SelectedValue.ToString() + "', toremark='" + TextBox16.Text + "', toamnt = '" + Label12.Text + "', toayear = '" + Label13.Text + "' where srno='" + DropDownList20.SelectedValue.ToString() + "'";
            SqlCommand cmd4 = new SqlCommand(query1, mssqlconn);
            int flg1;
            flg1 = cmd4.ExecuteNonQuery();
            if (flg1 > 0)
            {
                Label3.Text = "Record Updated Sucessfully";
                Label3.Visible = true;
                mssqlconn.Close();
            }
            else
            {
                Label3.Text = "Record not Updated Sucessfully";
                Label3.Visible = true;
                mssqlconn.Close();
            }

            if (DropDownList6.SelectedIndex == 1)
            {
                mssqlconn.Close();
                mssqlconn.Open();
                string str111 = "Delete * from otallotable where otsrno=" + DropDownList20.SelectedValue + "";
                SqlCommand cmd6 = new SqlCommand(str111, mssqlconn);
                cmd6.ExecuteNonQuery();
                mssqlconn.Close();
                mssqlconn.Open();
                string str112 = "Delete * from otmnthtable where otsrno=" + DropDownList20.SelectedValue + "";
                SqlCommand cmd7 = new SqlCommand(str112, mssqlconn);
                cmd7.ExecuteNonQuery();
                mssqlconn.Close();
                mssqlconn.Open();
                string str113 = "Delete * from otentrytable where srno=" + DropDownList20.SelectedValue + "";
                SqlCommand cmd8 = new SqlCommand(str113, mssqlconn);
                cmd7.ExecuteNonQuery();
                mssqlconn.Close();
            }

        }
        else
        {

        }
        Response.Redirect("AdmESerVerifyTO.aspx");
    }
    protected void DropDownList10_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void DropDownList11_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
    protected void TextBox16_TextChanged(object sender, EventArgs e)
    {

    }
    protected void DropDownList9_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}