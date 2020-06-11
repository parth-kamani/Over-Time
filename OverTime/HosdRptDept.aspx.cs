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

public partial class HosdRptDept : System.Web.UI.Page
{
    SqlConnection mssqlconn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        /*if (!IsPostBack)
        {
            this.BindGrid();
        }*/
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
                    Label1.Text = dr1[4].ToString();
                }
                mssqlconn.Close();
                Button3.Enabled = false;
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

                    }
                    else
                    {
                        dr2.Close();
                        SqlDataReader dr3 = cmd3.ExecuteReader();
                        if (dr3.Read() == true)
                        {
                            Label2.Text = dr3[2].ToString();
                        }
                        dr3.Close();
                    }

                    dr2.Close();
                    mssqlconn.Close();
                    Button1.Enabled = false;
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
        Response.AddHeader("content-disposition", "attachment;filename=DepartmentRptOf" + DropDownList1.SelectedItem.ToString() + ".xls");
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
                GridView1.Controls.Clear();
                // ConnectionString to NorthWind Database.\
                string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                // Create SQLDataSource.
                SqlDataSource sqlDataSource = new SqlDataSource();
                sqlDataSource.ID = "SqlDataSourcePMnthRpt";
                this.Page.Controls.Add(sqlDataSource);
                // Bind ConnectionString to SQLDataSource.
                sqlDataSource.ConnectionString = cs;
                // Retrieve records with only 5 Columns from Employees table of NorthWind Database.
                sqlDataSource.SelectCommand = "SELECT dept,sec, SUM([april]) AS [april],SUM([may]) AS [may],SUM([june]) AS [june],SUM([july]) AS [july],SUM([august]) AS [august],SUM([september]) AS [september],SUM([october]) AS [october],SUM([november]) AS [november],SUM([december]) AS [december],SUM([january]) AS [january],SUM([february]) AS [february],SUM([march]) AS [march],SUM([total]) AS [total] FROM otmnthtable WHERE year = '" + Label4.Text + "' and dept='" + Label1.Text + "' and sec='" + Label3.Text + "' GROUP BY dept,sec order by dept,sec";
                Label4.Text = DropDownList1.SelectedValue.ToString();
                // Bind SQLDataSource to GridView after retrieving the records.
                GridView1.DataSource = sqlDataSource;
                GridView1.DataBind();
                GridView1.Visible = true;
                tab.Visible = true;
                Button3.Enabled = true;
                norec.Visible = false;
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
                sqlDataSource.ID = "SqlDataSourcePMnthRpt";
                this.Page.Controls.Add(sqlDataSource);
                // Bind ConnectionString to SQLDataSource.
                sqlDataSource.ConnectionString = cs;
                // Retrieve records with only 5 Columns from Employees table of NorthWind Database.
                sqlDataSource.SelectCommand = "SELECT dept,sec, SUM([april]) AS [april],SUM([may]) AS [may],SUM([june]) AS [june],SUM([july]) AS [july],SUM([august]) AS [august],SUM([september]) AS [september],SUM([october]) AS [october],SUM([november]) AS [november],SUM([december]) AS [december],SUM([january]) AS [january],SUM([february]) AS [february],SUM([march]) AS [march],SUM([total]) AS [total] FROM otmnthtable WHERE year = '" + Label4.Text + "' and dept='" + Label1.Text + "' GROUP BY dept,sec order by dept,sec";
                Label4.Text = DropDownList1.SelectedValue.ToString();
                // Bind SQLDataSource to GridView after retrieving the records.
                GridView1.DataSource = sqlDataSource;
                GridView1.DataBind();
                GridView1.Visible = true;
                tab.Visible = true;
                Button3.Enabled = true;
                norec.Visible = false;
                Button1.Enabled = true;
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
    
    protected void OnPageIndexChanging(object sender, EventArgs e)
    {

    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        DropDownList1.SelectedIndex = 0;
        GridView1.Visible = false;
        Button3.Visible = true;
        Button3.Enabled = false;
        Button1.Enabled = false;
        tab.Visible = false;
    }
}