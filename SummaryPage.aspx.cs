using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SummaryPage : System.Web.UI.Page
{
    public Booking booking;
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Booking)Session["booking"] != null)
        {
            booking = (Booking)Session["booking"];
        }
        else
        {
            booking = new Booking(2, DateTime.Now, 2);
            //put back in when ready to push
            //Response.Redirect("BookingPage.aspx");
        }
    }
}