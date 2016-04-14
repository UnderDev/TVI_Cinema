using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {


    }

    public string GetImage(object img)
    {
        return "data:image/jpg;base64," + Convert.ToBase64String((byte[])img);
    }


    //when photo is clicked, event object should set statesession="name_of_movie" and send to movie page
   
    
    protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
    {
        
        DataList2.SelectedIndex = e.Item.ItemIndex;
        Session["SelectedMovie"] = ((Label)DataList2.SelectedItem.FindControl("NameLabel")).Text;
        Response.Redirect("Movie.aspx", true);
        
    }
}