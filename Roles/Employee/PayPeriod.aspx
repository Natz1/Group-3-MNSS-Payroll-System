﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PayPeriod.aspx.cs" Inherits="Group_3_MNSS_Payroll_System.Employee.PayPeriod" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2>View Pay Period Information</h2>
    <!--Gets pay period data from database-->
    <asp:SqlDataSource ID="GenerateData" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
        SelectCommand="SELECT TOP 1 PayPeriodId, Type, PayDate FROM PayPeriod ORDER BY PayPeriodId DESC"></asp:SqlDataSource>



    <asp:GridView ID="GenerateList" Width="1000px" Height="200px" runat="server" AutoGenerateColumns="False" DataKeyNames="PayPeriodId" DataSourceID="GenerateData">
        <Columns>
            <asp:BoundField DataField="PayPeriodId" HeaderText="PayPeriodId" InsertVisible="False" ReadOnly="True" SortExpression="PayPeriodId" />
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
            <asp:BoundField DataField="PayDate" HeaderText="PayDate" SortExpression="PayDate" />
        </Columns>
        <EmptyDataTemplate>No data available for display.</EmptyDataTemplate>
        <HeaderStyle CssClass="header"></HeaderStyle>
        <RowStyle CssClass="rows"></RowStyle>
    </asp:GridView>
</asp:Content>
