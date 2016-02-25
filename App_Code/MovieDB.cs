using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for MovieDB
/// </summary>
public class MovieDB
{

    public static List<Movie> GetMovieList()
    {
        Movie newMovie;
        List<Movie> movieList = new List<Movie>();
        SqlConnectionStringBuilder builder =
            new SqlConnectionStringBuilder();
        builder["Data Source"] = "localhost\\sqlexpress";  
        builder["integrated Security"] = true;
        builder["Initial Catalog"] = "MovieDB";
        String selStatement = "select distinct m.screen, m.name, m.description, m.length, m.poster, m.director, m.trailer_URL, m.stars, m.rating from movies as m;";
        SqlConnection con = new SqlConnection(builder.ConnectionString);
        SqlCommand cmd = new SqlCommand(selStatement, con);
        SqlDataReader reader;

        con.Open();

        reader = cmd.ExecuteReader();

        if (reader.HasRows)
        {
            while (reader.Read())
            {
                byte[] poster = new byte[25000];//byte array size = file limit in bytes
                reader.GetBytes(4, 0, poster, 0, 25000);//fill the poster byte array for use later 
                                    //name                  //description       //length            //duh   //director          //trailerURL            //rating            //screen            //actors
                newMovie = new Movie(reader.GetString(1), reader.GetString(2), reader.GetInt32(3), poster, reader.GetString(5), reader.GetString(6), reader.GetString(8), reader.GetInt32(0), reader.GetString(7));
                movieList.Add(newMovie);
            }
        }
        else
        {
            //Insert error message here?
        }

        reader.Close();
        con.Close();
        return movieList;
    }
}