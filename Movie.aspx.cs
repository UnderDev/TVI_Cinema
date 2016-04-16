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

        //prevents a user from landing on the page without selecting a movie from the ddl/comingsoon.aspx/default.aspx
        if (Session["SelectedMovie"] == null)
            Response.Redirect("Default.aspx", true);
        
        //MovieCategory seperates currently showing movies from movies that havent released(and lack the data fields that a regular movie has)
        string movieType = (string)Session["MovieCategory"];

        //format the page if the movie type is comingsoon
        if (movieType == "ComingSoon")
        {
            //grabs the movie from the db class
            selected = MovieDB.GetComingSoonMovie((string)Session["SelectedMovie"]);
            odsSingleMovie.SelectMethod = "GetComingSoonMovie";          

            //hide irrelevant fields from the details view
            dvMovieInfo.Rows[5].Visible = false;
            dvMovieInfo.Rows[4].Visible = false;
            dvMovieInfo.Rows[3].Visible = false;

            //also hide showtimes
            lblDate.Enabled = false;
            gvTimes.Enabled = false;
        }
        else//movie is currently playing
        {
            selected = MovieDB.GetMovie((string)Session["SelectedMovie"]);
            
            if (Session["SelectedDate"] != null)
                date = (DateTime)Session["SelectedDate"];
            else
            {
                date = DateTime.Now;
                Session["SelectedDate"] = date;
            }

            //formats the selected day, as grammatically correct as possible        
            lblDate.Text = string.Format("{0:dddd} the {0:dd}{1} of {0:MMMM yyyy}", date, ((date.Day % 10 == 1 && date.Day != 11) ? "st"
                                                                                        : (date.Day % 10 == 2 && date.Day != 12) ? "nd"
                                                                                        : (date.Day % 10 == 3 && date.Day != 13) ? "rd"
                                                                                        : "th"));

        }
        lblMovieTitle.Text = selected.Name;

        //converts the binary array storing the poster to a jpg encoded string
        ImgPoster.ImageUrl = "data:image/jpg;base64," + Convert.ToBase64String(selected.Poster);

        //set the trailer url depending on which movie is currently selected
        ifrmTrailerEmbed.Attributes.Add("src", "https://www.youtube.com/embed/" +selected.TrailerURL);
    }


    //Gets the screen number for the currently selected movie from the details view
    protected void sdsShowTimes_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        Label lblScreen = (Label)dvMovieInfo.Rows[5].FindControl("lblScreen");
        e.Command.Parameters["@Screen"].Value = lblScreen.Text;
    }
    
    protected void btnBooking_Click(object sender, EventArgs e)
    {
        //collect all the booking information from controls
        string time = ddlShowings.SelectedItem.Text;
        int hour = Convert.ToInt32(time.Substring(0, time.Length - 5));
        DateTime showing = new DateTime(date.Year, date.Month, date.Day, hour, 0, 0);
        Label dimLabel = (Label)gvTimes.Rows[ddlShowings.SelectedIndex].FindControl("lblDimension");

        //create the booking object and send it to session
        Booking booking = new Booking((String)Session["SelectedMovie"]);
        booking.ScreenNo = selected.Screen;
        booking.SelctdDateTime = showing;            
        booking.Dimension = Convert.ToInt32(dimLabel.Text);
        Session["Booking"] = booking;

        Response.Redirect("BookingPage.aspx", true);
    }
}