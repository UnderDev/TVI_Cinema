<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ComingSoonAdmin.aspx.cs" Inherits="ComingSoon2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1>Comming Soon Administration</h1>
        <asp:SqlDataSource ID="dsCSASqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MovieDBConnectionString %>" 
            SelectCommand="SELECT * FROM [ComingSoon]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [ComingSoon] WHERE [Number] = @original_Number" InsertCommand="INSERT INTO [ComingSoon] ([Number], [Name], [Poster], [Trailer_url], [Description], [Director], [Length]) VALUES (@Number, @Name, @Poster, @Trailer_url, @Description, @Director, @Length)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [ComingSoon] SET [Name] =@Name,  [Trailer_url] = @Trailer_url, [Description] = @Description, [Director] = @Director, [Length] = @Length WHERE [Number] = @original_Number AND [Name] = @original_Name AND [Trailer_url] = @original_Trailer_url AND [Description] = @original_Description AND [Director] = @original_Director AND [Length] = @original_Length">
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
                <asp:Parameter Name="original_Number" Type="Int32"/>
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Trailer_url" Type="String" />
                <asp:Parameter Name="original_Description" Type="String" />
                <asp:Parameter Name="original_Director" Type="String" />
                <asp:Parameter Name="original_Length" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>


        <asp:GridView ID="gvwCSAdmin" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Number" 
            DataSourceID="dsCSASqlDataSource" OnRowDeleted="gvwCSAdmin_RowDeleted" 
            PageSize="3" OnRowUpdated="gvwCSAdmin_RowUpdated" CellPadding="4" 
            ForeColor="#333333" BorderColor="White" BorderStyle="Solid" 
        BorderWidth="2px" Font-Names="Rockwell">
            <AlternatingRowStyle BackColor="#ECF5FF" ForeColor="#284775" />
            <Columns>
                <asp:TemplateField HeaderText="Number" SortExpression="Number">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Number") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Number") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name" SortExpression="Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1"  TextMode="multiline" Height="100"  Width="100" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Trailer URL" SortExpression="Trailer_url">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" Width="100" Height="100" TextMode="multiline" runat="server" Text='<%# Bind("Trailer_url") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Trailer_url") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Description" SortExpression="Description">
                    <EditItemTemplate>

                        <asp:TextBox ID="TextBox5" TextMode="multiline" Height="100" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Director" SortExpression="Director">
                    <EditItemTemplate>
                   
                        <asp:TextBox ID="TextBox3" TextMode="multiline" Height="100" Width="100" runat="server" Text='<%# Bind("Director") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Director") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Length" SortExpression="Length">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" TextMode="multiline" Height="100" Width="50" runat="server" Text='<%# Bind("Length") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Length") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" HeaderText="Poster" ImageUrl='<%# GetImage(Eval("Poster")) %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
    <p>
&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>
        <asp:TextBox ID="txtName" runat="server" ValidationGroup="vgRequiredText" Width="174px"></asp:TextBox>
        <asp:Label ID="lblTrailer" runat="server" Text="Trailer URL"></asp:Label>
        <asp:TextBox ID="txtTrailerURL" runat="server" style="margin-left: 0px" ValidationGroup="vgRequiredText"></asp:TextBox>
    </p>
    <p>
&nbsp;<asp:Label ID="lblDirector" runat="server" Text="Director"></asp:Label>
        <asp:TextBox ID="txtDirector" runat="server" ValidationGroup="vgRequiredText"></asp:TextBox>
        <asp:Label ID="lblLength" runat="server" Text="Length"></asp:Label>
        <asp:TextBox ID="txtLength" runat="server" ValidationGroup="vgRequiredText"></asp:TextBox>
&nbsp;&nbsp;&nbsp;</p>
    <p>
        <asp:Label ID="lblPoster" runat="server" Text=" Insert Poster"></asp:Label>
        &nbsp;&nbsp;<asp:FileUpload ID="fpPoster" runat="server" />
        &nbsp;</p>
    <p>
        &nbsp;<asp:Label ID="lblDescription" runat="server" Text="Description"></asp:Label>
        <asp:TextBox ID="txtDescription" runat="server" Height="115px" ValidationGroup="vgRequiredText" Width="231px"></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="btnInsert" runat="server" Text="Insert" OnClick="btnInsert_Click" ValidationGroup="vgRequiredText" />
    </p>
    <p>
        <asp:RegularExpressionValidator ID="revLength" runat="server" ControlToValidate="txtLength" ErrorMessage="Length needs to be a number " ValidationGroup="vgRequiredText" ValidationExpression="\d+"></asp:RegularExpressionValidator>
    </p>
    <p>
        <asp:Label ID="lblErrorMessage" runat="server"></asp:Label>
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
    </p>

        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="Name Field can't be empty" ValidationGroup="vgRequiredText"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="rfvTrailer" runat="server" ControlToValidate="txtTrailerURL" ErrorMessage="Trailer URL Field can't be empty" ValidationGroup="vgRequiredText"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="rfvDirector" runat="server" ControlToValidate="txtDirector" ErrorMessage="Director Field can't be empty" ValidationGroup="vgRequiredText"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="rfvLength" runat="server" ControlToValidate="txtLength" ErrorMessage="Length field can't be empty" ValidationGroup="vgRequiredText"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ControlToValidate="txtDescription" ErrorMessage="Description Field can't be empty" ValidationGroup="vgRequiredText"></asp:RequiredFieldValidator>
</asp:Content>

