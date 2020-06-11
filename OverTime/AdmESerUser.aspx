<%@ Page Title="Administrator Entry" Language="C#" MasterPageFile="~/MasterAdm.master" AutoEventWireup="true" CodeFile="AdmESerUser.aspx.cs" Inherits="AdmESerUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
        .style22
        {
            float: right;
            text-align: center;
        }
        .style23
        {
            width: 220px;
        }
        .style24
        {
            float:right;
            padding-right:200px;
            }
        
        .style25
        {
            float: right;
            width: 240px;
            text-align: center;
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
                    Administrator Entry Form
                    <img class="style24" src="images/img454.png" /></h1>
                <table bgcolor="#CCCCCC" align="left" style="height: 197px; width: 56%;"  >
                <tr>
                <td class="style25" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large;" class="style16">
                    UserName:
                </h1>
                </td>
                <td class="style23">
                    <asp:TextBox ID="TextBox2" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center" Text="admin" 
                                                ToolTip="Admin's UserName"  Font-Size="Large" BackColor="Silver" ReadOnly="true"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
                </tr>
                
                <tr>
                <td class="style25" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large;" class="style16">
                    Employe Type:
                </h1>
                </td>
                <td class="style23">
                    
                    <asp:DropDownList ID="DropDownList2" runat="server"
                                                 Width="205px" style="text-align: center" 
                                                ToolTip="Employee's Type"  Font-Size="Large" 
                        Font-Bold="False" Font-Names="Courier New" AppendDataBoundItems="true" 
                        onselectedindexchanged="DropDownList2_SelectedIndexChanged">
                                                <asp:ListItem></asp:ListItem>
                                                <asp:ListItem>O&S Employee</asp:ListItem>
                                                <asp:ListItem>Wage Board Employee</asp:ListItem>
                                
                    </asp:DropDownList>
                    
                </td>
                <td>
                    <asp:TextBox ID="TextBox6" runat="server" Visible="false"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                <td class="style25" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large;" class="style16">
                    PS Number:
                </h1>
                </td>
                <td class="style23">
                    <asp:TextBox ID="TextBox1" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center" 
                                                ToolTip="Employee's PS No." Font-Size="Large" 
                        ontextchanged="TextBox1_TextChanged" AutoPostBack="true" autocomplete="off"></asp:TextBox>
                        
                </td>
                <td>
                    <asp:TextBox ID="TextBox7" runat="server" Visible="false"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                <td class="style25" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large;" class="style16">
                    Name:
                </h1>
                </td>
                <td class="style23">
                    <asp:TextBox ID="TextBox4" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center" 
                                                ToolTip="Employee's Name" Font-Size="Large" ReadOnly = "true" autocomplete="off"></asp:TextBox>
                                                
                </td>
                <td>
                    <asp:TextBox ID="TextBox8" runat="server" Visible="false"></asp:TextBox>
                    </td>
                </tr>
                
                <tr>
                <td class="style25" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large;" class="style16">
                    Department:
                </h1>
                </td>
                <td class="style23">
                    
                    
                    <asp:TextBox ID="TextBox5" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center" 
                                                ToolTip="Employee's Department"  
                        Font-Size="Large" autocomplete="off"></asp:TextBox>
                        
                </td>
                <td>
                    <asp:TextBox ID="TextBox9" runat="server" Visible="false"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                <td class="style25" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large;" class="style16">
                    E-Mail ID:
                </h1>
                </td>
                <td class="style23">
                    <asp:TextBox ID="TextBox10" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center" 
                                                ToolTip="Administrator's Email ID"  
                        Font-Size="Large" autocomplete="off"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="TextBox11" runat="server" Visible="false"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                <td class="style25" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large;" class="style16">
                    Password:
                </h1>
                </td>
                <td class="style23">
                    <asp:TextBox ID="TextBox3" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center" 
                                                ToolTip="Employee's Password"  
                        Font-Size="Large" TextMode="Password"></asp:TextBox>
                </td>
                </tr>
                
                
                <tr><td class="style22" colspan="3">
                    <asp:Label ID="Label1" runat="server" 
                        style="font-family: 'Courier New'; font-weight: 700; color: #CC0000" 
                        Text="Label" Visible="false"></asp:Label>
                    </td></tr>
                <tr><td class="style25"></td><td class="style23"></td></tr>
                <tr><td align="center">
                 
                    &nbsp;</td><td align="center" colspan="2">
                        <asp:Button ID="Button1" runat="server" Text="Add" Font-Size="15px" Width="100px"
                                                Font-Names="Courier New" Font-Bold="True" 
                            ToolTip="Add Admin" onclick="Button1_Click" />
                &nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" Text="Delete" Font-Size="15px" Width="100px"
                                                Font-Names="Courier New" Font-Bold="True" 
                            ToolTip="Delete Admin User" onclick="Button2_Click" />
                &nbsp;&nbsp;
                <asp:Button ID="Button3" runat="server" Text="Reset" Font-Size="15px" Width="100px"
                                                Font-Names="Courier New" Font-Bold="True" 
                            ToolTip="Reset All Fields" onclick="Button3_Click" /></td>
                    </tr>
                    <tr><td class="style25"></td><td class="style23">
                        <asp:Label ID="Label10" runat="server" Text="Admin" Visible="false"></asp:Label>
                        </td></tr>
                    <tr><td class="style25"></td><td class="style23"></td></tr>
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


