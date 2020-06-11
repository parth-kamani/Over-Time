using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class MainHome : System.Web.UI.Page
{
    SqlConnection mssqlconn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button2_Click1(object sender, EventArgs e)
    {
        if (CheckBox1.Checked == true)
        {
            mssqlconn.Open();
            string sql = "select * from adminmaster where psno='" + TextBox1.Text + "' and pwd ='" + TextBox2.Text + "'";
            SqlCommand cmd = new SqlCommand(sql, mssqlconn);
            SqlDataReader dr = cmd.ExecuteReader();
            if (TextBox1.Text != null && TextBox2.Text != null)
            {
                if (dr.Read() == true)
                {
                    TextBox1.Text = dr[1].ToString();
                    Session["User"] = dr[7].ToString();
                    TextBox2.Text = dr[5].ToString();
                    if (TextBox2.Text == "Admin")
                    {
                        Response.Redirect("AdmHome.aspx");
                    }
                    else
                    {
                        Response.Redirect("MainHome.aspx?Home%Login");
                    }
                }
                else
                {
                    RequiredFieldValidator2.Visible = true;
                }

            }
            else
            {
                RequiredFieldValidator1.Visible = true;
            }
            mssqlconn.Close();
        }
        else
        {
            mssqlconn.Open();
            string sql = "select * from staff_entry where psno='" + TextBox1.Text + "' and pwd ='" + TextBox2.Text + "'";
            SqlCommand cmd = new SqlCommand(sql, mssqlconn);
            SqlDataReader dr = cmd.ExecuteReader();
            if (TextBox1.Text != null && TextBox2.Text != null)
            {
                if (dr.Read() == true)
                {
                    TextBox1.Text = dr[1].ToString();
                    Session["User"] = dr[1].ToString();
                    TextBox2.Text = dr[8].ToString();
                    if (TextBox2.Text == "Yes")
                    {
                        Response.Redirect("HosdHome.aspx");
                    }
                    else
                    {
                        Response.Redirect("NorHome.aspx");
                    }
                }
                else
                {
                    RequiredFieldValidator2.Visible = true;
                }

            }
            else
            {
                RequiredFieldValidator1.Visible = true;
            }
            mssqlconn.Close();
        }
    }
}