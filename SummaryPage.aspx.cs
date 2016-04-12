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
            Response.Redirect("BookingPage.aspx");
        }
    }
}