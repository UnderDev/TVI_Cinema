<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">  
    <h1>Home page</h1>
    <p>
        <asp:SqlDataSource ID="dsMovies" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MovieDBConnectionString %>" 
            SelectCommand="SELECT [Name], [Poster] FROM [Movies]"></asp:SqlDataSource>
    </p>
    <table class="style1">
        
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:DataList ID="DataList2" runat="server" CellPadding="20" 
                    DataSourceID="dsMovies" RepeatColumns="3" OnItemCommand="DataList2_ItemCommand">
                    <ItemTemplate>
                        &nbsp;<asp:Label ID="NameLabel" runat="server" Font-Bold="True" Font-Names="Arial" 
                            Font-Size="X-Large" Text='<%# Eval("Name") %>' />
                        <br />
                        <asp:ImageButton ID="ImageButton1" runat="server" 
                            ImageUrl='<%# GetImage(Eval("Poster")) %>' CommandName="selectMovie" />
                        <br />
                        <br />
                    </ItemTemplate>
                </asp:DataList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
<p>
        &nbsp;</p>
<p>
        &nbsp;</p>

    

</asp:Content>


