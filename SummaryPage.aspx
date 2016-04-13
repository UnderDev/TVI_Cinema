<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SummaryPage.aspx.cs" Inherits="SummaryPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>
    Summary</h1>
<p>
    <asp:Label ID="lblName" runat="server"></asp:Label>
    <asp:Button ID="btnReturn" runat="server" Text="Return" 
        onclick="btnReturn_Click" />
    </p>
</asp:Content>

