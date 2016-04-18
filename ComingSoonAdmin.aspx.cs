using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ComingSoon2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public string GetImage(object img)
    {
        return "data:image/jpg;base64," + Convert.ToBase64String((byte[])img);
    }


    protected void btnInsert_Click(object sender, EventArgs e)
    {
        // Read the file and convert it to Byte Array
        string filePath = fpPoster.PostedFile.FileName;
        string filename = Path.GetFileName(filePath);
        string ext = Path.GetExtension(filename);
        string contenttype = String.Empty;

        //Set the content type based on File Extension
        switch (ext)
        {
            case ".jpg":
                contenttype = "image/jpg";
                break;
            case ".png":
                contenttype = "image/png";
                break;
        }
        if (contenttype != String.Empty)
        {

            Stream fs = fpPoster.PostedFile.InputStream;
            BinaryReader br = new BinaryReader(fs);
            Byte[] bytes = br.ReadBytes((Int32)fs.Length);

            //insert the file into database
            string strQuery = "INSERT into ComingSoon(Name, Poster, Trailer_url, Description, Director, Length)" +
               " values ( @Name, @Poster, @Trailer_url, @Description, @Director, @Length)";
            SqlCommand cmd = new SqlCommand(strQuery);            

            string name = txtName.Text;
            cmd.Parameters.AddWithValue("Name", name);

            cmd.Parameters.Add("@Poster", SqlDbType.Binary).Value = bytes;

            string trailerURL = txtTrailerURL.Text;
            cmd.Parameters.AddWithValue("Trailer_url", trailerURL);

            string description = txtDescription.Text;
            cmd.Parameters.AddWithValue("Description", description);

            string director = txtDirector.Text;
            cmd.Parameters.AddWithValue("Director", director);


            string length = txtLength.Text;
            cmd.Parameters.AddWithValue("Length", length);


            InsertUpdateData(cmd);
            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Text = "File Uploaded Successfully";
            txtName.Text = "";
            txtTrailerURL.Text = "";
            txtDescription.Text = "";
            txtLength.Text = "";
            txtDirector.Text = "";
        }
        else
        {
            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Text = "File format not recognised." +
              " Upload Image formats";
        }


    }

    private Boolean InsertUpdateData(SqlCommand cmd)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["MovieDBConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(connectionString);
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
            return false;
        }
        finally
        {
            gvwCSAdmin.DataBind();
            con.Close();
            con.Dispose();
        }
    }
         
    protected void gvwCSAdmin_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblErrorMessage.Text = "A database error has occurred.<br /><br />" +
                "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
            lblErrorMessage.Text = "Another user may have updated that category." +
                "<br />Please try again.";
    }



    protected void gvwCSAdmin_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblMessage.Text = "A database error has occurred.<br /><br />" +
                "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
            lblMessage.Text = "Another user may have updated that category." +
                "<br />Please try again.";
    }
}

   

   