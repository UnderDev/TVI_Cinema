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
        if (!User.IsInRole("Admin"))
        {
            DataList dl = (DataList)LoginView1.FindControl("DataList2");

            dl.SelectedIndex = e.Item.ItemIndex;
            Session["SelectedMovie"] = ((Label)dl.SelectedItem.FindControl("NameLabel")).Text;
            Session["MovieCategory"] = "Regular";
            Response.Redirect("Movie.aspx", true);
        }
    }
    protected void dvwComingSoon_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        Label lblError = (Label)LoginView1.FindControl("lblError");
        if (e.Exception != null)
        {
            lblError.Text = "An update error has occurred. " + e.Exception.Message;
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
        }
        else
        {
            lblError.Text = "Item Succesfully Updated";
        }
    }
    protected void dvwComingSoon_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
    {
        Label lblError = (Label)LoginView1.FindControl("lblError");
        if (e.Exception != null)
        {
            lblError.Text = "A deletion error has occurred. " + e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else
        {
            lblError.Text = "Item Succesfully Deleted";
        }
    }
    protected void dvwComingSoon_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        Label lblError = (Label)LoginView1.FindControl("lblError");
        if (e.Exception != null)
        {
            lblError.Text = "An Insert error has occurred. " + e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else
        {
            lblError.Text = "Item Succesfully Inserted";
        }
    }
}