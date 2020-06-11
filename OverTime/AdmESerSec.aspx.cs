using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AdmESerSec : System.Web.UI.Page
{
    SqlConnection mssqlconn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    int a, b, c = 1;
    protected void Page_Load(object sender, EventArgs e)
    {
        TextBox4.Visible = false;
        TextBox5.Visible = false;
        TextBox6.Visible = false;
        Label2.Visible = false;
        Label3.Visible = false;
        Label4.Visible = false;
        Label1.Visible = false;
        GridView2.Visible = true;
        //TextBox4.ReadOnly = false;

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
                    Button1.Enabled = false;
                    Button2.Enabled = false;
                    Button3.Enabled = false;
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
        if (DropDownList1.SelectedIndex == 0)
        {
            GridView1.Visible = false;
            GridView2.Visible = true;
        }
        else
        {
            GridView1.Visible = true;
            GridView2.Visible = false;
        }
    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        //Label6.Text = DropDownList2.SelectedItem.ToString();
        //string Check = DropDownList2.SelectedItem.Text;
        if (DropDownList2.SelectedIndex == 1)
        {
            TextBox4.Text = null;
            TextBox5.Text = null;
            TextBox6.Text = null;
            Label2.Visible = true;
            TextBox4.Visible = true;
            Label3.Visible = true;
            TextBox5.Visible = true;
            Label4.Visible = true;
            TextBox6.Visible = true;
            GridView1.Visible = true;
            GridView2.Visible = false;
            Button1.Enabled = true;
            TextBox4.ReadOnly = false;
            Button2.Enabled = false;
            Button3.Enabled = false;
        }
        else
        {
            GridView1.Visible = true;
            GridView2.Visible = false;
            Button1.Enabled = false;
            Button2.Enabled = true;
            Button3.Enabled = true;
            mssqlconn.Open();
            string str = "select * from deptsec where dept='" + DropDownList1.SelectedValue + "' and sec='" + DropDownList2.SelectedValue + "'";


            SqlCommand cmd3 = new SqlCommand(str, mssqlconn);
            SqlDataReader dr7 = cmd3.ExecuteReader();

            if (dr7.Read() == true)
            {
                TextBox4.ReadOnly = true;
                TextBox4.Text = dr7[2].ToString();
                TextBox5.Text = dr7[3].ToString();
                TextBox6.Text = dr7[4].ToString();
                Button1.Enabled = false;
                Button2.Enabled = true;
                Button3.Enabled = true;
            }
            else
            {
                Button1.Enabled = true;
                TextBox4.Text = null;
                TextBox5.Text = null;
                TextBox6.Text = null;
                Button2.Enabled = false;
                Button3.Enabled = false;
                TextBox4.ReadOnly = false;
            }
            mssqlconn.Close();

            Label2.Visible = true;
            TextBox4.Visible = true;
            Label3.Visible = true;
            TextBox5.Visible = true;
            Label4.Visible = true;
            TextBox6.Visible = true;
        }
    }
    protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        GridView1.Visible = true;
        GridView2.Visible = false;
        DropDownList2.ClearSelection();
        DropDownList2.Items.Clear();
        DropDownList2.Items.Insert(0, "");
        DropDownList2.Items.Insert(1, "--Add Section--");
        /*DropDownList2.Items.Insert(0, new ListItem("", "0"));
        DropDownList2.Items.Insert(1, new ListItem("--Add Section--", "1"));*/
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex == 0)
        {
            if (DropDownList2.SelectedIndex == 0)
            {
                Label1.Text = "Compelete All The Details";
                Label1.Visible = true;
                DropDownList1.SelectedIndex = 0;
                DropDownList2.SelectedIndex = 0;
                TextBox4.Text = null;
                TextBox5.Text = null;
                TextBox6.Text = null;
            }
        }
        else
        {
            if (DropDownList2.SelectedIndex == 1)
            {

                if (TextBox4.Text != null && TextBox5.Text != null && TextBox6.Text != null)
                {

                    mssqlconn.Open();
                    string str = "select max(srno) from deptsec";

                    SqlCommand cmd3 = new SqlCommand(str, mssqlconn);
                    SqlDataReader dr7 = cmd3.ExecuteReader();

                    dr7.Read();
                    a = Convert.ToInt32(dr7[0].ToString());
                    b = a + c;
                    b.ToString();
                    mssqlconn.Close();

                    Label1.Visible = false;
                    Button1.Enabled = true;
                    mssqlconn.Open();

                    string query = "insert into deptsec values (" + b.ToString() + ",'" + DropDownList1.SelectedValue + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "')";
                    SqlCommand cmd4 = new SqlCommand(query, mssqlconn);
                    int flg = cmd4.ExecuteNonQuery();
                    if (flg > 0)
                    {
                        Label1.Text = "Record Has Added Sucessfully";
                        Label1.Visible = true;
                        DropDownList1.SelectedIndex = 0;
                        DropDownList2.SelectedIndex = 0;
                        TextBox4.Text = null;
                        TextBox5.Text = null;
                        TextBox6.Text = null;
                        mssqlconn.Close();
                    }
                    else
                    {
                        Label1.Text = "Record Not Added Sucessfully";
                        Label1.Visible = true;
                        DropDownList1.SelectedIndex = 0;
                        DropDownList2.SelectedIndex = 0;
                        TextBox4.Text = null;
                        TextBox5.Text = null;
                        TextBox6.Text = null;
                        mssqlconn.Close();
                    }
                }
                else
                {

                    Label1.Text = "Compelete All The Details";
                    Label1.Visible = true;
                    Button1.Enabled = false;
                    GridView2.Visible = false;
                    DropDownList1.SelectedIndex = 0;
                    DropDownList2.SelectedIndex = 0;
                    TextBox4.Text = null;
                    TextBox5.Text = null;
                    TextBox6.Text = null;
                }
            }
            else
            {
                Button1.Enabled = false;
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        mssqlconn.Open();

        string query = "update deptsec set hosname = '" + TextBox5.Text + "', hosemail = '" + TextBox6.Text + "' where dept='" + DropDownList1.SelectedValue + "' and sec = '" + DropDownList2.SelectedValue + "'";
        SqlCommand cmd4 = new SqlCommand(query, mssqlconn);
        int flg = cmd4.ExecuteNonQuery();
        if (flg > 0)
        {
            Label1.Text = "Record Has Sucessfully Updated";
            Label1.Visible = true;
            DropDownList1.SelectedIndex = 0;
            DropDownList2.SelectedIndex = 0;
            TextBox4.Text = null;
            TextBox5.Text = null;
            TextBox6.Text = null;
            mssqlconn.Close();
            Button1.Enabled = true;
            GridView1.Visible = true;
            GridView2.Visible = false;
        }
        else
        {
            Label1.Text = "Only Section Name of department Cannot Be Updated";
            Label1.Visible = true;
            Button1.Enabled = true;
            DropDownList1.SelectedIndex = 0;
            DropDownList2.SelectedIndex = 0;
            TextBox4.Text = null;
            TextBox5.Text = null;
            TextBox6.Text = null;
            mssqlconn.Close();
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        mssqlconn.Open();
        string str = "delete from deptsec where dept='" + DropDownList1.SelectedValue + "' and sec='" + DropDownList2.SelectedValue + "'";


        SqlCommand cmd3 = new SqlCommand(str, mssqlconn);
        int i = cmd3.ExecuteNonQuery();
        if (i > 0)
        {
            Label1.Text = "Record delete Sucessfully";
            Label1.Visible = true;
            DropDownList1.SelectedIndex = 0;
            DropDownList2.SelectedIndex = 0;
            TextBox4.Text = null;
            TextBox5.Text = null;
            TextBox6.Text = null;
            mssqlconn.Close();
            Button1.Enabled = true;
            GridView1.Visible = true;
            GridView2.Visible = false;
        }

        else
        {
            Label1.Text = "Record not delete Sucessfully";
            Label1.Visible = true;
            Button1.Enabled = true;
            DropDownList1.SelectedIndex = 0;
            DropDownList2.SelectedIndex = 0;
            TextBox4.Text = null;
            TextBox5.Text = null;
            TextBox6.Text = null;
            mssqlconn.Close();
        }
    }
}
