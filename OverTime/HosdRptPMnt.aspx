<%@ Page Title="Paid Month Wise Report" Language="C#" MasterPageFile="~/MasterHosd.master" AutoEventWireup="true" CodeFile="HosdRptPMnt.aspx.cs" Inherits="HosdRptPMnt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
    .style90
    {
        padding-left : 150px;
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
                 <tr>
                <td colspan="10">
                <h1 align="left" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; text-decoration: underline blink;
                font-size: 28px;" class="style16">
                    Paid Month Wise Summary Report
                   </h1>
                </td>
                </tr>
                <tr>
                <td style="text-align: left; padding-left:60px;" colspan="10">
                                     <asp:Button ID="Button3" runat="server" Text="Export To Exel" 
                        Font-Size="20px" Width="250px"
                                                Font-Names="Courier New" Font-Bold="True" 
                        ToolTip="Export Curret Report To Exel" Height="30px" onclick="Button3_Click" />
                        <asp:Button ID="Button4" runat="server" Text="Export To Exel" 
                        Font-Size="20px" Width="250px"
                                                Font-Names="Courier New" Font-Bold="True" 
                        ToolTip="Export Curret Report To Exel" Height="30px" onclick="Button4_Click" />
                        <asp:Button ID="Button5" runat="server" Text="Export To Exel" 
                        Font-Size="20px" Width="250px"
                                                Font-Names="Courier New" Font-Bold="True" 
                        ToolTip="Export Curret Report To Exel" Height="30px" onclick="Button5_Click" />
                        <asp:Button ID="Button6" runat="server" Text="Export To Exel" 
                        Font-Size="20px" Width="250px"
                                                Font-Names="Courier New" Font-Bold="True" 
                        ToolTip="Export Curret Report To Exel" Height="30px" onclick="Button6_Click" />
                </td>
                </tr>
                <tr>
                
                <td>
                    <br/>
                </td>
                <td> <asp:Button ID="Button9" runat="server" Text="Reset" Font-Size="15px" Width="150px"
                                                Font-Names="Courier New" Font-Bold="True" 
                        ToolTip="Reset" onclick="Button9_Click" AutoPostBack="True" /><br/></td>
                <td></tr>
                <tr>
                
                <td class="style22">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large;" class="style16">
                    Month:
                </h1>
                </td>
                <td class="style22">
                    <asp:DropDownList ID="DropDownList2" runat="server"
                                                 Width="205px" style="text-align: center" 
                                                ToolTip="Month"  Font-Size="Large" 
                        Font-Bold="False" Font-Names="Courier New" 
                         DataTextField="psno" 
                        DataValueField="psno" AutoPostBack="True" >
                        <asp:ListItem></asp:ListItem>
                                                <asp:ListItem>January</asp:ListItem>
                    <asp:ListItem>February</asp:ListItem>
                    <asp:ListItem>March</asp:ListItem>
                    <asp:ListItem>April</asp:ListItem>
                    <asp:ListItem>May</asp:ListItem>
                    <asp:ListItem>June</asp:ListItem>
                    <asp:ListItem>July</asp:ListItem>
                    <asp:ListItem>August</asp:ListItem>
                    <asp:ListItem>September</asp:ListItem>
                    <asp:ListItem>October</asp:ListItem>
                    <asp:ListItem>November</asp:ListItem>
                    <asp:ListItem>December</asp:ListItem>
                                
                    </asp:DropDownList>
                </td>
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
                        DataValueField="yearnme" AppendDataBoundItems="true" AutoPostBack="True" 
                        onselectedindexchanged="DropDownList1_SelectedIndexChanged">

                                                <asp:ListItem></asp:ListItem>
                                
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceYearSel" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT [yearnme] FROM [edit_year]"></asp:SqlDataSource>
                </td>
                <td>
                <div id= "sec" runat="server" visible = "false">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large; text-align: left; width: 532px;" class="style16">
                    Section:
&nbsp;<asp:DropDownList ID="DropDownList3" runat="server"
                                                 Width="205px" style="text-align: center" 
                                                ToolTip="Section"  Font-Size="Large" 
                        Font-Bold="False" Font-Names="Courier New" 
                        DataSourceID="SqlDataSourceSecSel" DataTextField="sec" 
                        DataValueField="sec" AppendDataBoundItems="True" AutoPostBack="True" 
                        onselectedindexchanged="DropDownList3_SelectedIndexChanged">

                                                <asp:ListItem></asp:ListItem>
                                
                    </asp:DropDownList>
                    
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
                <td colspan = "3"></td>
                </tr>
                <tr>
                <td></td>
                <td class="style22" colspan="5">
                 <asp:Button ID="Button1" runat="server" Text="Current Month Records" 
                        Font-Size="15px" Width="220px"
                                                Font-Names="Courier New" Font-Bold="True" 
                        ToolTip="Show Records of Department" onclick="Button1_Click" />
                                                <asp:Button ID="Button2" runat="server" 
                        Text="Previous Month Records" Font-Size="15px" Width="220px"
                                                Font-Names="Courier New" Font-Bold="True" 
                        ToolTip="Show Records of Department" onclick="Button2_Click" />
                        <asp:Button ID="Button7" runat="server" Text="Current Month Records" 
                        Font-Size="15px" Width="220px"
                                                Font-Names="Courier New" Font-Bold="True" 
                        ToolTip="Show Records of Department" onclick="Button7_Click" />
                                                <asp:Button ID="Button8" runat="server" 
                        Text="Previous Month Records" Font-Size="15px" Width="220px"
                                                Font-Names="Courier New" Font-Bold="True" 
                        ToolTip="Show Records of Department" onclick="Button8_Click" />
                </td>
                <td class = "style90">
                </td>
                </tr>
                <tr><td colspan="9">
                <div id = "norec" runat="server" visible = "false">
                <table class="style118">
                        <tr>
                        <td colspan = "9" align="center"><asp:Label ID="Label6" runat="server" Text="No Records" 
                        style="font-family: 'Courier New'; font-weight: 700; color: #CC0000; font-size: medium"></asp:Label></td>
                        </tr>
                        </table>
                 </div>
                 </td>
                 </tr>
                 
               <tr>
               <td></td>
               <td colspan="5">
               <asp:GridView ID="GridView1" Width="100%" BorderWidth="3px"  
                            HeaderStyle-BackColor="#666666" HeaderStyle-ForeColor="White"
        RowStyle-BackColor="#CCCCCC" AlternatingRowStyle-BackColor="#CCCCCC" AlternatingRowStyle-ForeColor="#000000"  
        runat="server" AutoGenerateColumns="false" AllowPaging="true" 
                            OnPageIndexChanging="OnPageIndexChanging" style="font-family: 'Courier New'; font-weight: 700; font-size: medium" 
                        Height="55px" BorderColor="WhiteSmoke"  >
                        <Columns>
                        <asp:BoundField DataField="psno" HeaderText="PS No." SortExpression="psno" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                        <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="dept" HeaderText="Department" SortExpression="dept" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="sec" HeaderText="Section" SortExpression="sec" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />                                        
                                        <asp:BoundField DataField="totalhrs" HeaderText="Current Month Total Hours" SortExpression="totalhrs" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        
                            
                        </Columns>
                       
                       <FooterStyle BorderWidth="2px" />
                       
<HeaderStyle BackColor="#333333" BorderWidth="2px" Font-Bold="true" ForeColor="WhiteSmoke" ></HeaderStyle>


                    </asp:GridView>
               </td>
               <td ></td>
               </tr>
               <tr>
               <td>&nbsp;</td>
               <td colspan="5">
               <asp:GridView ID="GridView2" Width="100%" BorderWidth="3px"  
                            HeaderStyle-BackColor="#666666" HeaderStyle-ForeColor="White"
        RowStyle-BackColor="#CCCCCC" AlternatingRowStyle-BackColor="#CCCCCC" AlternatingRowStyle-ForeColor="#000000"  
        runat="server" AutoGenerateColumns="false" AllowPaging="true" 
                            OnPageIndexChanging="OnPageIndexChanging" style="font-family: 'Courier New'; font-weight: 700; font-size: medium" 
                        Height="55px" BorderColor="WhiteSmoke"  >
                        <Columns>
                        <asp:BoundField DataField="psno" HeaderText="PS No." SortExpression="psno" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                        <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="dept" HeaderText="Department" SortExpression="dept" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="sec" HeaderText="Section" SortExpression="sec" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />                                        
                                        <asp:BoundField DataField="totalhrs" HeaderText="Previous Month Total Hours" SortExpression="totalhrs" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        
                            
                        </Columns>
                       
                       <FooterStyle BorderWidth="2px" />
                       
<HeaderStyle BackColor="#333333" BorderWidth="2px" Font-Bold="true" ForeColor="WhiteSmoke" ></HeaderStyle>


                    </asp:GridView>
               </td>
               <td></td>
               </tr>
               <tr>
               <td colspan="5">
               <asp:Label ID="Label1" runat="server" Text="dept" Visible = "false"></asp:Label>
                    <asp:Label ID="Label3" runat="server" Text="sec" Visible = "false"></asp:Label>
                    <asp:Label ID="Label2" runat="server" Text="hodemail" Visible = "false"></asp:Label>
                    <asp:Label ID="Label4" runat="server" Text="year" Visible = "false"></asp:Label>
                    <asp:Label ID="Label5" runat="server" Text="Yes" Visible = "false"></asp:Label>
                    <asp:Label ID="Label7" runat="server" Text="No" Visible = "false"></asp:Label>
                    <asp:Label ID="Label8" runat="server" Text="year2" Visible = "false"></asp:Label>
                    <asp:Label ID="Label9" runat="server" Text="month" Visible = "false"></asp:Label>
                    <asp:Label ID="Label10" runat="server" Text="month1" Visible = "false"></asp:Label>
                    <asp:Label ID="Label11" runat="server" Text="month2" Visible = "false"></asp:Label>
                     <asp:Label ID="Label12" runat="server" Text="dt1" Visible = "false"></asp:Label>
                      <asp:Label ID="Label13" runat="server" Text="dt2" Visible = "false"></asp:Label>
               </td>
               </tr>
               <tr>
               <td></td>
               <td colspan="5">
               <asp:GridView ID="GridView3" Width="100%" BorderWidth="3px"  
                            HeaderStyle-BackColor="#666666" HeaderStyle-ForeColor="White"
        RowStyle-BackColor="#CCCCCC" AlternatingRowStyle-BackColor="#CCCCCC" AlternatingRowStyle-ForeColor="#000000"  
        runat="server" AutoGenerateColumns="false" AllowPaging="true" 
                            OnPageIndexChanging="OnPageIndexChanging" style="font-family: 'Courier New'; font-weight: 700; font-size: medium" 
                        Height="55px" BorderColor="WhiteSmoke" >
                        <Columns>
                        <asp:BoundField DataField="psno" HeaderText="PS No." SortExpression="psno" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                        <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="dept" HeaderText="Department" SortExpression="dept" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="sec" HeaderText="Section" SortExpression="sec" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />                                        
                                        <asp:BoundField DataField="totalhrs" HeaderText="Current Month Total Hours" SortExpression="totalhrs" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        
                            
                        </Columns>
                       
                       <FooterStyle BorderWidth="2px" />
                       
<HeaderStyle BackColor="#333333" BorderWidth="2px" Font-Bold="true" ForeColor="WhiteSmoke" ></HeaderStyle>


                    </asp:GridView>
               </td>
               <td></td>
               </tr>
               <tr>
               <td></td>
               <td colspan="5">
               <asp:GridView ID="GridView4" Width="100%" BorderWidth="3px"  
                            HeaderStyle-BackColor="#666666" HeaderStyle-ForeColor="White"
        RowStyle-BackColor="#CCCCCC" AlternatingRowStyle-BackColor="#CCCCCC" AlternatingRowStyle-ForeColor="#000000"  
        runat="server" AutoGenerateColumns="false" AllowPaging="true" 
                            OnPageIndexChanging="OnPageIndexChanging" style="font-family: 'Courier New'; font-weight: 700; font-size: medium" 
                        Height="55px" BorderColor="WhiteSmoke"  >
                        <Columns>
                        <asp:BoundField DataField="psno" HeaderText="PS No." SortExpression="psno" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                        <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="dept" HeaderText="Department" SortExpression="dept" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="sec" HeaderText="Section" SortExpression="sec" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />                                        
                                        <asp:BoundField DataField="totalhrs" HeaderText="Previous Month Total Hours" SortExpression="totalhrs" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        
                            
                        </Columns>
                       
                       <FooterStyle BorderWidth="2px" />
                       
<HeaderStyle BackColor="#333333" BorderWidth="2px" Font-Bold="true" ForeColor="WhiteSmoke" ></HeaderStyle>


                    </asp:GridView>
               </td>
               <td></td>
               </tr>
               <tr><td colspan = "3" class="style90"></td>
               <td class="style90" colspan = "3">
               
                    <asp:Label ID="Label1004" runat="server" Text=""></asp:Label>
               
                    </td></tr>
                </table>
                </td></tr></table>
                        </div>
                      
</asp:Content>


