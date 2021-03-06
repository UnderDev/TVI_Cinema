﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for MovieDB
/// </summary>
[DataObject(true)]
public class MovieDB
{
    public static byte[] GetMoviePoster(int screen)
    {
        byte[] poster = null;
        SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
        builder["Data Source"] = "localhost\\sqlexpress";
        builder["integrated Security"] = true;
        builder["Initial Catalog"] = "MovieDB";
        String selStatement = "select m.poster from movies as m where m.screen = " + screen + ";";
        SqlConnection con = new SqlConnection(builder.ConnectionString);
        SqlCommand cmd = new SqlCommand(selStatement, con);
        SqlDataReader reader;

        con.Open();

        reader = cmd.ExecuteReader();

        if (reader.HasRows)
        {

            poster = (byte[])reader["poster"];

        }
        else
        {
            //Insert error message here?
        }

        reader.Close();
        con.Close();
        return poster;
    }
    [DataObjectMethod(DataObjectMethodType.Select)]
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
                byte[] poster = new byte[75000];//byte array size = file limit in bytes
                reader.GetBytes(4, 0, poster, 0, 75000);//fill the poster byte array for use later 
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

    [DataObjectMethod(DataObjectMethodType.Select)]
    public static List<Movie> GetComingSoonList()
    {
        Movie newMovie;
        List<Movie> movieList = new List<Movie>();
        SqlConnectionStringBuilder builder =
            new SqlConnectionStringBuilder();
        builder["Data Source"] = "localhost\\sqlexpress";
        builder["integrated Security"] = true;
        builder["Initial Catalog"] = "MovieDB";
        String selStatement = "select distinct m.name, m.poster, m.trailer_URL, m.description,  m.directorm m.length from ComingSoon as m;";
        SqlConnection con = new SqlConnection(builder.ConnectionString);
        SqlCommand cmd = new SqlCommand(selStatement, con);
        SqlDataReader reader;

        con.Open();

        reader = cmd.ExecuteReader();

        if (reader.HasRows)
        {
            while (reader.Read())
            {
                byte[] poster = new byte[75000];//byte array size = file limit in bytes
                reader.GetBytes(1, 0, poster, 0, 75000);//fill the poster byte array for use later 
                //name              //...  //description       //length              //director          //trailerURL                            
                newMovie = new Movie(reader.GetString(0), poster, reader.GetString(2), reader.GetString(3), reader.GetString(4), reader.GetInt32(5));
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

    [DataObjectMethod(DataObjectMethodType.Select)]
    public static Movie GetMovie(String name)
    {
        Movie movie = null;
        SqlConnectionStringBuilder builder =
            new SqlConnectionStringBuilder();
        builder["Data Source"] = "localhost\\sqlexpress";
        builder["integrated Security"] = true;
        builder["Initial Catalog"] = "MovieDB";

        String selStatement = "SELECT DISTINCT m.screen, m.name, m.description, m.length, m.poster, m.director, m.trailer_URL, m.stars, m.rating "
                                + "FROM movies AS m WHERE m.name = @MovieName;";

        SqlConnection con = new SqlConnection(builder.ConnectionString);
        SqlCommand cmd = new SqlCommand(selStatement, con);
        cmd.Parameters.AddWithValue("MovieName", name);
        SqlDataReader reader;

        con.Open();

        reader = cmd.ExecuteReader();

        if (reader.HasRows)
        {
            reader.Read();
            byte[] poster = new byte[75000];//byte array size = file limit in bytes
            reader.GetBytes(4, 0, poster, 0, 75000);//fill the poster byte array for use later 
            //name                  //description       //length            //duh   //director          //trailerURL            //rating            //screen            //actors
            movie = new Movie(reader.GetString(1), reader.GetString(2), reader.GetInt32(3), poster, reader.GetString(5), reader.GetString(6), reader.GetString(8), reader.GetInt32(0), reader.GetString(7));

        }
        else
        {
            //Insert error message here?
        }
        reader.Close();
        con.Close();
        return movie;
    }

    [DataObjectMethod(DataObjectMethodType.Select)]
    public static Movie GetComingSoonMovie(String name)
    {
        Movie movie = null;
        SqlConnectionStringBuilder builder =
            new SqlConnectionStringBuilder();
        builder["Data Source"] = "localhost\\sqlexpress";
        builder["integrated Security"] = true;
        builder["Initial Catalog"] = "MovieDB";

        String selStatement = "SELECT DISTINCT m.name, m.poster, m.trailer_URL, m.description, m.director,  m.length "
                                + "FROM ComingSoon AS m WHERE m.name = @MovieName;";

        SqlConnection con = new SqlConnection(builder.ConnectionString);
        SqlCommand cmd = new SqlCommand(selStatement, con);
        cmd.Parameters.AddWithValue("MovieName", name);
        SqlDataReader reader;

        con.Open();

        reader = cmd.ExecuteReader();

        if (reader.HasRows)
        {
            reader.Read();
            byte[] poster = new byte[75000];//byte array size = file limit in bytes
            reader.GetBytes(1, 0, poster, 0, 75000);//fill the poster byte array for use later 
            movie = new Movie(reader.GetString(0), poster, reader.GetString(2), reader.GetString(3), reader.GetString(4), reader.GetInt32(5));

        }
        else
        {
            //Insert error message here?
        }
        reader.Close();
        con.Close();
        return movie;
    }
}