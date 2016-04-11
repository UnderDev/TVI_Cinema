<%@ WebHandler Language="C#" Class="ImgHandler" %>

using System;
using System.Web;

public class ImgHandler : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
        string id = context.Request.QueryString["id"];
        
        var myImage = MovieDB.GetMoviePoster(Convert.ToInt32(id));
        context.Response.ContentType = "image/jpg";
        context.Response.OutputStream.Write(myImage, 0, myImage.Length);
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}