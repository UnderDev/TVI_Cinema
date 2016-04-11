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

        string emailbody = "\nFrom: " + YourName.Text + "\n";
        emailbody += "Email: " + YourEmail.Text + "\n";
        emailbody += "Subject: " + YourSubject.Text + "\n\n";
        emailbody += "Question: \n\t\t" + Comments.Text + "\n";

        mailMessage.Body = emailbody;
        // Specify the email Subject 
        mailMessage.Subject = YourSubject.Text;
        //mailMessage.From = YourEmail.Text;
        // No need to specify the SMTP settings as these 
        // are already specified in web.config
        SmtpClient smtpClient = new SmtpClient(); 
        // Finall send the email message using Send() method
        smtpClient.Send(mailMessage);
    }











    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            //here on button click what will done 
            SendMail();
            DisplayMessage.Text = "Your Comments after sending the mail";
            DisplayMessage.Visible = true;
            YourSubject.Text = "";
            YourEmail.Text = "";
            YourName.Text = "";
            Comments.Text = "";
        }
        catch (Exception) { }
    }




}