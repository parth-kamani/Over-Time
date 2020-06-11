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

public partial class NorRptOTStatus : System.Web.UI.Page
{
    SqlConnection mssqlconn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.BindGrid();
        }
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
                    Label6.Text = dr1[4].ToString();
                }
                mssqlconn.Close();
                BindGrid();
                Button3.Enabled = false;
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
    private void BindGrid()
    {
        if (TextBox6.Text != null && TextBox7.Text != null)
        {
            // ConnectionString to NorthWind Database.\
            string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            // Create SQLDataSource.
            SqlDataSource sqlDataSource = new SqlDataSource();
            sqlDataSource.ID = "SqlDataSourceStatusRpt";
            this.Page.Controls.Add(sqlDataSource);
            // Bind ConnectionString to SQLDataSource.
            sqlDataSource.ConnectionString = cs;
            // Retrieve records with only 5 Columns from Employees table of NorthWind Database.
            sqlDataSource.SelectCommand = "SELECT [srno], [psno], [name], [desig], [shift], [otshift], [costcentre], [area], [otentrydt], [allocation], [totalhrs], [lunchded], [assignwrk], [usrremark], [hosdapprove], [hosdremark], [replacepsno], [replacename] FROM [otentrytable] WHERE ([uid] = '" + Label1001.Text + "') AND ([dept] = '" + Label6.Text + "') AND ([hosdapprove] = '" + Label5.Text + "') AND ([otentrydt] BETWEEN '" + TextBox6.Text + "' AND '" + TextBox7.Text + "') ORDER BY [srno] DESC";
            // Bind SQLDataSource to GridView after retrieving the records.
            GridView2.DataSource = sqlDataSource;
            GridView2.DataBind();
            Button3.Enabled = true;
        }
        else
        {
            norec.Visible = true;
            GridView2.Visible = false;
        }
    }
    protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;
        this.BindGrid();
    }


    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=ApprovedRpt" + TextBox6.Text + "to" + TextBox7.Text + ".xls");
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
        GridView2.Visible = true;
        //Button3.Enabled = true;
        BindGrid();
    }
    /*protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        TextBox9.Text = null;
        GridView2.Visible = false;
        //string sel2;
        //sel2 = DropDownList2.SelectedIndex.ToString();
        //TextBox2.Text = sel2;
        //sel2 = DropDownList2.SelectedValue.ToString();
        //TextBox9.Text = sel2;
    }*/
    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {
        TextBox7.Text = null;
        TextBox7.Text = TextBox2.Text.ToString();
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        TextBox6.Text = null;
        TextBox6.Text = TextBox1.Text.ToString();
    }

}