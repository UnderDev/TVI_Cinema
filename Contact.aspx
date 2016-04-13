<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Contact.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="ContentContact">
        <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSubmit">
            <p>
                Please Fill the Following to Contact Us.</p>
                <asp:TextBox ID="YourName" runat="server" Width="350px" placeholder="Name" CssClass="TextBox"
                    AutoCompleteType="FirstName" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*"
                    ControlToValidate="YourName" ValidationGroup="save" />

                </p>
                <asp:TextBox ID="YourEmail" runat="server" Width="350px" AutoCompleteType="Email"
                    CssClass="TextBox" placeholder="Email Address"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                    ControlToValidate="YourEmail" ValidationGroup="save" />

                </p>
                <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator23"
                    SetFocusOnError="true" Text="Example: username@gmail.com" ControlToValidate="YourEmail"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"
                    ValidationGroup="save" />
                <asp:TextBox ID="YourSubject" runat="server" Width="350px" CssClass="TextBox" placeholder="Subject" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                    ControlToValidate="YourEmail" ValidationGroup="save" />

                </p>
                <asp:TextBox ID="Comments" runat="server" TextMode="MultiLine" Rows="10" Width="350px"
                    placeholder="Enter Your Question Here" CssClass="TextBox" Height="200px" Style="resize: none;"
                    MaxLength="1000" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
                    ControlToValidate="Comments" ValidationGroup="save" />
                    </p>
            </p>
            <p>
                <asp:Button ID="btnSubmit" runat="server" Text="Send" OnClick="btnSubmit_Click" ValidationGroup="save" />
            </p>
        </asp:Panel>
        <p>
            <asp:Label ID="DisplayMessage" runat="server" Visible="false" />
        </p>
    </div>
</asp:Content>
