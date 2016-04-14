<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Movie.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="Rob.css" rel="stylesheet" type="text/css" />
    <asp:ObjectDataSource ID="odsSingleMovie" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetMovie" TypeName="MovieDB">
        <SelectParameters>
            <asp:SessionParameter Name="name" SessionField="SelectedMovie" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:SqlDataSource ID="sdsShowTimes" runat="server" ConnectionString="<%$ ConnectionStrings:MovieDBConnectionString %>" SelectCommand="SELECT [Showtime], [Dimension] FROM [Showtimes] WHERE ([Screen] = @Screen)" OnSelecting="sdsShowTimes_Selecting">
        <SelectParameters>
            <asp:Parameter Name="Screen" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div class="content-container">
        <div class="MovieTitle">
            <h1>
                <asp:Label CssClass="MovieTitle" runat="server" ID="lblMovieTitle"></asp:Label></h1>
        </div>
        <div class="flex-container">
            <div class="flex-fixed60p">
                <asp:DetailsView ID="dvMovieInfo" runat="server" AutoGenerateRows="False" DataSourceID="odsSingleMovie" GridLines="None">
                    <Fields>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <div class="DetailsViewField">
                                    <asp:Label CssClass="DetailsViewField" ID="Label2" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                                    <br>
                                    </br>
                                    <br>
                                    </br>
                                    <br>
                                    </br>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <div class="DetailsViewField">
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Length") %>'></asp:Label>
                                    minutes long
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <div class="DetailsViewField">
                                    Directed by
                                    <asp:Label CssClass="DetailsViewField" ID="Label4" runat="server" Text='<%# Bind("Director") %>'></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <div class="DetailsViewField">
                                    <asp:Label ID="lblStarringPrefix" runat="server" Text="Starring"></asp:Label>
                                    <asp:Label CssClass="DetailsViewField" ID="Label7" runat="server" Text='<%# Bind("Starring") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <div class="DetailsViewField">
                                    <asp:Label ID="lblRatedPrefix" runat="server" Text="Rated"></asp:Label>
                                    <asp:Label CssClass="DetailsViewField" ID="Label6" runat="server" Text='<%# Bind("Rating") %>'></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <div class="DetailsViewField">
                                    <asp:Label ID="lblScreenPrefix" runat="server" Text="Playing on Screen"></asp:Label>
                                    <asp:Label CssClass="DetailsViewField" ID="lblScreen" runat="server" Text='<%# Bind("Screen") %>'></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                </asp:DetailsView>
                <br />
                <br />
            </div>
            <div class="flex-item" style="text-align: center; margin-left: 10px">
                <asp:Image ID="ImgPoster" runat="server" />
            </div>

        </div>
        <iframe id="ifrmTrailerEmbed" runat="server" width="560" height="315" frameborder="0" allowfullscreen></iframe>
        <div style="">
            <h3><asp:Label runat="server" ID="lblDate" /></h3>
            <div>
               <asp:GridView ID="gvTimes" runat="server" AutoGenerateColumns="False" DataSourceID="sdsShowTimes" GridLines="None" HorizontalAlign="Center">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("Showtime") %>' >  </asp:Label>   
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            &nbsp&nbsp&nbsp&nbsp <asp:Label ID="Label9" runat="server" Text='<%# Bind("Dimension") %>'></asp:Label>D
                        </ItemTemplate>                
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            </div>
        </div>


    </div>
</asp:Content>


