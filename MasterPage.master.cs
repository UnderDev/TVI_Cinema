using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    private List<Movie> movieList;

    public List<Movie> MovieList
    {
        get
        {
            return movieList;
        }

        set
        {
            movieList = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        int i;
        movieList = MovieDB.GetMovieList();
        i = movieList.Count();// Use as a breakpoint if bindings dont work.
        if (!IsPostBack)
        {
            ddlSelectFilm.DataSource = movieList;
            ddlSelectFilm.DataValueField = "Name";
            ddlSelectFilm.DataTextField = "Name";
            ddlSelectFilm.DataBind();
            ddlSelectTimes.DataSource = null;
        }
    }
    protected void ddlSelectFilm_SelectedIndexChanged(object sender, EventArgs e)
    {
        /*ddlSelectTimes.Items.Clear();
        ddlSelectTimes.DataSource = movieList.ElementAt(ddlSelectFilm.SelectedIndex - 1).Date;
        ddlSelectTimes.DataBind();
        ddlSelectTimes.Items.Insert(0, "CHOOSE A DATE");*/
    }
}
