<%@ Page Title="Change Password" Language="C#" MasterPageFile="~/MasterNor.master" AutoEventWireup="true" CodeFile="NorSerChangePwd.aspx.cs" Inherits="NorSerChangePwd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
        .style22
        {
            width: 167px;
        }
        .style23
        {
            float: right;
            width: 167px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
            <h1 align="right" 
        style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large; width: 1037px; height: 11px; margin-top: 0px; text-align: left;">
                    <span class="style11">&nbsp;welcome</span><span class="style7">&nbsp;</span>
                    <asp:Label ID="Label1003" runat="server" Text="Label" Visible="False"></asp:Label>
                    <asp:Label ID="Label1002" runat="server" Text="Label" Visible="False"></asp:Label>
                   <asp:Label ID="Label1001" runat="server"  style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #FFFFFF; 
                font-size: large; width: 1037px; height: 11px; margin-top: 0px; text-align: left;"  
                                                ToolTip="Employee's Name(Employee Name)"    
                        Font-Size="Large"></asp:Label>
                </h1><br/>
            <div align="center">
                <table bgcolor="#CCCCCC" border="1px" width="100%" align="center" frame="border" bgcolor="#FFFFFF">
            <tr>
                <td class="style13,style16" align="left">
                <img class="style18" src="images/img454.png" />
                &nbsp;<h1 align="left" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; text-decoration: underline blink;
                font-size: 28px;" class="style16">
                    Change Password Form
                        </h1>
                <table bgcolor="#CCCCCC" width="60%" align="left" style="height: 197px"  >
            <tr>
                <td class="style13,style16" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large;" class="style16">
                    PS No.:
                </h1>
                </td>
                <td class="style22">
                    <asp:TextBox ID="TextBox1" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center" 
                                                ToolTip="User Name Of Employee" Font-Size="Large"  BackColor="Silver" 
                        ReadOnly="True"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="*" ForeColor="#CC0000" ControlToValidate="TextBox1"></asp:RequiredFieldValidator></td>
                </tr>
                 <tr>
                <td class="style13,style16" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large;" class="style16">
                   Old Password:
                </h1>
                </td>
                <td class="style22">
                    <asp:TextBox ID="TextBox2" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center" 
                                                ToolTip="Enter Old Password" TextMode="Password"  Font-Size="Large"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"  
                        ErrorMessage="*" ForeColor="#CC0000" ControlToValidate="TextBox2"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                <td class="style13,style16" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large;" class="style16">
                   New Password:
                </h1>
                </td>
                <td class="style22">
                    <asp:TextBox ID="TextBox3" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center" 
                                                ToolTip="Enter New Password" TextMode="Password"  Font-Size="Large"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"  
                        ErrorMessage="*" ForeColor="#CC0000" ControlToValidate="TextBox3"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                <td class="style13,style16" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large;" class="style16">
                   Confirm Password:
                </h1>
                </td>
                <td class="style22">
                    <asp:TextBox ID="TextBox4" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center" 
                                                ToolTip="Enter New Confirmed Password" TextMode="Password"  Font-Size="Large"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"  
                        ErrorMessage="*" ForeColor="#CC0000" ControlToValidate="TextBox4"></asp:RequiredFieldValidator></td>
                </tr>
                <tr><td></td><td class="style22">
                    <asp:Label ID="Label5" runat="server" 
                        
                        style="font-family: 'Courier New'; font-size: medium; font-weight: 700; color: #CC0000;" 
                        Text="Label" Visible="False"></asp:Label>
                    </td></tr>
                <tr><td></td><td class="style22"></td></tr>
                <tr><td></td><td class="style23">
                
                <asp:Button ID="Button2" runat="server" Text="Update" Font-Size="15px" Width="100px"
                                                Font-Names="Courier New" Font-Bold="True" 
                        ToolTip="Update Password" onclick="Button2_Click" />
               
                
                </td>
                    </tr>
                    <tr><td></td><td class="style22"></td></tr>
                    <tr><td></td><td class="style22"></td></tr>
                </table>
                </td>
                </tr>
        </table>
                <br />
                </div>
</asp:Content>


