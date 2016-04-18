<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditPrices.aspx.cs" Inherits="EditPrices" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="dsPrices" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MovieDBConnectionString %>" 
        SelectCommand="SELECT * FROM [Prices]" 
        ConflictDetection="CompareAllValues" 
        DeleteCommand="DELETE FROM [Prices] WHERE [Type] = @original_Type AND [dimension] = @original_dimension AND [Price] = @original_Price" 
        InsertCommand="INSERT INTO [Prices] ([Type], [Price], [dimension]) VALUES (@Type, @Price, @dimension)" 
        OldValuesParameterFormatString="original_{0}" 
        UpdateCommand="UPDATE [Prices] SET [Price] = @Price WHERE [Type] = @original_Type AND [dimension] = @original_dimension AND [Price] = @original_Price">
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
    <div align="center">
        <br />
        <br />
        <br />
    <asp:FormView ID="fvwPrices" runat="server" DataKeyNames="Type,dimension" 
        DataSourceID="dsPrices" style="text-align: left" AllowPaging="True" 
            CellPadding="4" ForeColor="#333333">
        <EditItemTemplate>
            Type:
            <asp:Label ID="TypeLabel1" runat="server" Text='<%# Eval("Type") %>' />
            <br />
            Price:
            <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
            <br />
            dimension:
            <asp:Label ID="dimensionLabel1" runat="server" 
                Text='<%# Eval("dimension") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <InsertItemTemplate>
            Type:
            <asp:TextBox ID="TypeTextBox" runat="server" Text='<%# Bind("Type") %>' />
            <br />
            Price:
            <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
            <br />
            dimension:
            <asp:TextBox ID="dimensionTextBox" runat="server" 
                Text='<%# Bind("dimension") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            Type:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            <asp:Label ID="TypeLabel" runat="server" Text='<%# Eval("Type") %>' />
            <br />
            Price:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
            <asp:Label ID="PriceLabel" runat="server" Text='<%# Bind("Price") %>' />
            <br />
            Dimension: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                  
            <asp:Label ID="dimensionLabel" runat="server" Text='<%# Eval("dimension") %>' />
            <br />
            <asp:Button ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New" />
            
            <asp:Button ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Edit" />
            &nbsp;<asp:Button ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Delete" />
           
        </ItemTemplate>
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
    </asp:FormView>
    </div>
    <br />
</asp:Content>

