<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeeDisplay.aspx.cs" Inherits="Group_3_MNSS_Payroll_System.Roles.Manager.EmployeeDisplay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!--Allows manager to view all details on file about the employee-->
    <h2>View Employee Record</h2>
    <asp:SqlDataSource ID="RecData" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Employee.* FROM Employee Where ID = @id">
        <SelectParameters>
            <asp:QueryStringParameter Name="id" QueryStringField="id" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:ListView ID="RecList" runat="server" DataSourceID="RecData" DataKeyNames="Id">
        <AlternatingItemTemplate>
            <li style="background-color: #FFF8DC;">Id:
                <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                <br />
                FirstName:
                <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' />
                <br />
                LastName:
                <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                <br />
                DOB:
                <asp:Label ID="DOBLabel" runat="server" Text='<%# Eval("DOB") %>' />
                <br />
                Address:
                <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                <br />
                Email:
                <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                <br />
                Phone:
                <asp:Label ID="PhoneLabel" runat="server" Text='<%# Eval("Phone") %>' />
                <br />
                JobTitle:
                <asp:Label ID="JobTitleLabel" runat="server" Text='<%# Eval("JobTitle") %>' />
                <br />
                Salary:
                <asp:Label ID="SalaryLabel" runat="server" Text='<%# Eval("Salary") %>' />
                <br />
            </li>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <li style="background-color: #AFE1AF;color: #000000;">Id:
                <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                <br />
                FirstName:
                <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' />
                <br />
                LastName:
                <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' />
                <br />
                DOB:
                <asp:TextBox ID="DOBTextBox" runat="server" Text='<%# Bind("DOB") %>' />
                <br />
                Address:
                <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
                <br />
                Email:
                <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                <br />
                Phone:
                <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
                <br />
                JobTitle:
                <asp:TextBox ID="JobTitleTextBox" runat="server" Text='<%# Bind("JobTitle") %>' />
                <br />
                Salary:
                <asp:TextBox ID="SalaryTextBox" runat="server" Text='<%# Bind("Salary") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
            </li>
        </EditItemTemplate>
        <EmptyDataTemplate>
            No data was returned.
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <li style="">FirstName:
                <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' />
                <br />LastName:
                <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' />
                <br />DOB:
                <asp:TextBox ID="DOBTextBox" runat="server" Text='<%# Bind("DOB") %>' />
                <br />Address:
                <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
                <br />Email:
                <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                <br />Phone:
                <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
                <br />JobTitle:
                <asp:TextBox ID="JobTitleTextBox" runat="server" Text='<%# Bind("JobTitle") %>' />
                <br />Salary:
                <asp:TextBox ID="SalaryTextBox" runat="server" Text='<%# Bind("Salary") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
            </li>
        </InsertItemTemplate>
        <ItemSeparatorTemplate>
<br />
        </ItemSeparatorTemplate>
        <ItemTemplate>
            <li style="background-color: #AFE1AF;color: #000000;">Id:
                <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                <br />
                FirstName:
                <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' />
                <br />
                LastName:
                <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                <br />
                DOB:
                <asp:Label ID="DOBLabel" runat="server" Text='<%# Eval("DOB") %>' />
                <br />
                Address:
                <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                <br />
                Email:
                <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                <br />
                Phone:
                <asp:Label ID="PhoneLabel" runat="server" Text='<%# Eval("Phone") %>' />
                <br />
                JobTitle:
                <asp:Label ID="JobTitleLabel" runat="server" Text='<%# Eval("JobTitle") %>' />
                <br />
                Salary:
                <asp:Label ID="SalaryLabel" runat="server" Text='<%# Eval("Salary") %>' />
                <br />
            </li>
        </ItemTemplate>
        <LayoutTemplate>
            <ul id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                <li runat="server" id="itemPlaceholder" />
            </ul>
            <div style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <li style="background-color: #008A8C;font-weight: bold;color: #FFFFFF;">Id:
                <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                <br />
                FirstName:
                <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' />
                <br />
                LastName:
                <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                <br />
                DOB:
                <asp:Label ID="DOBLabel" runat="server" Text='<%# Eval("DOB") %>' />
                <br />
                Address:
                <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                <br />
                Email:
                <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                <br />
                Phone:
                <asp:Label ID="PhoneLabel" runat="server" Text='<%# Eval("Phone") %>' />
                <br />
                JobTitle:
                <asp:Label ID="JobTitleLabel" runat="server" Text='<%# Eval("JobTitle") %>' />
                <br />
                Salary:
                <asp:Label ID="SalaryLabel" runat="server" Text='<%# Eval("Salary") %>' />
                <br />
            </li>
        </SelectedItemTemplate>
    </asp:ListView>
    <hr />










    <h2>View Employee Performance</h2>
    <h3>Daily Performance</h3>
    <asp:SqlDataSource ID="DailyData" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [DailyHours] WHERE ([Id] = @Id)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="Id" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="DailyList" runat="server" PageSize="5" AllowPaging="True" DataSourceID="DailyData" AutoGenerateColumns="False" DataKeyNames="Id,DailyLogId">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="DailyLogId" HeaderText="DailyLogId" InsertVisible="False" ReadOnly="True" SortExpression="DailyLogId" />
            <asp:BoundField DataField="ClockInDate" HeaderText="ClockInDate" SortExpression="ClockInDate" />
            <asp:BoundField DataField="ClockOutDate" HeaderText="ClockOutDate" SortExpression="ClockOutDate" />
            <asp:BoundField DataField="HoursWorked" HeaderText="HoursWorked" SortExpression="HoursWorked" />
            <asp:BoundField DataField="DailyActivities" HeaderText="DailyActivities" SortExpression="DailyActivities" />
        </Columns>
        <HeaderStyle CssClass="header"></HeaderStyle>
        <EmptyDataTemplate>No data available.</EmptyDataTemplate>
        <RowStyle CssClass="rows"></RowStyle>
    </asp:GridView>
    <hr />





    <h3>Monthly Hours Worked</h3>
    <asp:SqlDataSource ID="PerfData" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="MonthlyWork" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="id" QueryStringField="id" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="PerfList" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id,MonthlyLogId" DataSourceID="PerfData">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="MonthlyLogId" HeaderText="MonthlyLogId" InsertVisible="False" ReadOnly="True" SortExpression="MonthlyLogId" />
            <asp:BoundField DataField="CurrentMonth" HeaderText="CurrentMonth" SortExpression="CurrentMonth" />
            <asp:BoundField DataField="CurrentYear" HeaderText="CurrentYear" SortExpression="CurrentYear" />
            <asp:BoundField DataField="MonthlyHoursWorked" HeaderText="MonthlyHoursWorked" SortExpression="MonthlyHoursWorked" />
        </Columns>
        <HeaderStyle CssClass="header"></HeaderStyle>
        <EmptyDataTemplate>No data available.</EmptyDataTemplate>
        <RowStyle CssClass="rows"></RowStyle>
    </asp:GridView>

</asp:Content>
