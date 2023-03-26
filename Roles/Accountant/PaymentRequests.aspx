<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PaymentRequests.aspx.cs" Inherits="Group_3_MNSS_Payroll_System.Accountant.PaymentRequests" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2>View Employee Payment Requests</h2>
    <asp:SqlDataSource ID="RequestData" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
        SelectCommand="SELECT PaymentRequest.* FROM PaymentRequest" UpdateCommand="UPDATE PaymentRequest SET Status = @status WHERE (Id = @id)">
        <UpdateParameters>
            <asp:Parameter Name="status" />
            <asp:Parameter Name="id" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:ListView ID="RequestList" runat="server" DataKeyNames="Id,PayRequestID" DataSourceID="RequestData"
        OnSelectedIndexChanged="Viewing">
        <EditItemTemplate>
            <li style="background-color: #AFE1AF;color: #000000;">Id:
                <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                <br />
                PayRequestID:
                <asp:Label ID="PayRequestIDLabel1" runat="server" Text='<%# Eval("PayRequestID") %>' />
                <br />
                FirstName:
                <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' ReadOnly="True" BackColor="#CCCCCC"/>
                <br />
                LastName:
                <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' ReadOnly="True" BackColor="#CCCCCC"/>
                <br />
                Date:
                <asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("Date") %>' ReadOnly="True" BackColor="#CCCCCC"/>
                <br />
                Amount:
                <asp:TextBox ID="AmountTextBox" runat="server" Text='<%# Bind("Amount") %>' ReadOnly="True" BackColor="#CCCCCC"/>
                <br />
                Reason:
                <asp:TextBox ID="ReasonTextBox" runat="server" Text='<%# Bind("Reason") %>' ReadOnly="True" BackColor="#CCCCCC"/>
                <br />
                Status:
                <asp:TextBox ID="StatusTextBox" runat="server" Text='<%# Bind("Status") %>' />

                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ErrorMessage="*Must either enter Completed or Rejected" 
                    ValidationExpression="^(Completed|Rejected|Pending)$" 
                    ControlToValidate="StatusTextBox" 
                    Display="Dynamic"></asp:RegularExpressionValidator>
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
            </li>
        </EditItemTemplate>
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
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Response" />
                &nbsp;
                <asp:Button ID="SelectButton" runat="server" CommandName="Select" Text="Calculate Salary"  />
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
        <SelectedItemTemplate>
            <li style="background-color: #AFE1AF;font-weight: bold;color: #000000;">Id:
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
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                <br />
                <asp:Button ID="SelectButton" runat="server" CommandName="Select" Text="Select" />
            </li>
        </SelectedItemTemplate>
    </asp:ListView>
</asp:Content>
