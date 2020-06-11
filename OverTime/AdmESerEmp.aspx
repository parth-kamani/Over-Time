<%@ Page Title="WBE Entry" Language="C#" MasterPageFile="~/MasterAdm.master" AutoEventWireup="true" CodeFile="AdmESerEmp.aspx.cs" Inherits="AdmESerEmp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
        .style20
        {
            width: 220px;
        }
        .style21
        {
        }
        .style22
        {
            width: 322px;
            text-align: right;
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
            <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
            <ContentTemplate>
                <table border="1px" width="100%" align="center" frame="border" bgcolor="#FFFFFF">
                    <tr>
                        <td bgcolor="#CCCCCC" class="style13">
                       <table width="100%" align="center">
            <tr>
                <td class="style13,style16" align="left">

                <h1 align="left" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; text-decoration: underline blink;
                font-size: 28px;" class="style16">
                    Wage Board Employee Entry Form
                    </h1>
                <table bgcolor="#CCCCCC" align="left" style="height: 197px; width: 100%;"  >
            
                <tr>
                <td class="style22">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal;  color: #102030; 
                font-size: large;" class="style16">
                    PS Number:
                </h1>
                </td>
                <td class="style20">
                    <asp:TextBox ID="TextBox1" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center" 
                                                ToolTip="Ps No.Of Employee" Font-Size="Large" 
                        ontextchanged="TextBox1_TextChanged" AutoPostBack="true" autocomplete="off"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="*" ControlToValidate="TextBox1" ForeColor="#CC0000"></asp:RequiredFieldValidator></td>
                </td>
                <td rowspan="9">
                <img class="style14" src="images/ts-1.png" style="float: right" />
                </tr>
                <tr>
                <td class="style22">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large;" class="style16">
                    Name:</h1>
                </td>
                <td class="style20">
                    <asp:TextBox ID="TextBox2" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center" 
                                                ToolTip="Employee's Name"  Font-Size="Large" autocomplete="off"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="*" ControlToValidate="TextBox2" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                </td>
                </tr>
                <tr>
                <td class="style22">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large;" class="style16">
                    Department:
                </h1>
                </td>
                <td class="style20">
                    
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                                                 Width="205px" style="text-align: center" align="left" 
                                                ToolTip="Employee's Department Name"  Font-Size="Large" 
                        Font-Bold="False" Font-Names="Courier New" 
                        DataSourceID="SqlDataSourceDeptSel" DataTextField="deptnme" 
                        DataValueField="deptnme" AppendDataBoundItems="true">

                                                <asp:ListItem></asp:ListItem>
                                
                                
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ErrorMessage="*" ControlToValidate="DropDownList1" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    <asp:SqlDataSource ID="SqlDataSourceDeptSel" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT [deptnme] FROM [edit_deptnme]"></asp:SqlDataSource>
                        
                </td>
                </tr>
                
                <tr>
                <td class="style22">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large;" class="style16">
                    Designation:
                </h1>
                </td>
                <td class="style20">
                    <asp:TextBox ID="TextBox3" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center" 
                                                ToolTip="Employee's Designation"  Font-Size="Large" autocomplete="off"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ErrorMessage="*" ControlToValidate="TextBox3" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                </td>
                </tr>
                <tr><td class="style21" colspan="2"><asp:Label ID="Label1" runat="server" 
                        Text="Label" style="color: #CC0000; font-weight: 700; font-family: 'Courier New';" ></asp:Label></td></tr>
                <tr><td class="style21"></td><td class="style20"></td></tr>
                <tr><td colspan="2">
                &nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" Text="Add" Font-Size="15px" Width="100px"
                                                Font-Names="Courier New" Font-Bold="True" 
                        ToolTip="Add Employee Record" onclick="Button1_Click" />
                &nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" Text="Update" Font-Size="15px" Width="100px"
                                                Font-Names="Courier New" Font-Bold="True" 
                        ToolTip="Update Employee Record" onclick="Button2_Click" />
                &nbsp;&nbsp;
                <asp:Button ID="Button3" runat="server" Text="Delete" Font-Size="15px" Width="100px"
                                                Font-Names="Courier New" Font-Bold="True" 
                        ToolTip="Delete Employee Record" onclick="Button3_Click" />
                    &nbsp;</td>
                    </tr>
                    <tr><td class="style21"></td><td class="style20"></td></tr>
                    <tr><td class="style21"></td><td class="style20"></td></tr>
                </table>
                </td>
                </tr>
        </table> 
                        </td>
                    </tr>
                </table>
                </ContentTemplate>
            
        </asp:UpdatePanel>
                </div>
</asp:Content>


