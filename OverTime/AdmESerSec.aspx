<%@ Page Title="Section Entry" Language="C#" MasterPageFile="~/MasterAdm.master" AutoEventWireup="true" CodeFile="AdmESerSec.aspx.cs" Inherits="AdmESerSec" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
        .style22
        {
            width: 127px;
        }
        .style23
        {            text-align: center;
        }
        .style24
        {
            text-align: center;
            }
        .style25
        {
            text-align: center;
            width: 215px;
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
                    Section Entry Form
                        </h1>
                <table bgcolor="#CCCCCC" width="60%" align="left" style="height: 197px"  >
            
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
                                                ToolTip="Department Name"  Font-Size="Large" 
                        Font-Bold="False" Font-Names="Courier New" DataTextField="dept" 
                        DataValueField="dept" AppendDataBoundItems="True" AutoPostBack="True" 
                        DataSourceID="SqlDataSourceDeptSel" 
                        onselectedindexchanged="DropDownList1_SelectedIndexChanged1">

                                                <asp:ListItem></asp:ListItem>
                              
                    </asp:DropDownList>
                    
                    <asp:SqlDataSource ID="SqlDataSourceDeptSel" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT DISTINCT [dept] FROM [deptsec]"></asp:SqlDataSource>
                    
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"  
                        ErrorMessage="*" ForeColor="#CC0000" ControlToValidate="DropDownList1"></asp:RequiredFieldValidator>--%>
                </td>
                
                </tr>
                <tr>
                <td class="style25" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large;" class="style16">
                    Section:
                </h1>
                </td>
                <td class="style22">
                    
                    <asp:DropDownList ID="DropDownList2" runat="server"
                                                 Width="205px" style="text-align: center" 
                                                ToolTip="Section Name"  Font-Size="Large" 
                        Font-Bold="False" Font-Names="Courier New"  DataTextField="sec" 
                        DataValueField="sec" AppendDataBoundItems="True" AutoPostBack="True" 
                        DataSourceID="SqlDataSourceSecSel" 
                        onselectedindexchanged="DropDownList2_SelectedIndexChanged">

                                                <asp:ListItem></asp:ListItem>
                                                <asp:ListItem>--Add Section--</asp:ListItem>
                                                
                    </asp:DropDownList>
                    
                    <asp:SqlDataSource ID="SqlDataSourceSecSel" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT [sec] FROM [deptsec] WHERE ([dept] = @dept)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="dept" 
                                PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    
                </td>
                </tr>
                <tr>
                <td class="style25" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large;" class="style16">
                    <asp:Label ID="Label2" runat="server" Text="Section Name:"></asp:Label>
                </h1>
                </td>
                <td class="style22">
                    <asp:TextBox ID="TextBox4" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center" 
                                                ToolTip="Section's Name" Font-Size="Large" autocomplete="off"></asp:TextBox>
                </td>
                </tr>

                 <tr>
                <td class="style25" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large;" class="style16">
                    <asp:Label ID="Label3" runat="server" Text="HOS Name:"></asp:Label>
                </h1>
                </td>
                <td class="style22">
                    <asp:TextBox ID="TextBox5" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center" 
                                                ToolTip="HOS's Name" Font-Size="Large" autocomplete="off"></asp:TextBox>
                </td>
                </tr>
                 <tr>
                <td class="style25" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large;" class="style16">
                    <asp:Label ID="Label4" runat="server" Text="HOS E-Mail:"></asp:Label>
                </h1>
                </td>
                <td class="style22">
                    <asp:TextBox ID="TextBox6" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center" 
                                                ToolTip="HOs's E-Mail"  Font-Size="Large" autocomplete="off"></asp:TextBox>
                </td>
                </tr>
                
                <tr><td class="style23" colspan="2"><asp:Label ID="Label1" runat="server" 
                        Text="Label" style="color: #CC0000; font-weight: 700; font-family: 'Courier New';" ></asp:Label></td></tr>
                <tr><td class="style25"></td><td class="style22">
                   
                    <%--<asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>--%>
                   
                    </td></tr>
                <tr><td colspan="2" style="text-align: center">
                    &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" Text="Add" Font-Size="15px" Width="100px"
                                                Font-Names="Courier New" Font-Bold="True" 
                        ToolTip="Add Section" onclick="Button1_Click" />
                &nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" Text="Update" Font-Size="15px" Width="100px"
                                                Font-Names="Courier New" Font-Bold="True" 
                        ToolTip="Update Section" onclick="Button2_Click" />
                &nbsp;&nbsp;
                <asp:Button ID="Button3" runat="server" Text="Delete" Font-Size="15px" Width="100px"
                                                Font-Names="Courier New" Font-Bold="True" 
                        ToolTip="Delete Section" onclick="Button3_Click" />
                    &nbsp;</td>
                    </tr>
                    
                    <tr><td class="style25"></td><td class="style22"></td></tr>
                    <tr><td class="style24" colspan="2">
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                         Width="100%" BorderWidth="3px"
                                    Font-Size="8pt" 
                        AllowPaging="True" AllowSorting="True" HeaderStyle-BackColor="#333333" 
                        BorderColor="WhiteSmoke" Visible="False" 
                        style="font-family: 'Courier New'; font-weight: 700; font-size: medium" 
                        Height="55px" DataKeyNames="sec" DataSourceID="SqlDataSourceSecShow" >
                       
                        <Columns>
                            <asp:BoundField DataField="dept" HeaderText="dept" SortExpression="dept" 
                                ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" 
                                HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px"/>
                            <asp:BoundField DataField="sec" HeaderText="sec" SortExpression="sec" 
                                ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" 
                                HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" ReadOnly="True"/>
                            <asp:BoundField DataField="hosname" HeaderText="hosname" 
                                SortExpression="hosname" ControlStyle-BorderWidth="2px" 
                                FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" 
                                ItemStyle-BorderWidth="2px"/>
                            <asp:BoundField DataField="hosemail" HeaderText="hosemail" 
                                SortExpression="hosemail" ControlStyle-BorderWidth="2px" 
                                FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" 
                                ItemStyle-BorderWidth="2px"/>
                        </Columns>
                       
                        <FooterStyle BorderWidth="2px" />
                       
<HeaderStyle BackColor="#333333" BorderWidth="2px"></HeaderStyle>
                    </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceSecShow" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT [dept], [sec], [hosname], [hosemail] FROM [deptsec] ORDER BY [srno]">
                        </asp:SqlDataSource>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                         Width="100%" BorderWidth="3px"
                                    Font-Size="8pt" 
                        AllowPaging="True" AllowSorting="True" HeaderStyle-BackColor="#333333" 
                        BorderColor="WhiteSmoke" Visible="False" 
                        style="font-family: 'Courier New'; font-weight: 700; font-size: medium" 
                        Height="55px" DataKeyNames="sec" DataSourceID="SqlDataSourceSecDept" >
                       
                        <Columns>
                            <asp:BoundField DataField="dept" HeaderText="dept" SortExpression="dept" 
                                ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" 
                                HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px"/>
                            <asp:BoundField DataField="sec" HeaderText="sec" SortExpression="sec" 
                                ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" 
                                HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" ReadOnly="True"/>
                            <asp:BoundField DataField="hosname" HeaderText="hosname" 
                                SortExpression="hosname" ControlStyle-BorderWidth="2px" 
                                FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" 
                                ItemStyle-BorderWidth="2px"/>
                            <asp:BoundField DataField="hosemail" HeaderText="hosemail" 
                                SortExpression="hosemail" ControlStyle-BorderWidth="2px" 
                                FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" 
                                ItemStyle-BorderWidth="2px"/>
                        </Columns>
                       
                        <FooterStyle BorderWidth="2px" />
                       
<HeaderStyle BackColor="#333333" BorderWidth="2px"></HeaderStyle>
                    </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceSecDept" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT [dept], [sec], [hosname], [hosemail] FROM [deptsec] WHERE ([dept] = @dept)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList1" Name="dept" 
                                    PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        </td>
                        </tr>
                </table>
                </td>
                </tr>
        </table>
        
        </ContentTemplate>
            
        </asp:UpdatePanel> 
                        </td>
                    </tr>
                </table>
                </div>
</asp:Content>


