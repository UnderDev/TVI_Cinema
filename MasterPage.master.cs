using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

public partial class MasterPage : System.Web.UI.MasterPage
{
    public List<Movie> movieList;
    protected void Page_Load(object sender, EventArgs e)
    {
        //int i;

        //i = movieList.Count();// Use as a breakpoint if bindings dont work.
        
        //this code only needs to run when its not a postBack

        movieList = MovieDB.GetMovieList();
        //i = movieList.Count();// Use as a breakpoint if bindings dont work.

        if (!IsPostBack)
        {
            //get list of movies from MovieDB
            movieList = MovieDB.GetMovieList();

            //set data source for film drop down list
            ddlSelectFilm.DataSource = movieList;
            //the name field needs to be bound, and will also be the identifier
            ddlSelectFilm.DataValueField = "Name";
            ddlSelectFilm.DataTextField = "Name";
            //bind the data
            ddlSelectFilm.DataBind();

            //get list of dates from genDates
            List<String> dates = genDates();

            //set source of dates ddl to above list
            ddlSelectTimes.DataSource = dates;
            ddlSelectTimes.DataBind();
        }
    }

    private List<String> genDates()
    {
        //dateTime and list of dateTime objects created
        DateTime dt = DateTime.Now;
        List<String>dates = new List<string>();
        //looping 7 times to accomodate a week's worth of dateTime objects
        for (int dateLoop = 0; dateLoop < 7; dateLoop++)
        {
            //current date is added to the list
            dates.Add(dateTimeToString(dt));
            //date is incremented by 1 day
            dt = dt.AddDays(1);
        }
        //after the list is complete, return it
        return dates;
    }
    public String dateTimeToString(DateTime dt)
    {
        //converts dateTime object to a string
        return (dt.DayOfWeek.ToString() + ", " + dt.Day + " " + dt.ToString("MMMM"));
    }

    protected void btnShowCal_Click(object sender, EventArgs e)
    {
        //button switches visibility based on state of calendar
        if (Calendar1.Visible == false)
        {
            Calendar1.Visible = true;
        }
        else
        {
            Calendar1.Visible = false;
        }   
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        //list of dates is taken from genDates
        List<String>dates = genDates();
        //get the selected date the user entered to the calendar
        DateTime dt = Calendar1.SelectedDate;
        //selctdDate refers to the location of the user selected date in the dates list
        int selctdDate = srchDates(dateTimeToString(dt), dates);
        //srchDates returns a -1 if the date wasnt in the list
        if (selctdDate != -1)
        {
            //set the value in the ddl to the selected date
            //1 is added to the selected date as the first value in the ddl 
            //says "choose a date"
            ddlSelectTimes.SelectedIndex = selctdDate + 1;
        }
        else
        {
            //send error message to user saying invalid date
        }
        //date selected, calendar no longer needed 
        Calendar1.Visible = false;
    }

    public int srchDates(String dt, List<String> dates)
    {
        //simple search to see if dt is in the list dates
        for (int datesLoop = 0; datesLoop < dates.Count(); datesLoop++)
        {
            if(dt.Equals(dates[datesLoop]))
            {
                //if found, the position in dates is returned
                return datesLoop;
            }
        }
        //if loop exits with no value found
        //-1 is returned
        return -1;
    }
}
