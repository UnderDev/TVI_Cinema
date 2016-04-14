<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SummaryPage.aspx.cs" Inherits="SummaryPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>
    Summary</h1>
    <table class="style1">
        <tr>
            <td class="style2">
                <asp:Label ID="lblName" runat="server"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblNameDisplay" runat="server" ></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="lblMovieName" runat="server" ></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblMovieNmDisplay" runat="server" ></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="lblScreen" runat="server"  ></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblScreenDisplay" runat="server"  ></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="lblPrice" runat="server"  ></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblPriceDisplay" runat="server"  ></asp:Label>
            </td>
        </tr>
    </table>
   
    <p>
        &nbsp;</p>
    <p>
    <asp:Button ID="btnReturn" runat="server" Text="Return" 
        onclick="btnReturn_Click" />
    </p>
</asp:Content>

