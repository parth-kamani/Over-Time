<%@ Page Title="O&S Entry" Language="C#" MasterPageFile="~/MasterAdm.master" AutoEventWireup="true" CodeFile="AdmESerOS.aspx.cs" Inherits="AdmESerOS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
        .style22
        {
            width: 17px;
        }
        .style23
        {            text-align: center;
        }
        .style25
        {
            width: 183px;
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
                <img class="style17" src="images/image1.png" />
                &nbsp;<h1 align="left" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; text-decoration: underline blink;
                font-size: 28px;" class="style16">
                    O&S Staff Entry Form
                        </h1>
                <table bgcolor="#CCCCCC" width="60%" align="left" style="height: 197px"  >
            <tr>
                <td class="style25" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large;" class="style16">
                    PS Number:
                </h1>
                </td>
                <td class="style22">
                    <asp:TextBox ID="TextBox1" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center" 
                                                ToolTip="Ps No.Of Employee" Font-Size="Large" 
                        ontextchanged="TextBox1_TextChanged" AutoPostBack="true" autocomplete="off"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="*" ForeColor="#CC0000" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
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
                <td class="style22">
                    <asp:TextBox ID="TextBox2" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center" 
                                                ToolTip="Password For Security" 
                        TextMode="Password" Font-Size="Large" Height="24px"></asp:TextBox>
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
                <td class="style22">
                    <asp:TextBox ID="TextBox3" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center" 
                                                ToolTip="Employee's Name"  Font-Size="Large" autocomplete="off"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"  
                        ErrorMessage="*" ForeColor="#CC0000" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>
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
                <td class="style22">
                    
                    <asp:DropDownList ID="DropDownList1" runat="server"
                                                 Width="205px" style="text-align: center" 
                                                ToolTip="Employee's Department Name"  Font-Size="Large" 
                        Font-Bold="False" Font-Names="Courier New" 
                        DataSourceID="SqlDataSourceDeptSel" DataTextField="deptnme" 
                        DataValueField="deptnme" AppendDataBoundItems="true">

                                                <asp:ListItem></asp:ListItem>
                                
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceDeptSel" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT [deptnme] FROM [edit_deptnme]"></asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"  
                        ErrorMessage="*" ForeColor="#CC0000" ControlToValidate="DropDownList1"></asp:RequiredFieldValidator>
                </td>
                </tr>
                
                <tr>
                <td class="style25" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large;" class="style16">
                    Designation:
                </h1>
                </td>
                <td class="style22">
                    <%--<asp:TextBox ID="TextBox4" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center" 
                                                ToolTip="Employee's Designation" Font-Size="Large"></asp:TextBox>--%>
                    <asp:DropDownList ID="DropDownList3" runat="server"
                                                 Width="205px" style="text-align: center" 
                                                ToolTip="Employee's Designation"  Font-Size="Large" 
                        Font-Bold="False" Font-Names="Courier New">

                                                <asp:ListItem></asp:ListItem>
                                
                                <asp:ListItem Value = "EN">Engineer</asp:ListItem>
                                <asp:ListItem Value = "SEN">Senior Engineer</asp:ListItem>
                                <asp:ListItem Value = "SE">Supervisor</asp:ListItem>
                                <asp:ListItem Value = "SSE">Senior Supervisor</asp:ListItem>
                                <asp:ListItem Value = "MA">Manager</asp:ListItem>
                                <asp:ListItem Value = "AMA">Assistant Manager</asp:ListItem>
                                <asp:ListItem Value = "DMA">Deputy Manager</asp:ListItem>
                                <asp:ListItem Value = "SH">Section Head</asp:ListItem>
                                <asp:ListItem Value = "DH">Department Head</asp:ListItem>
                                <asp:ListItem Value = "FH">Functional Head</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"  
                        ErrorMessage="*" ForeColor="#CC0000" ControlToValidate="DropDownList3"></asp:RequiredFieldValidator>
                </td>
                </tr>

                 <tr>
                <td class="style25" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large;" class="style16">
                    HOD E-Mail:
                </h1>
                </td>
                <td class="style22">
                    <asp:TextBox ID="TextBox5" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center" 
                                                ToolTip="HOD's E-Mail" Font-Size="Large" autocomplete="off"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"  
                        ErrorMessage="*" ForeColor="#CC0000" ControlToValidate="TextBox5"></asp:RequiredFieldValidator>
                </td>
                </tr>
                 <tr>
                <td class="style25" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large;" class="style16">
                    FH E-Mail:
                </h1>
                </td>
                <td class="style22">
                    <asp:TextBox ID="TextBox6" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center" 
                                                ToolTip="FH's E-Mail"  Font-Size="Large" autocomplete="off"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"  
                        ErrorMessage="*" ForeColor="#CC0000" ControlToValidate="TextBox6"></asp:RequiredFieldValidator>
                </td>
                </tr>
                <tr>
                <td class="style25" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large;" class="style16">
                    Authorised:
                </h1>
                </td>
                <td class="style22">
                    
                    <asp:DropDownList ID="DropDownList2" runat="server"
                                                 Width="205px" style="text-align: center" 
                                                ToolTip="Authorised/Non-Authorised Employee"  Font-Size="Large" 
                        Font-Bold="False" Font-Names="Courier New">

                                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>No</asp:ListItem>
                                <asp:ListItem>Yes</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"  
                        ErrorMessage="*" ForeColor="#CC0000" ControlToValidate="DropDownList2"></asp:RequiredFieldValidator>
                </td>
                </tr>
                
                 <tr>
                <td class="style25" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large;" class="style16">
                    Employee E-Mail:
                </h1>
                </td>
                <td class="style22">
                    <asp:TextBox ID="emp_id" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center" 
                                                ToolTip="Employee's E-Mail" Font-Size="Large" autocomplete="off"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"  
                        ErrorMessage="*" ForeColor="#CC0000" ControlToValidate="emp_id"></asp:RequiredFieldValidator>
                </td>
                </tr>
                <tr><td class="style23" colspan="2"><asp:Label ID="Label1" runat="server" 
                        Text="Label" style="color: #CC0000; font-weight: 700; font-family: 'Courier New';" ></asp:Label></td></tr>
                <tr><td colspan="2" style="text-align: center">
                    &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
                
                    <tr><td class="style25"></td><td class="style22"></td></tr>
                    <tr><td class="style25"></td><td class="style22"></td></tr>
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


