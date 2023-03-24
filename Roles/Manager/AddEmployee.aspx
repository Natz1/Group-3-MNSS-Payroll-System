﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddEmployee.aspx.cs" Inherits="Group_3_MNSS_Payroll_System.Permissions.Manager.AddEmployee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Add New Employee</h2>

    <!--Employee Information form-->
    <table>
        <tr>
            <td><asp:Label ID="FN" runat="server" Text="First Name: "></asp:Label></td>
            <td><asp:TextBox ID="FN1" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="LN" runat="server" Text="Last Name: "></asp:Label></td>
            <td><asp:TextBox ID="LN1" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="DB" runat="server" Text="DOB: "></asp:Label></td>
            <td><asp:TextBox ID="DB1" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="ADDR" runat="server" Text="Address: "></asp:Label></td>
            <td><asp:TextBox ID="ADDR1" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="EM" runat="server" Text="Email: "></asp:Label></td>
            <td><asp:TextBox ID="EM1" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="PHN" runat="server" Text="Phone: "></asp:Label></td>
            <td><asp:TextBox ID="PHN1" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="TITLE" runat="server" Text="Job Title: "></asp:Label></td>
            <td><asp:TextBox ID="TITLE1" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="SAL" runat="server" Text="Salary: "></asp:Label>
            <td><asp:TextBox ID="SAL1" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td></td>
            <td align="right">
                <asp:Button ID="Save" runat="server" Text="Save" OnClick="Save_Click" />
            </td>
        </tr>
    </table>

    <!--Print result message-->
    <asp:Label ID="Result" runat="server" Text=""></asp:Label>
    

    <!--Display employee record-->
    <br /><br />
    <!--Link sql database to gridview-->
    <asp:SqlDataSource ID="AddData" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Employee]" DeleteCommand="DELETE FROM Employee WHERE (Id = @id)" UpdateCommand="UPDATE Employee SET FirstName = @firstname, LastName = @lastname, DOB = @dob, Address = @address, Email = @email, Phone = @phone, JobTitle = @jobtitle, Salary = @salary WHERE (Id = @id)">
        <DeleteParameters>
            <asp:Parameter Name="id" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="firstname" />
            <asp:Parameter Name="lastname" />
            <asp:Parameter Name="dob" />
            <asp:Parameter Name="address" />
            <asp:Parameter Name="email" />
            <asp:Parameter Name="phone" />
            <asp:Parameter Name="jobtitle" />
            <asp:Parameter Name="salary" />
            <asp:Parameter Name="id" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <!--GridView of data-->
    <asp:GridView ID="AddList" DataSourceID="AddData"  runat="server" 
        CssClass="gridcss" AllowPaging="True" PageSize="20" AutoGenerateColumns="False" DataKeyNames="Id" 
         OnRowDeleting="RowDelete">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" ControlStyle-Width="80" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" ControlStyle-Width="80" />
            <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" ControlStyle-Width="70" />
            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" ControlStyle-Width="230" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" ControlStyle-Width="170" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" ControlStyle-Width="100" />
            <asp:BoundField DataField="JobTitle" HeaderText="JobTitle" SortExpression="JobTitle" ControlStyle-Width="100" />
            <asp:BoundField DataField="Salary" HeaderText="Salary" SortExpression="Salary" ControlStyle-Width="70" />
            <asp:CommandField ItemStyle-ForeColor="#184F07" ShowEditButton="True" ShowDeleteButton="True" />
        </Columns>
        <HeaderStyle CssClass="header"></HeaderStyle>
        <RowStyle CssClass="rows"></RowStyle>
    </asp:GridView>
</asp:Content>
