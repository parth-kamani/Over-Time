﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Logout : System.Web.UI.Page
{
    static string prevPage = String.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            prevPage = Request.UrlReferrer.ToString();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["User"] = "";
        Response.Redirect("logout.htm");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect(prevPage);
    }
}