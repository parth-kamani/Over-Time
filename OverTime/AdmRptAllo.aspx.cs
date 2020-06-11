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

public partial class AdmRptAllo : System.Web.UI.Page
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
                }
                mssqlconn.Close();
                Button3.Enabled = false;
                Button4.Visible = false;
                Button2.Enabled = false;
                Button1.Enabled = false;
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
    protected void Button1_Click(object sender, EventArgs e)
    {
        DropDownList2.SelectedIndex = 0;
        DropDownList3.SelectedIndex = 0;
        mssqlconn.Close();
        mssqlconn.Open();
        string sql1 = "select * from edit_year where yearnme ='" + DropDownList1.SelectedValue.ToString() + "'";
        SqlCommand cmd1 = new SqlCommand(sql1, mssqlconn);
        SqlDataReader dr1 = cmd1.ExecuteReader();
        if (dr1.Read() == true)
        {
            Label4.Text = dr1[0].ToString();
            Label9.Text = DropDownList3.SelectedValue.ToString();
        }
        mssqlconn.Close();
        Button3.Visible = true;
        Button4.Visible = false;
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
            Label9.Text = DropDownList3.SelectedValue.ToString();
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
                // Retrieve records with only 5 Columns from Employees table of NorthWind Database.
                sqlDataSource.SelectCommand = "SELECT dept,sec, SUM([planned]) AS [planned],SUM([modification]) AS [modification],SUM([overhauling]) AS [overhauling],SUM([erection]) AS [erection],SUM([safety]) AS [safety],SUM([emergency]) AS [emergency],SUM([absenteeism]) AS [absenteeism],SUM([againstvacancy]) AS [againstvacancy],SUM([training]) AS [training],SUM([process]) AS [process],SUM([others]) AS [others],SUM([preventive]) AS [preventive],SUM([shutdown]) AS [shutdown],SUM([qc]) AS [qc],SUM([breakdown]) AS [breakdown],SUM([WaterShortage]) AS [WaterShortage],SUM([total]) AS [total] FROM otallotable WHERE year = '" + Label4.Text + "' and dept='" + DropDownList5.SelectedValue.ToString() + "' and sec='" + DropDownList6.SelectedValue.ToString() + "' GROUP BY dept,sec order by dept,sec";
                Label4.Text = DropDownList1.SelectedValue.ToString();
                // Bind SQLDataSource to GridView after retrieving the records.
                GridView2.DataSource = sqlDataSource;
                GridView2.DataBind();
                GridView2.Visible = true;
                tab.Visible = true;
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
                // Retrieve records with only 5 Columns from Employees table of NorthWind Database.
                sqlDataSource.SelectCommand = "SELECT dept,sec, SUM([planned]) AS [planned],SUM([modification]) AS [modification],SUM([overhauling]) AS [overhauling],SUM([erection]) AS [erection],SUM([safety]) AS [safety],SUM([emergency]) AS [emergency],SUM([absenteeism]) AS [absenteeism],SUM([againstvacancy]) AS [againstvacancy],SUM([training]) AS [training],SUM([process]) AS [process],SUM([others]) AS [others],SUM([preventive]) AS [preventive],SUM([shutdown]) AS [shutdown],SUM([qc]) AS [qc],SUM([breakdown]) AS [breakdown],SUM([WaterShortage]) AS [WaterShortage],SUM([total]) AS [total] FROM otallotable WHERE year = '" + Label4.Text + "' and dept='" + DropDownList5.SelectedValue.ToString() + "' GROUP BY dept,sec order by dept,sec";
                Label4.Text = DropDownList1.SelectedValue.ToString();
                // Bind SQLDataSource to GridView after retrieving the records.
                GridView2.DataSource = sqlDataSource;
                GridView2.DataBind();
                GridView2.Visible = true;
                tab.Visible = true;
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
                // Retrieve records with only 5 Columns from Employees table of NorthWind Database.
                sqlDataSource.SelectCommand = "SELECT dept,sec, SUM([planned]) AS [planned],SUM([modification]) AS [modification],SUM([overhauling]) AS [overhauling],SUM([erection]) AS [erection],SUM([safety]) AS [safety],SUM([emergency]) AS [emergency],SUM([absenteeism]) AS [absenteeism],SUM([againstvacancy]) AS [againstvacancy],SUM([training]) AS [training],SUM([process]) AS [process],SUM([others]) AS [others],SUM([preventive]) AS [preventive],SUM([shutdown]) AS [shutdown],SUM([qc]) AS [qc],SUM([breakdown]) AS [breakdown],SUM([WaterShortage]) AS [WaterShortage],SUM([total]) AS [total] FROM otallotable WHERE year = '" + Label4.Text + "' GROUP BY dept,sec order by dept,sec";
                Label4.Text = DropDownList1.SelectedValue.ToString();
                // Bind SQLDataSource to GridView after retrieving the records.
                GridView2.DataSource = sqlDataSource;
                GridView2.DataBind();
                GridView2.Visible = true;
                tab.Visible = true;
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
                tab.Visible = false;
                Button3.Enabled = false;
            }
        }
    }
    protected void  Button2_Click(object sender, EventArgs e)
    {
        mssqlconn.Close();
        mssqlconn.Open();
        string sql1 = "select * from edit_year where yearnme ='" + DropDownList1.SelectedValue.ToString() + "'";
        SqlCommand cmd1 = new SqlCommand(sql1, mssqlconn);
        SqlDataReader dr1 = cmd1.ExecuteReader();
        if (dr1.Read() == true)
        {
            Label8.Text = dr1[0].ToString();
            Label9.Text = DropDownList3.SelectedValue.ToString();
        }
        mssqlconn.Close();
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
            Label9.Text = DropDownList3.SelectedValue.ToString();
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
                sqlDataSource.SelectCommand = "SELECT dept,sec, SUM([totalhrs]) AS [totalhrs] FROM otentrytable WHERE paidyear = '" + Label8.Text + "' and paidmonth='" + DropDownList3.SelectedValue.ToString() + "' and dept='" + DropDownList5.SelectedValue.ToString() + "' and sec='" + DropDownList6.SelectedValue.ToString() + "' and toapprove ='" + Label5.Text + "' and allocation='" + DropDownList2.SelectedValue.ToString() + "' GROUP BY dept,sec order by dept,sec";
                // Bind SQLDataSource to GridView after retrieving the records.
                GridView1.DataSource = sqlDataSource;
                GridView1.DataBind();
                GridView1.Visible = true;
                GridView2.Visible = false;
                tab.Visible = false;
                norec.Visible = false;
                Button3.Visible = false;
                Button4.Enabled = true;
                Button4.Visible = true;
            }
            else
            {
                norec.Visible = true;
                GridView1.Visible = false;
                GridView2.Visible = false;
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
                sqlDataSource.SelectCommand = "SELECT dept,sec, SUM([totalhrs]) AS [totalhrs] FROM otentrytable WHERE paidyear = '" + Label8.Text + "' and paidmonth='" + DropDownList3.SelectedValue.ToString() + "' and dept='" + DropDownList5.SelectedValue.ToString() + "' and toapprove ='" + Label5.Text + "' and allocation='" + DropDownList2.SelectedValue.ToString() + "' GROUP BY dept,sec order by dept,sec";
                // Bind SQLDataSource to GridView after retrieving the records.
                GridView1.DataSource = sqlDataSource;
                GridView1.DataBind();
                GridView1.Visible = true;
                GridView2.Visible = false;
                tab.Visible = false;
                norec.Visible = false;
                Button3.Visible = false;
                Button4.Enabled = true;
                Button4.Visible = true;
            }
            else
            {
                norec.Visible = true;
                GridView1.Visible = false;
                GridView2.Visible = false;
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
                sqlDataSource.SelectCommand = "SELECT dept,sec, SUM([totalhrs]) AS [totalhrs] FROM otentrytable WHERE paidyear = '" + Label8.Text + "' and paidmonth='" + DropDownList3.SelectedValue.ToString() + "' and toapprove ='" + Label5.Text + "' and allocation='" + DropDownList2.SelectedValue.ToString() + "' GROUP BY dept,sec order by dept,sec";
                // Bind SQLDataSource to GridView after retrieving the records.
                GridView1.DataSource = sqlDataSource;
                GridView1.DataBind();
                GridView1.Visible = true;
                GridView2.Visible = false;
                tab.Visible = false;
                norec.Visible = false;
                Button3.Visible = false;
                Button4.Enabled = true;
                Button4.Visible = true;
            }
            else
            {
                norec.Visible = true;
                GridView1.Visible = false;
                GridView2.Visible = false;
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
                + Convert.ToDouble(e.Row.Cells[13].Text)
                + Convert.ToDouble(e.Row.Cells[14].Text)
                + Convert.ToDouble(e.Row.Cells[15].Text)
                + Convert.ToDouble(e.Row.Cells[16].Text)
                + Convert.ToDouble(e.Row.Cells[17].Text);
            e.Row.Cells[18].Text = tot.ToString();
        }
    }
    protected void OnPageIndexChanging(object sender, EventArgs e)
    {

    }
    protected void  Button6_Click(object sender, EventArgs e)
    {
        
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=AdmAllocationRptOf" + DropDownList1.SelectedItem.ToString() + ".xls");
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
            GridView2.HeaderRow.Cells[2].Text = "Planned";
            GridView2.HeaderRow.Cells[3].Text = "Modification";
            GridView2.HeaderRow.Cells[4].Text = "Overhauling";
            GridView2.HeaderRow.Cells[5].Text = "Erection";
            GridView2.HeaderRow.Cells[6].Text = "Safety";
            GridView2.HeaderRow.Cells[7].Text = "Emergency";
            GridView2.HeaderRow.Cells[8].Text = "Absenteeism";
            GridView2.HeaderRow.Cells[9].Text = "Against Vacancy";
            GridView2.HeaderRow.Cells[10].Text = "Training";
            GridView2.HeaderRow.Cells[11].Text = "Process";
            GridView2.HeaderRow.Cells[12].Text = "Others";
            GridView2.HeaderRow.Cells[13].Text = "Preventive";
            GridView2.HeaderRow.Cells[14].Text = "Shutdown";
            GridView2.HeaderRow.Cells[15].Text = "QC";
            GridView2.HeaderRow.Cells[16].Text = "Breakdown";
            GridView2.HeaderRow.Cells[17].Text = "Water Shortage";
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
    protected void Button4_Click(object sender, EventArgs e)
    {

    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Button1.Enabled = true;
    }
    protected void DropDownList5_SelectedIndexChanged(object sender, EventArgs e)
    {
        //DropDownList6.Dispose();
        DropDownList6.Items.Clear();
        DropDownList6.Items.Insert(0, "");
        DropDownList1.SelectedIndex = 0;
        DropDownList3.SelectedIndex = 0;
        DropDownList2.SelectedIndex = 0;
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        DropDownList1.SelectedIndex = 0;
        DropDownList2.SelectedIndex = 0;
        DropDownList3.SelectedIndex = 0;
        DropDownList5.SelectedIndex = 0;
        DropDownList6.SelectedIndex = 0;
        GridView1.Visible = false;
        GridView2.Visible = false;
        Button4.Visible = false;
        Button3.Visible = true;
        Button3.Enabled = false;
        Button1.Enabled = false;
        Button2.Enabled = false;
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList3.SelectedIndex != 0)
        {
            Button2.Enabled = true;
        }
        else
        {
            Button2.Enabled = false;
        }
    }
    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList2.SelectedIndex = 0;
    }
}