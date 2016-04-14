<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ComingSoonInfo.aspx.cs" Inherits="ComingSoonInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="403px">
        </asp:DetailsView>
    </p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MovieDBConnectionString %>" SelectCommand="SELECT * FROM [ComingSoon]"></asp:SqlDataSource>
    <p>
    </p>
</asp:Content>

