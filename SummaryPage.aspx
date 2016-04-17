<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SummaryPage.aspx.cs" Inherits="SummaryPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Summary</h1>
    <div align="center">
    <table class="style1" style="table-layout: fixed" width="400px">
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
                <asp:Label ID="lblPriceDisplay" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
   </div>
    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="btnConfirm" runat="server" Text="Confirm Booking" 
            onclick="btnConfirm_Click" />
        <br/>
    <asp:Button ID="btnReturn" runat="server" Text="Cancel" 
        onclick="btnReturn_Click" />
    </p>
<p>
    &nbsp;</p>
<p>
    &nbsp;</p>

</asp:Content>

