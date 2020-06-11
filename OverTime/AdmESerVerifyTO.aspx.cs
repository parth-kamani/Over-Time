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

public partial class AdmESerVerifyTO : System.Web.UI.Page
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
    protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList9.SelectedIndex = 0;
        TextBox22.Text = DropDownList4.SelectedValue.ToString();
        TextBox20.Text = null;
    }
    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList9.SelectedIndex = 0;
        TextBox21.Text = DropDownList3.SelectedValue.ToString();
        TextBox20.Text = null;
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList9.SelectedIndex = 0;
        TextBox21.Text = DropDownList2.SelectedValue.ToString();
        TextBox20.Text = null;
    }
    protected void DropDownList8_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList9.SelectedIndex = 0;
        TextBox21.Text = DropDownList8.SelectedValue.ToString();
        TextBox20.Text = null;
    }
    protected void DropDownList13_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList9.SelectedIndex = 0;
        TextBox21.Text = DropDownList13.SelectedValue.ToString();
        TextBox20.Text = null;
    }
    protected void DropDownList14_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList9.SelectedIndex = 0;
        TextBox21.Text = DropDownList14.SelectedValue.ToString();
        TextBox20.Text = null;
    }
    protected void DropDownList9_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
    protected void DropDownList15_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList9.SelectedIndex = 0;
        TextBox22.Text = DropDownList15.SelectedValue.ToString();
        TextBox20.Text = null;
    }
    protected void DropDownList16_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList9.SelectedIndex = 0;
        TextBox22.Text = DropDownList16.SelectedValue.ToString();
        TextBox20.Text = null;
    }
    protected void DropDownList17_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList9.SelectedIndex = 0;
        TextBox22.Text = DropDownList17.SelectedValue.ToString();
        TextBox20.Text = null;
    }
    protected void DropDownList18_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList9.SelectedIndex = 0;
        TextBox22.Text = DropDownList18.SelectedValue.ToString();
        TextBox20.Text = null;
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
            DropDownList9.SelectedValue = dr1[18].ToString();

            if (DropDownList21.SelectedIndex == 0)
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
            else if (DropDownList21.SelectedIndex == 1)
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
            else if (DropDownList21.SelectedIndex == 2)
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
            else if (DropDownList21.SelectedIndex == 3)
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
            else if (DropDownList21.SelectedIndex == 4)
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
            else if (DropDownList21.SelectedIndex == 5)
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
            else if (DropDownList21.SelectedIndex == 6)
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
            else if (DropDownList21.SelectedIndex == 7)
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
        else
        {
            TextBox1.Text = "hell";
        }
        mssqlconn.Close();
        dr1.Close();
    }
    protected void DropDownList9_SelectedIndexChanged1(object sender, EventArgs e)
    {
        TextBox20.Text = DropDownList9.SelectedValue.ToString();
        double frm, to, tim, temp;
        string from, too;
        double x = 1.0;
        string ded;
        ded = DropDownList9.SelectedValue.ToString();
        TextBox20.Text = ded;
        from = TextBox21.Text;
        too = TextBox22.Text;
        frm = Convert.ToDouble(from);
        to = Convert.ToDouble(too);

        if (TextBox20.Text == "Yes")
        {
            if (frm >= to)
            {
                Label1.Text = "From Time is Greater Than To Time.";
                Label1.Visible = true;
                Button2.Enabled = false;
            }
            else
            {
                temp = to - frm;
                tim = temp - x;

                if (tim <= 1.0)
                {
                    Label1.Text = "Over Time Should be More Than 1 Hr";
                    Label1.Visible = true;
                    Button2.Enabled = false;
                    TextBox17.Text = tim.ToString();
                }
                else
                {

                    Label1.Visible = false;
                    Button2.Enabled = true;
                    TextBox17.Text = tim.ToString();
                }
            }
        }
        else
        {
            if (frm >= to)
            {
                Label1.Text = "From Time is Greater Than To Time.";
                Label1.Visible = true;
                Button2.Enabled = false;
            }
            else
            {
                tim = to - frm;
                if (tim <= 1.0)
                {
                    Label1.Text = "Over Time Should be More Than 1 Hr";
                    Label3.Visible = true;
                    Button2.Enabled = false;
                    TextBox17.Text = tim.ToString();
                }
                else
                {
                    Label1.Visible = false;
                    Button2.Enabled = true;
                    TextBox17.Text = tim.ToString();
                }
            }
        }
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
        string str = DateTime.Today.ToString("MMMM");
        string str1 = DateTime.Today.Year.ToString();
        Label12.Text = str;
        Label13.Text = str1;
        Label3.Visible = false;
        if (DropDownList6.SelectedIndex == 1 || DropDownList6.SelectedIndex == 2)
        {
            mssqlconn.Open();
            string query1 = "update otentrytable set previousot = '" + DropDownList5.SelectedValue.ToString() + "', paidmonth = '" + DropDownList10.SelectedValue.ToString() + "', paidyear = '" + Label4.Text + "', authoperson = '" + Label1001.Text + "', toapprove = '" + DropDownList6.SelectedValue.ToString() + "', toremark='" + TextBox16.Text + "', toamnt = '" + Label12.Text + "', toayear = '" + Label13.Text + "' where srno='" + DropDownList20.SelectedValue.ToString() + "'";
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
            mssqlconn.Open();
            string qw = "select max(srno) from otallotable";
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
            if (DropDownList6.SelectedIndex == 1)
            {
                if (DropDownList1.SelectedIndex == 1)
                {
                    string str5 = "insert into otallotable values ('" + b.ToString() + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','" + TextBox17.Text + "','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','" + Label4.Text + "','0','" + DropDownList20.SelectedValue.ToString() +"')";
                    //  psno,name,department,sec,area,'" + TextBox8.Text + "','" + TextBox7.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "',
                    SqlCommand cmd5 = new SqlCommand(str5, mssqlconn);
                    int i = cmd5.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Label3.Text = "record inserted sucessfully";
                        mssqlconn.Close();
                    }
                    else
                    {
                        Label3.Text = "record not inserted sucessfully";
                        mssqlconn.Close();
                    }
                }
                else if (DropDownList1.SelectedIndex == 2)
                {
                    string str5 = "insert into otallotable values ('" + b.ToString() + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','0','" + TextBox17.Text + "','0','0','0','0','0','0','0','0','0','0','0','0','0','0','" + Label4.Text + "','0','" + DropDownList20.SelectedValue.ToString() + "')";
                    //  psno,name,department,sec,area,'" + TextBox8.Text + "','" + TextBox7.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "',
                    SqlCommand cmd5 = new SqlCommand(str5, mssqlconn);
                    int i = cmd5.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Label3.Text = "record inserted sucessfully";
                        mssqlconn.Close();
                    }
                    else
                    {
                        Label3.Text = "record not inserted sucessfully";
                        mssqlconn.Close();
                    }
                }
                else if (DropDownList1.SelectedIndex == 3)
                {
                    string str5 = "insert into otallotable values ('" + b.ToString() + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','0','0','" + TextBox17.Text + "','0','0','0','0','0','0','0','0','0','0','0','0','0','" + Label4.Text + "','0','" + DropDownList20.SelectedValue.ToString() + "')";
                    //  psno,name,department,sec,area,'" + TextBox8.Text + "','" + TextBox7.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "',
                    SqlCommand cmd5 = new SqlCommand(str5, mssqlconn);
                    int i = cmd5.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Label3.Text = "record inserted sucessfully";
                        mssqlconn.Close();
                    }
                    else
                    {
                        Label3.Text = "record not inserted sucessfully";
                        mssqlconn.Close();
                    }
                }
                else if (DropDownList1.SelectedIndex == 4)
                {
                    string str5 = "insert into otallotable values ('" + b.ToString() + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','0','0','0','" + TextBox17.Text + "','0','0','0','0','0','0','0','0','0','0','0','0','" + Label4.Text + "','0','" + DropDownList20.SelectedValue.ToString() + "')";
                    //  psno,name,department,sec,area,'" + TextBox8.Text + "','" + TextBox7.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "',
                    SqlCommand cmd5 = new SqlCommand(str5, mssqlconn);
                    int i = cmd5.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Label3.Text = "record inserted sucessfully";
                        mssqlconn.Close();
                    }
                    else
                    {
                        Label3.Text = "record not inserted sucessfully";
                        mssqlconn.Close();
                    }
                }
                else if (DropDownList1.SelectedIndex == 5)
                {
                    string str5 = "insert into otallotable values ('" + b.ToString() + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','0','0','0','0','" + TextBox17.Text + "','0','0','0','0','0','0','0','0','0','0','0','" + Label4.Text + "','0','" + DropDownList20.SelectedValue.ToString() + "')";
                    //  psno,name,department,sec,area,'" + TextBox8.Text + "','" + TextBox7.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "',
                    SqlCommand cmd5 = new SqlCommand(str5, mssqlconn);
                    int i = cmd5.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Label3.Text = "record inserted sucessfully";
                        mssqlconn.Close();
                    }
                    else
                    {
                        Label3.Text = "record not inserted sucessfully";
                        mssqlconn.Close();
                    }
                }
                else if (DropDownList1.SelectedIndex == 6)
                {
                    string str5 = "insert into otallotable values ('" + b.ToString() + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','0','0','0','0','0','" + TextBox17.Text + "','0','0','0','0','0','0','0','0','0','0','" + Label4.Text + "','0','" + DropDownList20.SelectedValue.ToString() + "')";
                    //  psno,name,department,sec,area,'" + TextBox8.Text + "','" + TextBox7.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "',
                    SqlCommand cmd5 = new SqlCommand(str5, mssqlconn);
                    int i = cmd5.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Label3.Text = "record inserted sucessfully";
                        mssqlconn.Close();
                    }
                    else
                    {
                        Label3.Text = "record not inserted sucessfully";
                        mssqlconn.Close();
                    }
                }
                else if (DropDownList1.SelectedIndex == 7)
                {
                    string str5 = "insert into otallotable values ('" + b.ToString() + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','0','0','0','0','0','0','" + TextBox17.Text + "','0','0','0','0','0','0','0','0','0','" + Label4.Text + "','0','" + DropDownList20.SelectedValue.ToString() + "')";
                    //  psno,name,department,sec,area,'" + TextBox8.Text + "','" + TextBox7.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "',
                    SqlCommand cmd5 = new SqlCommand(str5, mssqlconn);
                    int i = cmd5.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Label3.Text = "record inserted sucessfully";
                        mssqlconn.Close();
                    }
                    else
                    {
                        Label3.Text = "record not inserted sucessfully";
                        mssqlconn.Close();
                    }
                }
                else if (DropDownList1.SelectedIndex == 8)
                {
                    string str5 = "insert into otallotable values ('" + b.ToString() + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','0','0','0','0','0','0','0','" + TextBox17.Text + "','0','0','0','0','0','0','0','0','" + Label4.Text + "','0','" + DropDownList20.SelectedValue.ToString() + "')";
                    //  psno,name,department,sec,area,'" + TextBox8.Text + "','" + TextBox7.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "',
                    SqlCommand cmd5 = new SqlCommand(str5, mssqlconn);
                    int i = cmd5.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Label3.Text = "record inserted sucessfully";
                        mssqlconn.Close();
                    }
                    else
                    {
                        Label3.Text = "record not inserted sucessfully";
                        mssqlconn.Close();
                    }
                }
                else if (DropDownList1.SelectedIndex == 9)
                {
                    string str5 = "insert into otallotable values ('" + b.ToString() + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','0','0','0','0','0','0','0','0','" + TextBox17.Text + "','0','0','0','0','0','0','0','" + Label4.Text + "','0','" + DropDownList20.SelectedValue.ToString() + "')";
                    //  psno,name,department,sec,area,'" + TextBox8.Text + "','" + TextBox7.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "',
                    SqlCommand cmd5 = new SqlCommand(str5, mssqlconn);
                    int i = cmd5.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Label3.Text = "record inserted sucessfully";
                        mssqlconn.Close();
                    }
                    else
                    {
                        Label3.Text = "record not inserted sucessfully";
                        mssqlconn.Close();
                    }
                }
                else if (DropDownList1.SelectedIndex == 10)
                {
                    string str5 = "insert into otallotable values ('" + b.ToString() + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','0','0','0','0','0','0','0','0','0','" + TextBox17.Text + "','0','0','0','0','0','0','" + Label4.Text + "','0','" + DropDownList20.SelectedValue.ToString() + "')";
                    //  psno,name,department,sec,area,'" + TextBox8.Text + "','" + TextBox7.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "',
                    SqlCommand cmd5 = new SqlCommand(str5, mssqlconn);
                    int i = cmd5.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Label3.Text = "record inserted sucessfully";
                        mssqlconn.Close();
                    }
                    else
                    {
                        Label3.Text = "record not inserted sucessfully";
                        mssqlconn.Close();
                    }
                }
                else if (DropDownList1.SelectedIndex == 11)
                {
                    string str5 = "insert into otallotable values ('" + b.ToString() + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','0','0','0','0','0','0','0','0','0','0','" + TextBox17.Text + "','0','0','0','0','0','" + Label4.Text + "','0','" + DropDownList20.SelectedValue.ToString() + "')";
                    //  psno,name,department,sec,area,'" + TextBox8.Text + "','" + TextBox7.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "',
                    SqlCommand cmd5 = new SqlCommand(str5, mssqlconn);
                    int i = cmd5.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Label3.Text = "record inserted sucessfully";
                        mssqlconn.Close();
                    }
                    else
                    {
                        Label3.Text = "record not inserted sucessfully";
                        mssqlconn.Close();
                    }
                }
                else if (DropDownList1.SelectedIndex == 12)
                {
                    string str5 = "insert into otallotable values ('" + b.ToString() + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','0','0','0','0','0','0','0','0','0','0','0','" + TextBox17.Text + "','0','0','0','0','" + Label4.Text + "','0','" + DropDownList20.SelectedValue.ToString() + "')";
                    //  psno,name,department,sec,area,'" + TextBox8.Text + "','" + TextBox7.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "',
                    SqlCommand cmd5 = new SqlCommand(str5, mssqlconn);
                    int i = cmd5.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Label3.Text = "record inserted sucessfully";
                        mssqlconn.Close();
                    }
                    else
                    {
                        Label3.Text = "record not inserted sucessfully";
                        mssqlconn.Close();
                    }
                }
                else if (DropDownList1.SelectedIndex == 13)
                {
                    string str5 = "insert into otallotable values ('" + b.ToString() + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','0','0','0','0','0','0','0','0','0','0','0','0','" + TextBox17.Text + "','0','0','0','" + Label4.Text + "','0','" + DropDownList20.SelectedValue.ToString() + "')";
                    //  psno,name,department,sec,area,'" + TextBox8.Text + "','" + TextBox7.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "',
                    SqlCommand cmd5 = new SqlCommand(str5, mssqlconn);
                    int i = cmd5.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Label3.Text = "record inserted sucessfully";
                        mssqlconn.Close();
                    }
                    else
                    {
                        Label3.Text = "record not inserted sucessfully";
                        mssqlconn.Close();
                    }
                }
                else if (DropDownList1.SelectedIndex == 14)
                {
                    string str5 = "insert into otallotable values ('" + b.ToString() + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','0','0','0','0','0','0','0','0','0','0','0','0','0','" + TextBox17.Text + "','0','0','" + Label4.Text + "','0','" + DropDownList20.SelectedValue.ToString() + "')";
                    //  psno,name,department,sec,area,'" + TextBox8.Text + "','" + TextBox7.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "',
                    SqlCommand cmd5 = new SqlCommand(str5, mssqlconn);
                    int i = cmd5.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Label3.Text = "record inserted sucessfully";
                        mssqlconn.Close();
                    }
                    else
                    {
                        Label3.Text = "record not inserted sucessfully";
                        mssqlconn.Close();
                    }
                }
                else if (DropDownList1.SelectedIndex == 15)
                {
                    string str5 = "insert into otallotable values ('" + b.ToString() + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','0','0','0','0','0','0','0','0','0','0','0','0','0','0','" + TextBox17.Text + "','0','" + Label4.Text + "','0','" + DropDownList20.SelectedValue.ToString() + "')";
                    //  psno,name,department,sec,area,'" + TextBox8.Text + "','" + TextBox7.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "',
                    SqlCommand cmd5 = new SqlCommand(str5, mssqlconn);
                    int i = cmd5.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Label3.Text = "record inserted sucessfully";
                        mssqlconn.Close();
                    }
                    else
                    {
                        Label3.Text = "record not inserted sucessfully";
                        mssqlconn.Close();
                    }
                }
                else if (DropDownList1.SelectedIndex == 16)
                {
                    string str5 = "insert into otallotable values ('" + b.ToString() + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','" + TextBox17.Text + "','" + Label4.Text + "','0','" + DropDownList20.SelectedValue.ToString() + "')";
                    //  psno,name,department,sec,area,'" + TextBox8.Text + "','" + TextBox7.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "',
                    SqlCommand cmd5 = new SqlCommand(str5, mssqlconn);
                    int i = cmd5.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Label3.Text = "record inserted sucessfully";
                        mssqlconn.Close();
                    }
                    else
                    {
                        Label3.Text = "record not inserted sucessfully";
                        mssqlconn.Close();
                    }
                }
                else
                {
                    Label1.Text = "No records";
                }
                mssqlconn.Close();
                mssqlconn.Open();
                string lk = "select max(srno) from otmnthtable";
                SqlCommand lkj = new SqlCommand(lk, mssqlconn);
                SqlDataReader lkjh = lkj.ExecuteReader();
                lkjh.Read();
                g = 0;
                h = 0;
                v = 1;
                g = Convert.ToInt32(lkjh[0].ToString());
                h = g + v;
                h.ToString();
                mssqlconn.Close();
                mssqlconn.Open();
                if(DropDownList10.SelectedIndex == 1)
                {
                    string str6 = "insert into otmnthtable values ('" + h.ToString() + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','0','0','0','0','0','0','0','0','0','" + TextBox17.Text + "','0','0','" + Label4.Text + "','0','" + DropDownList20.SelectedValue.ToString() + "')";
                    //  psno,name,department,sec,area,'" + TextBox8.Text + "','" + TextBox7.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "',
                    SqlCommand cmd6 = new SqlCommand(str6, mssqlconn);
                    int i = cmd6.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Label3.Text = "record inserted sucessfully";
                        mssqlconn.Close();
                    }
                    else
                    {
                        Label3.Text = "record not inserted sucessfully";
                        mssqlconn.Close();
                    }
                }
                else if (DropDownList10.SelectedIndex == 2)
                {
                    string str6 = "insert into otmnthtable values ('" + h.ToString() + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','0','0','0','0','0','0','0','0','0','0','" + TextBox17.Text + "','0','" + Label4.Text + "','0','" + DropDownList20.SelectedValue.ToString() + "')";
                    //  psno,name,department,sec,area,'" + TextBox8.Text + "','" + TextBox7.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "',
                    SqlCommand cmd6 = new SqlCommand(str6, mssqlconn);
                    int i = cmd6.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Label3.Text = "record inserted sucessfully";
                        mssqlconn.Close();
                    }
                    else
                    {
                        Label3.Text = "record not inserted sucessfully";
                        mssqlconn.Close();
                    }
                }
                else if (DropDownList10.SelectedIndex == 3)
                {
                    string str6 = "insert into otmnthtable values ('" + h.ToString() + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','0','0','0','0','0','0','0','0','0','0','0','" + TextBox17.Text + "','" + Label4.Text + "','0','" + DropDownList20.SelectedValue.ToString() + "')";
                    //  psno,name,department,sec,area,'" + TextBox8.Text + "','" + TextBox7.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "',
                    SqlCommand cmd6 = new SqlCommand(str6, mssqlconn);
                    int i = cmd6.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Label3.Text = "record inserted sucessfully";
                        mssqlconn.Close();
                    }
                    else
                    {
                        Label3.Text = "record not inserted sucessfully";
                        mssqlconn.Close();
                    }
                }
                else if (DropDownList10.SelectedIndex == 4)
                {
                    string str6 = "insert into otmnthtable values ('" + h.ToString() + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','" + TextBox17.Text + "','0','0','0','0','0','0','0','0','0','0','0','" + Label4.Text + "','0','" + DropDownList20.SelectedValue.ToString() + "')";
                    //  psno,name,department,sec,area,'" + TextBox8.Text + "','" + TextBox7.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "',
                    SqlCommand cmd6 = new SqlCommand(str6, mssqlconn);
                    int i = cmd6.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Label3.Text = "record inserted sucessfully";
                        mssqlconn.Close();
                    }
                    else
                    {
                        Label3.Text = "record not inserted sucessfully";
                        mssqlconn.Close();
                    }
                }
                else if (DropDownList10.SelectedIndex == 5)
                {
                    string str6 = "insert into otmnthtable values ('" + h.ToString() + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','0','" + TextBox17.Text + "','0','0','0','0','0','0','0','0','0','0','" + Label4.Text + "','0','" + DropDownList20.SelectedValue.ToString() + "')";
                    //  psno,name,department,sec,area,'" + TextBox8.Text + "','" + TextBox7.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "',
                    SqlCommand cmd6 = new SqlCommand(str6, mssqlconn);
                    int i = cmd6.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Label3.Text = "record inserted sucessfully";
                        mssqlconn.Close();
                    }
                    else
                    {
                        Label3.Text = "record not inserted sucessfully";
                        mssqlconn.Close();
                    }
                }
                else if (DropDownList10.SelectedIndex == 6)
                {
                    string str6 = "insert into otmnthtable values ('" + h.ToString() + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','0','0','" + TextBox17.Text + "','0','0','0','0','0','0','0','0','0','" + Label4.Text + "','0','" + DropDownList20.SelectedValue.ToString() + "')";
                    //  psno,name,department,sec,area,'" + TextBox8.Text + "','" + TextBox7.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "',
                    SqlCommand cmd6 = new SqlCommand(str6, mssqlconn);
                    int i = cmd6.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Label3.Text = "record inserted sucessfully";
                        mssqlconn.Close();
                    }
                    else
                    {
                        Label3.Text = "record not inserted sucessfully";
                        mssqlconn.Close();
                    }
                }
                else if (DropDownList10.SelectedIndex == 7)
                {
                    string str6 = "insert into otmnthtable values ('" + h.ToString() + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','0','0','0','" + TextBox17.Text + "''0','0','0','0','0','0','0','0','" + Label4.Text + "','0','" + DropDownList20.SelectedValue.ToString() + "')";
                    //  psno,name,department,sec,area,'" + TextBox8.Text + "','" + TextBox7.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "',
                    SqlCommand cmd6 = new SqlCommand(str6, mssqlconn);
                    int i = cmd6.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Label3.Text = "record inserted sucessfully";
                        mssqlconn.Close();
                    }
                    else
                    {
                        Label3.Text = "record not inserted sucessfully";
                        mssqlconn.Close();
                    }
                }
                else if (DropDownList10.SelectedIndex == 8)
                {
                    string str6 = "insert into otmnthtable values ('" + h.ToString() + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','0','0','0','0','" + TextBox17.Text + "','0','0','0','0','0','0','0','" + Label4.Text + "','0','" + DropDownList20.SelectedValue.ToString() + "')";
                    //  psno,name,department,sec,area,'" + TextBox8.Text + "','" + TextBox7.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "',
                    SqlCommand cmd6 = new SqlCommand(str6, mssqlconn);
                    int i = cmd6.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Label3.Text = "record inserted sucessfully";
                        mssqlconn.Close();
                    }
                    else
                    {
                        Label3.Text = "record not inserted sucessfully";
                        mssqlconn.Close();
                    }
                }
                else if (DropDownList10.SelectedIndex == 9)
                {
                    string str6 = "insert into otmnthtable values ('" + h.ToString() + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','0','0','0','0','0','" + TextBox17.Text + "','0','0','0','0','0','0','" + Label4.Text + "','0','" + DropDownList20.SelectedValue.ToString() + "')";
                    //  psno,name,department,sec,area,'" + TextBox8.Text + "','" + TextBox7.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "',
                    SqlCommand cmd6 = new SqlCommand(str6, mssqlconn);
                    int i = cmd6.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Label3.Text = "record inserted sucessfully";
                        mssqlconn.Close();
                    }
                    else
                    {
                        Label3.Text = "record not inserted sucessfully";
                        mssqlconn.Close();
                    }
                }
                else if (DropDownList10.SelectedIndex == 10)
                {
                    string str6 = "insert into otmnthtable values ('" + h.ToString() + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','0','0','0','0','0','0','" + TextBox17.Text + "','0','0','0','0','0','" + Label4.Text + "','0','" + DropDownList20.SelectedValue.ToString() + "')";
                    //  psno,name,department,sec,area,'" + TextBox8.Text + "','" + TextBox7.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "',
                    SqlCommand cmd6 = new SqlCommand(str6, mssqlconn);
                    int i = cmd6.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Label3.Text = "record inserted sucessfully";
                        mssqlconn.Close();
                    }
                    else
                    {
                        Label3.Text = "record not inserted sucessfully";
                        mssqlconn.Close();
                    }
                }
                else if (DropDownList10.SelectedIndex == 11)
                {
                    string str6 = "insert into otmnthtable values ('" + h.ToString() + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','0','0','0','0','0','0','0','" + TextBox17.Text + "','0','0','0','0','" + Label4.Text + "','0','" + DropDownList20.SelectedValue.ToString() + "')";
                    //  psno,name,department,sec,area,'" + TextBox8.Text + "','" + TextBox7.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "',
                    SqlCommand cmd6 = new SqlCommand(str6, mssqlconn);
                    int i = cmd6.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Label3.Text = "record inserted sucessfully";
                        mssqlconn.Close();
                    }
                    else
                    {
                        Label3.Text = "record not inserted sucessfully";
                        mssqlconn.Close();
                    }
                }
                else if (DropDownList10.SelectedIndex == 12)
                {
                    string str6 = "insert into otmnthtable values ('" + h.ToString() + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','0','0','0','0','0','0','0','0','" + TextBox17.Text + "','0','0','0','" + Label4.Text + "','0','" + DropDownList20.SelectedValue.ToString() + "')";
                    //  psno,name,department,sec,area,'" + TextBox8.Text + "','" + TextBox7.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "',
                    SqlCommand cmd6 = new SqlCommand(str6, mssqlconn);
                    int i = cmd6.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Label3.Text = "record inserted sucessfully";
                        mssqlconn.Close();
                    }
                    else
                    {
                        Label3.Text = "record not inserted sucessfully";
                        mssqlconn.Close();
                    }
                }
                else
                {
                    Label1.Text = "No records";
                }
                mssqlconn.Close();
            }
            else if (DropDownList6.SelectedIndex == 2)
            {
                mssqlconn.Open();
                string sql = "select * from depthead where dept='" + TextBox5.Text + "'";
                SqlCommand cmd = new SqlCommand(sql, mssqlconn);
                SqlDataReader dr = cmd.ExecuteReader();
                if (TextBox5.Text != null)
                {
                    if (dr.Read() == true)
                    {
                        Label5.Text = dr[2].ToString();
                        if (Label5.Text != null)
                        {
                            string to1 = Label5.Text;
                            string from1 = "overtime.alert@gmail.com";
                            string pas = "parth@overtime";
                            string sub = "Over Time Not Approved.";
                            //string body = " Employee Details <BR><BR> Name:" + TextBox19.Text + " <BR> Department: " + TextBox18.Text + " <BR>  O.T Shift: " + DropDownList12.SelectedValue.ToString() + " <BR> Date: " + TextBox9.Text + " <BR> Total Hours Worked: " + TextBox17.Text + " ";
                            using (MailMessage mm = new MailMessage(from1, to1))
                            {
                                mm.Subject = sub;
                                mm.Body = " Over Time Details " + Environment.NewLine + Environment.NewLine + "Your Department Employees's Over Time has been not Approved." + Environment.NewLine + Environment.NewLine + " Name:" + TextBox2.Text + Environment.NewLine + Environment.NewLine + " PS No.:" + TextBox1.Text + Environment.NewLine + Environment.NewLine + " Section: " + TextBox6.Text + Environment.NewLine + Environment.NewLine + " Sr No.:" + DropDownList20.SelectedValue.ToString() + Environment.NewLine + Environment.NewLine + "";
                                mm.IsBodyHtml = false;
                                SmtpClient smtp = new SmtpClient();
                                smtp.Host = "smtp.gmail.com";
                                smtp.EnableSsl = true;
                                NetworkCredential NetworkCred = new NetworkCredential(from1, pas);
                                smtp.UseDefaultCredentials = true;
                                smtp.Credentials = NetworkCred;
                                smtp.Port = 587;
                                smtp.Send(mm);
                            }
                            mssqlconn.Close();
                            Response.Redirect("AdmESerVerifyTO.aspx");
                        }
                    }
                    else
                    {
                        Label1.Text = "Incorrect Username";
                        Label1.Visible = true;
                    }

                }
            }
        }

        else if (DropDownList6.SelectedIndex == 3)
        {
            mssqlconn.Open();
            string query = "update otentrytable set previousot = '" + DropDownList5.SelectedValue.ToString() + "', paidmonth = '" + DropDownList10.SelectedValue.ToString() + "', paidyear = '" + Label4.Text + "', authoperson = '" + Label1001.Text + "', toapprove = '" + DropDownList6.SelectedValue.ToString() + "', toremark='" + TextBox16.Text + "', toamnt = '" + Label12.Text + "', toayear = '" + Label13.Text + "' where srno='" + DropDownList20.SelectedValue.ToString() + "'";

            SqlCommand cmd3 = new SqlCommand(query, mssqlconn);
            int flg;
            flg = cmd3.ExecuteNonQuery();
            if (flg > 0)
            {
                string query1 = "insert into delrecord values (" + DropDownList20.SelectedValue.ToString() + ",'" + Session["User"].ToString() + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox5.Text + "','" + TextBox3.Text + "','" + TextBox12.Text + "','" + TextBox13.Text + "','" + TextBox8.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','" + TextBox9.Text + "','" + DropDownList1.SelectedValue.ToString() + "','" + TextBox4.Text + "','" + TextBox14.Text + "','" + TextBox21.Text + "','" + TextBox22.Text + "','" + TextBox17.Text + "','" + DropDownList9.SelectedValue + "','" + TextBox11.Text + "','" + TextBox15.Text + "','" + DropDownList5.SelectedItem.ToString() + "','" + DropDownList10.SelectedItem.ToString() + "','" + DropDownList11.SelectedItem.ToString() + "','" + Label1001.Text + "','" + DropDownList6.SelectedItem.ToString() + "','"+TextBox16.Text+"','"+Label12.Text+"','"+Label13.Text+"')";

                SqlCommand cmd4 = new SqlCommand(query1, mssqlconn);
                int flg2;
                flg2 = cmd4.ExecuteNonQuery();
                if (flg2 > 0)
                {
                    Label3.Text = "Record deleted Sucessfully";
                    Label3.Visible = true;
                    mssqlconn.Close();
                    mssqlconn.Open();
                    string query2 = "select * from otentrytable where srno=" + DropDownList20.SelectedValue.ToString() + " ";
                    SqlCommand cmd5 = new SqlCommand(query2, mssqlconn);
                    SqlDataReader dr = cmd5.ExecuteReader();
                    if (dr.Read() == true)
                    {
                        string query3 = "delete from [otentrytable] where srno=" + DropDownList20.SelectedValue.ToString() + " ";
                        SqlCommand cmd6 = new SqlCommand(query3, mssqlconn);
                        dr.Close();
                        cmd6.ExecuteNonQuery();
                    }
                    mssqlconn.Close();
                    Response.Redirect("AdmESerVerifyTO.aspx");
                }
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
        mssqlconn.Open();
        string sql1 = "select * from edit_year where yearnme ='" + DropDownList11.SelectedValue.ToString() + "'";
        SqlCommand cmd1 = new SqlCommand(sql1, mssqlconn);
        SqlDataReader dr1 = cmd1.ExecuteReader();
        if (dr1.Read() == true)
        {
            Label4.Text = dr1[0].ToString();
        }
        mssqlconn.Close();
        if (Convert.ToInt32(Label4.Text) > DateTime.Today.Year)
        {
            Label1.Text = "Year Should be Greater then or Equal to Current Month.";
            Label1.Visible = true;
        }

        else
        {
            if (DropDownList10.SelectedIndex < DateTime.Today.Month)
            {
                Label1.Text = "Month Should be Greater then or Equal to Current Month.";
                Label1.Visible = true;
            }
            else
            {
                Label1.Visible = false;
            }
        }
    }
    protected void TextBox16_TextChanged(object sender, EventArgs e)
    {
        Button2.Enabled = true;
    }
}