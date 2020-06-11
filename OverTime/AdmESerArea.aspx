<%@ Page Title="Area Entry" Language="C#" MasterPageFile="~/MasterAdm.master" AutoEventWireup="true" CodeFile="AdmESerArea.aspx.cs" Inherits="AdmESerArea" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
        .style22
        {
            width: 177px;
        }
        .style90
        {
            padding-left:100px;
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
                         <table bgcolor="#CCCCCC" border="1px" width="100%" align="center" frame="border" bgcolor="#FFFFFF">
        
            <tr>
            
                <td class="style20" align="left">
                   
                <h1 align="left" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; text-decoration: underline blink;
                font-size: 28px;" class="style16">
                    Area Entry Form
                   </h1>

                <table bgcolor="#CCCCCC" width="60%" align="left" style="height: 100px">
                <tr>
                <td class="style13,style16" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large;" class="style16">
                    Area:
                </h1>
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center"  
                                                ToolTip="Area's Name"  Font-Size="Large" 
                        onload="Page_Load" ontextchanged="TextBox1_TextChanged" AutoPostBack="true" autocomplete="off"></asp:TextBox>
                    
                </td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="TextBox1" ErrorMessage="*" ForeColor="#CC0000"></asp:RequiredFieldValidator> </td>
                </tr>
            <tr>
                <td align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large;" class="style16">
                    Code:
                </h1>
                </td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center" 
                                                ToolTip="Code For Area"  Font-Size="Large" 
                        ontextchanged="TextBox2_TextChanged" autocomplete="off"></asp:TextBox>
                    
                </td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="TextBox2" ErrorMessage="*" ForeColor="#CC0000"></asp:RequiredFieldValidator></td>
                </tr>
                
                
                <tr><td colspan="2" 
                        
                        style="color: #CC0000; font-weight: 700; font-family: 'Courier New'; text-align: center;">
                    <asp:Label ID="Label1" runat="server" Text="Label" style="text-align: center" ></asp:Label></td></tr>
                <tr><td></td><td></td></tr>
                <tr><td colspan="2" align="center">
                &nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;
                &nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" Text="Add" Font-Size="15px" Width="100px"
                                                Font-Names="Courier New" Font-Bold="True" 
                        ToolTip="Add Area To Record" onclick="Button1_Click" 
                        style="height: 27px"  />
                &nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" Text="Update" Font-Size="15px" Width="100px"
                                                Font-Names="Courier New" Font-Bold="True" 
                        ToolTip="Update Area's Record" onclick="Button2_Click"  />
                &nbsp;&nbsp;
                &nbsp;&nbsp;
                </td>
                    </tr>
                    <tr><td colspan="2" align="center">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;
               
                <asp:Button ID="Button3" runat="server" Text="Delete" Font-Size="15px" Width="100px"
                                                Font-Names="Courier New" Font-Bold="True" 
                            ToolTip="Delete Area From Record" onclick="Button3_Click" />
                            
                </td></tr>
                    <tr><td></td><td></td></tr>
                   
                </table>

                </td>
                <td align="center" valign="top" class="style22"> 
                 
                                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                            AutoGenerateColumns="False" BorderColor="#CCCCCC" CellPadding="4" 
                            DataSourceID="SDSAreaEntry" GridLines="Horizontal" PageSize="15" Width="254px" 
                            DataKeyNames="area" BackColor="White" BorderStyle="None" BorderWidth="1px" 
                                    ForeColor="Black">
                            <Columns>
                                <asp:BoundField DataField="area" HeaderText="Area" SortExpression="area" 
                                    ReadOnly="True" />
                                <asp:BoundField DataField="code" HeaderText="Code" SortExpression="code" />
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F7F7F7" />
                            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                            <SortedDescendingCellStyle BackColor="#E5E5E5" />
                            <SortedDescendingHeaderStyle BackColor="#242121" />
                        </asp:GridView>
                            
                        <asp:SqlDataSource ID="SDSAreaEntry" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT [code], [area] FROM [areamaster] ORDER BY [area]">
                        </asp:SqlDataSource></td>
                        <td>
                            <img src="images/img454.png"  style="height: 388px" align="top" class="style90"/></td>
                </tr>
                
        </table>     
                </ContentTemplate>
            
        </asp:UpdatePanel>
                </div>
</asp:Content>


