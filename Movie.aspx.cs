using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    //temp delete me later
    List<Movie> movieList = MovieDB.GetMovieList();
    List<String> times = new List<String>();//get times from sql
    //
    protected void Page_Load(object sender, EventArgs e)
    {
        //delete me too
        times.Add("11:00pm");
        times.Add("2:00pm");
        times.Add("5:00pm");
        times.Add("8:00pm");

        Session.Add("SelectedMovie", movieList.Last());
        DateTime now = DateTime.Now;
        Session.Add("SelectedDate", now);
        //

        Movie selected = (Movie)Session["SelectedMovie"];
        DateTime date = (DateTime)Session["SelectedDate"];
        lblMovieTitle.Text = selected.Name;
        LblMovieDesc.Text = selected.Description;
        lblDate.Text = date.ToString();
        BulletedList1.DataSource = times;
        BulletedList1.DataBind();
        ImgPoster.ImageUrl = "http://ia.media-imdb.com/images/M/MV5BOTAzODEzNDAzMl5BMl5BanBnXkFtZTgwMDU1MTgzNzE@._V1_UX182_CR0,0,182,268_AL_.jpg";
    }
}