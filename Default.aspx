<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>
        Home page</h1>
    <p>
        <asp:SqlDataSource ID="dsMovies" runat="server" ConnectionString="<%$ ConnectionStrings:MovieDBConnectionString %>"
            SelectCommand="SELECT [Name], [Poster] FROM [Movies]"></asp:SqlDataSource>
    </p>
    <asp:SqlDataSource ID="dsMoviesDetail" runat="server" ConflictDetection="CompareAllValues"
        ConnectionString="<%$ ConnectionStrings:MovieDBConnectionString %>" DeleteCommand="DELETE FROM [Movies] WHERE [Screen] = @original_Screen AND [Name] = @original_Name AND [Poster] = @original_Poster AND [Trailer_url] = @original_Trailer_url AND [Description] = @original_Description AND [Director] = @original_Director AND [Length] = @original_Length AND [Stars] = @original_Stars AND [Rating] = @original_Rating"
        InsertCommand="INSERT INTO [Movies] ([Screen], [Name], [Poster], [Trailer_url], [Description], [Director], [Length], [Stars], [Rating]) VALUES (@Screen, @Name, @Poster, @Trailer_url, @Description, @Director, @Length, @Stars, @Rating)"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Movies]"
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
    <asp:LoginView ID="LoginView1" runat="server">
        <LoggedInTemplate>
            <asp:DataList ID="DataList2" runat="server" CellPadding="20" DataSourceID="dsMovies"
                RepeatColumns="3" OnItemCommand="DataList2_ItemCommand" HorizontalAlign="Center"
                Width="100%">
                <ItemTemplate>
                    &nbsp;<asp:Label ID="NameLabel" runat="server" Font-Bold="True" Font-Names="Arial"
                        Font-Size="X-Large" Text='<%# Eval("Name") %>' />
                    <br />
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# GetImage(Eval("Poster")) %>'
                        CommandName="selectMovie" />
                    <br />
                    <br />
                </ItemTemplate>
            </asp:DataList>
        </LoggedInTemplate>
        <AnonymousTemplate>
            <asp:DataList ID="DataList2" runat="server" CellPadding="20" DataSourceID="dsMovies"
                RepeatColumns="3" OnItemCommand="DataList2_ItemCommand" HorizontalAlign="Center"
                Width="100%">
                <ItemTemplate>
                    &nbsp;<asp:Label ID="NameLabel" runat="server" Font-Bold="True" Font-Names="Arial"
                        Font-Size="X-Large" Text='<%# Eval("Name") %>' />
                    <br />
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# GetImage(Eval("Poster")) %>'
                        CommandName="selectMovie" />
                    <br />
                    <br />
                </ItemTemplate>
            </asp:DataList>
        </AnonymousTemplate>
        <RoleGroups>
            <asp:RoleGroup Roles="Admin">
                <ContentTemplate>
                    <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False"
                        DataKeyNames="Screen" DataSourceID="dsMoviesDetail" Height="50px" Width="125px">
                        <Fields>
                            <asp:BoundField DataField="Screen" HeaderText="Screen" ReadOnly="True" SortExpression="Screen" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Trailer_url" HeaderText="Trailer_url" SortExpression="Trailer_url" />
                            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                            <asp:BoundField DataField="Director" HeaderText="Director" SortExpression="Director" />
                            <asp:BoundField DataField="Length" HeaderText="Length" SortExpression="Length" />
                            <asp:BoundField DataField="Stars" HeaderText="Stars" SortExpression="Stars" />
                            <asp:BoundField DataField="Rating" HeaderText="Rating" SortExpression="Rating" />
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                                ShowInsertButton="True" ButtonType="Button" />
                        </Fields>
                    </asp:DetailsView>
                </ContentTemplate>
            </asp:RoleGroup>
        </RoleGroups>
    </asp:LoginView>
</asp:Content>
