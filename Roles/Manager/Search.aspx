<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="Group_3_MNSS_Payroll_System.Permissions.Manager.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Locate Employee Record</h2>
    <table>
        <thead style="background-color:#184F07;color:#fff">
            <tr>
                <td>Employee's First Name:</td>
                <td>Employee's Last Name:</td>
                <td></td>
            </tr>
        </thead>
        <tr style="background-color:#60A649;color:#fff">
            <td>
                <asp:TextBox ID="FN" runat="server"></asp:TextBox>
            </td>
             <td>
                <asp:TextBox ID="LN" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="Search1" runat="server" Text="Search" ValidationGroup="Val1"/>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td> <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                    runat="server" ErrorMessage="*First name is required." ValidationGroup="Val1" 
                    ControlToValidate="FN"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                    runat="server" ErrorMessage="*Last name is required." ValidationGroup="Val1" 
                    ControlToValidate="LN"></asp:RequiredFieldValidator></td>            
        </tr>
    </table>
    <br />


    <asp:SqlDataSource ID="EmpData" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Employee] WHERE (([FirstName] = @FirstName) AND ([LastName] = @LastName))">
        <SelectParameters>
            <asp:ControlParameter ControlID="FN" Name="FirstName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="LN" Name="LastName" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="EmpList" runat="server" Width="1000px" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" 
        DataSourceID="EmpData" OnSelectedIndexChanged="Viewing">
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
            <asp:CommandField ShowSelectButton="True" ItemStyle-ForeColor="#184F07" SelectText="View Employee" />
        </Columns>
        <HeaderStyle CssClass="header"></HeaderStyle>
        <RowStyle CssClass="rows"></RowStyle>
    </asp:GridView>

    
</asp:Content>
