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

public partial class HosdRptOTStatus : System.Web.UI.Page
{
    SqlConnection mssqlconn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
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

                    }
                    else
                    {
                        dr2.Close();
                        SqlDataReader dr3 = cmd3.ExecuteReader();
                        if (dr3.Read() == true)
                        {
                            Label2.Text = dr3[2].ToString();
                            sec.Visible = true;
                        }
                        dr3.Close();
                    }
                    Button1.Enabled = false;
                    Button2.Enabled = false;
                    dr2.Close();
                    mssqlconn.Close();
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
        Response.AddHeader("content-disposition", "attachment;filename=ApprovedOTRptOf" + Label3.Text + ".xls");
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
    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=AllocationRptOf" + Label11.Text + "_" + DropDownList4.SelectedItem.ToString() + ".xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        using (StringWriter sw = new StringWriter())
        {
            HtmlTextWriter hw = new HtmlTextWriter(sw);

            //To Export all pages
            GridView1.AllowPaging = false;
            this.BindGrid1();
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
    protected void Button2_Click(object sender, EventArgs e)
    {
        Button3.Visible = true;
        Button4.Visible = false;
        Button3.Enabled = false;
        DropDownList4.SelectedIndex = 0;
        BindGrid();
    }
    private void BindGrid()
    {
        
        if (Label3.Text != "sec" && Label2.Text == "hodemail")
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
                sqlDataSource.SelectCommand = "SELECT [srno], [psno], [name], [shift], [otshift], [area], [otentrydt], [allocation], [totalhrs], [lunchded], [assignwrk], [usrremark], [replacepsno], [replacename] FROM [otentrytable] WHERE ([sec] = '" + Label3.Text + "') AND ([dept] = '" + Label1.Text + "') AND ([toapprove] =  '" + Label5.Text + "') AND ([otentrydt] BETWEEN '" + TextBox6.Text + "' AND '" + TextBox7.Text + "') ORDER BY [srno] DESC";
                //Label4.Text = DropDownList1.SelectedValue.ToString();
                // Bind SQLDataSource to GridView after retrieving the records.
                GridView2.DataSource = sqlDataSource;
                GridView2.DataBind();
                GridView2.Visible = true;
                GridView1.Visible = false;
                Button3.Enabled = true;
                norec.Visible = false;

                Button4.Visible = false;
            
        }

        else if (Label2.Text != "hodemail" && Label3.Text == "sec")
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
                sqlDataSource.SelectCommand = "SELECT [srno], [psno], [name], [shift], [otshift], [area], [otentrydt], [allocation], [totalhrs], [lunchded], [assignwrk], [usrremark], [replacepsno], [replacename] FROM [otentrytable] WHERE ([dept] = '" + Label1.Text + "') AND ([toapprove] =  '" + Label5.Text + "') AND ([otentrydt] BETWEEN '" + TextBox6.Text + "' AND '" + TextBox7.Text + "') ORDER BY [srno] DESC";
                //Label4.Text = DropDownList1.SelectedValue.ToString();
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
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        BindGrid1();
    }
    private void BindGrid1()
    {
        if (Label3.Text != "sec" && Label2.Text == "hodemail")
        {
            
                    // ConnectionString to NorthWind Database.\
                    string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    // Create SQLDataSource.
                    SqlDataSource sqlDataSource = new SqlDataSource();
                    sqlDataSource.ID = "SqlDataSourceAlloRpt";
                    this.Page.Controls.Add(sqlDataSource);
                    // Bind ConnectionString to SQLDataSource.
                    sqlDataSource.ConnectionString = cs;
                    //Label4.Text = DropDownList1.SelectedValue.ToString();
                    // Retrieve records with only 5 Columns from Employees table of NorthWind Database.
                    sqlDataSource.SelectCommand = "SELECT [srno], [psno], [name], [shift], [otshift], [area], [otentrydt], [allocation], [totalhrs], [lunchded], [assignwrk], [usrremark], [replacepsno], [replacename] FROM [otentrytable] WHERE ([sec] = '" + Label3.Text + "') AND ([dept] = '" + Label1.Text + "') AND ([toapprove] =  '" + Label5.Text + "') AND ([otentrydt] BETWEEN '" + TextBox6.Text + "' AND '" + TextBox7.Text + "') ORDER BY [srno] DESC";
                    // Bind SQLDataSource to GridView after retrieving the records.
                    GridView1.DataSource = sqlDataSource;
                    GridView1.DataBind();
                    GridView1.Visible = true;
                    GridView2.Visible = false;
                    norec.Visible = false;
                    Button4.Enabled = true;
                    Button4.Visible = true;
             
        }
        else if (Label2.Text != "hodemail" && Label3.Text == "sec")
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
                    sqlDataSource.SelectCommand = "SELECT [srno], [psno], [name], [shift], [otshift], [area], [otentrydt], [allocation], [totalhrs], [lunchded], [assignwrk], [usrremark], [replacepsno], [replacename] FROM [otentrytable] WHERE ([sec] = '" + DropDownList4.SelectedItem.ToString() + "') AND ([dept] = '" + Label1.Text + "') AND ([toapprove] =  '" + Label5.Text + "') AND ([otentrydt] BETWEEN '" + TextBox6.Text + "' AND '" + TextBox7.Text + "') ORDER BY [srno] DESC";

                //    Label4.Text = DropDownList1.SelectedValue.ToString();
                    // Bind SQLDataSource to GridView after retrieving the records.
                    GridView1.DataSource = sqlDataSource;
                    GridView1.DataBind();
                    GridView1.Visible = true;
                    GridView2.Visible = false;
                    norec.Visible = false;
                    Button4.Enabled = true;
                    Button4.Visible = true;
                    Button3.Visible = false;
                
        }
        else
        {
            norec.Visible = true;
            GridView1.Visible = false;
            GridView2.Visible = false;
        }
    }
    protected void OnPageIndexChanging(object sender, EventArgs e)
    {

    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        TextBox6.Text = null;
        TextBox6.Text = TextBox1.Text.ToString();
    }
    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {
        if(TextBox1.Text != null && TextBox2.Text != null)
        {
        TextBox7.Text = null;
        TextBox7.Text = TextBox2.Text.ToString();
            Button2.Enabled = true;
        }
        else
        {
            Button2.Enabled = false;
        }
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    }
    protected void Button9_Click(object sender, EventArgs e)
    {
        TextBox1.Text = null;
        TextBox6.Text = null;
        TextBox2.Text = null;
        TextBox7.Text= null;
        DropDownList4.SelectedIndex = 0;
        GridView1.Visible = false;
        GridView2.Visible = false;
    }
    protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (TextBox1.Text != null && TextBox2.Text != null && DropDownList4.SelectedIndex != 0)
        {
            Button2.Enabled = false;
            Button1.Enabled = true;
        }
        else
        {
            Button1.Enabled = false;
        }
    }
}