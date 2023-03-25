<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PaymentRequest.aspx.cs" Inherits="Group_3_MNSS_Payroll_System.Employee.PaymentRequest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Payment Request Application</h2>

    <table>
        <thead>
            <tr>
                <td>Id:</td>
                <td>First Name:</td>
                <td>Last Name:</td>
                <td>Date:</td>
                <td>Amount:</td>
            </tr>
        </thead>
        <tr>
            <td>
                <asp:TextBox ID="ID" runat="server" Width="30px" ReadOnly="true" BackColor="Gray"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="FN" runat="server" Width="100px" ReadOnly="true" BackColor="Gray"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="LN" runat="server" Width="100px" ReadOnly="true" BackColor="Gray"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="Date" runat="server" TextMode="Date"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="Amount" runat="server" Width="120px" TextMode="Number"></asp:TextBox>
            </td>
        </tr>
    </table>

    <br />
    <table>
        <thead>
            <tr>
                <td>Reason for Request:</td>
            </tr>
        </thead>
        <tr>
            <td>
                <asp:TextBox ID="Reason" runat="server" TextMode="MultiLine" Rows="5" 
                    Columns="60"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Submit" runat="server" Text="Submit Application" />
            </td>
        </tr>
    </table>
    <hr />

    <h2>View Salary Information</h2>
</asp:Content>
