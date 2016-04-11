using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        Movie selected = (Movie)Session["SelectedMovie"];
        DateTime date = (DateTime)Session["SelectedDate"];
        lblMovieTitle.Text = selected.Name;
        LblMovieDesc.Text = selected.Description;
        lblDate.Text = date.ToString("dd/mm/yy");
        LblRating.Text = selected.Rating;
        //BulletedList1.DataSource = times;
        //BulletedList1.DataBind();      
    }


    protected void ImgBinding(object sender, EventArgs e)
    {
        Movie selected = (Movie)Session["SelectedMovie"];
        ImgPoster.ImageUrl = "data:image/jpg;base64," + Convert.ToBase64String(selected.Poster); ;
    }
}