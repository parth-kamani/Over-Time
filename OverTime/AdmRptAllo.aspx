<%@ Page Title="Allocation Wise Report" Language="C#" MasterPageFile="~/MasterAdm.master" AutoEventWireup="true" CodeFile="AdmRptAllo.aspx.cs" Inherits="AdmRptAllo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
        
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
            padding-left:100px;
        }
    .style120
    {
        width: 187px;
    }
    .style121
    {
    }
    .style122
    {
        width: 56px;
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
                <td colspan="9">
                <h1 align="left" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; text-decoration: underline blink;
                font-size: 28px;" class="style16">
                    Allocation Wise Summary Report
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
                        onselectedindexchanged="DropDownList1_SelectedIndexChanged" 
                        AutoPostBack="True">

                                                <asp:ListItem></asp:ListItem>
                                
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceYearSel" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT [value], [yearnme] FROM [edit_year]"></asp:SqlDataSource>
                </td>
                <td>
                 <asp:Button ID="Button1" runat="server" Text="Show Records" Font-Size="15px" Width="150px"
                                                Font-Names="Courier New" Font-Bold="True" 
                        ToolTip="Show Records" onclick="Button1_Click" AutoPostBack="True" /><br/>
                </td>
                <td colspan="4">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large;" class="style16">
                    Month:
                    <asp:DropDownList ID="DropDownList3" runat="server"
                                                 Width="110px" style="text-align: center" 
                                                ToolTip="Month"  Font-Size="Large" 
                        Font-Bold="False" Font-Names="Courier New" AppendDataBoundItems="True" 
                         DataTextField="mnthnme" 
                        DataValueField="mnthnme" AutoPostBack="True" 
                        onselectedindexchanged="DropDownList3_SelectedIndexChanged">

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
                     Allocation:
                    <asp:DropDownList ID="DropDownList2" runat="server"
                                                 Width="205px" style="text-align: center" 
                                                ToolTip="Allocation Area"  Font-Size="Large" 
                        Font-Bold="False" Font-Names="Courier New" 
                        DataSourceID="SqlDataSourceAlloSel" DataTextField="allonme" 
                        DataValueField="allonme"  AppendDataBoundItems="true" AutoPostBack="True" 
                        onselectedindexchanged="DropDownList2_SelectedIndexChanged">

                                                <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>     
                        <asp:Button ID="Button2" runat="server" Text="Show Records" Font-Size="15px" Width="150px"
                                                Font-Names="Courier New" Font-Bold="True" 
                        ToolTip="Show Records" onclick="Button2_Click" AutoPostBack="True" />
                </h1>
                <asp:SqlDataSource ID="SqlDataSourceAlloSel" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT [allonme] FROM [edit_allonme]"></asp:SqlDataSource>
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
                <div id = "tab" runat="server" visible = "false">
                    <table class="style118">
                        
                        <tr>
                        <td class="style22">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td align="right">
                                01:</td>
                            <td align="left">
                                Planned</td>
                            <td align="right">
                                05:</td>
                            <td align="left">
                                Safety</td>
                            <td align="right">
                                09:</td>
                            <td align="left">
                                Training</td>
                            <td align="right">
                                13:</td>
                            <td align="left">
                                Shutdown</td>
                                <td>&nbsp;</td>
                                <td class="style22">&nbsp;</td>
                        </tr>
                        <tr>
                        <td>&nbsp;</td>
                               <td>&nbsp;</td>
                            <td align="right">
                                02:</td>
                            <td align="left">
                                Modification</td>
                            <td align="right">
                                06:</td>
                            <td align="left">
                                Emergency</td>
                            <td align="right">
                                10:</td>
                            <td align="left">
                                Process</td>
                            <td align="right">
                                14:</td>
                            <td align="left">
                                QC</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                        </tr>
                        <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                            <td align="right">
                                03:</td>
                            <td align="left">
                                Overhauling</td>
                            <td align="right">
                                07:</td>
                            <td align="left">
                                Absenteeism</td>
                            <td align="right">
                                11:</td>
                            <td align="left">
                                Others</td>
                            <td align="right">
                                15:</td>
                            <td align="left">
                                Breakdown</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                        </tr>
                        <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                            <td align="right">
                                04:</td>
                            <td align="left">
                                Erection</td>
                            <td align="right">
                                08:</td>
                            <td align="left">
                                Against Vacancy</td>
                            <td align="right">
                                12:</td>
                            <td align="left">
                                Preventive</td>
                            <td align="right">
                                16:</td>
                            <td align="left">
                                Water Shortage</td>
                                <td>&nbsp;</td>
                                <td class="style22">&nbsp;</td>
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
                        Height="55px" BorderColor="WhiteSmoke" onrowdatabound="GridView2_RowDataBound" >
                        <Columns>
                                        <asp:BoundField DataField="dept" HeaderText="Department" SortExpression="dept" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="sec" HeaderText="Section" SortExpression="sec" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="planned" HeaderText="01" 
                                            SortExpression="planned" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="modification" HeaderText="02" 
                                            SortExpression="modification" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="overhauling" HeaderText="03" 
                                            SortExpression="overhauling" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="erection" HeaderText="04" 
                                            SortExpression="erection" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="safety" HeaderText="05" 
                                            SortExpression="safety" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="emergency" HeaderText="06" 
                                            SortExpression="emergency" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="absenteeism" HeaderText="07" 
                                            SortExpression="absenteeism" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="againstvacancy" HeaderText="08" 
                                            SortExpression="againstvacancy" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="training" HeaderText="09" 
                                            SortExpression="training" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="process" HeaderText="10" 
                                            SortExpression="process" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="others" HeaderText="11" 
                                            SortExpression="others" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="preventive" HeaderText="12" 
                                            SortExpression="preventive" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="shutdown" HeaderText="13" 
                                            SortExpression="shutdown" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="qc" HeaderText="14" SortExpression="qc" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="breakdown" HeaderText="15" 
                                            SortExpression="breakdown" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="WaterShortage" HeaderText="16" 
                                            SortExpression="WaterShortage" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
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
                     <asp:Label ID="Label1" runat="server" Text="dept" Visible="false"></asp:Label>
                    <asp:Label ID="Label3" runat="server" Text="sec" Visible="false"></asp:Label>
                    <asp:Label ID="Label2" runat="server" Text="hodemail" Visible="false"></asp:Label>
                    <asp:Label ID="Label4" runat="server" Text="year" Visible="false"></asp:Label>
                    <asp:Label ID="Label5" runat="server" Text="Yes" Visible="false"></asp:Label>
                    <asp:Label ID="Label7" runat="server" Text="year1" Visible="false"></asp:Label>
                    <asp:Label ID="Label8" runat="server" Text="year2" Visible="false"></asp:Label>
                    <asp:Label ID="Label9" runat="server" Text="month" Visible="false"></asp:Label>
                    <asp:Label ID="Label10" runat="server" Text="month1" Visible="false"></asp:Label>
                    <asp:Label ID="Label11" runat="server" Text="month2" Visible="false"></asp:Label>
                </td>
                <td>&nbsp;</td>
                </tr>
                <tr>
                <td>&nbsp;</td>
                <td colspan="8">
                 
                        <asp:GridView ID="GridView1" Width="100%" BorderWidth="3px"  
                            HeaderStyle-BackColor="#666666" HeaderStyle-ForeColor="White"
        RowStyle-BackColor="#CCCCCC" AlternatingRowStyle-BackColor="#CCCCCC" AlternatingRowStyle-ForeColor="#000000"  
        runat="server" AutoGenerateColumns="false" AllowPaging="true" 
                            OnPageIndexChanging="OnPageIndexChanging" style="font-family: 'Courier New'; font-weight: 700; font-size: medium" 
                        Height="55px" BorderColor="WhiteSmoke"  >
                        <Columns>
                                        <asp:BoundField DataField="dept" HeaderText="Department" SortExpression="dept" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="sec" HeaderText="Section" SortExpression="sec" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        <asp:BoundField DataField="totalhrs" HeaderText="Total Hours" 
                                            SortExpression="totalhrs" ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" />
                                        
                            
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
                <td>&nbsp;</td>
                </tr>
                <tr><td colspan="9"></td></tr>
                </table>
                </td>
                </tr>
                </table>
                </div>
            
            
</asp:Content>


