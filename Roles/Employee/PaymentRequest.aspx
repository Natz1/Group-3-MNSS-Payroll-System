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
                <asp:Button ID="Submit" runat="server" Text="Submit Application" OnClick="Submit_Click" />
            </td>
        </tr>
    </table>
    <hr />


    <h2>View Past Payment Requests</h2>
    <asp:SqlDataSource ID="RequestData" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO PaymentRequest(Id, FirstName, LastName, Date, Amount, Reason) VALUES (@id, @firstname, @lastname, @date, @amount, @reason)" SelectCommand="SELECT PaymentRequest.* FROM PaymentRequest Where Id = @id">
        <InsertParameters>
            <asp:ControlParameter ControlID="ID" Name="id" />
            <asp:ControlParameter ControlID="FN" Name="firstname" />
            <asp:ControlParameter ControlID="LN"  Name="lastname" />
            <asp:ControlParameter ControlID="Date"  Name="date" />
            <asp:ControlParameter ControlID="Amount"  Name="amount" />
            <asp:ControlParameter ControlID="Reason"  Name="reason" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="ID" Name="id" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:ListView ID="RequestList" runat="server" DataKeyNames="Id,PayRequestID" DataSourceID="RequestData" AllowPaging="true" PageSize="1">
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
                PayRequestID:
                <asp:Label ID="PayRequestIDLabel" runat="server" Text='<%# Eval("PayRequestID") %>' />
                <br />
                FirstName:
                <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' />
                <br />
                LastName:
                <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                <br />
                Date:
                <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
                <br />
                Amount:
                <asp:Label ID="AmountLabel" runat="server" Text='<%# Eval("Amount") %>' />
                <br />
                Reason:
                <asp:Label ID="ReasonLabel" runat="server" Text='<%# Eval("Reason") %>' />
                <br />
                Status:
                <asp:Label ID="StatusLabel" runat="server" Text='<%# Eval("Status") %>' />
                <br />
            </li>
        </ItemTemplate>
        <LayoutTemplate>
            <ul id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                <li runat="server" id="itemPlaceholder" />
            </ul>
            <div style="text-align: center;background-color: #AFE1AF;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                <asp:DataPager ID="DataPager1" runat="server">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>
    </asp:ListView>




    <hr />
    <h2>View Salary Information</h2>
</asp:Content>
