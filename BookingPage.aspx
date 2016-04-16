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
    <h1>Select Tickets: </h1>
    <div>
    
        <asp:GridView ID="gvwBooking" runat="server" DataSourceID="dsPrices" 
            AutoGenerateColumns="False" DataKeyNames="Type,dimension" CellPadding="4" 
            ForeColor="#333333" GridLines="None" HorizontalAlign="Center" 
            Width="500px" Height="250px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Type" HeaderText="Type" ReadOnly="True" 
                    SortExpression="Type" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" 
                    DataFormatString="{0:c}" />
                <asp:BoundField DataField="dimension" HeaderText="Dimension" ReadOnly="True" 
                    SortExpression="dimension" DataFormatString="{0}D" />
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
        <table align="center" class="style1" style="border-collapse: collapse; empty-cells: show; table-layout: fixed; " 
            width="500px">
            <tr >
                <td style="border-top-style: groove; border-right-style: inherit; border-bottom-style: inherit; border-width: .1px; border-left-style: groove; border-color: #EFF3FB;">
                    &nbsp;</td>
                <td style="border-bottom:1pt solid black; border-bottom-style: inherit; border-top-style: groove; border-width: .1px; border-color: #EFF3FB; border-right-style: inherit;">
                    </td>
                <td style="border-bottom:1pt solid black; border-bottom-style: inherit; border-top-style: groove; border-width: .1px; border-color: #EFF3FB; border-right-style: inherit;">
                    </td>
                <td style="border-bottom:1pt solid black; border-bottom-style: inherit; border-top-style: groove; border-width: .1px; border-color: #EFF3FB; border-right-style: inherit;">
                    </td>
            </tr>
            <tr>
                <td style="border-width: .1px; border-color: #EFF3FB; border-left-style: groove"></td>
                <td> </td>
                <td align="center">
                 Booking Fee:</td>
                <td align="center" >
                    <asp:Label ID="lblBookingFee" runat="server" Text="0.00"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="border-width: .1px; border-color: #EFF3FB; border-left-style: groove">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td class="style1">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="border-width: .1px; border-color: #EFF3FB; border-left-style: groove">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td align="center" class="style1">
                    Total:</td>
                <td align="center">
                    <asp:Label ID="lblTotal" runat="server" >0.00</asp:Label>
                </td>
            </tr>
            <tr>
                <td style="border-width: .1px; border-color: #EFF3FB; border-left-style: groove">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td align="right" class="style1">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="border-width: .1px; border-color: #EFF3FB; border-left-style: groove">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td align="right" class="style1">
                    &nbsp;</td>
                <td align=center>
                    <asp:Button ID="btnContinue" runat="server" Text="Continue" 
                        onclick="btnContinue_Click" ValidationGroup="vGroupTotal" />
                    <asp:CustomValidator ID="cvTotal" runat="server" 
                        ErrorMessage="No Tickets Selected" 
                        onservervalidate="cvTotal_ServerValidate" ValidationGroup="vGroupTotal">*</asp:CustomValidator>
                </td>
            </tr>
        </table>
        <br />

    <asp:ValidationSummary ID="vsBookingPage1" ValidationGroup="vGroupTotal" 
        runat="server" DisplayMode="List" ForeColor="Red" />
        <br />
    </div>
</asp:Content>

