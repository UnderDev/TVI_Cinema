﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Web.Security;

public partial class MasterPage : System.Web.UI.MasterPage
{
    public List<Movie> movieList;
    public List<DateTime> datesList;

    protected void Page_Load(object sender, EventArgs e)
    {
        disableNonAdminOptions();
        //int i;

        //i = movieList.Count();// Use as a breakpoint if bindings dont work.

        //this code only needs to run when its not a postBack

        movieList = MovieDB.GetMovieList();
        if (datesList == null)
        {
            datesList = new List<DateTime>();
        }
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

    //If the user is not in the Role Admin, Remove the Button Screen Config from the user
    public void disableNonAdminOptions()
    {
        if (!Roles.IsUserInRole("Admin"))
        {
            MenuItemCollection menuItems = mNavHeader.Items;
            MenuItem adminItem = new MenuItem();
            foreach (MenuItem menuItem in menuItems)
            {
                if (menuItem.Text == "Administration")
                    adminItem = menuItem;
            }
            menuItems.Remove(adminItem);
        }
    }

    public String dateTimeFromString(DateTime dt)
    {
        //converts String to a DateTime Object
        return (dt.DayOfWeek.ToString() + ", " + dt.Day + " " + dt.ToString("MMMM"));
    }

    protected void btnShowCal_Click(object sender, EventArgs e)
    {
        //button switches visibility based on state of calendar
        if (clnMasterDate.Visible == false)
        {
            clnMasterDate.Visible = true;
        }
        else
        {
            clnMasterDate.Visible = false;
            
        }
    }

    public List<String> genDates()
    {
        //dateTime and list of dateTime objects created
        DateTime dt = DateTime.Now;
        List<String> dates = new List<string>();
        if (datesList == null)
        {
            datesList = new List<DateTime>();
        }
        //looping 7 times to accomodate a week's worth of dateTime objects
        for (int dateLoop = 0; dateLoop < 7; dateLoop++)
        {
            datesList.Add(dt);
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

    //search function for movies based on their name
    public Movie findMovie(String movieName)
    {
        foreach (Movie m in movieList)
        {
            if (m.Name.Equals(movieName))
            {
                return m;
            }
        }
        return null;
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        //list of dates is taken from genDates
        List<String> dates = genDates();
        //get the selected date the user entered to the calendar
        DateTime dt = clnMasterDate.SelectedDate;
        //selctdDate refers to the location of the user selected date in the dates list
        int selctdDate = srchDates(dateTimeToString(dt), dates);
        //srchDates returns a -1 if the date wasnt in the list
        if (selctdDate != -1)
        {
            //set the value in the ddl to the selected date
            //1 is added to the selected date as the first value in the ddl 
            //says "choose a date"
            ddlSelectTimes.SelectedIndex = selctdDate + 1;
            setDateSession();
        }
        else
        {
            //send error message to user saying invalid date
        }
        //date selected, calendar no longer needed 
        clnMasterDate.Visible = false;
    }

    public int srchDates(String dt, List<String> dates)
    {
        //simple search to see if dt is in the list dates
        for (int datesLoop = 0; datesLoop < dates.Count(); datesLoop++)
        {
            if (dt.Equals(dates[datesLoop]))
            {
                //if found, the position in dates is returned
                return datesLoop;
            }
        }
        //if loop exits with no value found
        //-1 is returned
        return -1;
    }


    protected void ddlSelectTimes_SelectedIndexChanged1(object sender, EventArgs e)
    {
        setDateSession();
    }

    private void setDateSession()
    {
        genDates();
        Session["SelectedDate"] = datesList[ddlSelectTimes.SelectedIndex - 1];
    }
    protected void ddlSelectFilm_SelectedIndexChanged1(object sender, EventArgs e)
    {
        Session["MovieCategory"] = "Showing";
        Session["SelectedMovie"] = ddlSelectFilm.SelectedValue;
    }
    protected void btnGo_Click1(object sender, EventArgs e)
    {
        if (ddlSelectFilm.SelectedIndex > 0 && ddlSelectTimes.SelectedIndex > 0)
        {
            Response.Redirect("Movie.aspx");
        }
    }
    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {
        genDates();
        for (int i = 0; i < datesList.Count; i++)
        {
            if (e.Day.Date == datesList[i].Date)
            {
                e.Cell.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
    protected void Calendar1_Init(object sender, EventArgs e)
    {
        
    }
}
