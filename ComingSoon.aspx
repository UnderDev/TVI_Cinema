<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="ComingSoon.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
        <asp:SqlDataSource ID="dsComingSoon" runat="server" ConnectionString="<%$ ConnectionStrings:MovieDBConnectionString %>"
            SelectCommand="SELECT [Name], [Poster] FROM [ComingSoon] ORDER BY [Name]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="CSAdminSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:MovieDBConnectionString %>"
            SelectCommand="SELECT * FROM [ComingSoon]" ConflictDetection="CompareAllValues"
            DeleteCommand="DELETE FROM [ComingSoon] WHERE [Number] = @original_Number" InsertCommand="INSERT INTO [ComingSoon] ([Number], [Name], [Poster], [Trailer_url], [Description], [Director], [Length]) VALUES (@Number, @Name, @Poster, @Trailer_url, @Description, @Director, @Length)"
            OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [ComingSoon] SET [Name] =@Name,  [Trailer_url] = @Trailer_url, [Description] = @Description, [Director] = @Director, [Length] = @Length WHERE [Number] = @original_Number AND [Name] = @original_Name AND [Trailer_url] = @original_Trailer_url AND [Description] = @original_Description AND [Director] = @original_Director AND [Length] = @original_Length">
            <DeleteParameters>
                <asp:Parameter Name="original_Number" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Number" Type="Int32" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Poster" Type="Object" />
                <asp:Parameter Name="Trailer_url" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Director" Type="String" />
                <asp:Parameter Name="Length" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" />
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
        <br />
        <asp:LoginView ID="LoginView1" runat="server">
            <LoggedInTemplate>
                <asp:ListView ID="lvwComingSoon" runat="server" DataSourceID="SqlDataSource1" GroupItemCount="3">
                    <EditItemTemplate>
                        <td id="Td1" runat="server" style="">Name:
                            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                            <br />
                            Poster:
                            <asp:TextBox ID="PosterTextBox" runat="server" Text='<%# Bind("Poster") %>' />
                            <br />
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <br />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                            <br />
                        </td>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table id="Table1" runat="server" style="">
                            <tr>
                                <td>No data was returned.
                                </td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <EmptyItemTemplate>
                        <td id="Td2" runat="server" />
                    </EmptyItemTemplate>
                    <GroupTemplate>
                        <tr id="itemPlaceholderContainer" runat="server">
                            <td id="itemPlaceholder" runat="server"></td>
                        </tr>
                    </GroupTemplate>
                    <InsertItemTemplate>
                        <td id="Td3" runat="server" style="">Name:
                            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                            <br />
                            Poster:
                            <asp:TextBox ID="PosterTextBox" runat="server" Text='<%# Bind("Poster") %>' />
                            <br />
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <br />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                            <br />
                        </td>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <td>
                            <table  style="background-color:#222E50;">
                                <tr>
                                    <td style="font-family: Arial, Sans-Serif; font-size: 12pt; font-weight: bold" align="center"
                                        valign="top">
                                        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 220px; width: 280px" align="center" valign="top">
                                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# GetImage(Eval("Poster")) %>'
                                            CommandArgument='<%# Eval("Name") %>' />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table id="Table1" runat="server">
                            <tr id="Tr1" runat="server">
                                <td id="Td1" runat="server">
                                    <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                                        <tr id="groupPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr id="Tr2" runat="server" align="center">
                                <td id="Td2" runat="server" style=""></td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <td id="Td4" runat="server" style="">Name:
                            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                            <br />
                            Poster:
                            <asp:Label ID="PosterLabel" runat="server" Text='<%# Eval("Poster") %>' />
                            <br />
                        </td>
                    </SelectedItemTemplate>
                </asp:ListView>
            </LoggedInTemplate>
            <AnonymousTemplate>
                <asp:ListView ID="lvwComingSoon" runat="server" DataSourceID="dsComingSoon" GroupItemCount="3">
                    <EditItemTemplate>
                        <td id="Td1" runat="server" style="">Name:
                            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                            <br />
                            Poster:
                            <asp:TextBox ID="PosterTextBox" runat="server" Text='<%# Bind("Poster") %>' />
                            <br />
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <br />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                            <br />
                        </td>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table id="Table1" runat="server" style="">
                            <tr>
                                <td>No data was returned.
                                </td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <EmptyItemTemplate>
                        <td id="Td2" runat="server" />
                    </EmptyItemTemplate>
                    <GroupTemplate>
                        <tr id="itemPlaceholderContainer" runat="server">
                            <td id="itemPlaceholder" runat="server"></td>
                        </tr>
                    </GroupTemplate>
                    <InsertItemTemplate>
                        <td id="Td3" runat="server" style="">
                           
                                Name:
                            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                                <br />
                                Poster:
                            <asp:TextBox ID="PosterTextBox" runat="server" Text='<%# Bind("Poster") %>' />
                                <br />
                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                <br />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                <br />
                            

                        </td>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <td>
                            <div >
                            <table style="background-color:#222E50;">
                                <tr>
                                    <td style="font-family: Arial, Sans-Serif; font-size: 12pt; font-weight: bold" align="center"
                                        valign="top">
                                        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 220px; width: 280px" align="center" valign="top">
                                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# GetImage(Eval("Poster")) %>'
                                            CommandArgument='<%# Eval("Name") %>' />
                                    </td>
                                </tr>
                            </table>
                                </div>
                        </td>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table id="Table1" runat="server">
                            <tr id="Tr1" runat="server">
                                <td id="Td1" runat="server">
                                    <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                                        <tr id="groupPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr id="Tr2" runat="server" align="center">
                                <td id="Td2" runat="server" style=""></td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <td id="Td4" runat="server" style="">Name:
                            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                            <br />
                            Poster:
                            <asp:Label ID="PosterLabel" runat="server" Text='<%# Eval("Poster") %>' />
                            <br />
                        </td>
                    </SelectedItemTemplate>
                </asp:ListView>
            </AnonymousTemplate>
        </asp:LoginView>
    </p>
</asp:Content>
