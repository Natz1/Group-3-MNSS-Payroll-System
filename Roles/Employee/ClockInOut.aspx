<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClockInOut.aspx.cs" Inherits="Group_3_MNSS_Payroll_System.Employee.ClockInOut" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <!--Allows the user to clock in and out for the day-->
    <h2>Clock In and Out</h2>
    <h3>Clock in</h3>
    <h4>Clock in for the day?</h4>
    <table>
        <thead>
            <tr>
                <td>ID: </td>
                <td>Clock in date/time: </td>
            </tr>
        </thead>
        <tr>
            <td>
                <asp:TextBox ID="ID" runat="server" ReadOnly="True" BackColor="#CCCCCC"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="ClockIn" runat="server" ReadOnly="True" BackColor="#CCCCCC"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="InButton" runat="server" Text="Clock In" />
            </td>
        </tr>
    </table>
    <br />
    <hr />

    <h3>Clock out</h3>
    <h4>Clock out for the day?</h4>
    <!--Ensure that employee has clocked in first before they can clock out for the day-->
    <table>
        <thead>
            <tr>
                <td>ID: </td>
                <td>Clock out date/time: </td>
                
            </tr>
        </thead>
        <tr>
            <td>
                <asp:TextBox ID="ID1" runat="server" ReadOnly="True" BackColor="#CCCCCC"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="ClockOut" runat="server" ReadOnly="True" BackColor="#CCCCCC"></asp:TextBox>
            </td>
        </tr>
    </table>
    <br />

    <table>
        <thead>
            <tr>
                <td>Daily activities performed: </td>
                
            </tr>
        </thead>
        <tr>
            <td>
                <asp:TextBox ID="Activities" runat="server" TextMode="MultiLine" 
                    Rows="5" Columns="50"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="OutButton" runat="server" Text="Clock Out" />
            </td>
        </tr>
    </table>
    <br />
    <br />
</asp:Content>
