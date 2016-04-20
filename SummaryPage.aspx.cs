using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Net.Mail;
using System.Web.UI.WebControls;

public partial class SummaryPage : System.Web.UI.Page
{
    public Booking booking;
    public double totalPrice;

    protected void Page_Load(object sender, EventArgs e)
    {
        //try to take in cookies and session objects
        if ((Booking)Session["booking"] != null && Request.Cookies["ticketTotal"].Value != null)
        {
            booking = (Booking)Session["booking"];
            totalPrice = Convert.ToDouble(Request.Cookies["ticketTotal"].Value);
            //display shows important information that was previously stored in cookies and session objects
            display();
        }
        else
        {
            //if any objects are missing, user is redirected back to start of booking
            Response.Redirect("BookingPage.aspx");
        }
    }
    public void sendConfirmation()
    {
        // Specify the from and to email address 
        MailMessage mailMessage = new MailMessage("thevillageidiot.cinema@gmail.com", booking.Email);
        // Specify the email body 
        String emailBody = "Dear "+booking.FirstName+" "+booking.LastName+"\n"+
            "\nYou are going to see: " + booking.MovieName + "\nDate: " + booking.SelctdDateTime.Date+
            "\nScreen number: Screen "+booking.ScreenNo+"\nScreening type: "+booking.Dimension+"D\n"+"Tickets:\n (incl. VAT): "+totalPrice;

        mailMessage.Body = emailBody;
        // Specify the email Subject 
        mailMessage.Subject = "Booking Confirmed";
        // No need to specify the SMTP settings as these 
        // are already specified in web.config
        SmtpClient smtpClient = new SmtpClient();
        // Finally send the email message using Send() method
        smtpClient.Send(mailMessage);
    }
    public void display()
    {
        //show information to screen
        String name = booking.FirstName+" "+booking.LastName;
        lblNameDisplay.Text = name;
        lblName.Text = "Name: ";
        lblMovieName.Text = "Movie: ";
        lblPrice.Text = "Price: ";
        lblScreen.Text = "Screen: ";
        lblMovieNmDisplay.Text = booking.MovieName.ToString();
        String s = String.Format("{0:C}", totalPrice.ToString());
        lblPriceDisplay.Text = String.Format("{0:C}", totalPrice.ToString());
        lblScreenDisplay.Text = booking.ScreenNo.ToString();
    }
    protected void btnReturn_Click(object sender, EventArgs e)
    {
        //on cancel click, remove session state objects, return user to home page
        Session.Clear();
        Response.Redirect("Default.aspx");
    }

    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        //on confirmation click, send a confirmation email to user, clear session objects and redirect user to home page
        sendConfirmation();
        Session.Clear();
        Response.Redirect("Default.aspx");
    }
}