<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"  CodeFile="Movie.aspx.cs" Inherits="Default2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" >
    <div class="content-container">
        <div class="flex-container">
             <div class="flex-fixed60p"><h1><asp:Label ID="lblMovieTitle" runat="server" Text="Movie Title"></asp:Label></h1></div>
             <div class="flex-item" > </div>
        </div>
       
    <br />
        <div class="flex-container" style="padding:10px">
            <div class="flex-fixed60p" style="padding:5px;">
                <asp:Label ID="LblMovieDesc" runat="server" Text=""></asp:Label>
                <br />  
                <br />
                Rated: <asp:Label ID="LblRating" runat="server" Text=""></asp:Label>
                             
                <asp:Label ID="LblStars" runat="server" Text=""></asp:Label>
            </div>
            <div class="flex-item" style="text-align:center;margin-left:10px">
                <asp:Image ID="ImgPoster" runat="server" />
            </div>
            
        </div>
        <h3>Showings for <asp:Label runat="server" ID="lblDate"></asp:Label> </h3>
        <asp:BulletedList ID="BulletedList1" runat="server" style="list-style-type:none;"></asp:BulletedList>        
    </div>
</asp:Content>

