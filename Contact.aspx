<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Group_3_MNSS_Payroll_System.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>You can contact us here at:</h3>
    <address>
        152 Bridgeview Walkway,<br />
        Kingston 10,<br />
        Jamaica,<br />
    </address>

    <address>
        <strong>Support:</strong>   <a href="mailto:Support@example.com">Support@mnsspayroll.com</a><br />
        <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">Marketing@mnsspayroll.com</a>
    </address>
</asp:Content>
