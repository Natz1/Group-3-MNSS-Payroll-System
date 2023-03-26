<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReviewPayroll.aspx.cs" Inherits="Group_3_MNSS_Payroll_System.Permissions.Manager.ReviewPayroll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2>View All Employee Payroll Transactions</h2>
    <asp:SqlDataSource ID="PayrollData" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [PaymentTransaction]"></asp:SqlDataSource>
    <asp:GridView ID="PayrollList" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id,PayRequestID,TransactionDate" DataSourceID="PayrollData"
        Width="1000px">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="PayRequestID" HeaderText="PayRequestID" ReadOnly="True" SortExpression="PayRequestID" />
            <asp:BoundField DataField="TransactionDate" HeaderText="TransactionDate" ReadOnly="True" SortExpression="TransactionDate" />
            <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
            <asp:BoundField DataField="TaxRate" HeaderText="TaxRate" SortExpression="TaxRate" />
            <asp:BoundField DataField="TaxDeduction" HeaderText="TaxDeduction" SortExpression="TaxDeduction" />
            <asp:BoundField DataField="BonusPercentage" HeaderText="BonusPercentage" SortExpression="BonusPercentage" />
            <asp:BoundField DataField="Bonus" HeaderText="Bonus" SortExpression="Bonus" />
            <asp:BoundField DataField="FinalSalary" HeaderText="FinalSalary" SortExpression="FinalSalary" />
        </Columns>
        <EmptyDataTemplate>No data available for display.</EmptyDataTemplate>
        <HeaderStyle CssClass="header"></HeaderStyle>
        <RowStyle CssClass="rows"></RowStyle>
    </asp:GridView>
</asp:Content>
