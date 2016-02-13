<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Movie.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1><asp:Label ID="lblMovieTitle" runat="server" Text="Movie Title"></asp:Label> </h1>
    <br />
    <asp:Label ID="LblMovieDesc" runat="server" Text="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed bibendum consectetur erat, eget tempus nisl luctus nec. Maecenas id molestie dui. Nulla imperdiet mauris nulla, id finibus quam sodales quis. Quisque convallis laoreet tortor sed molestie. Aliquam eu maximus ex. Morbi a sem imperdiet, lacinia nisl ut, tempus nunc. Quisque vehicula sollicitudin urna a ullamcorper. Suspendisse nec pellentesque lacus, finibus sodales urna."></asp:Label>
</asp:Content>

