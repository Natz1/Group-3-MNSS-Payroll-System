<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddEmployee.aspx.cs" Inherits="Group_3_MNSS_Payroll_System.Permissions.Manager.AddEmployee" %>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Employee]"></asp:SqlDataSource>
    <!--GridView of data-->
    <asp:GridView ID="GridView1" DataSourceID="SqlDataSource1"  runat="server" 
        CssClass="gridcss" AllowPaging="True" PageSize="5" AutoGenerateColumns="False" DataKeyNames="Id" >
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
            <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
            <asp:BoundField DataField="JobTitle" HeaderText="JobTitle" SortExpression="JobTitle" />
            <asp:BoundField DataField="Salary" HeaderText="Salary" SortExpression="Salary" />
        </Columns>
        <HeaderStyle CssClass="header"></HeaderStyle>
        <RowStyle CssClass="rows"></RowStyle>
    </asp:GridView>
</asp:Content>
