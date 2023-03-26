<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LeaveRequest.aspx.cs" Inherits="Group_3_MNSS_Payroll_System.Employee.LeaveRequest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Leave Request Form</h2>

    <!--Leave Request form-->
    <table>
        <tr>
            <td><asp:Label ID="ID" runat="server" Text="ID: "></asp:Label></td>
            <td><asp:TextBox ID="ID1" runat="server" MaxLength="50" ReadOnly="true" BackColor="Gray"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="FirstName" runat="server" Text="First Name: "></asp:Label></td>
            <td><asp:TextBox ID="FirstName1" runat="server" MaxLength="50" ReadOnly="true" BackColor="Gray"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="LastName" runat="server" Text="Last Name: "></asp:Label></td>
            <td><asp:TextBox ID="LastName1" runat="server" MaxLength="50" ReadOnly="true" BackColor="Gray"></asp:TextBox></td>
        </tr>
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
            <td></td>
            <td></td>
            <td><asp:Label ID="Responses" runat="server" Text="Manager's Response: "></asp:Label></td>
            <td><asp:TextBox ID="Responses1" runat="server" ReadOnly="true" BackColor="Gray"></asp:TextBox></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td align="right">
                <asp:Button ID="Submit" runat="server" Text="Submit Application" OnClick="Submit_Click" />
            </td>
        </tr>
    </table>

    <!--Connect form to database-->
    <asp:SqlDataSource ID="LeaveData" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO LeaveRequest(Id, FirstName, LastName, Type, Reason, LeaveDate, ReturnDate, Response) VALUES (@id, @firstname, @lastname, @type, @reason, @leavedate, @returndate, @response)" SelectCommand="SELECT LeaveRequest.* FROM LeaveRequest">
        <InsertParameters>
            <asp:ControlParameter Name="id" ControlID="ID1" />
            <asp:ControlParameter Name="firstname" ControlID="FirstName1" />
            <asp:ControlParameter Name="lastname" ControlID="LastName1" />
            <asp:ControlParameter Name="type" ControlID="Type1" />
            <asp:ControlParameter Name="reason" ControlID="Reason1" />
            <asp:ControlParameter Name="leavedate" ControlID="LeaveDate1" />
            <asp:ControlParameter Name="returndate" ControlID="ReturnDate1" />
            <asp:ControlParameter Name="response" ControlID="Responses1" />
        </InsertParameters>
    </asp:SqlDataSource>


    <!--Print result message-->
    <asp:Label ID="Result" runat="server" Text=""></asp:Label>



    <hr />
    <h2>View Past Leave Requests</h2>
    <asp:ListView ID="LeaveList" runat="server" DataKeyNames="Id,LeaveRequestID" DataSourceID="LeaveData" PageSize="2">
        <EmptyDataTemplate>
            No data was returned.
        </EmptyDataTemplate>
        <ItemSeparatorTemplate>
<br />
        </ItemSeparatorTemplate>
        <ItemTemplate>
            <li style="background-color: #AFE1AF;color: #000000;">Id:
                <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                <br />
                LeaveRequestID:
                <asp:Label ID="LeaveRequestIDLabel" runat="server" Text='<%# Eval("LeaveRequestID") %>' />
                <br />
                FirstName:
                <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' />
                <br />
                LastName:
                <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                <br />
                Type:
                <asp:Label ID="TypeLabel" runat="server" Text='<%# Eval("Type") %>' />
                <br />
                Reason:
                <asp:Label ID="ReasonLabel" runat="server" Text='<%# Eval("Reason") %>' />
                <br />
                LeaveDate:
                <asp:Label ID="LeaveDateLabel" runat="server" Text='<%# Eval("LeaveDate") %>' />
                <br />
                ReturnDate:
                <asp:Label ID="ReturnDateLabel" runat="server" Text='<%# Eval("ReturnDate") %>' />
                <br />
                Response:
                <asp:Label ID="ResponseLabel" runat="server" Text='<%# Eval("Response") %>' />
                <br />
            </li>
        </ItemTemplate>
        <LayoutTemplate>
            <ul id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                <li runat="server" id="itemPlaceholder" />
            </ul>
            <div style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                <asp:DataPager ID="DataPager1" runat="server">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>
    </asp:ListView>
</asp:Content>
