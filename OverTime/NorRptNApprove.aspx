<%@ Page Title="Non-Approved Report" Language="C#" MasterPageFile="~/MasterNor.master" AutoEventWireup="true" CodeFile="NorRptNApprove.aspx.cs" Inherits="NorRptNApprove"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    
    .style22
    {
        text-align: left;
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
    <%--<asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
            <ContentTemplate>--%>
         <table border="1px" width="100%" align="center" frame="border" bgcolor="#FFFFFF">
            <tr>
                <td bgcolor="#CCCCCC" class="style13">
                <table>
                <tr>
                <td colspan="6">
                <h1 align="left" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; text-decoration: underline blink;
                font-size: 28px;" class="style16">
                    Non-Approve Report
                   </h1>
                </td>
                </tr>
                <tr>
                <td style="text-align: left; padding-left:60px;" colspan="8">
                                     <asp:Button ID="Button3" runat="server" Text="Export To Exel" 
                        Font-Size="20px" Width="250px"
                                                Font-Names="Courier New" Font-Bold="True" 
                        ToolTip="Export Curret Report To Exel" Height="30px" onclick="Button3_Click" />
                
                </td>
                </tr>
                <tr>
                <td class="style22">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large;" class="style16">
                    From:
                </h1>
                </td>
                <td class="style22">
                    <asp:TextBox ID="TextBox1" runat="server" 
                        style="font-size: large; font-family: 'Courier New'; text-align: center;" 
                        type= "date" ontextchanged="TextBox1_TextChanged" ToolTip="Date From"></asp:TextBox>
                    <asp:TextBox ID="TextBox6" runat="server" Visible="False"></asp:TextBox>
                    
                    
                </td>
                
                <td class="style22">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large;" class="style16">
                    To:
                </h1>
                </td>
                <td class="style22">
                    <asp:TextBox ID="TextBox2" runat="server" 
                        style="font-size: large; font-family: 'Courier New'; text-align: center;" 
                        type= "date" ontextchanged="TextBox2_TextChanged" ToolTip="Date To"></asp:TextBox>

                    <asp:TextBox ID="TextBox7" runat="server" Visible="False" Height="19px"></asp:TextBox>
                    
                </td>
                
                <td class="style22">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large;" class="style16">
                    Section:
                </h1>
                </td>
                <td class="style22">
                    <asp:DropDownList ID="DropDownList2" runat="server"
                                                 Width="205px" style="text-align: center" 
                                                ToolTip="Department"  Font-Size="Large" 
                        Font-Bold="False" Font-Names="Courier New" 
                         DataTextField="sec" 
                        DataValueField="sec" AutoPostBack="True" 
                        DataSourceID="SqlDataSourceSecSel" AppendDataBoundItems="True" 
                        onselectedindexchanged="DropDownList2_SelectedIndexChanged" >
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                    
                    <asp:SqlDataSource ID="SqlDataSourceSecSel" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT [sec] FROM [deptsec] WHERE ([dept] = @dept)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="Label6" Name="dept" PropertyName="Text" 
                                Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    
                    <asp:TextBox ID="TextBox9" runat="server" ontextchanged="TextBox2_TextChanged" 
                        Visible="False"></asp:TextBox>
                </td>
                <td class="style22">
                 <asp:Button ID="Button1" runat="server" Text="Show Records" Font-Size="15px" Width="150px"
                                                Font-Names="Courier New" Font-Bold="True" 
                        ToolTip="Show Records of Department" onclick="Button1_Click" />
                </td>
                <td class="style117">
                    <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                    </td>
                </tr>
                    <tr><td><div id = "norec" runat="server" visible = "false">
                <table class="style118">
                        <tr>
                        <td colspan = "9" align="center"><asp:Label ID="Label2" runat="server" Text="No Records" 
                        style="font-family: 'Courier New'; font-weight: 700; color: #CC0000; font-size: medium"></asp:Label></td>
                        </tr>
                        </table>
                 </div>
                 </td></tr>
   <tr><td></td></tr>
   <tr><td></td></tr>
                <tr>
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
                            <asp:BoundField DataField="hosdapprove" HeaderText="HOD/HOS Approve" SortExpression="hosdapprove" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px"/>
                            <asp:BoundField DataField="hosdremark" HeaderText="HOD/HOS Remark" SortExpression="hosdremark" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px"/>
                            <asp:BoundField DataField="toapprove" HeaderText="Time Office Approve" SortExpression="toapprove" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px"/>
                            <asp:BoundField DataField="toremark" HeaderText="Time Office Remark" SortExpression="toremark" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px"/>
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
                    <asp:Label ID="Label5" runat="server" Text="No" Visible="False"></asp:Label>
                    <asp:Label ID="Label6" runat="server" Text="dept" Visible="False"></asp:Label>
                    <asp:Label ID="Label7" runat="server"  Text= "N" Visible="False"></asp:Label>
                </td>
                </tr>
                </table>
                </td>
            </tr>
        </table>
        <%--</ContentTemplate>
            
        </asp:UpdatePanel> --%>
                <br />
                </div>
</asp:Content>




