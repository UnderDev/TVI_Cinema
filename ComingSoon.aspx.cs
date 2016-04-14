using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.ComponentModel;
using System.Drawing;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {
        ListView1.ItemCommand += new EventHandler<ListViewCommandEventArgs>(ListView1_ItemCommand);
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public string GetImage(object img)
    {
        return "data:image/jpg;base64," + Convert.ToBase64String((byte[])img);
    }

    void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        HttpCookie cookie = new HttpCookie("CommandArgument");
        cookie.Value = e.CommandArgument.ToString();
        Response.Cookies.Add(cookie);
        Response.Redirect("ComingSoonInfo.aspx");
    }


}