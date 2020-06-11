<%@ Page Title="Change Approved OT" Language="C#" MasterPageFile="~/MasterAdm.master" AutoEventWireup="true" CodeFile="AdmESerApprovedRptChange.aspx.cs" Inherits="AdmESerApprovedRptChange" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <style type="text/css">
        .style22
        {
            width: 316px;
        }
        .style24
        {
        }
        .style26
        {
            padding-left: 60px;
            font-size: medium;
        }
        .style27
        {
            width: 187px;
            font-size: small;
        }
        .style28
        {
            font-size: small;
        }
        .style29
        {
            padding-left: 60px;
            font-size: small;
        }
        .style91
        {
            height: 332px;
            width: 400px;
            vertical-align: bottom;
        }
        .style92
        {
            width: 397px;
        }
        .style93
        {
            width: 187px;
            height: 19px;
        }
        .style94
        {
            height: 19px;
        }
        .style95
        {
            width: 397px;
            height: 19px;
        }
        .style97
        {
            width: 187px;
        }
        .style98
        {
            font-size: medium;
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
                <h1 align="left" style="font-family: 'Courier New'; font-weight: bold; font-style: normal; font-variant: normal; text-transform: none; color: #102030; text-decoration: underline blink; font-size: 28px;" class="style16">
                    Approved OT Change By Time Office Form
                    </h1>
                <table bgcolor="#CCCCCC" width="60%" align="left" style="height: 197px"  >
                <tr>
                <td class="style27" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030;" class="style29">
                    Sr No.:
                </h1>
                </td>
                <td class="style24">
                    
                    <asp:DropDownList ID="DropDownList20" runat="server"
                                                 Width="205px" style="text-align: center; font-size: small;" 
                                                ToolTip="Serial Number"  Font-Size="Large" 
                        Font-Bold="False" Font-Names="Courier New" AutoPostBack="True" 
                        DataSourceID="SqlDataSourceSrSel" DataTextField="srno" 
                        DataValueField="srno" AppendDataBoundItems="true" 
                        onselectedindexchanged="DropDownList20_SelectedIndexChanged">

                                                <asp:ListItem></asp:ListItem>
                                
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceSrSel" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        
                        
                        
                        
                        SelectCommand="SELECT [srno] FROM [otentrytable] WHERE ([toapprove] = @toapprove)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="Label3" Name="toapprove" PropertyName="Text" 
                                Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  
                        ErrorMessage="*" ForeColor="#CC0000" ControlToValidate="DropDownList20"></asp:RequiredFieldValidator>
                </td>
                </tr>
                <tr>
                <td class="style13,style16" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                " class="style29">
                    PS Number:
                </h1>
                </td>
                <td class="style92">
                    <asp:TextBox ID="TextBox1" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center; font-size: small;" 
                                                ToolTip="Employee's PS No." Font-Size="Large" 
                        CssClass="style98" BackColor="Silver" ReadOnly="true"></asp:TextBox>
                </td>
                <td class="style26" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal; font-variant: normal; text-transform: none; color: #102030;" class="style29">
                    Date:
                </h1>
                </td>
                <td class="style92">
                    <asp:TextBox ID="TextBox9" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center; font-size: small;" 
                                                ToolTip="Date Of O.T" Font-Size="Large" BackColor="Silver" ReadOnly="true"
                         CssClass="style98"></asp:TextBox>
                </td>
                </tr>
                <tr>
                <td class="style22" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                " class="style29">
                    Name:
                </h1>
                </td>
                <td class="style92">
                    <asp:TextBox ID="TextBox2" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center; font-size: small;" 
                                                ToolTip="Employee's Name"  Font-Size="Large" 
                        CssClass="style98" BackColor="Silver" ReadOnly="true"></asp:TextBox>
                </td>
                <td class="style27" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal; font-variant: normal; text-transform: none; color: #102030;" class="style29">
                    Original Shift:
                </h1>
                </td>
                <td class="style24">
                    <asp:TextBox ID="TextBox12" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center; font-size: small;" 
                                                ToolTip="Employee's Original Shift"  
                        Font-Size="Large" CssClass="style98" BackColor="Silver" ReadOnly="true"></asp:TextBox>
                </td>
                </tr>
                <tr>
                <td class="style26" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                " class="style29">
                    Designation:
                </h1>
                </td>
                <td class="style92">
                    <asp:TextBox ID="TextBox3" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center; font-size: small;" 
                                                ToolTip="Employee's Designation"  
                        Font-Size="Large" CssClass="style98" BackColor="Silver" ReadOnly="true"></asp:TextBox>
                </td>
                <td class="style27" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal; font-variant: normal; text-transform: none; color: #102030;" class="style29">
                    O.T Shift:
                </h1>
                </td>
                <td class="style24">
                    <asp:TextBox ID="TextBox13" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center; font-size: small;" 
                                                ToolTip="Employee's O.T Shift"  Font-Size="Large" 
                        CssClass="style98" BackColor="Silver" ReadOnly="true"></asp:TextBox>
                </td>
                </tr>
                <tr>
                <td class="style26" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030;" class="style29">
                    Department:
                </h1>
                </td>
                <td class="style92">
                    <asp:TextBox ID="TextBox5" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center; font-size: small;" 
                                                ToolTip="Employee's Department"  Font-Size="Large" 
                        CssClass="style98" BackColor="Silver" ReadOnly="true"></asp:TextBox>
                    
                </td>
                <td class="style27" align="left">
                                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                                    font-variant: normal; text-transform: none; color: #102030; text-align: right;
                                    width: 197px;" class="style28">
                                    O.T Timing From:</h1>
                            </td>
                            <td class="style116" align="left">
                                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                                    font-variant: normal; text-transform: none; color: #102030; font-size: large;
                                    text-align: left; width: 229px;" class="style30">
                                     <asp:TextBox ID="TextBox21" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="80px" style="text-align: center; font-size: small;" 
                                                ToolTip="O.T Time From"  Font-Size="Large" 
                        CssClass="style98" BackColor="Silver" ReadOnly="true"></asp:TextBox>
                                    
                                    <span class="style28">&nbsp;To: </span>
                                    <asp:TextBox ID="TextBox22" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="80px" style="text-align: center; font-size: small;" 
                                                ToolTip="O.T Time To"  Font-Size="Large" 
                        CssClass="style98" BackColor="Silver" ReadOnly="true"></asp:TextBox>
                                    </h1>
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownList21" runat="server" Visible="false">
                                 <asp:ListItem></asp:ListItem>
                                     <asp:ListItem> A Shift</asp:ListItem>
                                     <asp:ListItem> B Shift</asp:ListItem>
                                     <asp:ListItem> C Shift</asp:ListItem>
                                     <asp:ListItem> General Shift</asp:ListItem>
                                     <asp:ListItem> Weakly Off</asp:ListItem>
                                     <asp:ListItem> Paid Holiday</asp:ListItem>
                                     <asp:ListItem> Others</asp:ListItem>
                                </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                <td class="style26" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030;" class="style29">
                    Section:
                </h1>
                </td>
                <td class="style92">
                    <asp:TextBox ID="TextBox6" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center; font-size: small;" 
                                                ToolTip="Department's Section"  Font-Size="Large" 
                        CssClass="style98" BackColor="Silver" ReadOnly="true"></asp:TextBox>
                    
                </td>
                <td class="style27" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030;" class="style29">
                    Lunch Deduction:
                </h1>
                </td>
                <td class="style24">
                    <asp:TextBox ID="TextBox18" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center; font-size: small;" 
                                                ToolTip="Lunch Deduction"  
                        Font-Size="Large" CssClass="style98" BackColor="Silver" ReadOnly="true"></asp:TextBox>
                    
                    
                </td>
                <td>
                <asp:TextBox ID="TextBox20" runat="server" Visible="false"></asp:TextBox>
                <asp:TextBox ID="TextBox27" runat="server" Width="50px" ReadOnly = "true" BackColor = "Silver" Visible = "false"></asp:TextBox>
                                <asp:TextBox ID="TextBox28" runat="server" Width="50px" ReadOnly = "true" BackColor = "Silver" Visible = "false"></asp:TextBox>
                                <asp:TextBox ID="TextBox19" runat="server" Width="50px"  Visible="false"></asp:TextBox>
                                <asp:TextBox ID="TextBox200" runat="server" Width="50px" Visible="false"></asp:TextBox>
                                <asp:TextBox ID="TextBox201" runat="server" Width="50px" Visible="false"></asp:TextBox>
                </td>
                </tr>
                <tr>
                <td class="style26" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                " class="style29">
                    Area:
                </h1>
                </td>
                <td class="style92">
                    <asp:TextBox ID="TextBox7" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center; font-size: small;" 
                                                ToolTip="Employee's Working Area"  
                        Font-Size="Large" CssClass="style98" BackColor="Silver" ReadOnly="true"></asp:TextBox>
                    
                </td>
                <td class="style27" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030;" class="style29">
                    Total Hours:
                </h1>
                </td>
                <td class="style24">
                    <asp:TextBox ID="TextBox17" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center; font-size: small;" 
                                                ToolTip="Total Hours Employee Worked"  
                        Font-Size="Large" CssClass="style98" BackColor="Silver" ReadOnly="true"></asp:TextBox>
                </td>
                <td rowspan="9" >
                    <img class="style91" src="images/ts-slider-img2.png" /></td>
                </tr>
                <tr>
                <td class="style26" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                " class="style29">
                    Cost Center Code:
                </h1>
                </td>
                <td class="style92">
                    <asp:TextBox ID="TextBox8" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center; font-size: small;" 
                                                ToolTip="Department's Cost Center Code "  BackColor="Silver" ReadOnly="true"
                        Font-Size="Large" CssClass="style98"></asp:TextBox>
                    
                </td>

                <td class="style26" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; width: 69px;" 
                        class="style29">
                    Absent Person PS No.:
                </h1>
                </td>
                <td class="style92">
                    <asp:TextBox ID="TextBox4" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center; font-size: small;" 
                                                ToolTip="Absent Employee's PS No." Font-Size="Large" BackColor="Silver" ReadOnly="true"
                        CssClass="style98"></asp:TextBox>
                </td>
                        
                </tr>
                <tr>
                <td class="style26" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                " class="style29">
                    Allocatin(KPI):
                </h1>
                </td><td class="style92">
                     <asp:DropDownList ID="DropDownList1" runat="server" Width="205px" Style="text-align: center;
                                    font-size: small;" ToolTip="Employee's Allocation" Font-Size="Large" Font-Bold="False"
                                    Font-Names="Courier New" CssClass="style28" TabIndex="8" 
                                    AppendDataBoundItems="True" DataSourceID="SqlDataSourceAlloSel" 
                                    DataTextField="allonme" DataValueField="allonme" 
                                    onselectedindexchanged="DropDownList1_SelectedIndexChanged" 
                                    AutoPostBack="True" BackColor="Silver">
                                    <asp:ListItem></asp:ListItem>
                                    
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceAlloSel" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                    SelectCommand="SELECT [allonme] FROM [edit_allonme]"></asp:SqlDataSource></td>
                <td class="style26" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                " class="style29">
                    Absent Person Name:
                </h1>
                </td>
                <td class="style92">
                    <asp:TextBox ID="TextBox14" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center; font-size: small;" 
                                                ToolTip="Absent Employee's Name" Font-Size="Large" 
                        CssClass="style98" BackColor="Silver" ReadOnly="true"></asp:TextBox>
                </td>
                
                </tr>
                
                <tr>
                <td class="style27" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                " class="style29">
                    Work Assign:
                </h1>
                </td>
                <td class="style20">
                    <asp:TextBox ID="TextBox11" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center; font-size: small;" 
                                                ToolTip="Work Assign To Employee"  
                        Font-Size="Large" CssClass="style28" TextMode="MultiLine" BackColor="Silver" ReadOnly="true"></asp:TextBox>
                </td>
                <td class="style27" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                " class="style29">
                    User Remarks:
                </h1>
                </td>
                <td class="style24">
                    <asp:TextBox ID="TextBox15" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center; font-size: small;" 
                                                ToolTip="Remark for Employee"  Font-Size="Large" BackColor="Silver" ReadOnly="true"
                        CssClass="style98" TextMode="MultiLine"></asp:TextBox>
                </td>
                </tr>
                
                <tr>
                
                <td class="style27" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                " class="style29">
                    Previous O.T:</h1>
                </td>
                <td class="style24">
                    
                    <asp:DropDownList ID="DropDownList5" runat="server" AutoPostBack="True" BackColor="Silver"
                                                 Width="205px" style="text-align: center; font-size: small;" 
                                                ToolTip="Employee's Previous O.T"  Font-Size="Large" 
                        Font-Bold="False" Font-Names="Courier New" CssClass="style28">

                                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>No</asp:ListItem>
                                <asp:ListItem>Yes</asp:ListItem>
                    </asp:DropDownList>
                       </td>
                <td class="style122" align="left">
                                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                                    font-variant: normal; text-transform: none; color: #102030;" class="style29">
                                    Approval:
                                </h1>
                            </td>
                            <td class="style125">
                                <asp:DropDownList ID="DropDownList6" runat="server" Width="200px" Style="text-align: center;
                                    margin-right: 0px; font-size: small;" ToolTip="Approval"
                                    Font-Size="Large" Font-Bold="False" Font-Names="Courier New" 
                                    CssClass="style28" TabIndex="13" AutoPostBack="True"
                                    onselectedindexchanged="DropDownList9_SelectedIndexChanged">
                                    <asp:ListItem></asp:ListItem>
                                    <asp:ListItem Value="No">No</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*"
                                    ForeColor="#CC0000" ControlToValidate="DropDownList6"></asp:RequiredFieldValidator>
                            </td>
                </tr>
                <tr>
                <td class="style27" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                text-align: center;" class="style29">
                    Paid Month:</h1>
                
                    
                    <span class="style28">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                
                    
                    </span>
                
                    
                    <asp:DropDownList ID="DropDownList10" runat="server"
                                                 Width="112px" style="text-align: center; font-size: small;" 
                                                ToolTip="Employee's O.T Paid Month"  Font-Size="Large" 
                        Font-Bold="False" Font-Names="Courier New" CssClass="style28" AutoPostBack="True" BackColor="Silver">

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
                <td class="style24" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                text-align: center;" class="style29">
                    Paid Year:&nbsp;&nbsp; 
                </h1>
                
                    
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                
                    
                    <asp:DropDownList ID="DropDownList11" runat="server"
                                                 Width="110px" style="text-align: center; font-size: small;" 
                                                ToolTip="Employee's O.T Paid Year"  Font-Size="Large" 
                        Font-Bold="False" Font-Names="Courier New" CssClass="style28" 
                        DataSourceID="SqlDataSourceYearSel" DataTextField="yearnme" 
                        DataValueField="yearnme" AppendDataBoundItems="true" AutoPostBack="True" BackColor="Silver">

                                                <asp:ListItem></asp:ListItem>
                                
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceYearSel" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT [yearnme] FROM [edit_year]"></asp:SqlDataSource>
                </td>
                 <td class="style27" align="left">
                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                " class="style29">
                    Time Office Remarks:
                </h1>
                </td>
                <td class="style24">
                    <asp:TextBox ID="TextBox16" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                                 Width="200px" style="text-align: center; font-size: small;" 
                                                ToolTip="Time Office Remark for Employee"  
                        Font-Size="Large" CssClass="style98" TextMode="MultiLine" 
                        ontextchanged="TextBox16_TextChanged" AutoPostBack="True" BackColor="Silver"></asp:TextBox>
                </td>       
                    </tr>
                <tr><td colspan="4" align="center" style="text-align: right">
                    <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"
                        style="color: #CC0000; font-family: 'Courier New'"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;
                
                &nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" Text="Submit" Font-Size="15px" Width="100px"
                                                Font-Names="Courier New" Font-Bold="True" 
                        ToolTip="Submit Record" onclick="Button2_Click" />
                &nbsp;&nbsp;
                
                </td>
                    </tr>
                    <tr><td class="style93"><asp:Label ID="Label12" runat="server" Text="Label" Visible = "false"></asp:Label>
                                </td><td class="style94"><asp:Label ID="Label13" runat="server" Text="Label" Visible = "false"></asp:Label>
                                <asp:Label ID="Label4" runat="server" Text="Label" Visible = "false"></asp:Label>
                                <asp:Label ID="Label5" runat="server" Text="Label" Visible = "false"></asp:Label></td><td class="style94">
                        <asp:Label ID="Label3" runat="server" Text="Yes" Visible="false"></asp:Label>
                        <asp:Label ID="Label6" runat="server" Text="Yes" Visible="false"></asp:Label>
                        <asp:Label ID="Label7" runat="server" Text="No" Visible="false"></asp:Label>
                        <asp:Label ID="Label2" runat="server" Text="N" Visible="false"></asp:Label>
                        </td>
                        <td class="style95">
                      
                        </td></tr>
                    <tr><td class="style97"></td><td class="style24"></td><td></td><td class="style92"></td></tr>
                </table>
                        </td>
                    </tr>
                </table>
                </ContentTemplate>
            
        </asp:UpdatePanel>
        </td></tr></table>
                </div>
</asp:Content>


