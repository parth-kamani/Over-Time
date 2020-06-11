using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class HosdSerApproveOTEdit : System.Web.UI.Page
{
    SqlConnection mssqlconn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    public string x;
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
            string sql = "select * from staff_entry where psno='" + Session["User"] + "'";
            SqlCommand cmd = new SqlCommand(sql, mssqlconn);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read() == true)
            {
                Label1001.Text = dr[3].ToString();
                Label1003.Text = dr[8].ToString();
                TextBox9.Attributes["min"] = DateTime.Now.AddDays(-45).ToString("yyyy-MM-dd");
                TextBox9.Attributes["max"] = DateTime.Now.AddDays(5).ToString("yyyy-MM-dd");
            }
            dr.Close();
            mssqlconn.Close();
            if (Label1003.Text == "Yes")
            {
                mssqlconn.Open();
                string sql1 = "select * from staff_entry where psno='" + Session["User"] + "'";
                SqlCommand cmd1 = new SqlCommand(sql1, mssqlconn);
                SqlDataReader dr1 = cmd1.ExecuteReader();
                if (dr1.Read() == true)
                {
                    TextBox18.Text = dr1[4].ToString();
                    TextBox7.Text = Request["id"];
                }
                mssqlconn.Close();
                dr1.Close();
            }
            else
            {
                Session.Abandon();
                Session["User"] = null;
                Session.Clear();
                Response.Redirect("MainHome.aspx?err=Please_Login!");
            }
            if (TextBox7.Text != null)
            {
                mssqlconn.Open();
                string sql1 = "select * from otentrytable where srno='" + TextBox7.Text + "'";
                SqlCommand cmd1 = new SqlCommand(sql1, mssqlconn);
                SqlDataReader dr1 = cmd1.ExecuteReader();
                if (dr1.Read() == true)
                {
                    TextBox6.Text = dr1[2].ToString();
                    TextBox19.Text = dr1[3].ToString();
                    TextBox3.Text = dr1[5].ToString();
                    DropDownList11.SelectedValue = dr1[6].ToString();
                    DropDownList12.SelectedValue = dr1[7].ToString();
                    TextBox1.Text = dr1[8].ToString();
                    TextBox8.Text = dr1[9].ToString();
                    DropDownList6.SelectedValue = dr1[10].ToString();
                    TextBox9.Text = dr1[11].ToString();
                    DropDownList1.SelectedValue = dr1[12].ToString();
                    DropDownList9.SelectedValue = dr1[18].ToString();
                    TextBox17.Text = dr1[17].ToString();
                    TextBox11.Text = dr1[19].ToString();
                    TextBox2.Text = dr1[20].ToString();
                    TextBox200.Text = dr1[15].ToString();
                    TextBox201.Text = dr1[16].ToString();
                    TextBox20.Text = DropDownList9.SelectedValue.ToString();
                    TextBox5.Text = DropDownList12.SelectedValue.ToString();
                    DropDownList7.SelectedValue = dr1[13].ToString();
                    TextBox4.Text = dr1[14].ToString();

                    if (DropDownList12.SelectedIndex == 0)
                    {
                        DropDownList3.Visible = false;
                        DropDownList4.Visible = false;
                        DropDownList2.Visible = false;
                        DropDownList15.Visible = false;
                        DropDownList8.Visible = false;
                        DropDownList16.Visible = false;
                        DropDownList13.Visible = false;
                        DropDownList17.Visible = false;
                        DropDownList14.Visible = false;
                        DropDownList18.Visible = false;
                        DropDownList14.SelectedValue = dr1[15].ToString(); ;
                        DropDownList18.SelectedValue = dr1[16].ToString(); ;
                        DropDownList14.Visible = true;
                        DropDownList18.Visible = true;
                        TextBox21.Text = null;
                        TextBox22.Text = null;
                        TextBox21.Text = DropDownList14.SelectedValue.ToString();
                        TextBox22.Text = DropDownList18.SelectedValue.ToString();
                    }
                    else if (DropDownList12.SelectedIndex == 1)
                    {
                        DropDownList3.Visible = false;
                        DropDownList4.Visible = false;
                        DropDownList2.Visible = false;
                        DropDownList15.Visible = false;
                        DropDownList8.Visible = false;
                        DropDownList16.Visible = false;
                        DropDownList13.Visible = false;
                        DropDownList17.Visible = false;
                        DropDownList14.Visible = false;
                        DropDownList18.Visible = false;
                        DropDownList3.SelectedValue = dr1[15].ToString();
                        DropDownList4.SelectedValue = dr1[16].ToString();
                        DropDownList3.Visible = true;
                        DropDownList4.Visible = true;
                        TextBox21.Text = null;
                        TextBox22.Text = null;
                        TextBox21.Text = DropDownList3.SelectedValue.ToString();
                        TextBox22.Text = DropDownList4.SelectedValue.ToString();
                    }
                    else if (DropDownList12.SelectedIndex == 2)
                    {
                        DropDownList3.Visible = false;
                        DropDownList4.Visible = false;
                        DropDownList2.Visible = false;
                        DropDownList15.Visible = false;
                        DropDownList8.Visible = false;
                        DropDownList16.Visible = false;
                        DropDownList13.Visible = false;
                        DropDownList17.Visible = false;
                        DropDownList14.Visible = false;
                        DropDownList18.Visible = false;
                        DropDownList2.SelectedValue = TextBox200.Text;
                        DropDownList15.SelectedValue = TextBox201.Text;
                        DropDownList2.Visible = true;
                        DropDownList15.Visible = true;
                        TextBox21.Text = null;
                        TextBox22.Text = null;
                        TextBox21.Text = DropDownList2.SelectedValue.ToString();
                        TextBox22.Text = DropDownList15.SelectedValue.ToString();
                    }
                    else if (DropDownList12.SelectedIndex == 3)
                    {
                        DropDownList3.Visible = false;
                        DropDownList4.Visible = false;
                        DropDownList2.Visible = false;
                        DropDownList15.Visible = false;
                        DropDownList8.Visible = false;
                        DropDownList16.Visible = false;
                        DropDownList13.Visible = false;
                        DropDownList17.Visible = false;
                        DropDownList14.Visible = false;
                        DropDownList18.Visible = false;
                        DropDownList8.SelectedValue = dr1[15].ToString();
                        DropDownList16.SelectedValue = dr1[16].ToString();
                        DropDownList8.Visible = true;
                        DropDownList16.Visible = true;
                        TextBox21.Text = null;
                        TextBox22.Text = null;
                        TextBox21.Text = DropDownList8.SelectedValue.ToString();
                        TextBox22.Text = DropDownList16.SelectedValue.ToString();
                    }
                    else if (DropDownList12.SelectedIndex == 4)
                    {
                        DropDownList3.Visible = false;
                        DropDownList4.Visible = false;
                        DropDownList2.Visible = false;
                        DropDownList15.Visible = false;
                        DropDownList8.Visible = false;
                        DropDownList16.Visible = false;
                        DropDownList13.Visible = false;
                        DropDownList17.Visible = false;
                        DropDownList14.Visible = false;
                        DropDownList18.Visible = false;
                        DropDownList13.SelectedValue = dr1[15].ToString();
                        DropDownList17.SelectedValue = dr1[16].ToString();
                        DropDownList13.Visible = true;
                        DropDownList17.Visible = true;
                        TextBox21.Text = null;
                        TextBox22.Text = null;
                        TextBox21.Text = DropDownList13.SelectedValue.ToString();
                        TextBox22.Text = DropDownList17.SelectedValue.ToString();
                    }
                    else if (DropDownList12.SelectedIndex == 5)
                    {
                        DropDownList3.Visible = false;
                        DropDownList4.Visible = false;
                        DropDownList2.Visible = false;
                        DropDownList15.Visible = false;
                        DropDownList8.Visible = false;
                        DropDownList16.Visible = false;
                        DropDownList13.Visible = false;
                        DropDownList17.Visible = false;
                        DropDownList14.Visible = false;
                        DropDownList18.Visible = false;
                        DropDownList14.SelectedValue = dr1[15].ToString();
                        DropDownList18.SelectedValue = dr1[16].ToString();
                        DropDownList14.Visible = true;
                        DropDownList18.Visible = true;
                        TextBox21.Text = null;
                        TextBox22.Text = null;
                        TextBox21.Text = DropDownList14.SelectedValue.ToString();
                        TextBox22.Text = DropDownList18.SelectedValue.ToString();
                    }
                    else if (DropDownList12.SelectedIndex == 6)
                    {
                        DropDownList3.Visible = false;
                        DropDownList4.Visible = false;
                        DropDownList2.Visible = false;
                        DropDownList15.Visible = false;
                        DropDownList8.Visible = false;
                        DropDownList16.Visible = false;
                        DropDownList13.Visible = false;
                        DropDownList17.Visible = false;
                        DropDownList14.Visible = false;
                        DropDownList18.Visible = false;
                        DropDownList14.SelectedValue = dr1[15].ToString();
                        DropDownList18.SelectedValue = dr1[16].ToString();
                        DropDownList14.Visible = true;
                        DropDownList18.Visible = true;
                        TextBox21.Text = null;
                        TextBox22.Text = null;
                        TextBox21.Text = DropDownList14.SelectedValue.ToString();
                        TextBox22.Text = DropDownList18.SelectedValue.ToString();
                    }
                    else if (DropDownList12.SelectedIndex == 7)
                    {
                        DropDownList3.Visible = false;
                        DropDownList4.Visible = false;
                        DropDownList2.Visible = false;
                        DropDownList15.Visible = false;
                        DropDownList8.Visible = false;
                        DropDownList16.Visible = false;
                        DropDownList13.Visible = false;
                        DropDownList17.Visible = false;
                        DropDownList14.Visible = false;
                        DropDownList18.Visible = false;
                        DropDownList14.SelectedValue = dr1[15].ToString();
                        DropDownList18.SelectedValue = dr1[16].ToString();
                        DropDownList14.Visible = true;
                        DropDownList18.Visible = true;
                        TextBox21.Text = null;
                        TextBox22.Text = null;
                        TextBox21.Text = DropDownList14.SelectedValue.ToString();
                        TextBox22.Text = DropDownList18.SelectedValue.ToString();
                    }



                }
                mssqlconn.Close();
                dr1.Close();
            }
        }
    }

    protected void TextBox18_TextChanged(object sender, EventArgs e)
    {
        mssqlconn.Open();
        string sql = "select * from staff_entry where psno='" + Label1001.Text + "'";
        SqlCommand cmd = new SqlCommand(sql, mssqlconn);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read() == true)
        {
            TextBox18.Text = dr[4].ToString();
        }
        else
        {
            RequiredFieldValidator2.Text = " NO Record";
            RequiredFieldValidator2.Visible = true;
        }
        mssqlconn.Close();
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
    protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
    protected void DropDownList8_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
    protected void DropDownList13_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
    protected void DropDownList14_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
    protected void DropDownList9_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
    protected void DropDownList15_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
    protected void DropDownList16_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
    protected void DropDownList17_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
    protected void DropDownList18_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
    protected void Button2_Click12(object sender, EventArgs e)
    {
        Label3.Visible = false;
        if (DropDownList5.SelectedIndex == 1 || DropDownList5.SelectedIndex == 2)
        {
            mssqlconn.Open();
            string query1 = "update otentrytable set hosdapprove='" + DropDownList5.SelectedValue.ToString() + "', hosdremark='" + TextBox10.Text + "', toapprove='" + Label2.Text + "' where srno='" + TextBox7.Text + "'";
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
        }

        else if (DropDownList5.SelectedIndex == 3)
        {
            mssqlconn.Open();
            string query = "update otentrytable set hosdapprove='" + DropDownList5.SelectedValue.ToString() + "', hosdremark='" + TextBox10.Text + "', previousot='-', paidmonth='-', paidyear='-', authoperson='-', toapprove='-', toremark='-' where srno=" + TextBox7.Text + "";

            SqlCommand cmd3 = new SqlCommand(query, mssqlconn);
            int flg;
            flg = cmd3.ExecuteNonQuery();
            if (flg > 0)
            {
                string query1 = "insert into delrecord values (" + TextBox7.Text + ",'" + Session["User"].ToString() + "','" + TextBox6.Text + "','" + TextBox19.Text + "','" + TextBox18.Text + "','" + TextBox3.Text + "','" + DropDownList11.SelectedValue + "','" + DropDownList12.SelectedValue + "','" + TextBox1.Text + "','" + TextBox8.Text + "','" + DropDownList6.SelectedValue + "','" + TextBox9.Text + "','" + DropDownList1.SelectedValue + "','" + DropDownList7.SelectedValue + "','" + TextBox4.Text + "','" + TextBox21.Text + "','" + TextBox22.Text + "','" + TextBox17.Text + "','" + DropDownList9.SelectedValue + "','" + TextBox11.Text + "','" + TextBox2.Text + "','" + DropDownList5.SelectedValue + "','" + TextBox10.Text + "','-','-','-','-','-','-')";

                SqlCommand cmd4 = new SqlCommand(query1, mssqlconn);
                int flg2;
                flg2 = cmd4.ExecuteNonQuery();
                if (flg2 > 0)
                {
                    Label3.Text = "Record deleted Sucessfully";
                    Label3.Visible = true;
                    mssqlconn.Close();
                    mssqlconn.Open();
                    string query2 = "select * from otentrytable where srno=" + TextBox7.Text + " ";
                    SqlCommand cmd5 = new SqlCommand(query2, mssqlconn);
                    SqlDataReader dr = cmd5.ExecuteReader();
                    if (dr.Read() == true)
                    {
                        string query3 = "delete from [otentrytable] where srno=" + TextBox7.Text + " ";
                        SqlCommand cmd6 = new SqlCommand(query3, mssqlconn);
                        dr.Close();
                        cmd6.ExecuteNonQuery();
                    }
                    mssqlconn.Close();
                    Response.Redirect("HosdSerApproveOT.aspx");
                }
            }
        }

        else
        {
            mssqlconn.Open();
            string query1 = "update otentrytable set hosdapprove='" + DropDownList5.SelectedValue.ToString() + "', hosdremark='" + TextBox10.Text + "', previousot='-', paidmonth='-', paidyear='-', authoperson='-', toapprove='-', toremark='-' where srno='" + TextBox7.Text + "'";
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
        }
        Response.Redirect("HosdSerApproveOT.aspx");
    }
    protected void DropDownList11_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("HosdSerApproveOT.aspx");
    }
    protected void TextBox7_TextChanged(object sender, EventArgs e)
    {


    }
}
