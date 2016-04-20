<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="ScreenAdmin.aspx.cs" Inherits="ScreenTime" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <p>
        <br />
        <asp:SqlDataSource ID="dsScreen" runat="server" ConflictDetection="CompareAllValues"
            ConnectionString="<%$ ConnectionStrings:MovieDBConnectionString %>" DeleteCommand="DELETE FROM [Showtimes] WHERE [Screen] = @original_Screen AND [Showtime] = @original_Showtime AND [dimension] = @original_dimension"
            InsertCommand="INSERT INTO [Showtimes] ([Screen], [Showtime], [dimension]) VALUES (@Screen, @Showtime, @dimension)"
            OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT Showtimes.Screen, Showtimes.Showtime, Showtimes.dimension, Movies.Name FROM Showtimes INNER JOIN Movies ON Showtimes.Screen = Movies.Screen"
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
        &nbsp;
    </p>
    <div>
<table style="margin-left:auto;margin-right:auto">
        <tr>
            <td style="text-align: center;">
                <div style="background-color:#507CD1;box-shadow: 0 0 20px #000;">
                    <asp:ListView ID="lvwScreen" runat="server" DataKeyNames="Screen,Showtime" DataSourceID="dsScreen"
                        InsertItemPosition="LastItem" OnItemDeleted="lvScreen_ItemDeleted" OnItemInserted="lvScreen_ItemInserted"
                        OnItemUpdated="lvScreen_ItemUpdated" >
                        <AlternatingItemTemplate>
                            <tr style="background-color: #507CD1; " >
                                <td>
                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                </td>
                                <td>
                                    <asp:Label ForeColor="White" ID="ScreenLabel" runat="server" Text='<%# Eval("Screen") %>' />
                                </td>
                                <td>
                                    <asp:Label ForeColor="White" ID="ShowtimeLabel" runat="server" Text='<%# Eval("Showtime") %>' />
                                </td>
                                <td>
                                    <asp:Label ForeColor="White" ID="dimensionLabel" runat="server" Text='<%# Eval("dimension") %>' />
                                </td>
                                <td>
                                    <asp:Label ForeColor="White" ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                        <EditItemTemplate>
                            <tr style="background-color: #008A8C; color: #FFFFFF;">
                                <td>
                                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                </td>
                                <td>
                                    <asp:Label ForeColor="White" ID="ScreenLabel1" runat="server" Text='<%# Eval("Screen") %>' />
                                </td>
                                <td>
                                    <asp:Label ForeColor="White" ID="ShowtimeLabel1" runat="server" Text='<%# Eval("Showtime") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="dimensionTextBox" runat="server" Text='<%# Bind("dimension") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                                </td>
                            </tr>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                                <tr>
                                    <td>No data was returned.
                                    </td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <InsertItemTemplate>
                            <tr style="background-color:#507CD1">
                                <td>
                                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                </td>
                                <td>
                                    <asp:TextBox ID="ScreenTextBox" runat="server" Text='<%# Bind("Screen") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="ShowtimeTextBox" runat="server" Text='<%# Bind("Showtime") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="dimensionTextBox" runat="server" Text='<%# Bind("dimension") %>' />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="background-color: #507CD1; color: #000000;">
                                <td>
                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                </td>
                                <td>
                                    <asp:Label ForeColor="White" ID="ScreenLabel" runat="server" Text='<%# Eval("Screen") %>' />
                                </td>
                                <td>
                                    <asp:Label ForeColor="White" ID="ShowtimeLabel" runat="server" Text='<%# Eval("Showtime") %>' />
                                </td>
                                <td>
                                    <asp:Label ForeColor="White" ID="dimensionLabel" runat="server" Text='<%# Eval("dimension") %>' />
                                </td>
                                <td>
                                    <asp:Label ForeColor="White" ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="itemPlaceholderContainer" runat="server" border="0" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                            <tr runat="server" style="background-color: #DCDCDC; color: #000000;">
                                                <th runat="server"></th>
                                                <th runat="server">
                                                    <asp:LinkButton ID="lnkScreen" runat="server" CommandName="Sort" CommandArgument="Screen">Screen
                                                    </asp:LinkButton>
                                                </th>
                                                <th runat="server">
                                                    <asp:LinkButton ID="lnkTime" runat="server" CommandName="Sort" CommandArgument="Showtime">Showtime
                                                    </asp:LinkButton>
                                                </th>
                                                <th runat="server">dimension
                                                </th>
                                                <th runat="server">Name
                                                </th>
                                            </tr>
                                            <tr id="itemPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style="text-align: center; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000;">
                                        <asp:DataPager ID="DataPager1" runat="server">
                                            <Fields>
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                            </Fields>
                                        </asp:DataPager>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <SelectedItemTemplate>
                            <tr style="background-color: #008A8C; font-weight: bold; color: #FFFFFF;">
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
                        </SelectedItemTemplate>
                    </asp:ListView>
                </div>
            </td>
            <td>&nbsp;
            </td>
        </tr>
    </table>
    </div>
    
    <p>
        <asp:Label ID="lblError" runat="server"></asp:Label>
    </p>
    <asp:SqlDataSource ID="dsPrices" runat="server" ConnectionString="<%$ ConnectionStrings:MovieDBConnectionString %>"
        SelectCommand="SELECT * FROM [Prices]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Prices] WHERE [Type] = @original_Type AND [dimension] = @original_dimension AND [Price] = @original_Price"
        InsertCommand="INSERT INTO [Prices] ([Type], [Price], [dimension]) VALUES (@Type, @Price, @dimension)"
        OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Prices] SET [Price] = @Price WHERE [Type] = @original_Type AND [dimension] = @original_dimension AND [Price] = @original_Price">
        <DeleteParameters>
            <asp:Parameter Name="original_Type" Type="String" />
            <asp:Parameter Name="original_dimension" Type="Int32" />
            <asp:Parameter Name="original_Price" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="dimension" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="original_Type" Type="String" />
            <asp:Parameter Name="original_dimension" Type="Int32" />
            <asp:Parameter Name="original_Price" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <div style="text-align: center">
        <br />
        <br />
        <br />
        <div style="box-shadow: 0 0 20px #000;margin-left:auto;margin-right:auto; display:inline-block">
            <asp:FormView ID="fvwPrices" runat="server" DataKeyNames="Type,dimension" DataSourceID="dsPrices"
                Style="text-align: left" AllowPaging="True" CellPadding="4" ForeColor="#333333"
                HorizontalAlign="Center" Width="500px">
                <EditItemTemplate>
                    <span  > Type:</span>
                <asp:Label ID="TypeLabel1"   runat="server" Text='<%# Eval("Type") %>' />
                    <br />
                   <span  >  Price:</span>
                <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                    <br />
                      <span  >Dimension:</span>
                <asp:Label ID="dimensionLabel1"   runat="server" Text='<%# Eval("dimension") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                        Text="Update" />
                    &nbsp;<asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False"
                        CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True"   />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True"   />
                <HeaderTemplate>
                    <div style="text-align: center">
                        <asp:Label ID="Label1" runat="server" Text="Ticket Prices"></asp:Label>
                    </div>
                </HeaderTemplate>
                <InsertItemTemplate >
                   <span  > Type:</span>
                <asp:TextBox ID="TypeTextBox" runat="server" Text='<%# Bind("Type") %>' />
                    <br />
                    <span  >  Price:</span>
                <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                    <br />
                    <span  >Dimension:</span>
                <asp:TextBox ID="dimensionTextBox" runat="server" Text='<%# Bind("dimension") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                        Text="Insert" />
                    &nbsp;<asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False"
                        CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <div style="text-align: center">
                        <span  > Type:</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                    <asp:Label ID="TypeLabel"   runat="server" Text='<%# Eval("Type") %>' />
                        <br />
                        <span  >  &nbsp;Price:</span>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="PriceLabel"    runat="server" Text='<%# Bind("Price") %>' />
                        <br />
                        <span  >Dimension:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
                    <asp:Label ID="dimensionLabel" runat="server" Text='<%# Eval("dimension") %>' />
                        <br />
                        <asp:Button ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="New" />
                        <asp:Button ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="Edit" />
                        &nbsp;<asp:Button ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="Delete" />
                </ItemTemplate>
                <PagerSettings FirstPageText="First" LastPageText="Last" NextPageText="Next" PreviousPageText="Prev" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
            </asp:FormView>

        </div>

    </div>
    <br />
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
