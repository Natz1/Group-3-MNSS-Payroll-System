<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LeaveRequest.aspx.cs" Inherits="Group_3_MNSS_Payroll_System.Employee.LeaveRequest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Leave Request Form</h2>

    <!--Leave Request form-->
    <table>
        <tr>
            <td><asp:Label ID="Type" runat="server" Text="Type of Leave: "></asp:Label></td>
            <td><asp:TextBox ID="Type1" runat="server" MaxLength="50"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="Reason" runat="server" Text="Reason for Leave: "></asp:Label></td>
            <td><asp:TextBox ID="Reason1" runat="server" TextMode="MultiLine" Rows="5" Columns="50" MaxLength="1000"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="LeaveDate" runat="server" Text="Date of Leave: "></asp:Label></td>
            <td><asp:TextBox ID="LeaveDate1" runat="server" TextMode="Date" Width="203"></asp:TextBox></td>
             <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="ReturnDate" runat="server" Text="Date of Return: "></asp:Label></td>
            <td><asp:TextBox ID="ReturnDate1" runat="server" TextMode="Date" Width="203"></asp:TextBox></td>
        </tr>
        <tr>
           
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td><asp:Label ID="Response" runat="server" Text="Manager's Response: "></asp:Label></td>
            <td><asp:TextBox ID="Response1" runat="server" ReadOnly="true" BackColor="Gray"></asp:TextBox></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td align="right">
                <asp:Button ID="Submit" runat="server" Text="Submit Application" />
            </td>
        </tr>
    </table>

    <!--Print result message-->
    <asp:Label ID="Result" runat="server" Text=""></asp:Label>
</asp:Content>
