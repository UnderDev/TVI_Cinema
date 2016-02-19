<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Movie.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1><asp:Label ID="lblMovieTitle" runat="server" Text="Movie Title"></asp:Label> </h1>
    <br />
    <asp:Label ID="LblMovieDesc" runat="server" Text=""></asp:Label>
</asp:Content>

