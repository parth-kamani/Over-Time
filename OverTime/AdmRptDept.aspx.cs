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

public partial class AdmRptDept : System.Web.UI.Page
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
                    Button1.Enabled = false;
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
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=AdmDepartmentRptOf" + DropDownList1.SelectedItem.ToString() + ".xls");
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
            GridView1.HeaderRow.Cells[2].Text = "April";
            GridView1.HeaderRow.Cells[3].Text = "May";
            GridView1.HeaderRow.Cells[4].Text = "June";
            GridView1.HeaderRow.Cells[5].Text = "July";
            GridView1.HeaderRow.Cells[6].Text = "August";
            GridView1.HeaderRow.Cells[7].Text = "September";
            GridView1.HeaderRow.Cells[8].Text = "October";
            GridView1.HeaderRow.Cells[9].Text = "November";
            GridView1.HeaderRow.Cells[10].Text = "December";
            GridView1.HeaderRow.Cells[11].Text = "January";
            GridView1.HeaderRow.Cells[12].Text = "February";
            GridView1.HeaderRow.Cells[13].Text = "March";
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

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Button1.Enabled = true;
        mssqlconn.Close();
        mssqlconn.Open();
        string sql1 = "select * from edit_year where yearnme ='" + DropDownList1.SelectedValue.ToString() + "'";
        SqlCommand cmd1 = new SqlCommand(sql1, mssqlconn);
        SqlDataReader dr1 = cmd1.ExecuteReader();
        if (dr1.Read() == true)
        {
            Label4.Text = dr1[0].ToString();
            Label7.Text = dr1[0].ToString();
        }
        mssqlconn.Close();
        Button3.Visible = true;
        Button3.Enabled = false;
        //BindGrid();
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
                sqlDataSource.SelectCommand = "SELECT dept,sec, SUM([april]) AS [april],SUM([may]) AS [may],SUM([june]) AS [june],SUM([july]) AS [july],SUM([august]) AS [august],SUM([september]) AS [september],SUM([october]) AS [october],SUM([november]) AS [november],SUM([december]) AS [december],SUM([january]) AS [january],SUM([february]) AS [february],SUM([march]) AS [march],SUM([total]) AS [total] FROM otmnthtable WHERE year = '" + Label8.Text + "' and dept='" + DropDownList5.SelectedValue.ToString() + "' and sec='" + DropDownList6.SelectedValue.ToString() + "' GROUP BY dept,sec order by dept,sec";
                // Bind SQLDataSource to GridView after retrieving the records.
                GridView1.DataSource = sqlDataSource;
                GridView1.DataBind();
                GridView1.Visible = true;
                
                tab.Visible = false;
                norec.Visible = false;
                Button3.Enabled = true;
                Button3.Visible = true;
            }
            else
            {
                norec.Visible = true;
                GridView1.Visible = false;
                tab.Visible = false;
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
                sqlDataSource.SelectCommand = "SELECT dept,sec, SUM([april]) AS [april],SUM([may]) AS [may],SUM([june]) AS [june],SUM([july]) AS [july],SUM([august]) AS [august],SUM([september]) AS [september],SUM([october]) AS [october],SUM([november]) AS [november],SUM([december]) AS [december],SUM([january]) AS [january],SUM([february]) AS [february],SUM([march]) AS [march],SUM([total]) AS [total] FROM otmnthtable WHERE year = '" + Label8.Text + "' and dept='" + DropDownList5.SelectedValue.ToString() + "' GROUP BY dept,sec order by dept,sec";
                // Bind SQLDataSource to GridView after retrieving the records.
                GridView1.DataSource = sqlDataSource;
                GridView1.DataBind();
                GridView1.Visible = true;
                tab.Visible = false;
                norec.Visible = false;
                Button3.Enabled = true;
                Button3.Visible = true;
            }
            else
            {
                norec.Visible = true;
                GridView1.Visible = false;
                tab.Visible = false;
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
                sqlDataSource.SelectCommand = "SELECT dept,sec, SUM([april]) AS [april],SUM([may]) AS [may],SUM([june]) AS [june],SUM([july]) AS [july],SUM([august]) AS [august],SUM([september]) AS [september],SUM([october]) AS [october],SUM([november]) AS [november],SUM([december]) AS [december],SUM([january]) AS [january],SUM([february]) AS [february],SUM([march]) AS [march],SUM([total]) AS [total] FROM otmnthtable WHERE year = '" + Label8.Text + "' GROUP BY dept,sec order by dept,sec";
                // Bind SQLDataSource to GridView after retrieving the records.
                GridView1.DataSource = sqlDataSource;
                GridView1.DataBind();
                GridView1.Visible = true;
                tab.Visible = false;
                norec.Visible = false;
                Button3.Enabled = true;
                Button3.Visible = true;
            }
            else
            {
                norec.Visible = true;
                GridView1.Visible = false;
                tab.Visible = false;
                Button3.Enabled = false;
            }
        }   
    }
    protected void GridView2_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        double tot = 0;

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            tot = tot + Convert.ToDouble(e.Row.Cells[2].Text)
                + Convert.ToDouble(e.Row.Cells[3].Text)
                + Convert.ToDouble(e.Row.Cells[4].Text)
                + Convert.ToDouble(e.Row.Cells[5].Text)
                + Convert.ToDouble(e.Row.Cells[6].Text)
                + Convert.ToDouble(e.Row.Cells[7].Text)
                + Convert.ToDouble(e.Row.Cells[8].Text)
                + Convert.ToDouble(e.Row.Cells[9].Text)
                + Convert.ToDouble(e.Row.Cells[10].Text)
                + Convert.ToDouble(e.Row.Cells[11].Text)
                + Convert.ToDouble(e.Row.Cells[12].Text)
                + Convert.ToDouble(e.Row.Cells[13].Text);
            e.Row.Cells[14].Text = tot.ToString();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        mssqlconn.Close();
        mssqlconn.Open();
        string sql1 = "select * from edit_year where yearnme ='" + DropDownList1.SelectedValue.ToString() + "'";
        SqlCommand cmd1 = new SqlCommand(sql1, mssqlconn);
        SqlDataReader dr1 = cmd1.ExecuteReader();
        if (dr1.Read() == true)
        {
            Label8.Text = dr1[0].ToString();
        }
        mssqlconn.Close();
        BindGrid();
    }
    protected void OnPageIndexChanging(object sender, EventArgs e)
    {

    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        DropDownList1.SelectedIndex = 0;
        DropDownList5.SelectedIndex = 0;
        DropDownList6.SelectedIndex = 0;
        GridView1.Visible = false;
        Button3.Visible = true;
        Button3.Enabled = false;
        Button1.Enabled = false;
    }
    protected void DropDownList5_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList6.Items.Clear();
        DropDownList6.Items.Insert(0, "");
        DropDownList1.SelectedIndex = 0;
    }
}