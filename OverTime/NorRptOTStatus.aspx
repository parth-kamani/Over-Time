<%@ Page Title="OT Status Report" Language="C#" MasterPageFile="~/MasterNor.master" AutoEventWireup="true" CodeFile="NorRptOTStatus.aspx.cs" Inherits="NorRptOTStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
                <td colspan="6">
                <h1 align="left" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; text-decoration: underline blink;
                font-size: 28px;" class="style16">
                    Over Time Status Report
                   </h1>
                </td>
                </tr>
                <tr>
                <td style="text-align: left; padding-left:60px;" colspan="8">
                                     <asp:Button ID="Button3" runat="server" Text="Export To Exel" 
                        Font-Size="20px" Width="250px" Font-Names="Courier New" Font-Bold="True" 
                        ToolTip="Export Curret Report To Exel" Height="30px" onclick="Button3_Click" />
                
                </td>
                </tr>
                <tr>
                <td>
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large; width: 120px;" class="style16">
                    Date From:
                </h1>
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" 
                        style="font-size: large; font-family: 'Courier New'; text-align: center;" 
                        type="date" ontextchanged="TextBox1_TextChanged" ToolTip="Date From"></asp:TextBox>
                    <asp:TextBox ID="TextBox6" runat="server" Visible="False"></asp:TextBox>
                </td><td>
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large;" class="style16">
                    To:
                </h1>
                </td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" 
                        style="font-size: large; font-family: 'Courier New'; text-align: center;" 
                        type="date" ontextchanged="TextBox2_TextChanged" ToolTip="Date From"></asp:TextBox>
                    <asp:TextBox ID="TextBox7" runat="server" Visible="False"></asp:TextBox>
                </td>
                
                <td>
                 <asp:Button ID="Button2" runat="server" Text="Show Records" Font-Size="15px" Width="150px"
                                                Font-Names="Courier New" Font-Bold="True"
                        ToolTip="Show Records" onclick="Button1_Click" />
                    <br />
                    <asp:TextBox ID="TextBox8" runat="server" type="date" 
                        DataFormatString = "{0:dd/MM/yyyy}" Visible="False"></asp:TextBox>
                </td>
                <td class="style117">
                    <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                    </td>
                </tr><tr><td><div id = "norec" runat="server" visible = "false">
                <table class="style118">
                        <tr>
                        <td colspan = "9" align="center"><asp:Label ID="Label2" runat="server" Text="No Records" 
                        style="font-family: 'Courier New'; font-weight: 700; color: #CC0000; font-size: medium"></asp:Label></td>
                        </tr>
                        </table>
                 </div>
                 </td></tr>
                 
   <tr><td>&nbsp<br/></td></tr>
   <tr><td>&nbsp<br/></td></tr>
                <td colspan="8">
                    <asp:GridView ID="GridView2" Width="100%" BorderWidth="3px"  HeaderStyle-BackColor="#666666" HeaderStyle-ForeColor="White"
        RowStyle-BackColor="#CCCCCC" AlternatingRowStyle-BackColor="#CCCCCC" AlternatingRowStyle-ForeColor="#000000"  
        runat="server" AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="OnPageIndexChanging" style="font-family: 'Courier New'; font-weight: 700; font-size: medium" 
                        Height="55px" BorderColor="WhiteSmoke">
                       
                        <Columns>
                            <asp:BoundField DataField="srno" HeaderText="Sr No." SortExpression="srno" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                            <asp:BoundField DataField="psno" HeaderText="PS No." SortExpression="psno" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px"/>
                            <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px"/>
                            <asp:BoundField DataField="shift" HeaderText="Shift" SortExpression="shift" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px"/>
                            <asp:BoundField DataField="otshift" HeaderText="OT Shift" SortExpression="otshift" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px"/>
                            <asp:BoundField DataField="area" HeaderText="Area" SortExpression="area" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px"/>
                            <asp:BoundField DataField="otentrydt" HeaderText="OT Date" SortExpression="otentrydt" DataFormatString = "{0:dd/MM/yyyy}" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px"/>
                            <asp:BoundField DataField="allocation" HeaderText="Allocation" SortExpression="allocaion" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px"/>
                            <asp:BoundField DataField="totalhrs" HeaderText="Total Hours" SortExpression="totalhrs" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px"/>
                            <asp:BoundField DataField="lunchded" HeaderText="Lunch Deduction" SortExpression="lunchded" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px"/>
                            <asp:BoundField DataField="usrremark" HeaderText="User Remark" SortExpression="usrremark" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px"/>
                            <asp:BoundField DataField="replacepsno" HeaderText="Replace PS No." SortExpression="replacepsno" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px"/>
                            <asp:BoundField DataField="replacename" HeaderText="Replace Name" SortExpression="replacename" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px"/>
                        </Columns>
                       
                        <FooterStyle BorderWidth="2px" />
                       
<HeaderStyle BackColor="#333333" BorderWidth="2px"></HeaderStyle>
                    </asp:GridView>
                    <%--<asp:SqlDataSource ID="SqlDataSourceotStatusRpt" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        
                        
                        SelectCommand="SELECT [srno], [uid] FROM [otentrytable] WHERE ([sec] = @sec) AND ()">
                        <SelectParameters>
                            
                            <asp:ControlParameter ControlID="DropDownList2" Name="sec" 
                                PropertyName="SelectedValue" Type="String" />
                            
                        </SelectParameters>
                    </asp:SqlDataSource>--%>
                    <asp:Label ID="Label5" runat="server" Text="Yes" Visible="False"></asp:Label>
                    <asp:Label ID="Label6" runat="server" Text="dept" Visible="False"></asp:Label>
                    <asp:Label ID="Label7" runat="server" Text="sec" Visible="False"></asp:Label>
                </td>
                </tr>
                </table>
                </td>
            </tr>
        </table>
                <br />
                </div>
</asp:Content>


