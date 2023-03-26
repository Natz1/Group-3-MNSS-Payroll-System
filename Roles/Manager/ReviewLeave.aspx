<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReviewLeave.aspx.cs" Inherits="Group_3_MNSS_Payroll_System.Permissions.Manager.ReviewLeave" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!--Allows manager to review employee's requests to take leave-->
    <h2>Review Leave Requests</h2>

    <asp:SqlDataSource ID="LeaveData" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT LeaveRequest.* FROM LeaveRequest" 
        UpdateCommand="UPDATE LeaveRequest SET Response = @response WHERE (Id = @id)">
        <UpdateParameters>
            <asp:Parameter Name="response" />
            <asp:Parameter Name="id" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:ListView ID="LeaveList" runat="server" DataKeyNames="Id,LeaveRequestID" DataSourceID="LeaveData" PageSize="3">
        <EditItemTemplate>
            <li style="background-color: #AFE1AF;color: #000000;">Id:
                <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>'/>
                <br />
                LeaveRequestID:
                <asp:Label ID="LeaveRequestIDLabel1" runat="server" Text='<%# Eval("LeaveRequestID") %>'/>
                <br />
                FirstName:
                <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' ReadOnly="True" BackColor="#CCCCCC"/>
                <br />
                LastName:
                <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' ReadOnly="True" BackColor="#CCCCCC"/>
                <br />
                Type:
                <asp:TextBox ID="TypeTextBox" runat="server" Text='<%# Bind("Type") %>' ReadOnly="True" BackColor="#CCCCCC"/>
                <br />
                Reason:
                <br />
                <asp:TextBox ID="ReasonTextBox" runat="server" Text='<%# Bind("Reason") %>' 
                    Rows="5" Columns="50" TextMode="MultiLine" ReadOnly="True" BackColor="#CCCCCC"/>
                <br />
                LeaveDate:
                <asp:TextBox ID="LeaveDateTextBox" runat="server" Text='<%# Bind("LeaveDate") %>' ReadOnly="True" BackColor="#CCCCCC"/>
                <br />
                ReturnDate:
                <asp:TextBox ID="ReturnDateTextBox" runat="server" Text='<%# Bind("ReturnDate") %>' ReadOnly="True" BackColor="#CCCCCC"/>
                <br />
                Response (Approved/Rejected):
                <asp:TextBox ID="ResponseTextBox" runat="server" Text='<%# Bind("Response") %>' />

                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ErrorMessage="*Must either enter Approved or Rejected" 
                    ValidationExpression="^(Approved|Rejected|Pending)$" 
                    ControlToValidate="ResponseTextBox" 
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
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
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
</asp:Content>
