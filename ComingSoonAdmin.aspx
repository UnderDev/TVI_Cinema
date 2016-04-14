<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ComingSoonAdmin.aspx.cs" Inherits="ComingSoon2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MovieDBConnectionString %>" 
            SelectCommand="SELECT * FROM [ComingSoon]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [ComingSoon] WHERE [Number] = @original_Number AND [Name] = @original_Name AND [Poster] = @original_Poster AND [Trailer_url] = @original_Trailer_url AND [Description] = @original_Description AND [Director] = @original_Director AND [Length] = @original_Length" InsertCommand="INSERT INTO [ComingSoon] ([Number], [Name], [Poster], [Trailer_url], [Description], [Director], [Length]) VALUES (@Number, @Name, @Poster, @Trailer_url, @Description, @Director, @Length)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [ComingSoon] SET [Name] = @Name, [Poster] = @Poster, [Trailer_url] = @Trailer_url, [Description] = @Description, [Director] = @Director, [Length] = @Length WHERE [Number] = @original_Number AND [Name] = @original_Name AND [Poster] = @original_Poster AND [Trailer_url] = @original_Trailer_url AND [Description] = @original_Description AND [Director] = @original_Director AND [Length] = @original_Length">
            <DeleteParameters>
                <asp:Parameter Name="original_Number" Type="Int32" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Poster" Type="Object" />
                <asp:Parameter Name="original_Trailer_url" Type="String" />
                <asp:Parameter Name="original_Description" Type="String" />
                <asp:Parameter Name="original_Director" Type="String" />
                <asp:Parameter Name="original_Length" Type="Int32" />
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
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Poster" Type="Object" />
                <asp:Parameter Name="Trailer_url" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Director" Type="String" />
                <asp:Parameter Name="Length" Type="Int32" />
                <asp:Parameter Name="original_Number" Type="Int32" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Poster" Type="Object" />
                <asp:Parameter Name="original_Trailer_url" Type="String" />
                <asp:Parameter Name="original_Description" Type="String" />
                <asp:Parameter Name="original_Director" Type="String" />
                <asp:Parameter Name="original_Length" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Number" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Number" HeaderText="Number" ReadOnly="True" SortExpression="Number" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Trailer_url" HeaderText="Trailer_url" SortExpression="Trailer_url" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="Director" HeaderText="Director" SortExpression="Director" />
                <asp:BoundField DataField="Length" HeaderText="Length" SortExpression="Length" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# GetImage(Eval("Poster")) %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" >
                <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                </asp:CommandField>
            </Columns>
        </asp:GridView>
    </p>
    <p>
        <asp:Label ID="Label1" runat="server" Text="Number"></asp:Label>
        <asp:TextBox ID="txtNumber" runat="server" ValidationGroup="requiredText"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Text="Name"></asp:Label>
        <asp:TextBox ID="txtName" runat="server" ValidationGroup="requiredText" Width="174px"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="Label4" runat="server" Text="Trailer URL"></asp:Label>
        <asp:TextBox ID="txtTrailerURL" runat="server" style="margin-left: 0px" ValidationGroup="requiredText"></asp:TextBox>
&nbsp;<asp:Label ID="Label3" runat="server" Text="Director"></asp:Label>
        <asp:TextBox ID="txtDirector" runat="server" ValidationGroup="requiredText"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="Label5" runat="server" Text="Length"></asp:Label>
        <asp:TextBox ID="txtLength" runat="server" ValidationGroup="requiredText"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label6" runat="server" Text="Poster"></asp:Label>
        <asp:TextBox ID="txtPoster" runat="server" ValidationGroup="requiredText" Width="164px"></asp:TextBox>
    </p>
    <p>
        &nbsp;<asp:Label ID="Label8" runat="server" Text="Description"></asp:Label>
        <asp:TextBox ID="txtDescription" runat="server" Height="115px" ValidationGroup="requiredText" Width="231px"></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="btnInsert" runat="server" Text="Insert" />
    </p>
</asp:Content>

