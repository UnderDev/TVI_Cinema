using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BookingPage2 : System.Web.UI.Page
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
    protected void DropDownList1_Init(object sender, EventArgs e)
    {
        //list of strings to bind to the card type drop down list
        List<String> lstCardType = new List<String>() { "CARD TYPE", "Visa", "Mastercard"};
        ddlCardType.DataSource = lstCardType;
        ddlCardType.DataBind();
    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (!chkBxTerms.Checked)
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            setBooking();
            Response.Redirect("SummaryPage.aspx");
        }
    }

    private void setBooking()
    {
        booking.FirstName = txtFName.Text;
        booking.Gender = rdoListGender.SelectedValue;
        booking.Email = txtEmail.Text;
        booking.Address = txtAddress.Text;
        booking.CardCVV = Convert.ToInt32(txtCVV.Text);
        booking.CardNum = Convert.ToInt32(txtCardNo.Text);
        booking.CardType = ddlCardType.SelectedValue;
        booking.LastName = txtLName.Text;
        booking.PhoneNum = txtPhoneNo.Text;
        Session["Booking"] = booking;
    }

    protected void DropDownDate_Init(object sender, EventArgs e)
    {
        List<String> dates = ((MasterPage)this.Master).genDates();
        DropDownList tempDdl = (DropDownList)sender;
        tempDdl.DataSource = dates;
        tempDdl.DataBind();
        /*
         * 
         * CHANGE SCOPE OF NAVBAR DATE DROPDOWN
         */
    }
}