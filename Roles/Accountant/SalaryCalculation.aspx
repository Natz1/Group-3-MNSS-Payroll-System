<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SalaryCalculation.aspx.cs" Inherits="Group_3_MNSS_Payroll_System.Roles.Accountant.SalaryCalculation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    



    <h2>Calculate Employee Salary</h2>
    <h3>Calculate Tax Deductions</h3>
    <table>
        <thead>
            <tr>
                <td>Tax Rate</td>
                <td></td>
                <td>Request Amount</td>
                <td></td>
                <td>Tax Deduction</td>
            </tr>
        </thead>
        <tr>
            <td>
                <asp:TextBox ID="rate1" runat="server" TextMode="Number"></asp:TextBox>
            </td>
            <td> * </td>
            <td>
                <asp:TextBox ID="amount1" runat="server" TextMode="Number"></asp:TextBox>
            </td>
            <td> = </td>
            <td>
                <asp:TextBox ID="deduction1" runat="server" TextMode="Number"></asp:TextBox>
            </td>
        </tr>
    </table>
    <hr />




    <h3>Calculate Bonuses (if applicable)</h3>
    <h4>Will employee receive a bonus?</h4>
    <asp:DropDownList ID="BonusStatus" runat="server">
        <asp:ListItem>Approved</asp:ListItem>
        <asp:ListItem>Rejected</asp:ListItem>
    </asp:DropDownList>

    <br />
    <br />
    <table>
        <thead>
            <tr>
                <td>Bonus Percentage</td>
                <td></td>
                <td>Request Amount</td>
                <td></td>
                <td>Bonus</td>
            </tr>
        </thead>
        <tr>
            <td>
                <asp:TextBox ID="percent2" runat="server" TextMode="Number"></asp:TextBox>
            </td>
            <td> * </td>
            <td>
                <asp:TextBox ID="amount2" runat="server" TextMode="Number"></asp:TextBox>
            </td>
            <td> = </td>
            <td>
                <asp:TextBox ID="bonus2" runat="server" TextMode="Number"></asp:TextBox>
            </td>
        </tr>
    </table>
    <hr />






    <h3>Calculate Final Salary Amount</h3>
    <table>
        <thead>
            <tr>
                <td>Request Amount</td>
                <td></td>
                <td>Tax Deduction</td>
                <td></td>
                <td>Bonus</td>
                <td></td>
                <td>Final Salary</td>
            </tr>
        </thead>
        <tr>
            <td>
                <asp:TextBox ID="amount3" runat="server" TextMode="Number"></asp:TextBox>
            </td>
            <td> - </td>
            <td>
                <asp:TextBox ID="deduction3" runat="server" TextMode="Number"></asp:TextBox>
            </td>
            <td> + </td>
            <td>
                <asp:TextBox ID="bonus3" runat="server" TextMode="Number"></asp:TextBox>
            </td>
            <td> = </td>
            <td>
                <asp:TextBox ID="final3" runat="server" TextMode="Number"></asp:TextBox>
            </td>
        </tr>
    </table>
    <hr />
</asp:Content>
