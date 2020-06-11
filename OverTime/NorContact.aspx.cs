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

public partial class NorContact : System.Web.UI.Page
{
    SqlConnection mssqlconn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
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
            if (Label1003.Text == "No")
            {
                mssqlconn.Open();
                string sql1 = "select * from staff_entry where psno='" + Session["User"] + "'";
                SqlCommand cmd1 = new SqlCommand(sql1, mssqlconn);
                SqlDataReader dr1 = cmd1.ExecuteReader();
                if (dr1.Read() == true)
                {
                    Label6.Text = dr1[6].ToString();
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

    protected void Button1_Click(object sender, EventArgs e)
    {
        string to1 = "overtime.alert@gmail.com";
        string from1 = "overtime.alert@gmail.com";
        string pas = "parth@overtime";
        string sub = TextBox3.Text.ToString();
        if (TextBox2.Text != null && TextBox3.Text != null)
        {
            using (MailMessage mm = new MailMessage(from1, to1))
            {
                mm.Subject = sub;
                mm.Body = " Mail Details " + Environment.NewLine + Environment.NewLine + " Sender Name:" + Label1001.Text + Environment.NewLine + Environment.NewLine + " Sender E-mail: " + Label6.Text + Environment.NewLine + Environment.NewLine + " Subject: " + TextBox3.Text + Environment.NewLine + Environment.NewLine + " Message: " + TextBox2.Text + Environment.NewLine + Environment.NewLine + " ";

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
                TextBox2.Text = null;
                TextBox3.Text = null;

            }
        }
        else
        {
            Label10.Text = "Failed to Send Mail.";
            Label10.Visible = true;
        }
    }
}