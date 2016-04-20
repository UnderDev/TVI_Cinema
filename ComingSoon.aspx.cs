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
using System.IO;
using System.Configuration;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {

        //If the user is the Admin, redirect them to the ComingSoonAdmin page, otherwise Display the listview
        if (User.IsInRole("Admin"))
            Server.Transfer("ComingSoonAdmin.aspx", true);          
        else
        {
            ListView lvComingsoon = (ListView)LoginView1.FindControl("lvwComingSoon");
            lvComingsoon.ItemCommand += new EventHandler<ListViewCommandEventArgs>(lvwComingSoon_ItemCommand);
        }
    }

    public string GetImage(object img)
    {
        return "data:image/jpg;base64," + Convert.ToBase64String((byte[])img);
    }


    protected void Page_Load(object sender, EventArgs e)
    {
    }

    void lvwComingSoon_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        //take selected movie from listview
        string word = e.CommandArgument.ToString();
        //set session objects
        Session["MovieCategory"] = "ComingSoon";
        Session["SelectedMovie"] =word;

       Response.Redirect("Movie.aspx");      
    }
}