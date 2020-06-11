<%@ Page Title="TO Before Approve Report" Language="C#" MasterPageFile="~/MasterAdm.master" AutoEventWireup="true" CodeFile="AdmRptTOBApprove.aspx.cs" Inherits="AdmRptTOBApprove" %>

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
                <td colspan="9">
                <h1 align="left" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; text-decoration: underline blink;
                font-size: 28px;" class="style16">
                    Time Office Before Approve Summary Report
                   </h1>
                </td>
                </tr>
                <tr>
                <td style="text-align: left; padding-left:60px;" colspan="9">
                                     <asp:Button ID="Button3" runat="server" Text="Export To Exel" 
                        Font-Size="20px" Width="250px"
                                                Font-Names="Courier New" Font-Bold="True" 
                        ToolTip="Export Curret Report To Exel" Height="30px" onclick="Button3_Click" AutoPostBack="True" />
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
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large;" class="style16">
                    Department:
                </h1>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList5" runat="server"
                                                 Width="205px" style="text-align: center" 
                                                ToolTip="Department"  Font-Size="Large" 
                        Font-Bold="False" Font-Names="Courier New" AppendDataBoundItems="True" 
                         DataTextField="dept" 
                        DataValueField="dept" AutoPostBack="True" DataSourceID="SqlDataSource1" 
                        onselectedindexchanged="DropDownList5_SelectedIndexChanged">

                                                <asp:ListItem></asp:ListItem>
                                                
                                
                    </asp:DropDownList>
                     
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT DISTINCT [dept] FROM [depthead]"></asp:SqlDataSource>
                </td>
                <td class="style121">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large;" class="style16">
                    Section: 
                </h1>
                </td>
                <td class="style122">
                    <asp:DropDownList ID="DropDownList6" runat="server"
                                                 Width="205px" style="text-align: center" 
                                                ToolTip="Section"  Font-Size="Large" 
                        Font-Bold="False" Font-Names="Courier New" 
                        DataSourceID="SqlDataSource2" DataTextField="sec" 
                        DataValueField="sec"  AppendDataBoundItems="True">

                                                <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>       
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT [sec] FROM [deptsec] WHERE ([dept] = @dept)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList5" Name="dept" 
                                PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td class="style120">
                    <br/>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                </tr>
                <tr>
                <td>
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large;" class="style16">
                    Year:
                </h1>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server"
                                                 Width="110px" style="text-align: center" 
                                                ToolTip="Year"  Font-Size="Large" 
                        Font-Bold="False" Font-Names="Courier New" AppendDataBoundItems="True" 
                        DataSourceID="SqlDataSourceYearSel" DataTextField="yearnme" 
                        DataValueField="yearnme" 
                        onselectedindexchanged="DropDownList1_SelectedIndexChanged" >

                                                <asp:ListItem></asp:ListItem>
                                
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceYearSel" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT [value], [yearnme] FROM [edit_year]"></asp:SqlDataSource>
                </td>
                <td>
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large;" class="style16">
                    Month:
                </h1>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList2" runat="server"
                                                 Width="110px" style="text-align: center" 
                                                ToolTip="Month"  Font-Size="Large" 
                        Font-Bold="False" Font-Names="Courier New" AppendDataBoundItems="True" 
                         DataTextField="mnthnme" 
                        DataValueField="mnthnme" AutoPostBack="True" 
                        onselectedindexchanged="DropDownList2_SelectedIndexChanged">

                                                <asp:ListItem></asp:ListItem>
                                                <asp:ListItem Value="January">January</asp:ListItem>
            <asp:ListItem Value="February" >February</asp:ListItem>
            <asp:ListItem Value="March">March</asp:ListItem>
            <asp:ListItem Value="April">April</asp:ListItem>
            <asp:ListItem Value="May">May</asp:ListItem>
            <asp:ListItem Value="June">June</asp:ListItem>
            <asp:ListItem Value="July">July</asp:ListItem>
            <asp:ListItem Value="August">August</asp:ListItem>
            <asp:ListItem Value="September">September</asp:ListItem>
            <asp:ListItem Value="October">October</asp:ListItem>
            <asp:ListItem Value="November">November</asp:ListItem>
            <asp:ListItem Value="December">December</asp:ListItem>
                                
                    </asp:DropDownList>
                </td>
                
                <td>
                 <asp:Button ID="Button2" runat="server" Text="Show Records" Font-Size="15px" Width="150px"
                                                Font-Names="Courier New" Font-Bold="True" 
                        ToolTip="Show Records" onclick="Button2_Click" AutoPostBack="True" /><br/>
                </td>
                <td class="style22">
                
                </td>
                <td>&nbsp;</td>
                <td colspan = "2">&nbsp;</td>
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
                </td></tr>
                <tr>
                <td>&nbsp;</td>
                <td colspan="8">
                 <asp:GridView ID="GridView2" Width="100%" BorderWidth="3px"  
                            HeaderStyle-BackColor="#666666" HeaderStyle-ForeColor="White"
        RowStyle-BackColor="#CCCCCC" AlternatingRowStyle-BackColor="#CCCCCC" AlternatingRowStyle-ForeColor="#000000"  
        runat="server" AutoGenerateColumns="false" AllowPaging="true" 
                            OnPageIndexChanging="OnPageIndexChanging" style="font-family: 'Courier New'; font-weight: 700; font-size: medium" 
                        Height="55px" BorderColor="WhiteSmoke" Visible = "false">
                        <Columns>
                                        <asp:BoundField DataField="srno" HeaderText="SR No." SortExpression="srno" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="psno" HeaderText="PS No." SortExpression="psno" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="dept" HeaderText="Department" SortExpression="dept" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="sec" HeaderText="Section" SortExpression="sec" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="otentrydt" HeaderText="OT Entry Date" SortExpression="otentrydt" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="allocation" HeaderText="Allocation" SortExpression="allocation" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="totalhrs" HeaderText="Total Hours" SortExpression="totalhrs" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="hosdapprove" HeaderText="HOD/HOS Approve" SortExpression="hosdapprove" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="toapprove" HeaderText="TO Approve" SortExpression="toapprove" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                            
                        </Columns>
                       
                       <FooterStyle BorderWidth="2px" />
                       
