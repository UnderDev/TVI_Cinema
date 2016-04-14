    using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SummaryPage : System.Web.UI.Page
{
    public Booking booking;
    public double totalPrice;

    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Booking)Session["booking"] != null && Request.Cookies["ticketTotal"].Value != null)
        {
            booking = (Booking)Session["booking"];
            totalPrice = Convert.ToDouble(Request.Cookies["ticketTotal"].Value);
            display();
        }
        else
        {
            Response.Redirect("BookingPage.aspx");
        }
    }
    public void display()
    {
        String name = booking.FirstName+" "+booking.LastName;
        lblNameDisplay.Text = name;
        lblName.Text = "Name: ";
        lblMovieName.Text = "Movie: ";
        lblPrice.Text = "Price: ";
        lblScreen.Text = "Screen: ";
        //lblMovieNmDisplay.Text = booking.MovieName.ToString();
        lblPriceDisplay.Text = totalPrice.ToString();
        lblScreenDisplay.Text = booking.ScreenNo.ToString();


    }
    protected void btnReturn_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("Default.aspx");
    }
}