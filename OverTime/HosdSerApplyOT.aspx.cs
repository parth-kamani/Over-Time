using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class HosdSerApplyOT : System.Web.UI.Page
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
                    TextBox9.Attributes["min"] = DateTime.Now.AddDays(-45).ToString("yyyy-MM-dd");
                    TextBox9.Attributes["max"] = DateTime.Now.AddDays(5).ToString("yyyy-MM-dd");
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
    protected void DropDownList10_SelectedIndexChanged(object sender, EventArgs e)
    {
        mssqlconn.Open();
        string sql = "select * from wbempentry where psno='" + DropDownList10.Text + "'";


        SqlCommand cmd = new SqlCommand(sql, mssqlconn);


        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read() == true)
        {
            TextBox19.Text = dr[2].ToString();
            TextBox3.Text = dr[4].ToString();
        }
        else
        {
            RequiredFieldValidator2.Text = " NO Record";
            RequiredFieldValidator2.Visible = true;
        }
        dr.Close();

        string sql2 = "select * from costmaster where dept='" + TextBox18.Text + "'";
        SqlCommand cmd2 = new SqlCommand(sql2, mssqlconn);
        SqlDataReader dr2 = cmd2.ExecuteReader();
        if (dr2.Read() == true)
        {
            TextBox1.Text = dr2[2].ToString();
        }
        else
        {
            RequiredFieldValidator7.Text = " NO Record";
            RequiredFieldValidator7.Visible = true;
        }
        dr2.Close();
        mssqlconn.Close();
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
        if (DropDownList1.SelectedIndex == 7)
        {
            Label5.Visible = true;
            Label6.Visible = true;
            DropDownList7.Visible = true;
            TextBox4.Visible = true;
        }
        else
        {
            Label5.Visible = false;
            Label6.Visible = false;
            DropDownList7.Visible = false;
            TextBox4.Visible = false;
        }
    }
    protected void DropDownList7_SelectedIndexChanged(object sender, EventArgs e)
    {
        mssqlconn.Open();
        string sql = "select * from wbempentry where psno='" + DropDownList7.Text + "'";

        SqlCommand cmd = new SqlCommand(sql, mssqlconn);

        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read() == true)
        {
            TextBox4.Text = dr[2].ToString();
        }
        else
        {
            RequiredFieldValidator2.Text = " NO Record";
            RequiredFieldValidator2.Visible = true;
        }
        dr.Close();
    }
    protected void DropDownList12_SelectedIndexChanged(object sender, EventArgs e)
    {
        TextBox20.Text = null;
        TextBox20.Text = DropDownList9.SelectedValue.ToString();
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
            DropDownList14.SelectedValue = "0.5";
            DropDownList18.SelectedValue = "0.5";
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
            DropDownList3.SelectedValue = "6";
            DropDownList4.SelectedValue = "6";
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
            DropDownList2.SelectedValue = "14";
            DropDownList15.SelectedValue = "14";
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
            DropDownList8.SelectedValue = "22";
            DropDownList16.SelectedValue = "22";
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
            DropDownList13.SelectedValue = "8.5";
            DropDownList17.SelectedValue = "8.5";
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
            DropDownList14.SelectedValue = "0.5";
            DropDownList18.SelectedValue = "0.5";
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
            DropDownList14.SelectedValue = "0.5";
            DropDownList18.SelectedValue = "0.5";
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
            DropDownList14.SelectedValue = "0.5";
            DropDownList18.SelectedValue = "0.5";
            DropDownList14.Visible = true;
            DropDownList18.Visible = true;
            TextBox21.Text = null;
            TextBox22.Text = null;
            TextBox21.Text = DropDownList14.SelectedValue.ToString();
            TextBox22.Text = DropDownList18.SelectedValue.ToString();
        }
    }


    protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList9.ClearSelection();
        TextBox22.Text = null;
        string sel2;
        sel2 = DropDownList4.SelectedValue.ToString();
        TextBox22.Text = sel2;
    }
    protected void Button2_Click12(object sender, EventArgs e)
    {
        Label3.Visible = false;
        mssqlconn.Open();
        string str = "select max(srno) from otentrytable";

        SqlCommand cmd3 = new SqlCommand(str, mssqlconn);
        SqlDataReader dr7 = cmd3.ExecuteReader();

        dr7.Read();
        a = Convert.ToInt32(dr7[0].ToString());
        b = a + c;
        b.ToString();
        mssqlconn.Close();

        mssqlconn.Open();

        string query = "insert into otentrytable values ('" + b.ToString() + "','" + Label1001.Text + "','" + DropDownList10.SelectedValue.ToString() + "','" + TextBox19.Text + "','" + TextBox18.Text + "','" + TextBox3.Text + "','" + DropDownList11.SelectedValue + "','" + DropDownList12.SelectedValue + "','" + TextBox1.Text + "','" + DropDownList5.SelectedValue + "','" + DropDownList6.SelectedValue + "','" + TextBox9.Text + "','" + DropDownList1.SelectedValue + "','" + DropDownList7.SelectedValue + "','" + TextBox4.Text + "','" + TextBox21.Text + "','" + TextBox22.Text + "','" + TextBox17.Text + "','" + DropDownList9.SelectedValue + "','" + TextBox11.Text + "','" + TextBox2.Text + "','" + Label4.Text + "','" + Label7.Text + "','','','','','"+ Label8.Text +"','','','')";
        cmd3 = new SqlCommand(query, mssqlconn);
        int flg;
        flg = cmd3.ExecuteNonQuery();
        if (flg > 0)
        {
            Label3.Text = "Your O.T Has Been Applied";
            Label3.Visible = true;
            mssqlconn.Close();

        }
        else
        {
            Label3.Text = "Record not Inserted Sucessfully";
            Label3.Visible = true;
            mssqlconn.Close();
        }

    }
    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList9.ClearSelection();
        TextBox21.Text = null;
        string sel1;
        sel1 = DropDownList3.SelectedValue.ToString();
        TextBox21.Text = sel1;
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList9.ClearSelection();
        TextBox21.Text = null;
        string sel1;
        sel1 = DropDownList2.SelectedValue.ToString();
        TextBox21.Text = sel1;
    }
    protected void DropDownList8_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList9.ClearSelection();
        TextBox21.Text = null;
        string sel1;
        sel1 = DropDownList8.SelectedValue.ToString();
        TextBox21.Text = sel1;
    }
    protected void DropDownList13_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList9.ClearSelection();
        TextBox21.Text = null;
        string sel1;
        sel1 = DropDownList13.SelectedValue.ToString();
        TextBox21.Text = sel1;
    }
    protected void DropDownList14_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList9.ClearSelection();
        TextBox21.Text = null;
        string sel1;
        sel1 = DropDownList14.SelectedValue.ToString();
        TextBox21.Text = sel1;
    }
    protected void DropDownList9_SelectedIndexChanged(object sender, EventArgs e)
    {
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
                Label3.Text = "From Time is Greater Than To Time.";
                Label3.Visible = true;
                Button2.Enabled = false;
            }
            else
            {
                temp = to - frm;
                tim = temp - x;

                if (tim <= 1.0)
                {
                    Label3.Text = "Over Time Should be More Than 1 Hr";
                    Label3.Visible = true;
                    Button2.Enabled = false;
                    TextBox17.Text = tim.ToString();
                }
                else
                {

                    Label3.Visible = false;
                    Button2.Enabled = true;
                    TextBox17.Text = tim.ToString();
                }
            }
        }
        else
        {
            tim = to - frm;
            if (tim <= 1.0)
            {
                Label3.Text = "Over Time Should be More Than 1 Hr";
                Label3.Visible = true;
                Button2.Enabled = false;
                TextBox17.Text = tim.ToString();
            }
            else
            {
                Label3.Visible = false;
                Button2.Enabled = true;
                TextBox17.Text = tim.ToString();
            }
        }
    }
    protected void DropDownList15_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList9.ClearSelection();
        TextBox22.Text = null;
        string sel2;
        sel2 = DropDownList15.SelectedValue.ToString();
        TextBox22.Text = sel2;
    }
    protected void DropDownList16_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList9.ClearSelection();
        TextBox22.Text = null;
        string sel2;
        sel2 = DropDownList16.SelectedValue.ToString();
        TextBox22.Text = sel2;
    }
    protected void DropDownList17_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList9.ClearSelection();
        TextBox22.Text = null;
        string sel2;
        sel2 = DropDownList17.SelectedValue.ToString();
        TextBox22.Text = sel2;
    }
    protected void DropDownList18_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList9.ClearSelection();
        TextBox22.Text = null;
        string sel2;
        sel2 = DropDownList18.SelectedValue.ToString();
        TextBox22.Text = sel2;
    }
    /*protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {
        if (DropDownList1.SelectedIndex == 1)
        {
            if (TextBox9.Text < System.DateTime.Today.ToString())
            {
                Label3.Text = "Please Select The Proper Date If TOu Have Planned O.T";
                Label3.Visible = true;
            }
        }
        else
        {
        }

    }*/
}