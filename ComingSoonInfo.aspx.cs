using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ComingSoonInfo : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
       HttpCookie cookie =  Request.Cookies["CommandArgument"];
        String movie = cookie.Value.ToString();
        if (!IsPostBack)
        {

            // Declare the query string.
            String queryString =
              "Select  [Name], [Poster],  [Description], [Director], [Length]  From [ComingSoon] WHERE Name='"+movie+"';";

            // Run the query and bind the resulting DataSet
            // to the GridView control.
            DataSet ds = GetData(queryString);
            if (ds.Tables.Count > 0)
            {
                DetailsView1.DataSource = ds;
                DetailsView1.DataBind();
            }          

        }

    }

    DataSet GetData(String queryString)
    {

        // Retrieve the connection string stored in the Web.config file.
        String connectionString = ConfigurationManager.ConnectionStrings["MovieDBConnectionString"].ConnectionString;

        DataSet ds = new DataSet();

        try
        {
            // Connect to the database and run the query.
            SqlConnection connection = new SqlConnection(connectionString);
            SqlDataAdapter adapter = new SqlDataAdapter(queryString, connection);

            // Fill the DataSet.
            adapter.Fill(ds);

        }
        catch (Exception ex)
        {

            

        }

        return ds;

    }
}