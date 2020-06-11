<%@ Page Title="Cost Center Entry" Language="C#" MasterPageFile="~/MasterAdm.master" AutoEventWireup="true" CodeFile="AdmESerCost.aspx.cs" Inherits="AdmESerCost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
        .style20
        {
            width: 179px;
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
                <table border="1px" width="100%" align="center" frame="border" bgcolor="#FFFFFF">
                    <tr>
                        <td bgcolor="#CCCCCC" class="style13">
                          <table width="100%" align="center">
            <tr>
                <td class="style13,style16" align="left">

                <h1 align="left" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; text-decoration: underline blink;
                font-size: 28px;" class="style16">
                    Cost Centre Code Entry Form
                    <img class="style14" src="images/ts-1.png" /></h1>
                <table bgcolor="#CCCCCC" align="left" style="height: 197px; width: 56%;"  >
            
                
                <tr>
                <td class="style21" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large;" class="style16">
                    Department:
                </h1>
                </td>
                <td class="style20">
                    
                    <asp:DropDownList ID="DropDownList1" runat="server"
                                                 Width="205px" style="text-align: center" 
                                                ToolTip="Employee's Department Name"  Font-Size="Large" 
                        Font-Bold="False" Font-Names="Courier New" AppendDataBoundItems="True" 
                        DataSourceID="SqlDataSourceDeptSel" DataTextField="deptnme" 
                        DataValueField="deptnme" 
                        onselectedindexchanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true">

                                                <asp:ListItem></asp:ListItem>
                                
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceDeptSel" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT * FROM [edit_deptnme]"></asp:SqlDataSource>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ErrorMessage="*" ControlToValidate="DropDownList1" ForeColor="#CC0000"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                <td class="style21" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large;" class="style16">
                    Cost Centre Code:
                </h1>
                </td>
                <td class="style20">
                    <asp:TextBox ID="TextBox2" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center" 
                                                ToolTip="Department's Cost Centre Code"  Font-Size="Large" autocomplete="off"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="*" ControlToValidate="TextBox2" ForeColor="#CC0000"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                <td class="style21" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large;" class="style16">
                    Description:
                </h1>
                </td>
                <td class="style20">
                    <asp:TextBox ID="TextBox3" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: left" ToolTip="Description About Deaprtmnet"  Font-Size="Large" 
                        TextMode="MultiLine" autocomplete="off"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ErrorMessage="*" ControlToValidate="TextBox3" ForeColor="#CC0000"></asp:RequiredFieldValidator></td>
                </tr>
                <tr><td class="style21" colspan="2" align="center"><asp:Label ID="Label1" runat="server" 
                        Text="Label" 
                        style="color: #CC0000; font-weight: 700; font-family: 'Courier New';" ></asp:Label></td></tr>
                <tr><td class="style21"></td><td class="style20"></td></tr>
                <tr><td colspan="2" align="center">
                &nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" Text="Add" Font-Size="15px" Width="100px"
                                                Font-Names="Courier New" Font-Bold="True" 
                        ToolTip="Add Record" onclick="Button1_Click" />
                &nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" Text="Update" Font-Size="15px" Width="100px"
                                                Font-Names="Courier New" Font-Bold="True" 
                        ToolTip="Update Record" onclick="Button2_Click" />
                &nbsp;&nbsp;
                <asp:Button ID="Button3" runat="server" Text="Delete" Font-Size="15px" Width="100px"
                                                Font-Names="Courier New" Font-Bold="True" 
                        ToolTip="Delete Record" onclick="Button3_Click" />
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
                </div>
</asp:Content>


