<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ComingSoon.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   


    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MovieDBConnectionString %>" 
            SelectCommand="SELECT [Name], [Poster] FROM [ComingSoon] ORDER BY [Name]">
        </asp:SqlDataSource>
        <br />
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" 
            GroupItemCount="3">
            
            <EditItemTemplate>
                <td runat="server" style="">
                    Name:
                    <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                    <br />Poster:
                    <asp:TextBox ID="PosterTextBox" runat="server" Text='<%# Bind("Poster") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" />
                    <br />
                </td>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>
                            No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
<td runat="server" />
            </EmptyItemTemplate>
            <GroupTemplate>

            <tr ID="itemPlaceholderContainer" runat="server">
                <td ID="itemPlaceholder" runat="server">
                </td>
            </tr>
        </GroupTemplate>


            <InsertItemTemplate>
                <td runat="server" style="">
                    Name:
                    <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                    <br />Poster:
                    <asp:TextBox ID="PosterTextBox" runat="server" Text='<%# Bind("Poster") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                        Text="Insert" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Clear" />
                    <br />
                </td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td>
                    <table>
                        <tr>
                            <td style="font-family: Arial, Sans-Serif;
                                font-size: 12pt; font-weight: bold" align="center" valign="top">
                                <asp:Label ID="NameLabel" runat="server"
                                    Text='<%# Eval("Name") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 220px; width: 280px"
                                align="center" valign="top">
                                <asp:Image ID="Image1" runat="server" 
                                    ImageUrl='<%# Eval("Poster") %>' /> 

                            </td>
                        </tr>
                    </table>
                </td>
            </ItemTemplate>




            <LayoutTemplate>
            <table id="Table1" runat="server">
                <tr id="Tr1" runat="server">
                    <td id="Td1" runat="server">
                        <table ID="groupPlaceholderContainer" runat="server" border="0" style="">
                            <tr ID="groupPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="Tr2" runat="server" align="center">
                    <td id="Td2" runat="server" style="">
                    </td>
                </tr>
            </table>

        </LayoutTemplate>



            <SelectedItemTemplate>
                <td runat="server" style="">
                    Name:
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                    <br />Poster:
                    <asp:Label ID="PosterLabel" runat="server" Text='<%# Eval("Poster") %>' />
                    <br />
                </td>
            </SelectedItemTemplate>
        </asp:ListView>
    </p>
    <p>
        &nbsp;</p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
   


</asp:Content>

