<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"  CodeFile="Movie.aspx.cs" Inherits="Default2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" >
    <div class="content-div" style="padding:10px">
        <div class="flex-container">
            <div  class="flex-fixed60p"><h1><asp:Label ID="lblMovieTitle" runat="server" Text="Movie Title"></asp:Label></h1></div>
             <div class="flex-item" > <h2>Showings for <asp:Label runat="server" ID="lblDate"></asp:Label> </h2></div>
        </div>
       
    <br />
        <div class="movie-container flex-container">
            <div class="flex-fixed40p">
                <asp:Label ID="LblMovieDesc" runat="server" Text="" ></asp:Label>
            </div>
            <div class="flex-fixed20p" style="text-align:center">
                <asp:Image ID="ImgPoster" runat="server" />
            </div>
            <div class="flex-item">
                <asp:BulletedList ID="BulletedList1" runat="server">
                </asp:BulletedList>
            </div>
        </div>        
    </div>
</asp:Content>

