<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="BookingPage2.aspx.cs" Inherits="BookingPage2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2>
        Please Enter Your Information:</h2>
    <div style="text-align: left; margin-left: 20px;">
        <br />
        <table class="style1">
            <tr>
                <td width="75px">
                    <asp:Label ID="lblFName" runat="server" Text="First Name: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtFName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvFName" runat="server" ErrorMessage="First name is required"
                        ValidationGroup="vGroupBasicInfo" ControlToValidate="txtFName">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:Label ID="lblLName" runat="server" Text="Last Name:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtLName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvLName" runat="server" ErrorMessage="Last name is required"
                        ValidationGroup="vGroupBasicInfo" ControlToValidate="txtLName">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="margin-left: 40px">
                    <asp:Label ID="lblEmail" runat="server" Text="Email: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email Address is required"
                        ValidationGroup="vGroupBasicInfo" ControlToValidate="txtEmail" Display="Dynamic">*</asp:RequiredFieldValidator>

                    <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                        ControlToValidate="txtEmail" ValidationGroup="vGroupBasicInfo" ErrorMessage="Invalid email address" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic">*</asp:RegularExpressionValidator>

                </td>
                <td width="120px">
                    <asp:Label ID="lblEmailC" runat="server" Text="Confirm Email: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEmailC" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmailC" runat="server" ErrorMessage="Must Confirm Email Address"
                        ControlToValidate="txtEmailC" Display="Dynamic" ValidationGroup="vGroupBasicInfo">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvEmailC" runat="server" ErrorMessage="Email Addresses must be same"
                        ControlToCompare="txtEmail" ControlToValidate="txtEmailC" Display="Dynamic" ValidationGroup="vGroupBasicInfo">*</asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPhone" runat="server" Text="Phone No: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPhoneNo" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPhoneNo" runat="server" ErrorMessage="Phone Number is required"
                        ValidationGroup="vGroupBasicInfo" ControlToValidate="txtPhoneNo">*</asp:RequiredFieldValidator>

                    <asp:RegularExpressionValidator ID="revPhoneNo" runat="server" 
                        ErrorMessage="Invalid Phone Number" ValidationGroup="vGroupBasicInfo" 
                        ControlToValidate="txtPhoneNo" Display="Dynamic" 
                        ValidationExpression="0\d{1,3}-\d{5,7}">*
                    </asp:RegularExpressionValidator>
                </td>
                <td>
                    <asp:Label ID="lblGender" runat="server" Text="Gender: "></asp:Label>
                </td>
                <td>
                    <asp:RadioButtonList ID="rdoListGender" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True">Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td width="100px">
                    <asp:Label ID="lblAddress" runat="server" Text="Address: "></asp:Label>
                </td>
                <td width="275px">
                    <asp:TextBox ID="txtAddress" TextMode="MultiLine" Rows="3" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ErrorMessage="Address field is required"
                        ValidationGroup="vGroupBasicInfo" ControlToValidate="txtAddress">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    Date:</td>
                <td>
                    <asp:DropDownList ID="ddlDate" runat="server" OnInit="DropDownDate_Init">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvDate" runat="server" 
                        ControlToValidate="ddlDate" ErrorMessage="Date Required" 
                        ValidationGroup="vGroupBasicInfo">*</asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
    </div>
    <h4>
        Credit Card Info:
    </h4>
    <div style="text-align: left; margin-left: 20px;">
        <table class="style1">
            <tr>
                <td width="100">
                    <asp:Label ID="lblCardType" runat="server" Text="Card Type: "></asp:Label>
                </td>
                <td width="275">
                    <asp:DropDownList ID="ddlCardType" runat="server" OnInit="DropDownList1_Init">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvCardType" runat="server" 
                        ControlToValidate="ddlCardType" ErrorMessage="Card Type is required" 
                        InitialValue="CARD TYPE" ValidationGroup="vGroupBasicInfo">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:Label ID="lblCVV" runat="server" Text="CVV: " Width="50px"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtCVV" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCVV" runat="server" ErrorMessage="CVV field is required"
                        ValidationGroup="vGroupBasicInfo" ControlToValidate="txtCVV" Display="Dynamic">*</asp:RequiredFieldValidator>

                    <asp:RangeValidator ID="rvCVV" runat="server" ErrorMessage="CVV value out of range"
                       ValidationGroup="vGroupBasicInfo" ControlToValidate="txtCVV" MinimumValue="100"
                        MaximumValue="9999" Type="Integer">*</asp:RangeValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="lblCardNo" runat="server" Text="Card Number: "></asp:Label>
                </td>
                <td class="style2">
                    <asp:TextBox ID="txtCardNo" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCardNo" runat="server" Display="Dynamic" ErrorMessage="Card Number is required"
                        ValidationGroup="vGroupBasicInfo" ControlToValidate="txtCardNo">*</asp:RequiredFieldValidator>
                        
                    <asp:RegularExpressionValidator ID="revCardNo" ValidationGroup="vGroupBasicInfo"
                        runat="server" ErrorMessage="Must be a number" Display="Dynamic" ControlToValidate="txtCardNo"
                        ValidationExpression="^[0-9]+$">*</asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="cvNumLegnth" runat="server" Display="Dynamic" ValidationGroup="vGroupBasicInfo"
                        ErrorMessage="Card Number cannot be greater than 16 digits long" 
                        onservervalidate="cvNumLegnth_ServerValidate">*</asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
    <p>
        <asp:CustomValidator ID="csvTermsBox" runat="server" ErrorMessage="Box must be checked"
            OnServerValidate="CustomValidator1_ServerValidate" ValidationGroup="vGroupBasicInfo">*</asp:CustomValidator>
        <asp:CheckBox ID="chkBxTerms" runat="server" Text="By checking this check box you are agreeing to the TVI Cinema's terms and conditions" />
        &nbsp;&nbsp;&nbsp;
    </p>
    <p>
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
            ValidationGroup="vGroupBasicInfo" onclick="btnSubmit_Click" />
    </p>

    <asp:ValidationSummary ID="vsBookingPage2" ValidationGroup="vGroupBasicInfo" 
        runat="server" DisplayMode="List" ForeColor="Red" />
</asp:Content>
