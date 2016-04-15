<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BookingPage.aspx.cs" Inherits="BookingPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="dsPrices" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MovieDBConnectionString %>" 
        SelectCommand="SELECT * FROM [Prices] WHERE ([dimension] = @dimension)">
        <SelectParameters>
            <asp:SessionParameter Name="dimension" 
                SessionField="dimension" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:ObjectDataSource ID="dsQuantity" runat="server"></asp:ObjectDataSource>
    <h1>Booking Page</h1>
    <div>
    
        <asp:GridView ID="gvwBooking" runat="server" DataSourceID="dsPrices" 
            AutoGenerateColumns="False" DataKeyNames="Type,dimension" CellPadding="4" 
            ForeColor="#333333" GridLines="None" HorizontalAlign="Center" Width="347px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Type" HeaderText="Type" ReadOnly="True" 
                    SortExpression="Type" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" 
                    DataFormatString="{0:c}" />
                <asp:BoundField DataField="dimension" HeaderText="Dimension" ReadOnly="True" 
                    SortExpression="dimension" />
                <asp:TemplateField HeaderText="Amount">
                    <ItemTemplate> 
                         <asp:DropDownList ID="dllAmount" Runat="Server" oninit="dllAmount_Init" 
                             onselectedindexchanged="dllAmount_SelectedIndexChanged" 
                             AutoPostBack="True"/>
                    </ItemTemplate>
                </asp:TemplateField> 
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>

        <br />
        <br />
        <table align="center" class="style1">
            <tr>
                <td class="style2">
                    </td>
                <td class="style2">
                    </td>
                <td class="style2">
                    </td>
                <td class="style2">
                    </td>
            </tr>
            <tr >
                <td >
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td align="right" width="100">
                    Booking Fee:</td>
                <td align="center" >
                    <asp:Label ID="lblBookingFee" runat="server" Text="0.00"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td align="right">
                    Total:</td>
                <td align="center">
                    <asp:Label ID="lblTotal" runat="server" >0.00</asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td align="right">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td align="right">
                    &nbsp;</td>
                <td align=right width="50">
                    <asp:Button ID="btnContinue" runat="server" Text="Continue" 
                        onclick="btnContinue_Click" />
                </td>
            </tr>
        </table>
        <br />
        <br />
    </div>
</asp:Content>

