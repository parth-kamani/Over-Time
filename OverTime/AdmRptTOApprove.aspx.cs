﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Drawing;
using System.Data.SqlClient;
using System.Configuration;

public partial class AdmRptTOApprove : System.Web.UI.Page
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
                Button3.Enabled = false;
                //Button4.Visible = false;
                //Button4.Enabled = false;
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
        //DropDownList3.SelectedIndex = 0;
        mssqlconn.Close();
        mssqlconn.Open();
        string sql1 = "select * from edit_year where yearnme ='" + DropDownList1.SelectedValue.ToString() + "'";
        SqlCommand cmd1 = new SqlCommand(sql1, mssqlconn);
        SqlDataReader dr1 = cmd1.ExecuteReader();
        if (dr1.Read() == true)
        {
            Label4.Text = dr1[0].ToString();
            //Label9.Text = DropDownList3.SelectedValue.ToString();
        }
        mssqlconn.Close();
        Button3.Visible = true;
        //Button4.Visible = false;
        Button3.Enabled = false;
        BindGrid();
    }
    private void BindGrid()
    {
        mssqlconn.Close();
        mssqlconn.Open();
        string sql1 = "select * from edit_year where yearnme ='" + DropDownList1.SelectedValue.ToString() + "'";
        SqlCommand cmd1 = new SqlCommand(sql1, mssqlconn);
        SqlDataReader dr1 = cmd1.ExecuteReader();
        if (dr1.Read() == true)
        {
            Label4.Text = dr1[0].ToString();
            Label8.Text = dr1[0].ToString();
        }
        mssqlconn.Close();
        string str = Label12.Text;
        int q = str.Length;
        int w = q - 12;
        str = str.Substring(0, 10);
        string str1 = Label13.Text;
        int q1 = str1.Length;
        int w1 = q - 12;
        str1 = str1.Substring(0, 10);
        if (DropDownList5.SelectedIndex != 0 && DropDownList6.SelectedIndex != 0)
        {
            if (Convert.ToInt32(Label4.Text) <= DateTime.Today.Year)
            {
                // ConnectionString to NorthWind Database.\
                string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                // Create SQLDataSource.
                SqlDataSource sqlDataSource = new SqlDataSource();
                sqlDataSource.ID = "SqlDataSourceAlloRpt";
                this.Page.Controls.Add(sqlDataSource);
                // Bind ConnectionString to SQLDataSource.
                sqlDataSource.ConnectionString = cs;
                Label4.Text = DropDownList1.SelectedValue.ToString();
                // Retrieve records with only 5 Columns from Employees table of NorthWind Database.
                sqlDataSource.SelectCommand = "SELECT * FROM otentrytable WHERE toapprove = '" + Label5.Text + "' and toayear = '" + Label8.Text + "' and toamnt = '" + DropDownList2.SelectedValue.ToString() + "' and dept='" + DropDownList5.SelectedValue.ToString() + "' and sec='" + DropDownList6.SelectedValue.ToString() + "' GROUP BY srno,uid,psno,name,dept,desig,shift,otshift,costcentre,sec,area,otentrydt,allocation,replacepsno,replacename,ottimefrom,ottimeto,totalhrs,lunchded,assignwrk,usrremark,hosdapprove,hosdremark,previousot,paidmonth,paidyear,authoperson,toapprove,toremark,toamnt,toayear order by srno";
                // Bind SQLDataSource to GridView after retrieving the records.
                GridView1.DataSource = sqlDataSource;
                GridView1.DataBind();
                GridView1.Visible = true;
                GridView2.DataSource = sqlDataSource;
                GridView2.DataBind();
                GridView2.Visible = true;
                norec.Visible = false;
                Button3.Enabled = true;
                Button3.Visible = true;
            }
            else
            {
                norec.Visible = true;
                GridView1.Visible = false;
                Button3.Enabled = false;
            }
        }
        else if (DropDownList5.SelectedIndex != 0)
        {
            if (Convert.ToInt32(Label4.Text) <= DateTime.Today.Year)
            {
                // ConnectionString to NorthWind Database.\
                string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                // Create SQLDataSource.
                SqlDataSource sqlDataSource = new SqlDataSource();
                sqlDataSource.ID = "SqlDataSourceAlloRpt";
                this.Page.Controls.Add(sqlDataSource);
                // Bind ConnectionString to SQLDataSource.
                sqlDataSource.ConnectionString = cs;
                Label4.Text = DropDownList1.SelectedValue.ToString();
                // Retrieve records with only 5 Columns from Employees table of NorthWind Database.
                sqlDataSource.SelectCommand = "SELECT * FROM otentrytable WHERE toapprove = '" + Label5.Text + "' and toayear = '" + Label8.Text + "' and toamnt = '" + DropDownList2.SelectedValue.ToString() + "' and dept='" + DropDownList5.SelectedValue.ToString() + "' GROUP BY srno,uid,psno,name,dept,desig,shift,otshift,costcentre,sec,area,otentrydt,allocation,replacepsno,replacename,ottimefrom,ottimeto,totalhrs,lunchded,assignwrk,usrremark,hosdapprove,hosdremark,previousot,paidmonth,paidyear,authoperson,toapprove,toremark,toamnt,toayear order by srno";
                // Bind SQLDataSource to GridView after retrieving the records.
                GridView1.DataSource = sqlDataSource;
                GridView1.DataBind();
                GridView1.Visible = true;
                GridView2.DataSource = sqlDataSource;
                GridView2.DataBind();
                GridView2.Visible = true;
                norec.Visible = false;
                Button3.Enabled = true;
                Button3.Visible = true;
            }
            else
            {
                norec.Visible = true;
                GridView1.Visible = false;
                Button3.Enabled = false;
            }
        }

        else if (DropDownList5.SelectedIndex == 0 && DropDownList6.SelectedIndex == 0)
        {
            if (Convert.ToInt32(Label4.Text) <= DateTime.Today.Year)
            {
                // ConnectionString to NorthWind Database.\
                string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                // Create SQLDataSource.
                SqlDataSource sqlDataSource = new SqlDataSource();
                sqlDataSource.ID = "SqlDataSourceAlloRpt";
                this.Page.Controls.Add(sqlDataSource);
                // Bind ConnectionString to SQLDataSource.
                sqlDataSource.ConnectionString = cs;
                Label4.Text = DropDownList1.SelectedValue.ToString();
                // Retrieve records with only 5 Columns from Employees table of NorthWind Database.
                sqlDataSource.SelectCommand = "SELECT * FROM otentrytable WHERE toapprove = '" + Label5.Text + "' and toayear = '" + Label8.Text + "' and toamnt = '" + DropDownList2.SelectedValue.ToString() + "' GROUP BY srno,uid,psno,name,dept,desig,shift,otshift,costcentre,sec,area,otentrydt,allocation,replacepsno,replacename,ottimefrom,ottimeto,totalhrs,lunchded,assignwrk,usrremark,hosdapprove,hosdremark,previousot,paidmonth,paidyear,authoperson,toapprove,toremark,toamnt,toayear order by srno";
                // Bind SQLDataSource to GridView after retrieving the records.
                GridView1.DataSource = sqlDataSource;
                GridView1.DataBind();
                GridView1.Visible = true;
                GridView2.DataSource = sqlDataSource;
                GridView2.DataBind();
                GridView2.Visible = true;
                norec.Visible = false;
                Button3.Enabled = true;
                Button3.Visible = true;
                //GridView1.Visible = false;
            }
            else
            {
                norec.Visible = true;
                GridView1.Visible = false;
                Button3.Enabled = false;
            }
        }

    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        DropDownList1.SelectedIndex = 0;
        DropDownList2.SelectedIndex = 0;
        DropDownList5.SelectedIndex = 0;
        DropDownList6.SelectedIndex = 0;
        GridView1.Visible = false;
        Button3.Visible = true;
        Button3.Enabled = false;
        Button2.Enabled = false;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        GridView1.Visible = true;
        GridView1.DataBind();
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=AdmTOApproveRptOf" + DropDownList5.SelectedItem.ToString() + ".xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        using (StringWriter sw = new StringWriter())
        {
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            
            //To Export all pages
            GridView1.AllowPaging = false;
            this.BindGrid();
            GridView1.BorderColor = Color.Black;
            GridView1.HeaderRow.BackColor = Color.Snow;
            foreach (TableCell cell in GridView1.HeaderRow.Cells)
            {
                cell.BackColor = GridView1.HeaderStyle.BackColor;
            }
            foreach (GridViewRow row in GridView1.Rows)
            {
                row.BackColor = Color.White;
                foreach (TableCell cell in row.Cells)
                {
                    if (row.RowIndex % 2 == 0)
                    {
                        cell.BackColor = GridView1.AlternatingRowStyle.BackColor;
                    }
                    else
                    {
                        cell.BackColor = GridView1.RowStyle.BackColor;
                    }
                    cell.CssClass = "textmode";
                }
            }

            GridView1.RenderControl(hw);

            //style to format numbers to string
            string style = @"<style> .textmode { mso-number-format:\@; } </style>";
            Response.Write(style);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
            
        }
       

    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    }
    protected void OnPageIndexChanging(object sender, EventArgs e)
    {

    }
    
    protected void DropDownList5_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList6.Items.Clear();
        DropDownList6.Items.Insert(0, "");
        DropDownList1.SelectedIndex = 0;
        DropDownList2.SelectedIndex = 0;
        Label12.Text = null;
        Label13.Text = null;
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(DropDownList1.SelectedIndex != 0)
        {
            Button2.Enabled = true;
            mssqlconn.Open();
            string sql1 = "select * from edit_year where yearnme ='" + DropDownList1.SelectedValue.ToString() + "'";
            SqlCommand cmd1 = new SqlCommand(sql1, mssqlconn);
            SqlDataReader dr1 = cmd1.ExecuteReader();
            if (dr1.Read() == true)
            {
                Label4.Text = dr1[0].ToString();
                Label9.Text = DropDownList2.SelectedValue.ToString();
            }
            mssqlconn.Close();
            int year1 = Convert.ToInt16(Label4.Text);
            int month1 = DropDownList2.SelectedIndex;
            Label8.Text = year1.ToString();
            int year2 = Convert.ToInt16(year1);
            DateTime today = DateTime.Today;
            //int days = DateTime.DaysInMonth(year1, month1);
            int month2 = month1 - 1;
            if (month2 == 0)
            {
                month2 = 12;
                year2 = year1 - 1;
                DateTime start = new DateTime(year2, month2, 26);
                DateTime end = new DateTime(year1, month1, 25);
                Label12.Text = start.ToString();
                Label13.Text = end.ToString();

            }
            else
            {
                DateTime start = new DateTime(year2, month2, 26);
                DateTime end = new DateTime(year1, month1, 25);
                Label12.Text = start.ToString();
                Label13.Text = end.ToString();
            }
        }
        else
        {
            Button2.Enabled = false;
        }
    }
}