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
        <asp:SqlDataSource ID="dsMoviesAdmin" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MovieDBConnectionString %>" 
            SelectCommand="SELECT * FROM [Movies] ORDER BY [Screen]" 
            ConflictDetection="CompareAllValues" 
            DeleteCommand="DELETE FROM [Movies] WHERE [Screen] = @original_Screen AND [Name] = @original_Name AND [Poster] = @original_Poster AND [Trailer_url] = @original_Trailer_url AND [Description] = @original_Description AND [Director] = @original_Director AND [Length] = @original_Length AND [Stars] = @original_Stars AND [Rating] = @original_Rating" 
            InsertCommand="INSERT INTO [Movies] ([Screen], [Name], [Poster], [Trailer_url], [Description], [Director], [Length], [Stars], [Rating]) VALUES (@Screen, @Name, @Poster, @Trailer_url, @Description, @Director, @Length, @Stars, @Rating)" 
            OldValuesParameterFormatString="original_{0}" 
            UpdateCommand="UPDATE [Movies] SET [Name] = @Name, [Poster] = @Poster, [Trailer_url] = @Trailer_url, [Description] = @Description, [Director] = @Director, [Length] = @Length, [Stars] = @Stars, [Rating] = @Rating WHERE [Screen] = @original_Screen AND [Name] = @original_Name AND [Poster] = @original_Poster AND [Trailer_url] = @original_Trailer_url AND [Description] = @original_Description AND [Director] = @original_Director AND [Length] = @original_Length AND [Stars] = @original_Stars AND [Rating] = @original_Rating">
            <DeleteParameters>
                <asp:Parameter Name="original_Screen" Type="Int32" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Poster" Type="Object" />
                <asp:Parameter Name="original_Trailer_url" Type="String" />
                <asp:Parameter Name="original_Description" Type="String" />
                <asp:Parameter Name="original_Director" Type="String" />
                <asp:Parameter Name="original_Length" Type="Int32" />
                <asp:Parameter Name="original_Stars" Type="String" />
                <asp:Parameter Name="original_Rating" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Screen" Type="Int32" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Poster" Type="Object" />
                <asp:Parameter Name="Trailer_url" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Director" Type="String" />
                <asp:Parameter Name="Length" Type="Int32" />
                <asp:Parameter Name="Stars" Type="String" />
                <asp:Parameter Name="Rating" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Poster" Type="Object" />
                <asp:Parameter Name="Trailer_url" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Director" Type="String" />
                <asp:Parameter Name="Length" Type="Int32" />
                <asp:Parameter Name="Stars" Type="String" />
                <asp:Parameter Name="Rating" Type="String" />
                <asp:Parameter Name="original_Screen" Type="Int32" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Poster" Type="Object" />
                <asp:Parameter Name="original_Trailer_url" Type="String" />
                <asp:Parameter Name="original_Description" Type="String" />
                <asp:Parameter Name="original_Director" Type="String" />
                <asp:Parameter Name="original_Length" Type="Int32" />
                <asp:Parameter Name="original_Stars" Type="String" />
                <asp:Parameter Name="original_Rating" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <table class="style1">
        <tr>
            <td>
                <asp:ListView ID="ListView1" runat="server" DataKeyNames="Screen" 
                    DataSourceID="dsMoviesAdmin" InsertItemPosition="LastItem">
                    <AlternatingItemTemplate>
                        <tr style="">
                            <td>
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                                    Text="Delete" />
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                            </td>
                            <td>
                                <asp:Label ID="ScreenLabel" runat="server" Text='<%# Eval("Screen") %>' />
                            </td>
                            <td>
                                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                            </td>
                            <td>
                                <asp:Label ID="PosterLabel" runat="server" Text='<%# Eval("Poster") %>' />
                            </td>
                            <td>
                                <asp:Label ID="Trailer_urlLabel" runat="server" 
                                    Text='<%# Eval("Trailer_url") %>' />
                            </td>
                            <td>
                                <asp:Label ID="DescriptionLabel" runat="server" 
                                    Text='<%# Eval("Description") %>' />
                            </td>
                            <td>
                                <asp:Label ID="DirectorLabel" runat="server" Text='<%# Eval("Director") %>' />
                            </td>
                            <td>
                                <asp:Label ID="LengthLabel" runat="server" Text='<%# Eval("Length") %>' />
                            </td>
                            <td>
                                <asp:Label ID="StarsLabel" runat="server" Text='<%# Eval("Stars") %>' />
                            </td>
                            <td>
                                <asp:Label ID="RatingLabel" runat="server" Text='<%# Eval("Rating") %>' />
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                    <EditItemTemplate>
                        <tr style="">
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
                                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="PosterTextBox" runat="server" Text='<%# Bind("Poster") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="Trailer_urlTextBox" runat="server" 
                                    Text='<%# Bind("Trailer_url") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="DescriptionTextBox" runat="server" 
                                    Text='<%# Bind("Description") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="DirectorTextBox" runat="server" 
                                    Text='<%# Bind("Director") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="LengthTextBox" runat="server" Text='<%# Bind("Length") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="StarsTextBox" runat="server" Text='<%# Bind("Stars") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="RatingTextBox" runat="server" Text='<%# Bind("Rating") %>' />
                            </td>
                        </tr>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table runat="server" style="">
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
                                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="PosterTextBox" runat="server" Text='<%# Bind("Poster") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="Trailer_urlTextBox" runat="server" 
                                    Text='<%# Bind("Trailer_url") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="DescriptionTextBox" runat="server" 
                                    Text='<%# Bind("Description") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="DirectorTextBox" runat="server" 
                                    Text='<%# Bind("Director") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="LengthTextBox" runat="server" Text='<%# Bind("Length") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="StarsTextBox" runat="server" Text='<%# Bind("Stars") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="RatingTextBox" runat="server" Text='<%# Bind("Rating") %>' />
                            </td>
                        </tr>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <tr style="">
                            <td>
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                                    Text="Delete" />
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                            </td>
                            <td>
                                <asp:Label ID="ScreenLabel" runat="server" Text='<%# Eval("Screen") %>' />
                            </td>
                            <td>
                                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                            </td>
                            <td>
                                <asp:Label ID="PosterLabel" runat="server" Text='<%# Eval("Poster") %>' />
                            </td>
                            <td>
                                <asp:Label ID="Trailer_urlLabel" runat="server" 
                                    Text='<%# Eval("Trailer_url") %>' />
                            </td>
                            <td>
                                <asp:Label ID="DescriptionLabel" runat="server" 
                                    Text='<%# Eval("Description") %>' />
                            </td>
                            <td>
                                <asp:Label ID="DirectorLabel" runat="server" Text='<%# Eval("Director") %>' />
                            </td>
                            <td>
                                <asp:Label ID="LengthLabel" runat="server" Text='<%# Eval("Length") %>' />
                            </td>
                            <td>
                                <asp:Label ID="StarsLabel" runat="server" Text='<%# Eval("Stars") %>' />
                            </td>
                            <td>
                                <asp:Label ID="RatingLabel" runat="server" Text='<%# Eval("Rating") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table ID="itemPlaceholderContainer" runat="server" border="0" style="">
                                        <tr runat="server" style="">
                                            <th runat="server">
                                            </th>
                                            <th runat="server">
                                                Screen</th>
                                            <th runat="server">
                                                Name</th>
                                            <th runat="server">
                                                Poster</th>
                                            <th runat="server">
                                                Trailer_url</th>
                                            <th runat="server">
                                                Description</th>
                                            <th runat="server">
                                                Director</th>
                                            <th runat="server">
                                                Length</th>
                                            <th runat="server">
                                                Stars</th>
                                            <th runat="server">
                                                Rating</th>
                                        </tr>
                                        <tr ID="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style="">
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
                        <tr style="">
                            <td>
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                                    Text="Delete" />
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                            </td>
                            <td>
                                <asp:Label ID="ScreenLabel" runat="server" Text='<%# Eval("Screen") %>' />
                            </td>
                            <td>
                                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                            </td>
                            <td>
                                <asp:Label ID="PosterLabel" runat="server" Text='<%# Eval("Poster") %>' />
                            </td>
                            <td>
                                <asp:Label ID="Trailer_urlLabel" runat="server" 
                                    Text='<%# Eval("Trailer_url") %>' />
                            </td>
                            <td>
                                <asp:Label ID="DescriptionLabel" runat="server" 
                                    Text='<%# Eval("Description") %>' />
                            </td>
                            <td>
                                <asp:Label ID="DirectorLabel" runat="server" Text='<%# Eval("Director") %>' />
                            </td>
                            <td>
                                <asp:Label ID="LengthLabel" runat="server" Text='<%# Eval("Length") %>' />
                            </td>
                            <td>
                                <asp:Label ID="StarsLabel" runat="server" Text='<%# Eval("Stars") %>' />
                            </td>
                            <td>
                                <asp:Label ID="RatingLabel" runat="server" Text='<%# Eval("Rating") %>' />
                            </td>
                        </tr>
                    </SelectedItemTemplate>
                </asp:ListView>
            </td>
        </tr>
    </table>
<p>
        &nbsp;</p>
    <p>
        &nbsp;</p>

    

</asp:Content>


