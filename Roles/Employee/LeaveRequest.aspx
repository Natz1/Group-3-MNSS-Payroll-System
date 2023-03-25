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
    <asp:SqlDataSource ID="LeaveData" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO LeaveRequest(Id, FirstName, LastName, Type, Reason, LeaveDate, ReturnDate, Response) VALUES (@id, @firstname, @lastname, @type, @reason, @leavedate, @returndate, @response)" SelectCommand="SELECT LeaveRequest.* FROM LeaveRequest INNER JOIN LeaveRequest AS LeaveRequest_1 ON LeaveRequest.Id = LeaveRequest_1.Id">
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


    <h2>View Past Leave Requests</h2>
    <asp:ListView ID="LeaveList" runat="server" DataSourceID="LeaveData">
        <AlternatingItemTemplate>
            <li style="background-color: #FAFAD2;color: #284775;">Id:
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
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <li style="background-color: #AFE1AF;color: #000000;">Id:
                <asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>' />
                <br />
                LeaveRequestID:
                <asp:Label ID="LeaveRequestIDLabel1" runat="server" Text='<%# Eval("LeaveRequestID") %>' />
                <br />
                FirstName:
                <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' />
                <br />
                LastName:
                <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' />
                <br />
                Type:
                <asp:TextBox ID="TypeTextBox" runat="server" Text='<%# Bind("Type") %>' />
                <br />
                Reason:
                <asp:TextBox ID="ReasonTextBox" runat="server" Text='<%# Bind("Reason") %>' />
                <br />
                LeaveDate:
                <asp:TextBox ID="LeaveDateTextBox" runat="server" Text='<%# Bind("LeaveDate") %>' />
                <br />
                ReturnDate:
                <asp:TextBox ID="ReturnDateTextBox" runat="server" Text='<%# Bind("ReturnDate") %>' />
                <br />
                Response:
                <asp:TextBox ID="ResponseTextBox" runat="server" Text='<%# Bind("Response") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
            </li>
        </EditItemTemplate>
        <EmptyDataTemplate>
            No data was returned.
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <li style="">Id:
                <asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>' />
                <br />FirstName:
                <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' />
                <br />LastName:
                <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' />
                <br />Type:
                <asp:TextBox ID="TypeTextBox" runat="server" Text='<%# Bind("Type") %>' />
                <br />Reason:
                <asp:TextBox ID="ReasonTextBox" runat="server" Text='<%# Bind("Reason") %>' />
                <br />LeaveDate:
                <asp:TextBox ID="LeaveDateTextBox" runat="server" Text='<%# Bind("LeaveDate") %>' />
                <br />ReturnDate:
                <asp:TextBox ID="ReturnDateTextBox" runat="server" Text='<%# Bind("ReturnDate") %>' />
                <br />Response:
                <asp:TextBox ID="ResponseTextBox" runat="server" Text='<%# Bind("Response") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
            </li>
        </InsertItemTemplate>
        <ItemSeparatorTemplate>
<br />
        </ItemSeparatorTemplate>
        <ItemTemplate>
            <li style="background-color: #AFE1AF;color: #333333;">Id:
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
            <div style="text-align: center;background-color: #AFE1AF;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                <asp:DataPager ID="DataPager1" runat="server">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <li style="background-color: #FFCC66;font-weight: bold;color: #000080;">Id:
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
        </SelectedItemTemplate>
    </asp:ListView>
</asp:Content>
