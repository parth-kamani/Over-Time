using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class HosdSerApproveOT : System.Web.UI.Page
{
    SqlConnection mssqlconn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    public string x;
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
                string ps = Session["User"].ToString();
                mssqlconn.Open();
                string sql1 = "select * from staff_entry where psno='" + Session["User"] + "'";
                SqlCommand cmd1 = new SqlCommand(sql1, mssqlconn);
                SqlDataReader dr1 = cmd1.ExecuteReader();
                if (dr1.Read() == true)
                {
                    Label1.Text = dr1[4].ToString();
                    Label5.Text = dr1[6].ToString();
                }
                dr1.Close();
                mssqlconn.Close();
                if (Label1.Text != null)
                {
                    mssqlconn.Open();
                    string sql2 = "select * from deptsec where hosname='" + Label1001.Text + "' and dept='" + Label1.Text + "'";
                    SqlCommand cmd2 = new SqlCommand(sql2, mssqlconn);
                    string sql3 = "select * from depthead where hodemail='" + Label5.Text + "' and dept='" + Label1.Text + "'";
                    SqlCommand cmd3 = new SqlCommand(sql3, mssqlconn);

                    SqlDataReader dr2 = cmd2.ExecuteReader();
                    if (dr2.Read() == true)
                    {
                        Label2.Text = dr2[2].ToString();
                        // ConnectionString to NorthWind Database.\
                        string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                        // Create SQLDataSource.
                        SqlDataSource sqlDataSource = new SqlDataSource();
                        sqlDataSource.ID = "SqlDataSourceOTApprove";
                        this.Page.Controls.Add(sqlDataSource);
                        // Bind ConnectionString to SQLDataSource.
                        sqlDataSource.ConnectionString = cs;
                        // Retrieve records with only 5 Columns from Employees table of NorthWind Database.
                        sqlDataSource.SelectCommand = "SELECT * FROM [otentrytable] WHERE ([sec] = '" + Label2.Text + "') AND ([dept] = '" + Label1.Text + "') AND ([hosdapprove] = '" + Label4.Text + "') ORDER BY [srno] DESC";
                        // Bind SQLDataSource to GridView after retrieving the records.
                        GridView1.DataSource = sqlDataSource;
                        GridView1.DataBind();
                    }
                    else
                    {
                        dr2.Close();
                        SqlDataReader dr3 = cmd3.ExecuteReader();
                        if (dr3.Read() == true)
                        {
                            Label5.Text = dr3[2].ToString();
                            if (Label5.Text != null)
                            {
                                // ConnectionString to NorthWind Database.\
                                string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                                // Create SQLDataSource.
                                SqlDataSource sqlDataSource = new SqlDataSource();
                                sqlDataSource.ID = "SqlDataSourceOTApprove";
                                this.Page.Controls.Add(sqlDataSource);
                                // Bind ConnectionString to SQLDataSource.
                                sqlDataSource.ConnectionString = cs;
                                // Retrieve records with only 5 Columns from Employees table of NorthWind Database.
                                sqlDataSource.SelectCommand = "SELECT * FROM [otentrytable] WHERE ([dept] = '" + Label1.Text + "') AND ([hosdapprove] = '" + Label4.Text + "') ORDER BY [srno] DESC";
                                // Bind SQLDataSource to GridView after retrieving the records.
                                GridView1.DataSource = sqlDataSource;
                                GridView1.DataBind();
                            }
                        }
                        dr3.Close();
                    }
                    dr2.Close();
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
        mssqlconn.Close();
    }
    protected void GridView1_RowEditing1(object sender, GridViewEditEventArgs e)
    {
        Response.Redirect("HosdSerApproveOTEdit.aspx?Id=" + GridView1.Rows[e.NewEditIndex].Cells[2].Text);
    }
    protected void GridView1_RowUpdating1(object sender, GridViewUpdateEventArgs e)
    {
        mssqlconn.Open();
        string sql = "UPDATE otentrytable set hosdapprove='" + Label6.Text + "', hosdremark='" + Label3.Text + "', toapprove = '"+ Label4.Text +"' where srno =" + GridView1.Rows[e.RowIndex].Cells[2].Text + "";
        SqlCommand cmd = new SqlCommand(sql, mssqlconn);

        cmd.ExecuteNonQuery();

        mssqlconn.Close();
        Response.Redirect("HosdSerApproveOT.aspx");
    }
    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {


    }
}