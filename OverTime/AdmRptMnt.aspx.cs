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

public partial class AdmRptMnt : System.Web.UI.Page
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
                sqlDataSource.SelectCommand = "SELECT dept,sec,name,SUM([totalhrs]) AS [totalhrs] FROM otentrytable WHERE toapprove = '" + Label5.Text + "' and toayear = '" + Label8.Text + "' and toamnt = '" + DropDownList2.SelectedValue.ToString() + "' and dept='" + DropDownList5.SelectedValue.ToString() + "' and sec='" + DropDownList6.SelectedValue.ToString() + "' GROUP BY dept,sec,name order by dept,sec";
                // Bind SQLDataSource to GridView after retrieving the records.
                GridView1.DataSource = sqlDataSource;
                GridView1.DataBind();
                GridView1.Visible = true;
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
                sqlDataSource.SelectCommand = "SELECT dept,sec,name,SUM([totalhrs]) AS [totalhrs] FROM otentrytable WHERE toapprove = '" + Label5.Text + "' and toayear = '" + Label8.Text + "' and toamnt = '" + DropDownList2.SelectedValue.ToString() + "' and dept='" + DropDownList5.SelectedValue.ToString() + "' GROUP BY dept,sec,name order by dept,sec";
                // Bind SQLDataSource to GridView after retrieving the records.
                GridView1.DataSource = sqlDataSource;
                GridView1.DataBind();
                GridView1.Visible = true;
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
                sqlDataSource.SelectCommand = "SELECT dept,sec,name,SUM([totalhrs]) AS [totalhrs] FROM otentrytable WHERE toapprove = '" + Label5.Text + "' and toayear = '" + Label8.Text + "' and toamnt = '" + DropDownList2.SelectedValue.ToString() + "' GROUP BY dept,sec,name order by dept,sec";                
                // Bind SQLDataSource to GridView after retrieving the records.
                GridView1.DataSource = sqlDataSource;
                GridView1.DataBind();
                GridView1.Visible = true;
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
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=AdmMonthWisRptOf" + DropDownList2.SelectedItem.ToString() + "_" + DropDownList1.SelectedItem.ToString() + ".xls");
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
    protected void OnPageIndexChanging(object sender, EventArgs e)
    {

    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    }
    protected void DropDownList5_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList6.Items.Clear();
        DropDownList6.Items.Insert(0, "");
        DropDownList1.SelectedIndex = 0;
        DropDownList2.SelectedIndex = 0;
    }
    protected void Button4_Click(object sender, EventArgs e)
    {

    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex != 0)
        {
            Button2.Enabled = true;
        }
        else
        {
            Button2.Enabled = false;
        }
    }
}