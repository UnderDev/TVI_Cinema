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

       selected = MovieDB.GetMovie((string)Session["SelectedMovie"]);
        if (Session["SelectedDate"] != null)
            date = (DateTime)Session["SelectedDate"];
        else
            date = DateTime.Now;
        
        lblMovieTitle.Text = selected.Name;
        LblMovieDesc.Text = selected.Description;
        lblDate.Text = date.ToString("dd/mm/yy");
        LblRating.Text = selected.Rating;
        ImgPoster.ImageUrl = "data:image/jpg;base64," + Convert.ToBase64String(selected.Poster);
        //BulletedList1.DataSource = times;
        //BulletedList1.DataBind();      
    }

}