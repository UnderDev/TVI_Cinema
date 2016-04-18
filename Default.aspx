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
        <asp:SqlDataSource ID="dsMoviesDetail" runat="server" ConflictDetection="CompareAllValues"
            ConnectionString="<%$ ConnectionStrings:MovieDBConnectionString %>" DeleteCommand="DELETE FROM [ComingSoon] WHERE [Number] = @original_Number "
            InsertCommand="INSERT INTO [ComingSoon] ([Name], [Poster], [Trailer_url], [Description], [Director], [Length]) VALUES (@Name, @Poster, @Trailer_url, @Description, @Director, @Length)"
            OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [ComingSoon]"
            UpdateCommand="UPDATE [ComingSoon] SET [Name] = @Name, [Trailer_url] = @Trailer_url, [Description] = @Description, [Director] = @Director, [Length] = @Length WHERE [Number] = @original_Number AND [Name] = @original_Name AND [Trailer_url] = @original_Trailer_url AND [Description] = @original_Description AND [Director] = @original_Director AND [Length] = @original_Length">
            <DeleteParameters>
                <asp:Parameter Name="original_Number" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Number" Type="Int32" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Trailer_url" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Director" Type="String" />
                <asp:Parameter Name="Length" Type="Int32" />
                <asp:Parameter Name="Poster" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Trailer_url" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Director" Type="String" />
                <asp:Parameter Name="Length" Type="Int32" />
                <asp:Parameter Name="original_Number" Type="Int32" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Trailer_url" Type="String" />
                <asp:Parameter Name="original_Description" Type="String" />
                <asp:Parameter Name="original_Director" Type="String" />
                <asp:Parameter Name="original_Length" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <asp:LoginView ID="LoginView1" runat="server">
        <LoggedInTemplate>
            <asp:DataList ID="DataList2" runat="server" CellPadding="20" DataSourceID="dsMovies"
                RepeatColumns="3" OnItemCommand="DataList2_ItemCommand" HorizontalAlign="Center"
                Width="100%">
                <ItemTemplate>
                    &nbsp;<asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                    <br />
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# GetImage(Eval("Poster")) %>'
                        CommandName="selectMovie" />
                    <br />
                    <br />
                </ItemTemplate>
            </asp:DataList>
        </LoggedInTemplate>
        <AnonymousTemplate>
            <asp:DataList ID="dlMovies" runat="server" CellPadding="20" DataSourceID="dsMovies"
                RepeatColumns="3" OnItemCommand="DataList2_ItemCommand" HorizontalAlign="Center"
                Width="100%" CssClass="ImageBoarderStyles">
                <ItemTemplate>
                    &nbsp;<asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>' />
                    <br />
                    <asp:ImageButton ID="imgBtn" runat="server" ImageUrl='<%# GetImage(Eval("Poster")) %>'
                        CommandName="selectMovie" />
                    <br />
                    <br />
                </ItemTemplate>
            </asp:DataList>
        </AnonymousTemplate>
        <RoleGroups>
            <asp:RoleGroup Roles="Admin">
                <ContentTemplate>
                    <asp:DetailsView ID="dvwComingSoon" runat="server" AllowPaging="True" AutoGenerateRows="False"
                        CellPadding="4" DataKeyNames="Number" DataSourceID="dsMoviesDetail" ForeColor="#333333"
                        GridLines="None" HorizontalAlign="Center" OnItemUpdated="dvwComingSoon_ItemUpdated"
                        OnItemDeleted="dvwComingSoon_ItemDeleted" OnItemInserted="dvwComingSoon_ItemInserted">
                        <AlternatingRowStyle BackColor="White" />
                        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                        <EditRowStyle BackColor="#2461BF" />
                        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                        <Fields>
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:TemplateField HeaderText="Number" SortExpression="Number">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Number") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Number") %>'></asp:Label>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:Label ID="lblNewNumber" runat="server" Text=" "></asp:Label>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Trailer_url" HeaderText="Trailer_url" SortExpression="Trailer_url" />
                            <asp:TemplateField HeaderText="Description" SortExpression="Description">
                                <ItemTemplate>
                                    <asp:Label ID="lblDescription" TextMode="MultiLine" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Director" HeaderText="Director" SortExpression="Director" />
                            <asp:BoundField DataField="Length" HeaderText="Length" SortExpression="Length" />
                            <asp:TemplateField HeaderText="Poster">
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# GetImage(Eval("Poster")) %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# GetImage(Eval("Poster")) %>' />
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:FileUpload ID="fpPoster" filebytes='<%# Bind("Poster") %>' runat="server"  />
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True"
                                ShowInsertButton="True" />
                        </Fields>
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerSettings FirstPageText="&lt;&lt;" LastPageText="&gt;&gt;" Mode="NextPreviousFirstLast"
                            NextPageText="&gt;" PreviousPageText="&lt;" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                    </asp:DetailsView>
                    <asp:Label ID="lblError" runat="server"></asp:Label>
                </ContentTemplate>
            </asp:RoleGroup>
        </RoleGroups>
    </asp:LoginView>
    <br />
</asp:Content>
