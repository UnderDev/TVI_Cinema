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
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["SelectedMovie"] == null)
            Response.Redirect("Default.aspx", true);
        selected = MovieDB.GetMovie((string)Session["SelectedMovie"]);
        if (Session["SelectedDate"] != null)
            date = (DateTime)Session["SelectedDate"];
        else
            date = DateTime.Now;
        
        lblMovieTitle.Text = selected.Name;
        //LblMovieDesc.Text = selected.Description;
        lblDate.Text = string.Format("{0:dddd} the {0:dd}{1} of {0:MMMM yyyy}", DateTime.Now, ((DateTime.Now.Day % 10 == 1 && DateTime.Now.Day != 11) ? "st"
                                                                                    : (DateTime.Now.Day % 10 == 2 && DateTime.Now.Day != 12) ? "nd"
                                                                                    : (DateTime.Now.Day % 10 == 3 && DateTime.Now.Day != 13) ? "rd"
                                                                                    : "th"));
        //LblRating.Text = selected.Rating;
        ImgPoster.ImageUrl = "data:image/jpg;base64," + Convert.ToBase64String(selected.Poster);
        //BulletedList1.DataSource = times;
        //BulletedList1.DataBind();      
    }


    protected void sdsShowTimes_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        Label lblScreen = (Label)dvMovieInfo.Rows[5].FindControl("lblScreen");
        e.Command.Parameters["@Screen"].Value = lblScreen.Text;
    }
}