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

public partial class HosdRptEmp : System.Web.UI.Page
{
    SqlConnection mssqlconn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        sec.Visible = false;
        if (!IsPostBack)
        {
            this.BindGrid();
            this.BindGrid1();
        }
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
                        DropDownList2.Visible = false;
                        //Button1.Visible = true;
                        Button2.Visible = false;
                    }
                    else
                    {
                        dr2.Close();
                        SqlDataReader dr3 = cmd3.ExecuteReader();
                        if (dr3.Read() == true)
                        {
                            Label2.Text = dr3[2].ToString();
                            sec.Visible = true;
                            //Button1.Visible = false;
                        }
                        dr3.Close();
                    }

                    dr2.Close();
                    mssqlconn.Close();
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
    /*protected void Button1_Click(object sender, EventArgs e)
    {
        
    }*/
    
    protected void GridView2_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        double tot = 0;

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            tot = tot + Convert.ToDouble(e.Row.Cells[4].Text)
                + Convert.ToDouble(e.Row.Cells[5].Text)
                + Convert.ToDouble(e.Row.Cells[6].Text)
                + Convert.ToDouble(e.Row.Cells[7].Text)
                + Convert.ToDouble(e.Row.Cells[8].Text)
                + Convert.ToDouble(e.Row.Cells[9].Text)
                + Convert.ToDouble(e.Row.Cells[10].Text)
                + Convert.ToDouble(e.Row.Cells[11].Text)
                + Convert.ToDouble(e.Row.Cells[12].Text)
                + Convert.ToDouble(e.Row.Cells[13].Text)
                + Convert.ToDouble(e.Row.Cells[14].Text)
                + Convert.ToDouble(e.Row.Cells[15].Text);
            e.Row.Cells[16].Text = tot.ToString();
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        
        mssqlconn.Close();
        mssqlconn.Open();
        string sql1 = "select * from edit_year where yearnme ='" + DropDownList1.SelectedValue.ToString() + "'";
        SqlCommand cmd1 = new SqlCommand(sql1, mssqlconn);
        SqlDataReader dr1 = cmd1.ExecuteReader();
        if (dr1.Read() == true)
        {
            Label4.Text = dr1[0].ToString();
        }
        mssqlconn.Close();
        Button3.Visible = false;
        Button4.Visible = true;
        Button3.Enabled = false;
        BindGrid1();
        GridView1.Visible = false;
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
        }
        mssqlconn.Close();
        if (Label3.Text != "sec" && Label2.Text == "hodemail")
        {
            if (Convert.ToInt32(Label4.Text) <= DateTime.Today.Year)
            {
                // ConnectionString to NorthWind Database.\
                string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                // Create SQLDataSource.
                SqlDataSource sqlDataSource = new SqlDataSource();
                sqlDataSource.ID = "SqlDataSourceEmpRpt";
                this.Page.Controls.Add(sqlDataSource);
                // Bind ConnectionString to SQLDataSource.
                sqlDataSource.ConnectionString = cs;
                // Retrieve records with only 5 Columns from Employees table of NorthWind Database.
                sqlDataSource.SelectCommand = "SELECT psno,name,dept,sec, SUM([april]) AS [april],SUM([may]) AS [may],SUM([june]) AS [june],SUM([july]) AS [july],SUM([august]) AS [august],SUM([september]) AS [september],SUM([october]) AS [october],SUM([november]) AS [november],SUM([december]) AS [december],SUM([january]) AS [january],SUM([february]) AS [february],SUM([march]) AS [march],SUM([total]) AS [total] FROM otmnthtable WHERE year = '" + Label4.Text + "' and dept='" + Label1.Text + "' and sec='" + Label3.Text + "' GROUP BY psno,name,dept,sec order by dept,sec";
                Label4.Text = DropDownList1.SelectedValue.ToString();
                // Bind SQLDataSource to GridView after retrieving the records.
                GridView2.DataSource = sqlDataSource;
                GridView2.DataBind();
                GridView2.Visible = true;
                tab.Visible = true;
                GridView1.Visible = false;
                Button4.Enabled = true;
                norec.Visible = false;
                Button3.Visible = false;
            }
            else
            {
                norec.Visible = true;
                GridView1.Visible = false;
                tab.Visible = false;
                Button3.Enabled = false;
                GridView2.Visible = false;
            }
        }

        else if (Label2.Text != "hodemail" && Label3.Text == "sec")
        {
            if (Convert.ToInt32(Label4.Text) <= DateTime.Today.Year)
            {
                // ConnectionString to NorthWind Database.\
                string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                // Create SQLDataSource.
                SqlDataSource sqlDataSource = new SqlDataSource();
                sqlDataSource.ID = "SqlDataSourceEmpRpt";
                this.Page.Controls.Add(sqlDataSource);
                // Bind ConnectionString to SQLDataSource.
                sqlDataSource.ConnectionString = cs;
                // Retrieve records with only 5 Columns from Employees table of NorthWind Database.
                sqlDataSource.SelectCommand = "SELECT psno,name,dept,sec, SUM([april]) AS [april],SUM([may]) AS [may],SUM([june]) AS [june],SUM([july]) AS [july],SUM([august]) AS [august],SUM([september]) AS [september],SUM([october]) AS [october],SUM([november]) AS [november],SUM([december]) AS [december],SUM([january]) AS [january],SUM([february]) AS [february],SUM([march]) AS [march],SUM([total]) AS [total] FROM otmnthtable WHERE year = '" + Label4.Text + "' and dept='" + Label1.Text + "' and sec='"+DropDownList2.SelectedValue.ToString()+"' GROUP BY psno,name,dept,sec order by dept,sec";
                Label4.Text = DropDownList1.SelectedValue.ToString();
                // Bind SQLDataSource to GridView after retrieving the records.
                GridView2.DataSource = sqlDataSource;
                GridView2.DataBind();
                GridView2.Visible = true;
                tab.Visible = true;
                GridView1.Visible = false;
                Button4.Enabled = true;
                norec.Visible = false;
                Button3.Visible = false;
            }
            else
            {
                norec.Visible = true;
                GridView1.Visible = false;
                tab.Visible = false;
                Button3.Enabled = false;
            }
        }
        else
        {
            norec.Visible = true;
            GridView1.Visible = false;
            tab.Visible = false;
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=EmpWisRptOf" + DropDownList1.SelectedItem.ToString() + ".xls");
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
            GridView1.HeaderRow.Cells[4].Text = "April";
            GridView1.HeaderRow.Cells[5].Text = "May";
            GridView1.HeaderRow.Cells[6].Text = "June";
            GridView1.HeaderRow.Cells[7].Text = "July";
            GridView1.HeaderRow.Cells[8].Text = "August";
            GridView1.HeaderRow.Cells[9].Text = "September";
            GridView1.HeaderRow.Cells[10].Text = "October";
            GridView1.HeaderRow.Cells[11].Text = "November";
            GridView1.HeaderRow.Cells[12].Text = "December";
            GridView1.HeaderRow.Cells[13].Text = "January";
            GridView1.HeaderRow.Cells[14].Text = "Febuary";
            GridView1.HeaderRow.Cells[15].Text = "March";
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
        Response.AddHeader("content-disposition", "attachment;filename=EmpWiseRptOf"+DropDownList2.SelectedValue.ToString()+"_"+ DropDownList1.SelectedValue.ToString() + ".xls");
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
            GridView2.HeaderRow.Cells[4].Text = "April";
            GridView2.HeaderRow.Cells[5].Text = "May";
            GridView2.HeaderRow.Cells[6].Text = "June";
            GridView2.HeaderRow.Cells[7].Text = "July";
            GridView2.HeaderRow.Cells[8].Text = "August";
            GridView2.HeaderRow.Cells[9].Text = "September";
            GridView2.HeaderRow.Cells[10].Text = "October";
            GridView2.HeaderRow.Cells[11].Text = "November";
            GridView2.HeaderRow.Cells[12].Text = "December";
            GridView2.HeaderRow.Cells[13].Text = "January";
            GridView2.HeaderRow.Cells[14].Text = "Febuary";
            GridView2.HeaderRow.Cells[15].Text = "March";
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
    protected void OnPageIndexChanging(object sender, EventArgs e)
    {

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Button1.Enabled = true;
        DropDownList2.SelectedIndex = 0;

        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DropDownList2.SelectedIndex = 0;
        mssqlconn.Close();
        mssqlconn.Open();
        string sql1 = "select * from edit_year where yearnme ='" + DropDownList1.SelectedValue.ToString() + "'";
        SqlCommand cmd1 = new SqlCommand(sql1, mssqlconn);
        SqlDataReader dr1 = cmd1.ExecuteReader();
        if (dr1.Read() == true)
        {
            Label4.Text = dr1[0].ToString();
        }
        mssqlconn.Close();
        Button3.Visible = true;
        Button4.Visible = false;
        Button3.Enabled = false;
        BindGrid();
        GridView2.Visible = false;
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
        }
        mssqlconn.Close();
        if (Label3.Text != "sec" && Label2.Text == "hodemail")
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
                // Retrieve records with only 5 Columns from Employees table of NorthWind Database.
                sqlDataSource.SelectCommand = "SELECT psno,name,dept,sec, SUM([april]) AS [april],SUM([may]) AS [may],SUM([june]) AS [june],SUM([july]) AS [july],SUM([august]) AS [august],SUM([september]) AS [september],SUM([october]) AS [october],SUM([november]) AS [november],SUM([december]) AS [december],SUM([january]) AS [january],SUM([february]) AS [february],SUM([march]) AS [march],SUM([total]) AS [total] FROM otmnthtable WHERE year = '" + Label4.Text + "' and dept='" + Label1.Text + "' and sec='" + Label3.Text + "' GROUP BY psno,name,dept,sec order by dept,sec";
                Label4.Text = DropDownList1.SelectedValue.ToString();
                // Bind SQLDataSource to GridView after retrieving the records.
                GridView1.DataSource = sqlDataSource;
                GridView1.DataBind();
                GridView1.Visible = true;
                tab.Visible = true;
                GridView2.Visible = false;
                Button3.Enabled = true;
                norec.Visible = false;

                Button4.Visible = false;
            }
            else
            {
                norec.Visible = true;
                GridView1.Visible = false;
                tab.Visible = false;
                Button3.Enabled = false;
            }
        }

        else if (Label2.Text != "hodemail" && Label3.Text == "sec")
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
                // Retrieve records with only 5 Columns from Employees table of NorthWind Database.
                sqlDataSource.SelectCommand = "SELECT psno,name,dept,sec, SUM([april]) AS [april],SUM([may]) AS [may],SUM([june]) AS [june],SUM([july]) AS [july],SUM([august]) AS [august],SUM([september]) AS [september],SUM([october]) AS [october],SUM([november]) AS [november],SUM([december]) AS [december],SUM([january]) AS [january],SUM([february]) AS [february],SUM([march]) AS [march],SUM([total]) AS [total] FROM otmnthtable WHERE year = '" + Label4.Text + "' and dept='" + Label1.Text + "' GROUP BY psno,name,dept,sec order by dept,sec";
                Label4.Text = DropDownList1.SelectedValue.ToString();
                // Bind SQLDataSource to GridView after retrieving the records.
                GridView1.DataSource = sqlDataSource;
                GridView1.DataBind();
                GridView1.Visible = true;
                tab.Visible = true;
                GridView2.Visible = true;
                Button3.Enabled = true;
                norec.Visible = false;
                Button4.Visible = false;
            }
            else
            {
                norec.Visible = true;
                GridView1.Visible = false;
                tab.Visible = false;
                Button3.Enabled = false;
            }
        }
        else
        {
            norec.Visible = true;
            GridView1.Visible = false;
            tab.Visible = false;
        }
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        DropDownList1.SelectedIndex = 0;
        DropDownList2.SelectedIndex = 0;
        Button1.Enabled = false;
        Button2.Enabled = false;
        GridView1.Visible = false;
        GridView2.Visible = false;
        tab.Visible = false;
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        Button2.Enabled = true;
        Button1.Enabled = false;
    }
}