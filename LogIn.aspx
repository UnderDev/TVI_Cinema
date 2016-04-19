<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="LogIn.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
        <asp:Login ID="Login" runat="server" Style="width: 100%;" 
    VisibleWhenLoggedIn="False" 
    DestinationPageUrl="~/Default.aspx">
        <%--DestinationPageUrl="~/AdminPages/Home.aspx"--%>

        <LayoutTemplate>        
            <div class="box">
                <asp:Panel runat="server" class="content" DefaultButton="btnLogin">
                    <h1>Authentication Required</h1>
                    <asp:TextBox Cssclass="TxtBoxInput" placeholder="UserName" ID="UserName" 
                        runat="server" AutoCompleteType="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvUserNameRequired" runat="server" ControlToValidate="UserName"
                        ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="vgLogin"
                        ForeColor="#046c8a">*</asp:RequiredFieldValidator>
                    <br>
                    <asp:TextBox Cssclass="TxtBoxInput" placeholder="PassWord" ID="Password" runat="server"
                        TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPasswordRequired" runat="server" ControlToValidate="Password"
                        ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="vgLogin"
                        ForeColor="#046c8a">*</asp:RequiredFieldValidator>
                    <br>
                    <asp:Button Cssclass="btn" ID="btnLogin" runat="server" CommandName="Login" Text="Log In"
                        ValidationGroup="vgLogin" Width="150"></asp:Button>
                        <br>
                    <asp:Button Cssclass="btn" ID="btnRegister" runat="server" CommandName="Login" Text="Register"
                                PostBackUrl="~/Registration.aspx" Width="150" ></asp:Button>
                    <br>
                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False" ></asp:Literal>
            </asp:Panel>
        </LayoutTemplate>
    </asp:Login>
    <br />

</asp:Content>
