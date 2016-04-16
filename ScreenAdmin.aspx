<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ScreenAdmin.aspx.cs" Inherits="ScreenTime" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <br />
        <asp:SqlDataSource ID="dsScreen" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:MovieDBConnectionString %>" 
            DeleteCommand="DELETE FROM [Showtimes] WHERE [Screen] = @original_Screen AND [Showtime] = @original_Showtime AND [dimension] = @original_dimension" 
            InsertCommand="INSERT INTO [Showtimes] ([Screen], [Showtime], [dimension]) VALUES (@Screen, @Showtime, @dimension)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT Showtimes.Screen, Showtimes.Showtime, Showtimes.dimension, Movies.Name FROM Showtimes INNER JOIN Movies ON Showtimes.Screen = Movies.Screen" 
            
            
            
            
            UpdateCommand="UPDATE [Showtimes] SET [dimension] = @dimension WHERE [Screen] = @original_Screen AND [Showtime] = @original_Showtime AND [dimension] = @original_dimension">
            <DeleteParameters>
                <asp:Parameter Name="original_Screen" Type="Int32" />
                <asp:Parameter Name="original_Showtime" Type="String" />
                <asp:Parameter Name="original_dimension" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Screen" Type="Int32" />
                <asp:Parameter Name="Showtime" Type="String" />
                <asp:Parameter Name="dimension" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="original_Screen" Type="Int32" />
                <asp:Parameter Name="original_Showtime" Type="String" />
                <asp:Parameter Name="original_dimension" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    <table class="style1">
        <tr>
            <td>
        <asp:ListView ID="lvwScreen" runat="server" DataKeyNames="Screen,Showtime" 
            DataSourceID="dsScreen" InsertItemPosition="LastItem" 
            onitemdeleted="lvScreen_ItemDeleted" oniteminserted="lvScreen_ItemInserted" 
            onitemupdated="lvScreen_ItemUpdated">
            <AlternatingItemTemplate>
                <tr style="background-color:#FFF8DC;">
                    <td>
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="ScreenLabel" runat="server" Text='<%# Eval("Screen") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ShowtimeLabel" runat="server" Text='<%# Eval("Showtime") %>' />
                    </td>
                    <td>
                        <asp:Label ID="dimensionLabel" runat="server" Text='<%# Eval("dimension") %>' />
                    </td>
                    <td>
                        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color:#008A8C;color: #FFFFFF;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                            Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                            Text="Cancel" />
                    </td>
                    <td>
                        <asp:Label ID="ScreenLabel1" runat="server" Text='<%# Eval("Screen") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ShowtimeLabel1" runat="server" Text='<%# Eval("Showtime") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="dimensionTextBox" runat="server" 
                            Text='<%# Bind("dimension") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" 
                    style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>
                            No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                            Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                            Text="Clear" />
                    </td>
                    <td>
                        <asp:TextBox ID="ScreenTextBox" runat="server" Text='<%# Bind("Screen") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ShowtimeTextBox" runat="server" 
                            Text='<%# Bind("Showtime") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="dimensionTextBox" runat="server" 
                            Text='<%# Bind("dimension") %>' />
                    </td>
                    
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color:#DCDCDC;color: #000000;">
                    <td>
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="ScreenLabel" runat="server" Text='<%# Eval("Screen") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ShowtimeLabel" runat="server" Text='<%# Eval("Showtime") %>' />
                    </td>
                    <td>
                        <asp:Label ID="dimensionLabel" runat="server" 
                            Text='<%# Eval("dimension") %>' />
                    </td>
                    <td>
                        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table ID="itemPlaceholderContainer" runat="server" border="1" 
                                style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                    <th runat="server">
                                    </th>
                                    <th runat="server">
                                    <asp:LinkButton ID="lnkScreen" runat="server" CommandName="Sort" CommandArgument="Screen">Screen
                                        </asp:LinkButton>
                                        </th>
                                    <th runat="server">
                                    <asp:LinkButton ID="lnkTime" runat="server" CommandName="Sort" CommandArgument="Showtime">Showtime
                                        </asp:LinkButton>
                                        </th>
                                    <th runat="server">
                                        dimension</th>
                                    <th runat="server">
                                        Name</th>
                                </tr>
                                <tr ID="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" 
                            style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                        ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                    <td>
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="ScreenLabel" runat="server" Text='<%# Eval("Screen") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ShowtimeLabel" runat="server" Text='<%# Eval("Showtime") %>' />
                    </td>
                    <td>
                        <asp:Label ID="dimensionLabel" runat="server" 
                            Text='<%# Eval("dimension") %>' />
                    </td>
                    <td>
                        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <p>
        <asp:Label ID="lblError" runat="server"></asp:Label>
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

