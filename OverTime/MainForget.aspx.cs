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

public partial class MainForget : System.Web.UI.Page
{
    SqlConnection mssqlconn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    static string prevPage = String.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            prevPage = Request.UrlReferrer.ToString();
        }

        int lenght = 8;
        string allowedLetterChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ";
        string allowedNumberChars = "1234567890";
        char[] chars = new char[lenght];
        Random rd = new Random();

        bool useLetter = true;
        for (int i = 0; i < lenght; i++)
        {
            if (useLetter)
            {
                chars[i] = allowedLetterChars[rd.Next(0, allowedLetterChars.Length)];
                useLetter = false;
            }
            else
            {
                chars[i] = allowedNumberChars[rd.Next(0, allowedNumberChars.Length)];
                useLetter = true;
            }

        }

        Label3.Text = new string(chars);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect(prevPage);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (CheckBox1.Checked == true)
        {
            mssqlconn.Open();
            string sql = "select * from adminmaster where psno='" + TextBox1.Text + "'";
            SqlCommand cmd = new SqlCommand(sql, mssqlconn);
            SqlDataReader dr = cmd.ExecuteReader();
            if (TextBox1.Text != null)
            {
                if (dr.Read() == true)
                {
                    Label2.Text = dr[9].ToString();
                    if (Label2.Text != null)
                    {
                        string to1 = Label2.Text;
                        string from1 = "overtime.alert@gmail.com";
                        string pas = "parth@overtime";
                        string sub = "Reset Password.";
                        //string body = " Employee Details <BR><BR> Name:" + TextBox19.Text + " <BR> Department: " + TextBox18.Text + " <BR>  O.T Shift: " + DropDownList12.SelectedValue.ToString() + " <BR> Date: " + TextBox9.Text + " <BR> Total Hours Worked: " + TextBox17.Text + " ";
                        using (MailMessage mm = new MailMessage(from1, to1))
                        {
                            mm.Subject = sub;
                            mm.Body = " Password Details " + Environment.NewLine + Environment.NewLine + "Your Password has been reset as per your request." + Environment.NewLine + Environment.NewLine + " Username:" + TextBox1.Text + Environment.NewLine + Environment.NewLine + " Password: " + Label3.Text + Environment.NewLine + Environment.NewLine + " NOTE:- Please Login Through This Username and Password. Further Go to " + "Services>Change Password" + " to Change Password of the user. ";
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
                        mssqlconn.Open();
                        cmd = new SqlCommand("update adminmaster set pwd= '" + Label3.Text + "' where psno='" + TextBox1.Text + "'", mssqlconn);
                        cmd.ExecuteNonQuery();
                        Label1.Text = "Password is sent to your Registered E-mail Address. ";
                        Label1.Visible = true;
                        TextBox1.Text = "";
                        mssqlconn.Close();
                        Label2.Text = null;
                        Label3.Text = null;
                    }
                    else
                    { }
                }
                else
                {
                    Label1.Text = "Incorrect Username";
                    Label1.Visible = true;
                }

            }
            else
            {
                Label1.Text = "Incorrect Username";
                Label1.Visible = true;
            }
            mssqlconn.Close();
        }
        else
        {
            mssqlconn.Open();
            string sql = "select * from staff_entry where psno='" + TextBox1.Text + "'";
            SqlCommand cmd = new SqlCommand(sql, mssqlconn);
            SqlDataReader dr = cmd.ExecuteReader();
            if (TextBox1.Text != null)
            {
                if (dr.Read() == true)
                {
                    Label2.Text = dr[6].ToString();
                    if (Label2.Text != null)
                    {
                        string to1 = Label2.Text;
                        string from1 = "overtime.alert@gmail.com";
                        string pas = "parth@overtime";
                        string sub = "Reset Password.";
                        //string body = " Employee Details <BR><BR> Name:" + TextBox19.Text + " <BR> Department: " + TextBox18.Text + " <BR>  O.T Shift: " + DropDownList12.SelectedValue.ToString() + " <BR> Date: " + TextBox9.Text + " <BR> Total Hours Worked: " + TextBox17.Text + " ";
                        using (MailMessage mm = new MailMessage(from1, to1))
                        {
                            mm.Subject = sub;
                            mm.Body = " Password Details " + Environment.NewLine + Environment.NewLine + "Your Password has been reset as per your request." + Environment.NewLine + Environment.NewLine + " Username:" + TextBox1.Text + Environment.NewLine + Environment.NewLine + " Password: " + Label3.Text + Environment.NewLine + Environment.NewLine + " NOTE:- Please Login Through This Username and Password. Further Go to " + "Services>Change Password" + " to Change Password of the user. ";
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
                        mssqlconn.Open();
                        cmd = new SqlCommand("update staff_entry set pwd= '" + Label3.Text + "' where psno='" + TextBox1.Text + "'", mssqlconn);
                        cmd.ExecuteNonQuery();
                        Label1.Text = "Password is sent to your Registered E-mail Address. ";
                        Label1.Visible = true;
                        TextBox1.Text = "";
                        mssqlconn.Close();
                        Label2.Text = null;
                        Label3.Text = null;
                    }
                    else
                    { }
                }
                else
                {
                    Label1.Text = "Incorrect Username";
                    Label1.Visible = true;
                }

            }
            else
            {
                Label1.Text = "Incorrect Username";
                Label1.Visible = true;
            }
            mssqlconn.Close();
        }
    }
}