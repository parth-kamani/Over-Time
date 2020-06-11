<%@ Page Title="Employee Wise Report" Language="C#" MasterPageFile="~/MasterHosd.master" AutoEventWireup="true" CodeFile="HosdRptEmp.aspx.cs" Inherits="HosdRptEmp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css" >
.style118
        {
            width: 100%;
            font-family:Courier New;
            font-size:medium;
            font-style:normal;
            font-weight:bold;
        }
        .style22
        {
            padding-left:50px;
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
                        <table>
                <td colspan="9">
                <h1 align="left" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; text-decoration: underline blink;
                font-size: 28px;" class="style16">
                    Employee Wise Summary Report
                   </h1>
                </td>
                </tr>
                <tr>
                <td style="text-align: left; padding-left:60px;" colspan="8">
                                     <asp:Button ID="Button3" runat="server" Text="Export To Exel" 
                        Font-Size="20px" Width="250px"
                                                Font-Names="Courier New" Font-Bold="True" 
                        ToolTip="Export Curret Report To Exel" Height="30px" onclick="Button3_Click" />
                        <asp:Button ID="Button4" runat="server" Text="Export To Exel" 
                        Font-Size="20px" Width="250px"
                                                Font-Names="Courier New" Font-Bold="True" 
                        ToolTip="Export Curret Report To Exel" Height="30px" onclick="Button4_Click" />
                
                </td>
                </tr>
                <tr>
                
                <td>
                    <br/>
                </td>
                <td> <asp:Button ID="Button5" runat="server" Text="Reset" Font-Size="15px" Width="150px"
                                                Font-Names="Courier New" Font-Bold="True" 
                        ToolTip="Reset" onclick="Button5_Click" AutoPostBack="True" /><br/></td>
                <td>
                </tr>
                <tr>
                <td class="style22">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large;" class="style16">
                    Year:
                </h1>
                </td>
                <td class="style22">
                    <asp:DropDownList ID="DropDownList1" runat="server"
                                                 Width="110px" style="text-align: center" 
                                                ToolTip="Year"  Font-Size="Large" 
                        Font-Bold="False" Font-Names="Courier New" 
                        DataSourceID="SqlDataSourceYearSel" DataTextField="yearnme" 
                        DataValueField="yearnme" AppendDataBoundItems="true" 
                        onselectedindexchanged="DropDownList1_SelectedIndexChanged" 
                        AutoPostBack="True">

                                                <asp:ListItem></asp:ListItem>
                                
                    </asp:DropDownList>
                     <asp:Button ID="Button1" runat="server" Text="Show Records" Font-Size="15px" Width="150px"
                                                Font-Names="Courier New" Font-Bold="True" 
                        ToolTip="Show Records of Employee" onclick="Button1_Click" />
                    <asp:SqlDataSource ID="SqlDataSourceYearSel" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT [yearnme] FROM [edit_year]"></asp:SqlDataSource>
                </td>
                <td class="style22">
                 <%--<asp:Button ID="Button1" runat="server" Text="Show Records" Font-Size="15px" Width="150px"
                                                Font-Names="Courier New" Font-Bold="True" 
                        ToolTip="Show Records of Department Wise in Year" onclick="Button1_Click" />--%>
                </td>
                <%--<td>
                                 <asp:Button ID="Button1" runat="server" Text="Show Records" Font-Size="15px" Width="150px"
                                                Font-Names="Courier New" Font-Bold="True" 
                        ToolTip="Show Records of Employee" onclick="Button2_Click" />
                
                </td>--%>
                <td class="style22">
                <div id= "sec" runat="server">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large; text-align: left; width: 532px;" class="style16">
                    Section:
&nbsp;<asp:DropDownList ID="DropDownList2" runat="server"
                                                 Width="205px" style="text-align: center" 
                                                ToolTip="Section"  Font-Size="Large" 
                        Font-Bold="False" Font-Names="Courier New" 
                        DataSourceID="SqlDataSourceSecSel" DataTextField="sec" 
                        DataValueField="sec" AppendDataBoundItems="True" AutoPostBack="True" 
                        onselectedindexchanged="DropDownList2_SelectedIndexChanged">

                                                <asp:ListItem></asp:ListItem>
                                
                    </asp:DropDownList>
                    <asp:Button ID="Button2" runat="server" Text="Show Records" Font-Size="15px" Width="150px"
                                                Font-Names="Courier New" Font-Bold="True" 
                        ToolTip="Show Records of Employee" onclick="Button2_Click" />
                    </h1>
                    
                <%--</td>
                <td class="style22">--%>
                    
                    <asp:SqlDataSource ID="SqlDataSourceSecSel" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        
                        
                        SelectCommand="SELECT DISTINCT [sec] FROM [otmnthtable] WHERE ([dept] = @dept)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="Label1" Name="dept" 
                                PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    </div>
                </td>
                <td class="style22">
                 
                </td>
                <td >
                    <asp:Label ID="Label13" runat="server" Text="Label" Visible="False"></asp:Label>
                    </td>

                </tr>
                <tr>
                <td colspan="9" align = "center">
                <div id = "norec" runat="server" visible = "false">
                <table class="style118">
                        <tr>
                        <td colspan = "9" align="center"><asp:Label ID="Label6" runat="server" Text="No Records" 
                        style="font-family: 'Courier New'; font-weight: 700; color: #CC0000; font-size: medium"></asp:Label></td>
                        </tr>
                        </table>
                 </div>
                <div id = "tab" runat="server" visible = "false">
                    <table class="style118">
                        
                        <tr>
                        <td class="style22">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td align="right">
                                01:</td>
                            <td align="left">
                                April</td>
                            <td align="right">
                                05:</td>
                            <td align="left">
                                August</td>
                            <td align="right">
                                09:</td>
                            <td align="left">
                                December</td>
                                <td>&nbsp;</td>
                                <td class="style22">&nbsp;</td>
                        </tr>
                        <tr>
                        <td>&nbsp;</td>
                               <td>&nbsp;</td>
                            <td align="right">
                                02:</td>
                            <td align="left">
                                May</td>
                            <td align="right">
                                06:</td>
                            <td align="left">
                                September</td>
                            <td align="right">
                                10:</td>
                            <td align="left">
                                January</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                        </tr>
                        <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                            <td align="right">
                                03:</td>
                            <td align="left">
                                June</td>
                            <td align="right">
                                07:</td>
                            <td align="left">
                                October</td>
                            <td align="right">
                                11:</td>
                            <td align="left">
                                February</td>
                            
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                        </tr>
                        <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                            <td align="right">
                                04:</td>
                            <td align="left">
                                July</td>
                            <td align="right">
                                08:</td>
                            <td align="left">
                                November</td>
                            <td align="right">
                                12:</td>
                            <td align="left">
                                March</td>
                            
                                <td>&nbsp;</td>
                                <td class="style22">&nbsp;</td>
                        </tr>
                    </table>
                </div>
                </td></tr>
                <tr>
                <td>&nbsp;</td>
                <td colspan="8">
                 
                        <asp:GridView ID="GridView1" Width="100%" BorderWidth="3px"  
                            HeaderStyle-BackColor="#666666" HeaderStyle-ForeColor="White"
        RowStyle-BackColor="#CCCCCC" AlternatingRowStyle-BackColor="#CCCCCC" AlternatingRowStyle-ForeColor="#000000"  
        runat="server" AutoGenerateColumns="false" AllowPaging="true" 
                            OnPageIndexChanging="OnPageIndexChanging" style="font-family: 'Courier New'; font-weight: 700; font-size: medium" 
                        Height="55px" BorderColor="WhiteSmoke" onrowdatabound="GridView2_RowDataBound"  >
                        <Columns>
                        <asp:BoundField DataField="psno" HeaderText="PS No." SortExpression="psno" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                        <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="dept" HeaderText="Department" SortExpression="dept" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="sec" HeaderText="Section" SortExpression="sec" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="april" HeaderText="01" 
                                            SortExpression="april" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="may" HeaderText="02" 
                                            SortExpression="may" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="june" HeaderText="03" 
                                            SortExpression="june" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="july" HeaderText="04" 
                                            SortExpression="july" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="august" HeaderText="05" 
                                            SortExpression="august" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="september" HeaderText="06" 
                                            SortExpression="september" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="october" HeaderText="07" 
                                            SortExpression="october" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="november" HeaderText="08" 
                                            SortExpression="november" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="december" HeaderText="09" 
                                            SortExpression="december" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="january" HeaderText="10" 
                                            SortExpression="janaury" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="february" HeaderText="11" 
                                            SortExpression="february" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="march" HeaderText="12" 
                                            SortExpression="march" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        
                                        <asp:BoundField DataField="total" HeaderText="Total" SortExpression="total" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                            
                        </Columns>
                       
                       <FooterStyle BorderWidth="2px" />
                       
<HeaderStyle BackColor="#333333" BorderWidth="2px" Font-Bold="true" ForeColor="WhiteSmoke" ></HeaderStyle>


                    </asp:GridView>
                    <%--<asp:SqlDataSource ID="SqlDataSourceotStatusRpt" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        
                        
                        SelectCommand="SELECT [srno], [uid] FROM [otentrytable] WHERE ([sec] = @sec) AND ()">
                        <SelectParameters>
                            
                            <asp:ControlParameter ControlID="DropDownList2" Name="sec" 
                                PropertyName="SelectedValue" Type="String" />
                            
                        </SelectParameters>
                    </asp:SqlDataSource>--%>
                    <asp:GridView ID="GridView2" Width="100%" BorderWidth="3px"  
                            HeaderStyle-BackColor="#666666" HeaderStyle-ForeColor="White"
        RowStyle-BackColor="#CCCCCC" AlternatingRowStyle-BackColor="#CCCCCC" AlternatingRowStyle-ForeColor="#000000"  
        runat="server" AutoGenerateColumns="false" AllowPaging="true" 
                            OnPageIndexChanging="OnPageIndexChanging" style="font-family: 'Courier New'; font-weight: 700; font-size: medium" 
                        Height="55px" BorderColor="WhiteSmoke" onrowdatabound="GridView2_RowDataBound"  >
                        <Columns>
                        <asp:BoundField DataField="psno" HeaderText="PS No." SortExpression="psno" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                        <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="dept" HeaderText="Department" SortExpression="dept" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="sec" HeaderText="Section" SortExpression="sec" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="april" HeaderText="01" 
                                            SortExpression="april" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="may" HeaderText="02" 
                                            SortExpression="may" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="june" HeaderText="03" 
                                            SortExpression="june" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="july" HeaderText="04" 
                                            SortExpression="july" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="august" HeaderText="05" 
                                            SortExpression="august" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="september" HeaderText="06" 
                                            SortExpression="september" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="october" HeaderText="07" 
                                            SortExpression="october" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="november" HeaderText="08" 
                                            SortExpression="november" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="december" HeaderText="09" 
                                            SortExpression="december" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="january" HeaderText="10" 
                                            SortExpression="janaury" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="february" HeaderText="11" 
                                            SortExpression="february" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="march" HeaderText="12" 
                                            SortExpression="march" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        
                                        <asp:BoundField DataField="total" HeaderText="Total" SortExpression="total" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                            
                        </Columns>
                       
                       <FooterStyle BorderWidth="2px" />
                       
<HeaderStyle BackColor="#333333" BorderWidth="2px" Font-Bold="true" ForeColor="WhiteSmoke" ></HeaderStyle>


                    </asp:GridView>
                <asp:Label ID="Label1" runat="server" Text="dept" Visible = "false"></asp:Label>
                    <asp:Label ID="Label3" runat="server" Text="sec" Visible = "false"></asp:Label>
                    <asp:Label ID="Label2" runat="server" Text="hodemail" Visible = "false"></asp:Label>
                    <asp:Label ID="Label4" runat="server" Text="year" Visible = "false"></asp:Label>
                    <asp:Label ID="Label5" runat="server" Text="Yes" Visible = "false"></asp:Label>
                    <asp:Label ID="Label7" runat="server" Text="year1" Visible = "false"></asp:Label>
                    <asp:Label ID="Label8" runat="server" Text="year2" Visible = "false"></asp:Label>
                    <asp:Label ID="Label9" runat="server" Text="month" Visible = "false"></asp:Label>
                    <asp:Label ID="Label10" runat="server" Text="month1" Visible = "false"></asp:Label>
                    <asp:Label ID="Label11" runat="server" Text="month2" Visible = "false"></asp:Label>
                </td>
                </tr>
                </table>
                        </td>
                        </tr>
                        </table>
                        </div>
</asp:Content>


