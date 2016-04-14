using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BookingPage : System.Web.UI.Page
{
    public const double BOOKING_FEE = .30;
    public Booking booking;
    protected void Page_Load(object sender, EventArgs e)
    {
        booking = new Booking(2, DateTime.Now, 2);
        Session["dimension"] = booking.Dimension;
    }
    protected void dllAmount_Init(object sender, EventArgs e)
    {
        DropDownList ddlSender = (DropDownList)sender;
        List<Int16> amounts = new List<Int16>() { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
        ddlSender.DataSource = amounts;
    }
    protected void dllAmount_SelectedIndexChanged(object sender, EventArgs e)
    {
        //casting sender to a drop down list
        DropDownList ddlSender = (DropDownList)sender;
        //finding which row the sender was on
        GridViewRow gvwRow = (GridViewRow)(sender as Control).Parent.Parent;
        int rowNo = gvwRow.RowIndex;
        GridViewRow selectedRow = gvwBooking.Rows[rowNo];

        //value of price field that matches with the current drop down list
        String price = removeCurrSymbol(gvwBooking.Rows[rowNo].Cells[1].Text);
        
        //a fee of 30 cents is added onto every ticket bought online
        Double bookingFee = (Convert.ToInt32(ddlSender.Text)*BOOKING_FEE)+Convert.ToDouble(lblBookingFee.Text.Substring(1));
        //add the booking fee calculated above to the already established booking fee total
       
        lblBookingFee.Text = String.Format("{0:C}", bookingFee);
        //calculate the cost of getting X amount of tickets 
        Double slctdPurchase = (Convert.ToDouble(price) * Convert.ToInt32(ddlSender.Text));
        //the cost of purchase is added to the current total
        Double  currTotal= Convert.ToDouble(lblTotal.Text.Substring(1));
        Double total = (currTotal + slctdPurchase + bookingFee);
        //the new current total is set to the value of the total label
        lblTotal.Text = String.Format("{0:C}", total);
    }
    public String removeCurrSymbol(String str)
    {
        //loop through a string to remove the currency formatting 
        String newStr = "";
        
        int i = str.Length-1;
        Char c = str[i];
        while (c != ';')
        {
            i--;
            try
            {
                c = str[i];
            }
            catch
            {
                i = 0;
                c = ';';
            }
        }
        //increment i by 1 to not count the semi-colon
        i++;
        newStr = str.Substring(i, str.Length-i);

        return newStr;
    }
    protected void btnContinue_Click(object sender, EventArgs e)
    {
        booking.Total = Convert.ToDouble(lblTotal.Text.Substring(1));
        Session["Booking"] = booking;
        Response.Redirect("BookingPage2.aspx");
    }
}