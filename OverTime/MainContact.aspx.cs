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

public partial class MainContact : System.Web.UI.Page
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
                    Label7.Visible = true;
                }

            }
            else
            {
                Label8.Visible = true;
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
                    Label8.Visible = true;
                }

            }
            else
            {
                Label7.Visible = true;
            }
            mssqlconn.Close();
        }
    }
    
    protected void Button1_Click(object sender, EventArgs e)
    {
        string to1 = "overtime.alert@gmail.com";
        string from1 = "overtime.alert@gmail.com";
        string pas = "parth@overtime";
        string sub = TextBox6.Text.ToString();
        if (TextBox3.Text != null && TextBox4.Text != null && TextBox5.Text != null && TextBox6.Text != null && TextBox7.Text != null)
        {
            try
            {
                using (MailMessage mm = new MailMessage(from1, to1))
                {
                    mm.Subject = sub;
                    mm.Body = " Mail Details " + Environment.NewLine + Environment.NewLine + " Sender Name:" + TextBox4.Text + Environment.NewLine + Environment.NewLine + " Sender E-mail: " + TextBox5.Text + Environment.NewLine + Environment.NewLine + " Subject: " + TextBox6.Text + Environment.NewLine + Environment.NewLine + " Message: " + TextBox7.Text + Environment.NewLine + Environment.NewLine + " ";

                    mm.IsBodyHtml = false;
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.EnableSsl = true;
                    NetworkCredential NetworkCred = new NetworkCredential(from1, pas);
                    smtp.UseDefaultCredentials = true;
                    smtp.Credentials = NetworkCred;
                    smtp.Port = 587;
                    smtp.Send(mm);
                    Label10.Text = "Mail Sent Successfully.";
                    Label10.Visible = true;
                    TextBox4.Text = null;
                    TextBox5.Text = null;

                }
            }
            catch(Exception ty)
            {
                Response.Write(ty.Message);
            }
        }
        else
        {
            Label10.Text = "Failed to Send Mail.";
            Label10.Visible = true;
        }
    }
}