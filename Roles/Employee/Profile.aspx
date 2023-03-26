<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Group_3_MNSS_Payroll_System.Employee.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2>View Employee Profile</h2>

    <asp:SqlDataSource ID="EmpData" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Employee] WHERE ([Email] = @Email)" UpdateCommand="UPDATE Employee SET Address = @address, Phone = @phone WHERE (Id = @id)">
        <SelectParameters>
            <asp:SessionParameter Name="Email" SessionField="email" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="address" />
            <asp:Parameter Name="phone" />
            <asp:Parameter Name="id" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:ListView ID="EmpList" runat="server" DataKeyNames="Id" 
        DataSourceID="EmpData" EnableEdit="true" InsertItemPosition="None" PageSize="1">
        <EditItemTemplate>
            <li style="background-color: #AFE1AF;color: #000000;">Id:
                <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                <br />
                FirstName:
                <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' ReadOnly="True" BackColor="#CCCCCC" />
                <br />
                LastName:
                <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' ReadOnly="True" BackColor="#CCCCCC"/>
                <br />
                DOB:
                <asp:TextBox ID="DOBTextBox" runat="server" Text='<%# Bind("DOB") %>' ReadOnly="True" BackColor="#CCCCCC"/>
                <br />
                Address:
                <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
                <br />
                Email:
                <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' ReadOnly="True" BackColor="#CCCCCC"/>
                <br />
                Phone:
                <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' TextMode="Number" />
                <br />
                JobTitle:
                <asp:TextBox ID="JobTitleTextBox" runat="server" Text='<%# Bind("JobTitle") %>' ReadOnly="True" BackColor="#CCCCCC"/>
                <br />
                Salary:
                <asp:TextBox ID="SalaryTextBox" runat="server" Text='<%# Bind("Salary") %>' ReadOnly="True" BackColor="#CCCCCC" />
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
            <li style="background-color: #AFE1AF;color: #333333;">Id:
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
                <asp:Button runat="server" Text="Edit" CommandName="Edit" CommandArgument="<%# Container.DataItemIndex %>" />
                <br />
            </li>
        </ItemTemplate>
        <LayoutTemplate>
            <ul id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                <li runat="server" id="itemPlaceholder" />
            </ul>
            <div style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
            </div>
        </LayoutTemplate>
    </asp:ListView>



</asp:Content>