<HeaderStyle BackColor="#333333" BorderWidth="2px" Font-Bold="true" ForeColor="WhiteSmoke" ></HeaderStyle>


                    </asp:GridView>
                        <asp:GridView ID="GridView1" Width="100%" BorderWidth="3px"  
                            HeaderStyle-BackColor="#666666" HeaderStyle-ForeColor="White"
        RowStyle-BackColor="#CCCCCC" AlternatingRowStyle-BackColor="#CCCCCC" AlternatingRowStyle-ForeColor="#000000"  
        runat="server" AutoGenerateColumns="false" AllowPaging="true" 
                            OnPageIndexChanging="OnPageIndexChanging" style="font-family: 'Courier New'; font-weight: 700; font-size: medium; display:none; position:relative; padding-left:0px; overflow:hidden" 
                        Height="55px" BorderColor="WhiteSmoke" >
                        <Columns>
                                        <asp:BoundField DataField="srno" HeaderText="SR No." SortExpression="srno" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="uid" HeaderText="User ID" SortExpression="uid" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="psno" HeaderText="PS No." SortExpression="psno" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="dept" HeaderText="Department" SortExpression="dept" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="desig" HeaderText="Designation" SortExpression="desig" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="shift" HeaderText="Original Shift" SortExpression="shift" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />                                        
                                        <asp:BoundField DataField="otshift" HeaderText="OT Shift" SortExpression="otshift" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="costcentre" HeaderText=" Cost Center Code" SortExpression="costcentre" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="sec" HeaderText="Section" SortExpression="sec" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="area" HeaderText="Area" SortExpression="area" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="otentrydt" HeaderText="OT Entry Date" SortExpression="otentrydt" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="allocation" HeaderText="Allocation" SortExpression="allocation" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="replacepsno" HeaderText="Replace Person PS No." SortExpression="replacepsno" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="replacename" HeaderText="Replace Person Name" SortExpression="replacename" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="ottimefrom" HeaderText="OT Time From" SortExpression="ottimefrom" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="ottimeto" HeaderText="OT Time To" SortExpression="ottimeto" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="totalhrs" HeaderText="Total Hours" SortExpression="totalhrs" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="lunchded" HeaderText="Lunch Deduction" SortExpression="lunchded" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="assignwrk" HeaderText="Assigned Work" SortExpression="assignwrk" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="usrremark" HeaderText="User Remark" SortExpression="usrremark" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="hosdapprove" HeaderText="HOD/HOS Approve" SortExpression="hosdapprove" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="hosdremark" HeaderText="HOD/HOS Remark" SortExpression="hosdremark" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="previousot" HeaderText="Previous OT" SortExpression="previousot" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="paidmonth" HeaderText="Paid Month" SortExpression="paidmonth" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="paidyear" HeaderText="Paid Year" SortExpression="paidyear" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="authoperson" HeaderText="TO Approver Name" SortExpression="authoperson" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="toapprove" HeaderText="TO Approve" SortExpression="toapprove" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="toremark" HeaderText="TO Remark" SortExpression="toremark" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="toamnt" HeaderText="TO Approve Month" SortExpression="toamnt" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="toayear" HeaderText="TO Approve Year" SortExpression="toayear" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        
                            
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
                </td>
                </tr>
                <tr>
                <td>&nbsp;</td>
                <td colspan="8">
                 
                     <asp:Label ID="Label1" runat="server" Text="dept" Visible="false"></asp:Label>
                    <asp:Label ID="Label3" runat="server" Text="sec" Visible="false"></asp:Label>
                    <asp:Label ID="Label2" runat="server" Text="hodemail" Visible="false"></asp:Label>
                    <asp:Label ID="Label4" runat="server" Text="year" Visible="false"></asp:Label>
                    <asp:Label ID="Label5" runat="server" Text="N" Visible="false"></asp:Label>
                    <asp:Label ID="Label7" runat="server" Text="year1" Visible="false"></asp:Label>
                    <asp:Label ID="Label8" runat="server" Text="year2" Visible="false"></asp:Label>
                    <asp:Label ID="Label9" runat="server" Text="month" Visible="false"></asp:Label>
                    <asp:Label ID="Label10" runat="server" Text="month1" Visible="false"></asp:Label>
                    <asp:Label ID="Label11" runat="server" Text="month2" Visible="false"></asp:Label>
                     <asp:Label ID="Label12" runat="server" Text="dt1" Visible="false"></asp:Label>
                      <asp:Label ID="Label13" runat="server" Text="dt2" Visible="false"></asp:Label>
                </td>
                </tr>
                <tr><td colspan="9"></td></tr>
                <tr><td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>
                </td>
                <td></td>
                <td></td>
                <td></td>
                </tr>
                </table>  
                        </td>
                    </tr>
                </table>
                </div>
</asp:Content>


