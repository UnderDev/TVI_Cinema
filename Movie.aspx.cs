using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    Movie selected;
    DateTime date;
    bool comingsoon = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        ViewState["PreviousPageUrl"] = Request.UrlReferrer.ToString();

        if(ViewState["PreviousPageUrl"] != null)
        {
            if(ViewState["PreviousPageUrl"].ToString().Contains("ComingSoon"))
            {
                comingsoon = true;
            }
        }

        if (Session["SelectedMovie"] == null)
            Response.Redirect("Default.aspx", true);
        selected = MovieDB.GetMovie((string)Session["SelectedMovie"]);

        if (Session["SelectedDate"] != null)
            date = (DateTime)Session["SelectedDate"];
        else
            date = DateTime.Now;
        
        lblMovieTitle.Text = selected.Name;
        lblDate.Text = string.Format("{0:dddd} the {0:dd}{1} of {0:MMMM yyyy}", DateTime.Now, ((DateTime.Now.Day % 10 == 1 && DateTime.Now.Day != 11) ? "st"
                                                                                    : (DateTime.Now.Day % 10 == 2 && DateTime.Now.Day != 12) ? "nd"
                                                                                    : (DateTime.Now.Day % 10 == 3 && DateTime.Now.Day != 13) ? "rd"
                                                                                    : "th"));
        ImgPoster.ImageUrl = "data:image/jpg;base64," + Convert.ToBase64String(selected.Poster);
    }


    //Gets the screen number for the currently selected movie from the details view
    protected void sdsShowTimes_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        Label lblScreen = (Label)dvMovieInfo.Rows[5].FindControl("lblScreen");
        e.Command.Parameters["@Screen"].Value = lblScreen.Text;
    }
}