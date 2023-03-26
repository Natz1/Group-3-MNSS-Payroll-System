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
                <asp:TextBox ID="rate1" runat="server" Text="0.0" ValidationGroup="Val1"></asp:TextBox>
            </td>
            <td> * </td>
            <td>
                <asp:TextBox ID="amount1" runat="server" ReadOnly="True"  BackColor="#CCCCCC" ></asp:TextBox>
            </td>
            <td> = </td>
            <td>
                <asp:TextBox ID="deduction1" runat="server" ReadOnly="True"  BackColor="#CCCCCC"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="CalDeduct" runat="server" Text="Calculate" ValidationGroup="Val1" OnClick="CalDeduct_Click" />
            </td>
        </tr>
    </table>
    <br />
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
    ControlToValidate="rate1" ValidationExpression="^\d+(\.\d{1,2})?$"
    ErrorMessage="Please enter a numeric or decimal value."></asp:RegularExpressionValidator>
    <hr />




    <h3>Calculate Bonuses (if applicable)</h3>
    <h4>Will employee receive a bonus?</h4>
    <asp:DropDownList ID="BonusStatus" runat="server">
        <asp:ListItem>Approved</asp:ListItem>
        <asp:ListItem>Rejected</asp:ListItem>
    </asp:DropDownList>
    <asp:Button ID="Select" runat="server" Text="Select" ValidationGroup="Val2" OnClick="Select_Click"/>


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
                <asp:TextBox ID="percent2" runat="server" ReadOnly="true" Text="0.0"></asp:TextBox>
            </td>
            <td> * </td>
            <td>
                <asp:TextBox ID="amount2" runat="server" TextMode="Number" ReadOnly="True"  BackColor="#CCCCCC"></asp:TextBox>
            </td>
            <td> = </td>
            <td>
                <asp:TextBox ID="bonus2" runat="server" TextMode="Number" ReadOnly="True"  BackColor="#CCCCCC"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="CalBonus" runat="server" Text="Calculate" ValidationGroup="Val3" OnClick="CalBonus_Click"/>
            </td>
        </tr>
    </table>
    <br />
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
    ControlToValidate="percent2" ValidationExpression="^\d+(\.\d{1,2})?$"
    ErrorMessage="Please enter a numeric or decimal value."></asp:RegularExpressionValidator>
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
                <asp:TextBox ID="amount3" runat="server" ReadOnly="True"  BackColor="#CCCCCC"></asp:TextBox>
            </td>
            <td> - </td>
            <td>
                <asp:TextBox ID="deduction3" runat="server" ReadOnly="True"  BackColor="#CCCCCC"></asp:TextBox>
            </td>
            <td> + </td>
            <td>
                <asp:TextBox ID="bonus3" runat="server" ReadOnly="True"  BackColor="#CCCCCC"></asp:TextBox>
            </td>
            <td> = </td>
            <td>
                <asp:TextBox ID="final3" runat="server" ReadOnly="True"  BackColor="#CCCCCC"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="CalSalary" runat="server" Text="Calculate" ValidationGroup="Val4" OnClick="CalSalary_Click" />
            </td>
        </tr>
    </table>
    <hr />
</asp:Content>
