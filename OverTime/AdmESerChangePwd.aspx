<%@ Page Title="Change Password" Language="C#" MasterPageFile="~/MasterAdm.master" AutoEventWireup="true" CodeFile="AdmESerChangePwd.aspx.cs" Inherits="AdmESerChangePwd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
        .style20
        {
            width: 102px;
        }
        .style21
        {
            text-align: left;
        }
    .style22
    {
        height: 42px;
    }
    .style23
    {
        width: 102px;
        height: 42px;
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
                <td class="style20">
                    <asp:TextBox ID="TextBox1" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center" ReadOnly = "true" BackColor="Silver"
                                                ToolTip="Employee's PS No." Font-Size="Large"></asp:TextBox>
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
                <td class="style20">
                    <asp:TextBox ID="TextBox2" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center" 
                                                ToolTip="Enter Old Password" TextMode="Password"  
                        Font-Size="Large" ></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"  
                        ErrorMessage="*" ForeColor="#CC0000" ControlToValidate="TextBox2"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                <td class="style22" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large;" class="style16">
                   New Password:
                </h1>
                </td>
                <td class="style23">
                    <asp:TextBox ID="TextBox3" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center" 
                                                ToolTip="Enter New Password" TextMode="Password"  Font-Size="Large"></asp:TextBox>
                </td>
                <td class="style22">
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
                <td class="style20">
                    <asp:TextBox ID="TextBox4" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center" 
                                                ToolTip="Enter New Confirmed Password" 
                        TextMode="Password"  Font-Size="Large" ontextchanged="TextBox4_TextChanged"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"  
                        ErrorMessage="*" ForeColor="#CC0000" ControlToValidate="TextBox4"></asp:RequiredFieldValidator></td>
                </tr>
                <tr><td colspan="2" style="text-align: center">
                <asp:Label ID="Label1" runat="server" Text="Label" 
                        style="font-weight: 700; font-family: 'Courier New'; color: #CC0000;" ></asp:Label></td></tr>
                
                </td></tr>
                <tr><td></td><td class="style20"></td></tr>
                <tr><td></td><td class="style21">
                
                <asp:Button ID="Button2" runat="server" Text="Update" Font-Size="15px" Width="100px"
                                                Font-Names="Courier New" Font-Bold="True" 
                        ToolTip="Update Password" onclick="Button2_Click"  />
               
                <asp:Button ID="Button1" runat="server" Text="Reset" Font-Size="15px" Width="100px"
                                                Font-Names="Courier New" Font-Bold="True" 
                        ToolTip="Reset" onclick="Button1_Click"  />
                </td>
                    </tr>
                    <tr><td></td><td class="style20"></td></tr>
                    <tr><td>
                        <asp:TextBox ID="TextBox5" runat="server" AutoPostBack= "true" Visible=false></asp:TextBox>
                        </td><td class="style20"></td></tr>
                </table>
                </td>
                </tr>
                </table>
                </div>
           
</asp:Content>


