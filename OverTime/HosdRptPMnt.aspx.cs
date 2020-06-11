using System;
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

public partial class HosdRptPMnt : System.Web.UI.Page
{
    SqlConnection mssqlconn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        /*if (!IsPostBack)
        {
            this.BindGrid();
            this.BindGrid1();
        }*/
        if (Session["User"] == null)
        {
            Response.Redirect("MainHome.aspx?err=Please_Login!");
        }
        else
        {
            Button4.Visible = false;
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
                    Label1.Text = dr1[4].ToString();
                }
                mssqlconn.Close();
                Button3.Enabled = false;
                Button4.Enabled = false;
                Button5.Enabled = false;
                Button6.Enabled = false;
                // BindGrid();


                if (Label1.Text != null)
                {
                    mssqlconn.Open();
                    string sql2 = "select * from deptsec where hosname='" + Label1001.Text + "' and dept='" + Label1.Text + "'";
                    SqlCommand cmd2 = new SqlCommand(sql2, mssqlconn);
                    string sql3 = "select * from depthead where hodname='" + Label1001.Text + "' and dept='" + Label1.Text + "'";
                    SqlCommand cmd3 = new SqlCommand(sql3, mssqlconn);

                    SqlDataReader dr2 = cmd2.ExecuteReader();
                    if (dr2.Read() == true)
                    {
                        Label3.Text = dr2[2].ToString();
                        sec.Visible = false;
                        Button7.Visible = false;
                        Button8.Visible = false;
                        Button5.Visible = false;
                        Button6.Visible = false;
                    }
                    else
                    {
                        dr2.Close();
                        SqlDataReader dr3 = cmd3.ExecuteReader();
                        if (dr3.Read() == true)
                        {
                            Label2.Text = dr3[2].ToString();
                            sec.Visible = true;
                            Button7.Visible = true;
                            Button8.Visible = true;
                            Button1.Visible = false;
                            Button2.Visible = false;
                            Button5.Visible = false;
                            Button6.Visible = false;
                        }
                        dr3.Close();
                    }

                    dr2.Close();
                    mssqlconn.Close();
                    Button8.Enabled = false;
                    Button7.Enabled = false;
                    Button1.Enabled = false;
                    Button2.Enabled = false;
                }
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
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=PaidMntRptOf" + DropDownList3.SelectedItem.ToString() + "OfPrevRpt.xls");
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
    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=PaidMntRptOf" + DropDownList3.SelectedItem.ToString() + "OfCurrRpt.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        using (StringWriter sw = new StringWriter())
        {
            HtmlTextWriter hw = new HtmlTextWriter(sw);

            //To Export all pages
            GridView2.AllowPaging = false;
            this.BindGrid();
            GridView2.BorderColor = Color.Black;
            GridView2.HeaderRow.BackColor = Color.Snow;
            foreach (TableCell cell in GridView2.HeaderRow.Cells)
            {
                cell.BackColor = GridView2.HeaderStyle.BackColor;
            }
            foreach (GridViewRow row in GridView2.Rows)
            {
                row.BackColor = Color.White;
                foreach (TableCell cell in row.Cells)
                {
                    if (row.RowIndex % 2 == 0)
                    {
                        cell.BackColor = GridView2.AlternatingRowStyle.BackColor;
                    }
                    else
                    {
                        cell.BackColor = GridView2.RowStyle.BackColor;
                    }
                    cell.CssClass = "textmode";
                }
            }

            GridView2.RenderControl(hw);

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
    protected void Button1_Click(object sender, EventArgs e)
    {
        Button3.Visible = true;
        Button4.Visible = false;
        Button3.Enabled = false;
        Button5.Visible = false;
        Button6.Visible = false;
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
            Label9.Text = DropDownList2.SelectedValue.ToString();
        }
        mssqlconn.Close();
        string str = Label12.Text;
        int q = str.Length;
        int w = q - 12;
        str = str.Substring(0,10);
        string str1 = Label13.Text;
        int q1 = str1.Length;
        int w1 = q - 12;
        str1 = str1.Substring(0, 10);
        if (Label3.Text != "sec" && Label2.Text == "hodemail")
        {
            if (Convert.ToInt32(Label4.Text) <= DateTime.Today.Year)
            {
                if (DropDownList2.SelectedIndex <= DateTime.Today.Month)
                {
                // ConnectionString to NorthWind Database.\
                string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                // Create SQLDataSource.
                SqlDataSource sqlDataSource = new SqlDataSource();
                sqlDataSource.ID = "SqlDataSourceAlloRpt";
                this.Page.Controls.Add(sqlDataSource);
                // Bind ConnectionString to SQLDataSource.
                sqlDataSource.ConnectionString = cs;
                // Retrieve records with only 5 Columns from Employees table of NorthWind Database.
                sqlDataSource.SelectCommand = "SELECT [psno], [name], [dept], [sec], SUM([totalhrs]) AS [totalhrs] FROM otentrytable WHERE [toamnt]='" + Label9.Text + "' AND [toayear]='" + Label8.Text + "' AND ([otentrydt])BETWEEN '" + str + "' AND '" + str1 + "' AND [toapprove]='" + Label5.Text + "' AND [dept]='" + Label1.Text + "' AND [sec]='"+ Label3.Text+"' AND [previousot]='" + Label7.Text + "' GROUP BY [psno],[name],[dept],[sec] ORDER BY [psno] ASC";
                Label4.Text = DropDownList1.SelectedValue.ToString();
                // Bind SQLDataSource to GridView after retrieving the records.
                GridView1.DataSource = sqlDataSource;
                GridView1.DataBind();
                GridView1.Visible = true;
                GridView2.Visible = false;
                Button3.Enabled = true;
                norec.Visible = false;
                Button4.Visible = false;
                }
                else
                {
                    norec.Visible = true;
                    GridView1.Visible = false;
                    GridView2.Visible = false;
                    Button4.Enabled = false;
                    Button3.Visible = false;
                }
            }
            else
            {
                norec.Visible = true;
                GridView1.Visible = false;
                GridView2.Visible = false;
                Button3.Enabled = false;
            }
        }

        else if (Label2.Text != "hodemail" && Label3.Text == "sec")
        {
            if (Convert.ToInt32(Label4.Text) <= DateTime.Today.Year)
            {
                if (DropDownList2.SelectedIndex <= DateTime.Today.Month)
                {
                    // ConnectionString to NorthWind Database.\
                    string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    // Create SQLDataSource.
                    SqlDataSource sqlDataSource = new SqlDataSource();
                    sqlDataSource.ID = "SqlDataSourceAlloRpt";
                    this.Page.Controls.Add(sqlDataSource);
                    // Bind ConnectionString to SQLDataSource.
                    sqlDataSource.ConnectionString = cs;
                    // Retrieve records with only 5 Columns from Employees table of NorthWind Database.
                    sqlDataSource.SelectCommand = "SELECT [psno], [name], [dept], [sec], SUM([totalhrs]) AS [totalhrs] FROM otentrytable WHERE [toamnt]='" + Label9.Text + "' AND [toayear]='" + Label8.Text + "' AND ([otentrydt])BETWEEN '" + str + "' AND '" + str1 + "' AND [toapprove]='" + Label5.Text + "' AND [dept]='" + Label1.Text + "' AND [previousot]='" + Label7.Text + "' GROUP BY [psno],[name],[dept],[sec] ORDER BY [psno] ASC";
                    Label4.Text = DropDownList1.SelectedValue.ToString();
                    // Bind SQLDataSource to GridView after retrieving the records.
                    GridView1.DataSource = sqlDataSource;
                    GridView1.DataBind();
                    GridView1.Visible = true;
                    GridView2.Visible = false;
                    Button3.Enabled = true;
                    norec.Visible = false;
                    Button4.Visible = false;
                }
                else
                {
                    norec.Visible = true;
                    GridView1.Visible = false;
                    GridView2.Visible = false;
                    Button4.Enabled = false;
                    Button3.Visible = false;
                }
            }
            else
            {
                norec.Visible = true;
                GridView1.Visible = false;
                GridView2.Visible = false;
                Button3.Enabled = false;
            }
        }
        else
        {
            norec.Visible = true;
            GridView1.Visible = false;
            GridView2.Visible = false;
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        BindGrid1();
    }
    private void BindGrid1()
    {
        mssqlconn.Close();
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
        string str = Label12.Text;
        int q = str.Length;
        int w = q - 12;
        str = str.Substring(0, 10);
        string str1 = Label13.Text;
        int q1 = str1.Length;
        int w1 = q - 12;
        str1 = str1.Substring(0, 10);
        if (Label3.Text != "sec" && Label2.Text == "hodemail")
        {
            if (Convert.ToInt32(Label4.Text) <= DateTime.Today.Year)
            {
                if (DropDownList2.SelectedIndex <= DateTime.Today.Month)
                {
                    // ConnectionString to NorthWind Database.\
                    string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    // Create SQLDataSource.
                    SqlDataSource sqlDataSource = new SqlDataSource();
                    sqlDataSource.ID = "SqlDataSourceAlloRpt";
                    this.Page.Controls.Add(sqlDataSource);
                    // Bind ConnectionString to SQLDataSource.
                    sqlDataSource.ConnectionString = cs;
                    // Retrieve records with only 5 Columns from Employees table of NorthWind Database.
                    sqlDataSource.SelectCommand = "SELECT [psno], [name], [dept], [sec], SUM([totalhrs]) AS [totalhrs] FROM otentrytable WHERE [toamnt]='" + Label9.Text + "' AND [toayear]='" + Label8.Text + "' AND ([otentrydt])BETWEEN '" + str + "' AND '" + str1 + "' AND [toapprove]='" + Label5.Text + "' AND [dept]='" + Label1.Text + "' AND [sec]='" + Label3.Text + "' AND [previousot]='" + Label5.Text + "' GROUP BY [psno],[name],[dept],[sec] ORDER BY [psno] ASC";
                    Label4.Text = DropDownList1.SelectedValue.ToString();
                    // Bind SQLDataSource to GridView after retrieving the records.
                    GridView2.DataSource = sqlDataSource;
                    GridView2.DataBind();
                    GridView2.Visible = true;
                    GridView1.Visible = false;
                    Button3.Enabled = true;
                    norec.Visible = false;
                    Button4.Visible = false;
                }
                else
                {
                    norec.Visible = true;
                    GridView1.Visible = false;
                    GridView2.Visible = false;
                    Button4.Enabled = false;
                    Button3.Visible = false;
                }
            }
            else
            {
                norec.Visible = true;
                GridView1.Visible = false;
                GridView2.Visible = false;
                Button3.Enabled = false;
            }
        }

        else if (Label2.Text != "hodemail" && Label3.Text == "sec")
        {
            if (Convert.ToInt32(Label4.Text) <= DateTime.Today.Year)
            {
                if (DropDownList2.SelectedIndex <= DateTime.Today.Month)
                {
                    // ConnectionString to NorthWind Database.\
                    string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    // Create SQLDataSource.
                    SqlDataSource sqlDataSource = new SqlDataSource();
                    sqlDataSource.ID = "SqlDataSourceAlloRpt";
                    this.Page.Controls.Add(sqlDataSource);
                    // Bind ConnectionString to SQLDataSource.
                    sqlDataSource.ConnectionString = cs;
                    // Retrieve records with only 5 Columns from Employees table of NorthWind Database.
                    sqlDataSource.SelectCommand = "SELECT [psno], [name], [dept], [sec], SUM([totalhrs]) AS [totalhrs] FROM otentrytable WHERE [toamnt]='" + Label9.Text + "' AND [toayear]='" + Label8.Text + "' AND ([otentrydt])BETWEEN '" + str + "' AND '" + str1 + "' AND [toapprove]='" + Label5.Text + "' AND [dept]='" + Label1.Text + "' AND [previousot]='" + Label5.Text + "' GROUP BY [psno],[name],[dept],[sec] ORDER BY [psno] ASC";
                    Label4.Text = DropDownList1.SelectedValue.ToString();
                    // Bind SQLDataSource to GridView after retrieving the records.
                    GridView2.DataSource = sqlDataSource;
                    GridView2.DataBind();
                    GridView2.Visible = true;
                    GridView1.Visible = false;
                    Button3.Enabled = true;
                    norec.Visible = false;
                    Button4.Visible = false;
                }
                else
                {
                    norec.Visible = true;
                    GridView1.Visible = false;
                    GridView2.Visible = false;
                    Button4.Enabled = false;
                    Button3.Visible = false;
                }
            }
            else
            {
                norec.Visible = true;
                GridView1.Visible = false;
                GridView2.Visible = false;
                Button3.Enabled = false;
            }
        }
        else
        {
            norec.Visible = true;
            GridView1.Visible = false;
            GridView2.Visible = false;
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex != 0 && DropDownList2.SelectedIndex != 0)
        {
            Button1.Visible = true;
            Button2.Visible = true;
            Button2.Enabled = true;
            Button1.Enabled = true;
            Button7.Visible = false;
            Button8.Visible = false;
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
            Button1.Enabled = false;
            Button2.Enabled = false;
        }
    }
    protected void OnPageIndexChanging(object sender, EventArgs e)
    {

    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        BindGrid2();
    }
    protected void Button8_Click(object sender, EventArgs e)
    {
        BindGrid3();
    }
    private void BindGrid2()
    {
        mssqlconn.Close();
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
        string str = Label12.Text;
        int q = str.Length;
        int w = q - 12;
        str = str.Substring(0, 10);
        string str1 = Label13.Text;
        int q1 = str1.Length;
        int w1 = q - 12;
        str1 = str1.Substring(0, 10);
        if (Label3.Text != "sec" && Label2.Text == "hodemail")
        {
            if (Convert.ToInt32(Label4.Text) <= DateTime.Today.Year)
            {
                if (DropDownList2.SelectedIndex <= DateTime.Today.Month)
                {
                    // ConnectionString to NorthWind Database.\
                    string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    // Create SQLDataSource.
                    SqlDataSource sqlDataSource = new SqlDataSource();
                    sqlDataSource.ID = "SqlDataSourceAlloRpt";
                    this.Page.Controls.Add(sqlDataSource);
                    // Bind ConnectionString to SQLDataSource.
                    sqlDataSource.ConnectionString = cs;
                    // Retrieve records with only 5 Columns from Employees table of NorthWind Database.
                    sqlDataSource.SelectCommand = "SELECT [psno], [name], [dept], [sec], SUM([totalhrs]) AS [totalhrs] FROM otentrytable WHERE [toamnt]='" + Label9.Text + "' AND [toayear]='" + Label8.Text + "' AND ([otentrydt])BETWEEN '" + str + "' AND '" + str1 + "' AND [toapprove]='" + Label5.Text + "' AND [dept]='" + Label1.Text + "' AND [sec]='" + Label3.Text + "' AND [previousot]='" + Label7.Text + "' GROUP BY [psno],[name],[dept],[sec] ORDER BY [psno] ASC";
                    Label4.Text = DropDownList1.SelectedValue.ToString();
                    // Bind SQLDataSource to GridView after retrieving the records.
                    GridView1.DataSource = sqlDataSource;
                    GridView1.DataBind();
                    GridView1.Visible = true;
                    GridView3.Visible = false;
                    GridView4.Visible = false;
                    GridView2.Visible = false;
                    Button3.Enabled = true;
                    norec.Visible = false;
                    Button4.Visible = false;
                    Button5.Visible = false;
                    Button6.Visible = false;
                }
                else
                {
                    norec.Visible = true;
                    GridView1.Visible = false;
                    GridView2.Visible = false;
                    Button4.Enabled = false;
                    Button3.Visible = false;
                }
            }
            else
            {
                norec.Visible = true;
                GridView1.Visible = false;
                GridView2.Visible = false;
                Button3.Enabled = false;
            }
        }

        else if (Label2.Text != "hodemail" && Label3.Text == "sec")
        {
            if (Convert.ToInt32(Label4.Text) <= DateTime.Today.Year)
            {
                if (DropDownList2.SelectedIndex <= DateTime.Today.Month)
                {
                    if (DropDownList3.SelectedIndex == 0)
                    {
                        // ConnectionString to NorthWind Database.\
                        string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                        // Create SQLDataSource.
                        SqlDataSource sqlDataSource = new SqlDataSource();
                        sqlDataSource.ID = "SqlDataSourceAlloRpt";
                        this.Page.Controls.Add(sqlDataSource);
                        // Bind ConnectionString to SQLDataSource.
                        sqlDataSource.ConnectionString = cs;
                        // Retrieve records with only 5 Columns from Employees table of NorthWind Database.
                        sqlDataSource.SelectCommand = "SELECT [psno], [name], [dept], [sec], SUM([totalhrs]) AS [totalhrs] FROM otentrytable WHERE [toamnt]='" + Label9.Text + "' AND [toayear]='" + Label8.Text + "' AND ([otentrydt])BETWEEN '" + str + "' AND '" + str1 + "' AND [toapprove]='" + Label5.Text + "' AND [dept]='" + Label1.Text + "' AND [previousot]='" + Label7.Text + "' GROUP BY [psno],[name],[dept],[sec] ORDER BY [psno] ASC";
                        Label4.Text = DropDownList1.SelectedValue.ToString();
                        // Bind SQLDataSource to GridView after retrieving the records.
                        GridView3.DataSource = sqlDataSource;
                        GridView3.DataBind();
                        GridView3.Visible = true;
                        GridView2.Visible = false;
                        GridView1.Visible = false;
                        GridView4.Visible = false;
                        Button6.Visible = false;
                        Button5.Enabled = true;
                        Button5.Visible = true;
                        norec.Visible = false;
                        Button3.Visible = false;
                        Button4.Visible = false;
                    }
                    else
                    {
                        // ConnectionString to NorthWind Database.\
                        string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                        // Create SQLDataSource.
                        SqlDataSource sqlDataSource = new SqlDataSource();
                        sqlDataSource.ID = "SqlDataSourceAlloRpt";
                        this.Page.Controls.Add(sqlDataSource);
                        // Bind ConnectionString to SQLDataSource.
                        sqlDataSource.ConnectionString = cs;
                        // Retrieve records with only 5 Columns from Employees table of NorthWind Database.
                        sqlDataSource.SelectCommand = "SELECT [psno], [name], [dept], [sec], SUM([totalhrs]) AS [totalhrs] FROM otentrytable WHERE [toamnt]='" + Label9.Text + "' AND [toayear]='" + Label8.Text + "' AND ([otentrydt])BETWEEN '" + str + "' AND '" + str1 + "' AND [toapprove]='" + Label5.Text + "' AND [dept]='" + Label1.Text + "' AND [sec]='" + DropDownList3.SelectedItem.ToString() + "' AND [previousot]='" + Label7.Text + "' GROUP BY [psno],[name],[dept],[sec] ORDER BY [psno] ASC";
                        Label4.Text = DropDownList1.SelectedValue.ToString();
                        // Bind SQLDataSource to GridView after retrieving the records.
                        GridView3.DataSource = sqlDataSource;
                        GridView3.DataBind();
                        GridView3.Visible = true;
                        GridView2.Visible = false;
                        GridView1.Visible = false;
                        GridView4.Visible = false;
                        Button6.Visible = false;
                        Button5.Enabled = true;
                        Button5.Visible = true;
                        norec.Visible = false;
                        Button3.Visible = false;
                        Button4.Visible = false;
                    }
                }
                else
                {
                    norec.Visible = true;
                    GridView1.Visible = false;
                    GridView2.Visible = false;
                    Button4.Enabled = false;
                    Button3.Visible = false;
                }
            }
            else
            {
                norec.Visible = true;
                GridView1.Visible = false;
                GridView2.Visible = false;
                Button3.Enabled = false;
            }
        }
        else
        {
            norec.Visible = true;
            GridView1.Visible = false;
            GridView2.Visible = false;
        }
    }
    private void BindGrid3()
    {
        mssqlconn.Close();
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
        string str = Label12.Text;
        int q = str.Length;
        int w = q - 12;
        str = str.Substring(0, 10);
        string str1 = Label13.Text;
        int q1 = str1.Length;
        int w1 = q - 12;
        str1 = str1.Substring(0, 10);
        if (Label3.Text != "sec" && Label2.Text == "hodemail")
        {
            if (Convert.ToInt32(Label4.Text) <= DateTime.Today.Year)
            {
                if (DropDownList2.SelectedIndex <= DateTime.Today.Month)
                {
                    // ConnectionString to NorthWind Database.\
                    string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    // Create SQLDataSource.
                    SqlDataSource sqlDataSource = new SqlDataSource();
                    sqlDataSource.ID = "SqlDataSourceAlloRpt";
                    this.Page.Controls.Add(sqlDataSource);
                    // Bind ConnectionString to SQLDataSource.
                    sqlDataSource.ConnectionString = cs;
                    // Retrieve records with only 5 Columns from Employees table of NorthWind Database.
                    sqlDataSource.SelectCommand = "SELECT [psno], [name], [dept], [sec], SUM([totalhrs]) AS [totalhrs] FROM otentrytable WHERE [toamnt]='" + Label9.Text + "' AND [toayear]='" + Label8.Text + "' AND ([otentrydt])BETWEEN '" + str + "' AND '" + str1 + "' AND [toapprove]='" + Label5.Text + "' AND [dept]='" + Label1.Text + "' AND [sec]='" + Label3.Text + "' AND [previousot]='" + Label5.Text + "' GROUP BY [psno],[name],[dept],[sec] ORDER BY [psno] ASC";
                    Label4.Text = DropDownList1.SelectedValue.ToString();
                    // Bind SQLDataSource to GridView after retrieving the records.
                    GridView4.DataSource = sqlDataSource;
                    GridView4.DataBind();
                    GridView4.Visible = true;
                    GridView1.Visible = false;
                    GridView2.Visible = false;
                    GridView3.Visible = false;
                    Button6.Enabled = true;
                    Button6.Visible = true;
                    norec.Visible = false;
                    Button4.Visible = false;
                    Button3.Visible = false;
                    Button5.Visible = false;
                }
                else
                {
                    norec.Visible = true;
                    GridView1.Visible = false;
                    GridView2.Visible = false;
                    Button4.Enabled = false;
                    Button3.Visible = false;
                }
            }
            else
            {
                norec.Visible = true;
                GridView1.Visible = false;
                GridView2.Visible = false;
                Button3.Enabled = false;
            }
        }

        else if (Label2.Text != "hodemail" && Label3.Text == "sec")
        {
            if (Convert.ToInt32(Label4.Text) <= DateTime.Today.Year)
            {
                if (DropDownList2.SelectedIndex <= DateTime.Today.Month)
                {
                    if (DropDownList3.SelectedIndex == 0)
                    {
                        // ConnectionString to NorthWind Database.\
                        string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                        // Create SQLDataSource.
                        SqlDataSource sqlDataSource = new SqlDataSource();
                        sqlDataSource.ID = "SqlDataSourceAlloRpt";
                        this.Page.Controls.Add(sqlDataSource);
                        // Bind ConnectionString to SQLDataSource.
                        sqlDataSource.ConnectionString = cs;
                        // Retrieve records with only 5 Columns from Employees table of NorthWind Database.
                        sqlDataSource.SelectCommand = "SELECT [psno], [name], [dept], [sec], SUM([totalhrs]) AS [totalhrs] FROM otentrytable WHERE [toamnt]='" + Label9.Text + "' AND [toayear]='" + Label8.Text + "' AND ([otentrydt])BETWEEN '" + str + "' AND '" + str1 + "' AND [toapprove]='" + Label5.Text + "' AND [dept]='" + Label1.Text + "' AND [previousot]='" + Label5.Text + "' GROUP BY [psno],[name],[dept],[sec] ORDER BY [psno] ASC";
                        Label4.Text = DropDownList1.SelectedValue.ToString();
                        // Bind SQLDataSource to GridView after retrieving the records.
                        GridView4.DataSource = sqlDataSource;
                        GridView4.DataBind();
                        GridView4.Visible = true;
                        GridView1.Visible = false;
                        GridView2.Visible = false;
                        GridView3.Visible = false;
                        Button6.Enabled = true;
                        Button6.Visible = true;
                        norec.Visible = false;
                        Button4.Visible = false;
                        Button3.Visible = false;
                        Button5.Visible = false;
                    }
                    else
                    {
                        // ConnectionString to NorthWind Database.\
                        string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                        // Create SQLDataSource.
                        SqlDataSource sqlDataSource = new SqlDataSource();
                        sqlDataSource.ID = "SqlDataSourceAlloRpt";
                        this.Page.Controls.Add(sqlDataSource);
                        // Bind ConnectionString to SQLDataSource.
                        sqlDataSource.ConnectionString = cs;
                        // Retrieve records with only 5 Columns from Employees table of NorthWind Database.
                        sqlDataSource.SelectCommand = "SELECT [psno], [name], [dept], [sec], SUM([totalhrs]) AS [totalhrs] FROM otentrytable WHERE [toamnt]='" + Label9.Text + "' AND [toayear]='" + Label8.Text + "' AND ([otentrydt])BETWEEN '" + str + "' AND '" + str1 + "' AND [toapprove]='" + Label5.Text + "' AND [dept]='" + Label1.Text + "' AND [sec]='" + DropDownList3.SelectedItem.ToString() + "' AND [previousot]='" + Label5.Text + "' GROUP BY [psno],[name],[dept],[sec] ORDER BY [psno] ASC";
                        Label4.Text = DropDownList1.SelectedValue.ToString();
                        // Bind SQLDataSource to GridView after retrieving the records.
                        GridView4.DataSource = sqlDataSource;
                        GridView4.DataBind();
                        GridView4.Visible = true;
                        GridView1.Visible = false;
                        GridView2.Visible = false;
                        GridView3.Visible = false;
                        Button6.Enabled = true;
                        Button6.Visible = true;
                        norec.Visible = false;
                        Button4.Visible = false;
                        Button3.Visible = false;
                        Button5.Visible = false;
                    }
                }
                else
                {
                    norec.Visible = true;
                    GridView1.Visible = false;
                    GridView2.Visible = false;
                    Button4.Enabled = false;
                    Button3.Visible = false;
                }
            }
            else
            {
                norec.Visible = true;
                GridView1.Visible = false;
                GridView2.Visible = false;
                Button3.Enabled = false;
            }
        }
        else
        {
            norec.Visible = true;
            GridView1.Visible = false;
            GridView2.Visible = false;
        }
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=PaidMntRptOf" + DropDownList3.SelectedItem.ToString() + "OfCurrRpt.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        using (StringWriter sw = new StringWriter())
        {
            HtmlTextWriter hw = new HtmlTextWriter(sw);

            //To Export all pages
            GridView3.AllowPaging = false;
            this.BindGrid();
            GridView3.BorderColor = Color.Black;
            GridView3.HeaderRow.BackColor = Color.Snow;
            foreach (TableCell cell in GridView3.HeaderRow.Cells)
            {
                cell.BackColor = GridView3.HeaderStyle.BackColor;
            }
            foreach (GridViewRow row in GridView3.Rows)
            {
                row.BackColor = Color.White;
                foreach (TableCell cell in row.Cells)
                {
                    if (row.RowIndex % 2 == 0)
                    {
                        cell.BackColor = GridView3.AlternatingRowStyle.BackColor;
                    }
                    else
                    {
                        cell.BackColor = GridView3.RowStyle.BackColor;
                    }
                    cell.CssClass = "textmode";
                }
            }

            GridView3.RenderControl(hw);

            //style to format numbers to string
            string style = @"<style> .textmode { mso-number-format:\@; } </style>";
            Response.Write(style);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=PaidMntRptOf" + DropDownList3.SelectedItem.ToString() + "OfPrevRpt.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        using (StringWriter sw = new StringWriter())
        {
            HtmlTextWriter hw = new HtmlTextWriter(sw);

            //To Export all pages
            GridView4.AllowPaging = false;
            this.BindGrid();
            GridView4.BorderColor = Color.Black;
            GridView4.HeaderRow.BackColor = Color.Snow;
            foreach (TableCell cell in GridView4.HeaderRow.Cells)
            {
                cell.BackColor = GridView4.HeaderStyle.BackColor;
            }
            foreach (GridViewRow row in GridView4.Rows)
            {
                row.BackColor = Color.White;
                foreach (TableCell cell in row.Cells)
                {
                    if (row.RowIndex % 2 == 0)
                    {
                        cell.BackColor = GridView4.AlternatingRowStyle.BackColor;
                    }
                    else
                    {
                        cell.BackColor = GridView4.RowStyle.BackColor;
                    }
                    cell.CssClass = "textmode";
                }
            }

            GridView4.RenderControl(hw);

            //style to format numbers to string
            string style = @"<style> .textmode { mso-number-format:\@; } </style>";
            Response.Write(style);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }
    }
    protected void Button9_Click(object sender, EventArgs e)
    {
        DropDownList2.SelectedIndex = 0;
        DropDownList3.SelectedIndex = 0;
        DropDownList1.SelectedIndex = 0;
        Button1.Enabled = false;
        Button2.Enabled = false;
        Button7.Enabled = false;
        Button8.Enabled = false;
        GridView1.Visible = false;
        GridView2.Visible = false;
        GridView3.Visible = false;
        GridView4.Visible = false;
    }
    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex != 0 && DropDownList2.SelectedIndex != 0 && DropDownList3.SelectedIndex != 0)
        {
            Button7.Enabled = true;
            Button8.Enabled = true;
            Button8.Visible = true;
            Button7.Visible = true;
            Button1.Visible = false;
            Button2.Visible = false;
        }
        else
        {
            Button7.Enabled = false;
            Button8.Enabled = false;
        }
    }
}