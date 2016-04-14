using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void SendMail()
    { // Specify the from and to email address 
        MailMessage mailMessage = new MailMessage("thevillageidiot.cinema@gmail.com", "thevillageidiot.cinema@gmail.com"); 
        // Specify the email body 

        string emailBody = "\nFrom: " + txtboxYourName.Text + "\n";
        emailBody += "Email: " + txtboxYourEmail.Text + "\n";
        emailBody += "Subject: " + txtboxYourSubject.Text + "\n\n";
        emailBody += "Question: \n\t\t" + txtboxComments.Text + "\n";

        mailMessage.Body = emailBody;
        // Specify the email Subject 
        mailMessage.Subject = txtboxYourSubject.Text;
        //mailMessage.From = YourEmail.Text;
        // No need to specify the SMTP settings as these 
        // are already specified in web.config
        SmtpClient smtpClient = new SmtpClient(); 
        // Finall send the email message using Send() method
        smtpClient.Send(mailMessage);
    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            //here on button click what will done 
            SendMail();
            lblDisplayMessage.Text = "Your Comments after sending the mail";
            lblDisplayMessage.Visible = true;
            txtboxYourSubject.Text = "";
            txtboxYourEmail.Text = "";
            txtboxYourName.Text = "";
            txtboxComments.Text = "";
        }
        catch (Exception) { }
    }
}