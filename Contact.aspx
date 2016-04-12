<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Contact.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="ContentContact">
        <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSubmit">
            <p>
                Please Fill the Following to Contact Us.</p>
            <asp:TextBox ID="txtboxYourName" runat="server" Width="350px" placeholder="Name"
                CssClass="TextBox" AutoCompleteType="FirstName" />
            <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Username Required "
                ControlToValidate="txtboxYourName" ValidationGroup="vgContact" Display="Dynamic">*</asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:TextBox ID="txtboxYourEmail" runat="server" Width="350px" AutoCompleteType="Email"
                CssClass="TextBox" placeholder="Email Address"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email Required"
                ControlToValidate="txtboxYourEmail" ValidationGroup="vgContact" Text="*" Display="Dynamic"/>      
            <asp:RegularExpressionValidator runat="server" ID="revEmail"
                SetFocusOnError="true" ControlToValidate="txtboxYourEmail"
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"
                ValidationGroup="vgContact"
                ErrorMessage="Email Incorrect, E.g. username@gmail.com" >*</asp:RegularExpressionValidator>
            <br />
            <br />    
            <asp:TextBox ID="txtboxYourSubject" runat="server" Width="350px" CssClass="TextBox"
                placeholder="Subject" />
            <asp:RequiredFieldValidator ID="rfvSubject" runat="server" ErrorMessage="Subject Required"
                ControlToValidate="txtboxYourSubject" ValidationGroup="vgContact" Text="*" Display="Dynamic" />
            <br />
            <br />
            <asp:TextBox ID="txtboxComments" runat="server" TextMode="MultiLine" Rows="10" Width="350px"
                placeholder="Enter Your Question Here" CssClass="TextBox" Height="200px" Style=" resize: none;"
                MaxLength="1000" />
            <asp:RequiredFieldValidator ID="rfvQuestion" runat="server" ErrorMessage="Question Required"
                ControlToValidate="txtboxComments" ValidationGroup="vgContact" Display="Dynamic">*</asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Button ID="btnSubmit" runat="server" Text="Send" OnClick="btnSubmit_Click" ValidationGroup="vgContact" />
        </asp:Panel>
        <p>
            <asp:Label ID="lblDisplayMessage" runat="server" Visible="false" />
        </p>
        <asp:ValidationSummary ID="vsContactUs" runat="server" 
            ValidationGroup="vgContact" DisplayMode="List" />
    </div>
</asp:Content>
