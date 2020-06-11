<%@ Page Title="Apply OverTime" Language="C#" MasterPageFile="~/MasterHosd.master" AutoEventWireup="true" CodeFile="HosdSerApplyOT.aspx.cs" Inherits="HosdSerApplyOT" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <style type="text/css">
        .style26
        {
            padding-left: 60px;
            font-size: medium;
        }
        .style27
        {
            width: 206px;
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
            height: 362px;
            width: 472px;
            vertical-align: bottom;
        }
        .style92
        {
            width: 430px;
        }
        .style94
        {
            height: 19px;
            width: 206px;
        }
        .style95
        {
            width: 418px;
            height: 19px;
        }
        .style98
        {
            font-size: medium;
        }
        .style103
        {
            height: 19px;
            width: 487px;
        }
        .style106
        {
            padding-left: 60px;
            font-size: medium;
            height: 46px;
            width: 206px;
        }
        .style107
        {
            width: 418px;
            height: 46px;
        }
        .style109
        {
            padding-left: 60px;
            font-size: medium;
            width: 206px;
        }
        .style110
        {
            width: 206px;
        }
        .style111
        {
            width: 190px;
            font-size: small;
        }
        .style112
        {
            width: 190px;
        }
        .style114
        {
            height: 19px;
            width: 190px;
        }
        .style115
        {
            width: 487px;
        }
        .style116
        {
            width: 418px;
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
                            <table>
            <tr>
                <td class="style13,style16" align="left">
                    <h1 align="left" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                        font-variant: normal; text-transform: none; color: #102030; text-decoration: underline blink;
                        font-size: 28px;" class="style16">
                        Over Time Entry Form
                    </h1>
                    <table bgcolor="#CCCCCC" width="60%" align="left" style="height: 197px">
                        <tr>

                            <td class="style111" align="left">
                                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                                    font-variant: normal; text-transform: none; color: #102030; width: 95px;" class="style29">
                                    PS Number:
                                </h1>
                            </td>
                            <td class="style115" width="219px">
                                <asp:DropDownList ID="DropDownList10" runat="server" Width="200px" 
                                    Style="margin-right: 0px; font-size: small;" ToolTip="Employee's PS No."
                                    Font-Size="Large" Font-Bold="False" Font-Names="Courier New" 
                                    CssClass="style28" TabIndex="13" AppendDataBoundItems="True" 
                                    DataSourceID="SqlDataSourcePsnoSel" DataTextField="psno" 
                                    DataValueField="psno" 
                                    onselectedindexchanged="DropDownList10_SelectedIndexChanged" 
                                    AutoPostBack="True">
                                    <asp:ListItem></asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourcePsnoSel" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                    SelectCommand="SELECT [psno] FROM [wbempentry]"></asp:SqlDataSource>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                                    ForeColor="#CC0000" ControlToValidate="DropDownList10"></asp:RequiredFieldValidator>
                            </td>
                            <td class="style106" align="left">
                                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                                    font-variant: normal; text-transform: none; color: #102030;" class="style29">
                                    Date:
                                </h1>
                            </td>
                            <td class="style107">
                                <asp:TextBox ID="TextBox9" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                    Width="200px" Style="text-align: center; font-size: small;" ToolTip="Date Of O.T"
                                    Font-Size="Large" Type ="Date" CssClass="style98" TabIndex="7" ></asp:TextBox><%--ondayrender="Calendar1_DayRender"--%>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="*"
                                    ForeColor="#CC0000" ControlToValidate="TextBox9"></asp:RequiredFieldValidator>
                            </td>
                            <td align="left">
                                <h1 style="text-align: right" ><asp:Label ID="Label5" runat="server" Text="PS Number:" align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                                    font-variant: normal; text-transform: none; color: #102030; width: 95px;" 
                                        class="style29" Visible="False"></asp:Label>
                                </h1>
                            </td>
                            <td class="style115" width="219px">
                                <asp:DropDownList ID="DropDownList7" runat="server" Width="200px" Style="text-align: center;
                                    margin-right: 0px; font-size: small;" ToolTip="Employee's Correct Lunch Deduction"
                                    Font-Size="Large" Font-Bold="False" Font-Names="Courier New" 
                                    CssClass="style28" TabIndex="13" DataSourceID="SqlDataSourceAbPsnoSel" 
                                    DataTextField="psno" DataValueField="psno" 
                                    onselectedindexchanged="DropDownList7_SelectedIndexChanged" 
                                    Visible="False" AppendDataBoundItems="true" AutoPostBack="True">
                                    <asp:ListItem >None</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceAbPsnoSel" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                    SelectCommand="SELECT [psno] FROM [wbempentry]"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td class="style112" align="left">
                                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                                    font-variant: normal; text-transform: none; color: #102030; width: 95px;" class="style29">
                                    Name:
                                </h1>
                            </td>
                            <td class="style115" width="219px">
                                <asp:TextBox ID="TextBox19" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                    Width="200px" Style="text-align: center; font-size: small;" ToolTip="Employee's Name"
                                    Font-Size="Large" CssClass="style98" BackColor="Silver" ReadOnly="True" autocompelete="off"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                                    ForeColor="#CC0000" ControlToValidate="TextBox19" CssClass="style25"></asp:RequiredFieldValidator>
                            </td>
                            <td class="style109" align="left">
                                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                                    font-variant: normal; text-transform: none; color: #102030;" class="style29">
                                    Allocatin(KPI):
                                </h1>
                            </td>
                            <td class="style116">
                                <asp:DropDownList ID="DropDownList1" runat="server" Width="205px" Style="text-align: center;
                                    font-size: small;" ToolTip="Employee's Allocation" Font-Size="Large" Font-Bold="False"
                                    Font-Names="Courier New" CssClass="style28" TabIndex="8" 
                                    AppendDataBoundItems="True" DataSourceID="SqlDataSourceAlloSel" 
                                    DataTextField="allonme" DataValueField="allonme" 
                                    onselectedindexchanged="DropDownList1_SelectedIndexChanged" 
                                    AutoPostBack="True">
                                    <asp:ListItem></asp:ListItem>
                                    
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceAlloSel" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                    SelectCommand="SELECT [allonme] FROM [edit_allonme]"></asp:SqlDataSource>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="*"
                                    ForeColor="#CC0000" ControlToValidate="DropDownList1"></asp:RequiredFieldValidator>
                            </td>
                            <td align="left">
                                <h1 style="width: 216px"> 
                                    <asp:Label ID="Label6" runat="server" align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                                    font-variant: normal; text-transform: none; color: #102030;" class="style29" 
                                        Visible="False">Absent Person Name:</asp:Label>
                                    
                                </h1>
                            </td>
                            <td class="style92">
                                    <asp:TextBox ID="TextBox4" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                    Width="200px" Style="text-align: center; font-size: small;" ToolTip="Absent Employee's Name"
                                    Font-Size="Large" CssClass="style98" Visible="False" BackColor="Silver" ReadOnly="True"></asp:TextBox>
                                </td>
                        </tr>
                        <tr>
                            <td class="style117" align="left">
                                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                                    font-variant: normal; text-transform: none; color: #102030; width: 95px; text-align: left;
                                    margin-left: 0px;" class="style29">
                                    Designation:
                                </h1>
                            </td>
                            <td class="style118" width="219px">
                                <asp:TextBox ID="TextBox3" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                    Width="200px" Style="text-align: center; font-size: small;" ToolTip="Designation Of Employee"
                                    Font-Size="Large" CssClass="style98" BackColor="Silver" ReadOnly="True" autocompelete="off"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
                                    ForeColor="#CC0000" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>
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
                                    <asp:DropDownList ID="DropDownList3" runat="server" Width="70px" Style="text-align: center;
                                        font-size: small;" ToolTip="Employee's O.T Start Time" Font-Size="Large" Font-Bold="False"
                                        Font-Names="Courier New" CssClass="style28" TabIndex="11" 
                                        AutoPostBack="True" class="style130" Visible="False" 
                                        onselectedindexchanged="DropDownList3_SelectedIndexChanged">
                                        <asp:ListItem Value= "6">06:00</asp:ListItem>
                                        <asp:ListItem Value= "6.5">06:30</asp:ListItem>
                                        <asp:ListItem Value= "7">07:00</asp:ListItem>
                                        <asp:ListItem Value= "7.5">07:30</asp:ListItem>
                                        <asp:ListItem Value= "8">08:00</asp:ListItem>
                                        <asp:ListItem Value= "8.5">08:30</asp:ListItem>
                                        <asp:ListItem Value= "9">09:00</asp:ListItem>
                                        <asp:ListItem Value= "9.5">09:30</asp:ListItem>
                                        <asp:ListItem Value= "10">10:00</asp:ListItem>
                                        <asp:ListItem Value= "10.5">10:30</asp:ListItem>
                                        <asp:ListItem Value= "11">11:00</asp:ListItem>
                                        <asp:ListItem Value= "11.5">11:30</asp:ListItem>
                                        <asp:ListItem Value= "12">12:00</asp:ListItem>
                                        <asp:ListItem Value= "12.5">12:30</asp:ListItem>
                                        <asp:ListItem Value= "13">13:00</asp:ListItem>
                                        <asp:ListItem Value= "13.5">13:30</asp:ListItem>
                                        <asp:ListItem Value= "14">14:00</asp:ListItem>
                                        
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="DropDownList2" runat="server" Width="70px" Style="text-align: center;
                                        font-size: small;" ToolTip="Employee's O.T Start Time" Font-Size="Large" Font-Bold="False"
                                        Font-Names="Courier New" CssClass="style28" TabIndex="11" 
                                        AutoPostBack="True" class="style130" Visible="False" 
                                        onselectedindexchanged="DropDownList2_SelectedIndexChanged">
                                        <asp:ListItem Value= "14">14:00</asp:ListItem>
                                        <asp:ListItem Value= "14.5">14:30</asp:ListItem>
                                        <asp:ListItem Value= "15">15:00</asp:ListItem>
                                        <asp:ListItem Value= "15.5">15:30</asp:ListItem>
                                        <asp:ListItem Value= "16">16:00</asp:ListItem>
                                        <asp:ListItem Value= "16.5">16:30</asp:ListItem>
                                        <asp:ListItem Value= "17">17:00</asp:ListItem>
                                        <asp:ListItem Value= "17.5">17:30</asp:ListItem>
                                        <asp:ListItem Value= "18">18:00</asp:ListItem>
                                        <asp:ListItem Value= "18.5">18:30</asp:ListItem>
                                        <asp:ListItem Value= "19">19:00</asp:ListItem>
                                        <asp:ListItem Value= "19.5">19:30</asp:ListItem>
                                        <asp:ListItem Value= "20">20:00</asp:ListItem>
                                        <asp:ListItem Value= "20.5">20:30</asp:ListItem>
                                        <asp:ListItem Value= "21">21:00</asp:ListItem>
                                        <asp:ListItem Value= "21.5">21:30</asp:ListItem>
                                        <asp:ListItem Value= "22">22:00</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="DropDownList8" runat="server" Width="70px" Style="text-align: center;
                                        font-size: small;" ToolTip="Employee's O.T Start Time" Font-Size="Large" Font-Bold="False"
                                        Font-Names="Courier New" CssClass="style28" TabIndex="11" 
                                        AutoPostBack="True" class="style130" Visible="False" 
                                        onselectedindexchanged="DropDownList8_SelectedIndexChanged">
                                        <asp:ListItem Value= "22">22:00</asp:ListItem>
                                        <asp:ListItem Value= "22.5">22:30</asp:ListItem>
                                        <asp:ListItem Value= "23">23:00</asp:ListItem>
                                        <asp:ListItem Value= "23.5">23:30</asp:ListItem>
                                        <asp:ListItem Value= "24">00:00</asp:ListItem>
                                        <asp:ListItem Value= "24.5">00:30</asp:ListItem>
                                        <asp:ListItem Value= "25">01:00</asp:ListItem>
                                        <asp:ListItem Value= "25.5">01:30</asp:ListItem>
                                        <asp:ListItem Value= "26">02:00</asp:ListItem>
                                        <asp:ListItem Value= "26.5">02:30</asp:ListItem>
                                        <asp:ListItem Value= "27">03:00</asp:ListItem>
                                        <asp:ListItem Value= "27.5">03:30</asp:ListItem>
                                        <asp:ListItem Value= "28">04:00</asp:ListItem>
                                        <asp:ListItem Value= "28.5">04:30</asp:ListItem>
                                        <asp:ListItem Value= "29">05:00</asp:ListItem>
                                        <asp:ListItem Value= "29.5">05:30</asp:ListItem>
                                        <asp:ListItem Value= "30">06:00</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="DropDownList13" runat="server" Width="70px" Style="text-align: center;
                                        font-size: small;" ToolTip="Employee's O.T Start Time" Font-Size="Large" Font-Bold="False"
                                        Font-Names="Courier New" CssClass="style28" TabIndex="11" 
                                        AutoPostBack="True" class="style130" Visible="False" 
                                        onselectedindexchanged="DropDownList13_SelectedIndexChanged">
                                        <asp:ListItem Value= "8.5">08:30</asp:ListItem>
                                        <asp:ListItem Value= "9">09:00</asp:ListItem>
                                        <asp:ListItem Value= "9.5">09:30</asp:ListItem>
                                        <asp:ListItem Value= "10">10:00</asp:ListItem>
                                        <asp:ListItem Value= "10.5">10:30</asp:ListItem>
                                        <asp:ListItem Value= "11">11:00</asp:ListItem>
                                        <asp:ListItem Value= "11.5">11:30</asp:ListItem>
                                        <asp:ListItem Value= "12">12:00</asp:ListItem>
                                        <asp:ListItem Value= "12.5">12:30</asp:ListItem>
                                        <asp:ListItem Value= "13">13:00</asp:ListItem>
                                        <asp:ListItem Value= "13.5">13:30</asp:ListItem>
                                        <asp:ListItem Value= "14">14:00</asp:ListItem>
                                        <asp:ListItem Value= "14.5">14:30</asp:ListItem>
                                        <asp:ListItem Value= "15">15:00</asp:ListItem>
                                        <asp:ListItem Value= "15.5">15:30</asp:ListItem>
                                        <asp:ListItem Value= "16">16:00</asp:ListItem>
                                        <asp:ListItem Value= "16.5">16:30</asp:ListItem>
                                        <asp:ListItem Value= "17">17:00</asp:ListItem>
                                        <asp:ListItem Value= "17.5">17:30</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="DropDownList14" runat="server" Width="70px" Style="text-align: center;
                                        font-size: small;" ToolTip="Employee's O.T Start Time" Font-Size="Large" Font-Bold="False"
                                        Font-Names="Courier New" CssClass="style28" TabIndex="11" 
                                        AutoPostBack="True" class="style130" Height="16px" 
                                        onselectedindexchanged="DropDownList14_SelectedIndexChanged">
                                        <asp:ListItem Value= "0.5">00:30</asp:ListItem>
                                        <asp:ListItem Value= "1">01:00</asp:ListItem>
                                        <asp:ListItem Value= "1.5">01:30</asp:ListItem>
                                        <asp:ListItem Value= "2">02:00</asp:ListItem>
                                        <asp:ListItem Value= "2.5">02:30</asp:ListItem>
                                        <asp:ListItem Value= "3">03:00</asp:ListItem>
                                        <asp:ListItem Value= "3.5">03:30</asp:ListItem>
                                        <asp:ListItem Value= "4">04:00</asp:ListItem>
                                        <asp:ListItem Value= "4.5">04:30</asp:ListItem>
                                        <asp:ListItem Value= "5">05:00</asp:ListItem>
                                        <asp:ListItem Value= "5.5">05:30</asp:ListItem>
                                        <asp:ListItem Value= "6">06:00</asp:ListItem>
                                        <asp:ListItem Value= "6.5">06:30</asp:ListItem>
                                        <asp:ListItem Value= "7">07:00</asp:ListItem>
                                        <asp:ListItem Value= "7.5">07:30</asp:ListItem>
                                        <asp:ListItem Value= "8">08:00</asp:ListItem>
                                        <asp:ListItem Value= "8.5">08:30</asp:ListItem>
                                        <asp:ListItem Value= "9">09:00</asp:ListItem>
                                        <asp:ListItem Value= "9.5">09:30</asp:ListItem>
                                        <asp:ListItem Value= "10">10:00</asp:ListItem>
                                        <asp:ListItem Value= "10.5">10:30</asp:ListItem>
                                        <asp:ListItem Value= "11">11:00</asp:ListItem>
                                        <asp:ListItem Value= "11.5">11:30</asp:ListItem>
                                        <asp:ListItem Value= "12">12:00</asp:ListItem>
                                        <asp:ListItem Value= "12.5">12:30</asp:ListItem>
                                        <asp:ListItem Value= "13">13:00</asp:ListItem>
                                        <asp:ListItem Value= "13.5">13:30</asp:ListItem>
                                        <asp:ListItem Value= "14">14:00</asp:ListItem>
                                        <asp:ListItem Value= "14.5">14:30</asp:ListItem>
                                        <asp:ListItem Value= "15">15:00</asp:ListItem>
                                        <asp:ListItem Value= "15.5">15:30</asp:ListItem>
                                        <asp:ListItem Value= "16">16:00</asp:ListItem>
                                        <asp:ListItem Value= "16.5">16:30</asp:ListItem>
                                        <asp:ListItem Value= "17">17:00</asp:ListItem>
                                        <asp:ListItem Value= "17.5">17:30</asp:ListItem>
                                        <asp:ListItem Value= "18">18:00</asp:ListItem>
                                        <asp:ListItem Value= "18.5">18:30</asp:ListItem>
                                        <asp:ListItem Value= "19">19:00</asp:ListItem>
                                        <asp:ListItem Value= "19.5">19:30</asp:ListItem>
                                        <asp:ListItem Value= "20">20:00</asp:ListItem>
                                        <asp:ListItem Value= "20.5">20:30</asp:ListItem>
                                        <asp:ListItem Value= "21">21:00</asp:ListItem>
                                        <asp:ListItem Value= "21.5">21:30</asp:ListItem>
                                        <asp:ListItem Value= "22">22:00</asp:ListItem>
                                        <asp:ListItem Value= "22.5">22:30</asp:ListItem>
                                        <asp:ListItem Value= "23">23:00</asp:ListItem>
                                        <asp:ListItem Value= "23.5">23:30</asp:ListItem>
                                        <asp:ListItem Value= "24">00:00</asp:ListItem>
                                    </asp:DropDownList>
                                    <span class="style28">&nbsp;To: </span>
                                    <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" 
                                        class="style130" CssClass="style28" Font-Bold="False" Font-Names="Courier New" 
                                        Font-Size="Large" onselectedindexchanged="DropDownList4_SelectedIndexChanged" Style="text-align: right;
                                        font-size: small;" TabIndex="12" ToolTip="Employee's O.T Stop Time" 
                                        Visible="False" Width="70px">
                                        <asp:ListItem Value="6">06:00</asp:ListItem>
                                        <asp:ListItem Value="6.5">06:30</asp:ListItem>
                                        <asp:ListItem Value="7">07:00</asp:ListItem>
                                        <asp:ListItem Value="7.5">07:30</asp:ListItem>
                                        <asp:ListItem Value="8">08:00</asp:ListItem>
                                        <asp:ListItem Value="8.5">08:30</asp:ListItem>
                                        <asp:ListItem Value="9">09:00</asp:ListItem>
                                        <asp:ListItem Value="9.5">09:30</asp:ListItem>
                                        <asp:ListItem Value="10">10:00</asp:ListItem>
                                        <asp:ListItem Value="10.5">10:30</asp:ListItem>
                                        <asp:ListItem Value="11">11:00</asp:ListItem>
                                        <asp:ListItem Value="11.5">11:30</asp:ListItem>
                                        <asp:ListItem Value="12">12:00</asp:ListItem>
                                        <asp:ListItem Value="12.5">12:30</asp:ListItem>
                                        <asp:ListItem Value="13">13:00</asp:ListItem>
                                        <asp:ListItem Value="13.5">13:30</asp:ListItem>
                                        <asp:ListItem Value="14">14:00</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="DropDownList15" runat="server" AutoPostBack="True" 
                                        class="style130" CssClass="style28" Font-Bold="False" Font-Names="Courier New" 
                                        Font-Size="Large" onselectedindexchanged="DropDownList15_SelectedIndexChanged" Style="text-align: right;
                                        font-size: small;" TabIndex="12" ToolTip="Employee's O.T Stop Time" 
                                        Visible="False" Width="70px">
                                        <asp:ListItem Value="14">14:00</asp:ListItem>
                                        <asp:ListItem Value="14.5">14:30</asp:ListItem>
                                        <asp:ListItem Value="15">15:00</asp:ListItem>
                                        <asp:ListItem Value="15.5">15:30</asp:ListItem>
                                        <asp:ListItem Value="16">16:00</asp:ListItem>
                                        <asp:ListItem Value="16.5">16:30</asp:ListItem>
                                        <asp:ListItem Value="17">17:00</asp:ListItem>
                                        <asp:ListItem Value="17.5">17:30</asp:ListItem>
                                        <asp:ListItem Value="18">18:00</asp:ListItem>
                                        <asp:ListItem Value="18.5">18:30</asp:ListItem>
                                        <asp:ListItem Value="19">19:00</asp:ListItem>
                                        <asp:ListItem Value="19.5">19:30</asp:ListItem>
                                        <asp:ListItem Value="20">20:00</asp:ListItem>
                                        <asp:ListItem Value="20.5">20:30</asp:ListItem>
                                        <asp:ListItem Value="21">21:00</asp:ListItem>
                                        <asp:ListItem Value="21.5">21:30</asp:ListItem>
                                        <asp:ListItem Value="22">22:00</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="DropDownList16" runat="server" AutoPostBack="True" 
                                        class="style130" CssClass="style28" Font-Bold="False" Font-Names="Courier New" 
                                        Font-Size="Large" onselectedindexchanged="DropDownList16_SelectedIndexChanged" Style="text-align: right;
                                        font-size: small;" TabIndex="12" ToolTip="Employee's O.T Stop Time" 
                                        Visible="False" Width="70px">
                                        <asp:ListItem Value="22">22:00</asp:ListItem>
                                        <asp:ListItem Value="22.5">22:30</asp:ListItem>
                                        <asp:ListItem Value="23">23:00</asp:ListItem>
                                        <asp:ListItem Value="23.5">23:30</asp:ListItem>
                                        <asp:ListItem Value="24">00:00</asp:ListItem>
                                        <asp:ListItem Value="24.5">00:30</asp:ListItem>
                                        <asp:ListItem Value="25">01:00</asp:ListItem>
                                        <asp:ListItem Value="25.5">01:30</asp:ListItem>
                                        <asp:ListItem Value="26">02:00</asp:ListItem>
                                        <asp:ListItem Value="26.5">02:30</asp:ListItem>
                                        <asp:ListItem Value="27">03:00</asp:ListItem>
                                        <asp:ListItem Value="27.5">03:30</asp:ListItem>
                                        <asp:ListItem Value="28">04:00</asp:ListItem>
                                        <asp:ListItem Value="28.5">04:30</asp:ListItem>
                                        <asp:ListItem Value="29">05:00</asp:ListItem>
                                        <asp:ListItem Value="29.5">05:30</asp:ListItem>
                                        <asp:ListItem Value="30">06:00</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="DropDownList17" runat="server" AutoPostBack="True" 
                                        class="style130" CssClass="style28" Font-Bold="False" Font-Names="Courier New" 
                                        Font-Size="Large" onselectedindexchanged="DropDownList17_SelectedIndexChanged" Style="text-align: right;
                                        font-size: small;" TabIndex="12" ToolTip="Employee's O.T Stop Time" 
                                        Visible="False" Width="70px">
                                        <asp:ListItem Value="8.5">08:30</asp:ListItem>
                                        <asp:ListItem Value="9">09:00</asp:ListItem>
                                        <asp:ListItem Value="9.5">09:30</asp:ListItem>
                                        <asp:ListItem Value="10">10:00</asp:ListItem>
                                        <asp:ListItem Value="10.5">10:30</asp:ListItem>
                                        <asp:ListItem Value="11">11:00</asp:ListItem>
                                        <asp:ListItem Value="11.5">11:30</asp:ListItem>
                                        <asp:ListItem Value="12">12:00</asp:ListItem>
                                        <asp:ListItem Value="12.5">12:30</asp:ListItem>
                                        <asp:ListItem Value="13">13:00</asp:ListItem>
                                        <asp:ListItem Value="13.5">13:30</asp:ListItem>
                                        <asp:ListItem Value="14">14:00</asp:ListItem>
                                        <asp:ListItem Value="14.5">14:30</asp:ListItem>
                                        <asp:ListItem Value="15">15:00</asp:ListItem>
                                        <asp:ListItem Value="15.5">15:30</asp:ListItem>
                                        <asp:ListItem Value="16">16:00</asp:ListItem>
                                        <asp:ListItem Value="16.5">16:30</asp:ListItem>
                                        <asp:ListItem Value="17">17:00</asp:ListItem>
                                        <asp:ListItem Value="17.5">17:30</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="DropDownList18" runat="server" AutoPostBack="True" 
                                        class="style130" CssClass="style28" Font-Bold="False" Font-Names="Courier New" 
                                        Font-Size="Large" onselectedindexchanged="DropDownList18_SelectedIndexChanged" Style="text-align: right;
                                        font-size: small;" TabIndex="12" ToolTip="Employee's O.T Stop Time" 
                                        Width="70px">
                                        <asp:ListItem Value="0.5">00:30</asp:ListItem>
                                        <asp:ListItem Value="1">01:00</asp:ListItem>
                                        <asp:ListItem Value="1.5">01:30</asp:ListItem>
                                        <asp:ListItem Value="2">02:00</asp:ListItem>
                                        <asp:ListItem Value="2.5">02:30</asp:ListItem>
                                        <asp:ListItem Value="3">03:00</asp:ListItem>
                                        <asp:ListItem Value="3.5">03:30</asp:ListItem>
                                        <asp:ListItem Value="4">04:00</asp:ListItem>
                                        <asp:ListItem Value="4.5">04:30</asp:ListItem>
                                        <asp:ListItem Value="5">05:00</asp:ListItem>
                                        <asp:ListItem Value="5.5">05:30</asp:ListItem>
                                        <asp:ListItem Value="6">06:00</asp:ListItem>
                                        <asp:ListItem Value="6.5">06:30</asp:ListItem>
                                        <asp:ListItem Value="7">07:00</asp:ListItem>
                                        <asp:ListItem Value="7.5">07:30</asp:ListItem>
                                        <asp:ListItem Value="8">08:00</asp:ListItem>
                                        <asp:ListItem Value="8.5">08:30</asp:ListItem>
                                        <asp:ListItem Value="9">09:00</asp:ListItem>
                                        <asp:ListItem Value="9.5">09:30</asp:ListItem>
                                        <asp:ListItem Value="10">10:00</asp:ListItem>
                                        <asp:ListItem Value="10.5">10:30</asp:ListItem>
                                        <asp:ListItem Value="11">11:00</asp:ListItem>
                                        <asp:ListItem Value="11.5">11:30</asp:ListItem>
                                        <asp:ListItem Value="12">12:00</asp:ListItem>
                                        <asp:ListItem Value="12.5">12:30</asp:ListItem>
                                        <asp:ListItem Value="13">13:00</asp:ListItem>
                                        <asp:ListItem Value="13.5">13:30</asp:ListItem>
                                        <asp:ListItem Value="14">14:00</asp:ListItem>
                                        <asp:ListItem Value="14.5">14:30</asp:ListItem>
                                        <asp:ListItem Value="15">15:00</asp:ListItem>
                                        <asp:ListItem Value="15.5">15:30</asp:ListItem>
                                        <asp:ListItem Value="16">16:00</asp:ListItem>
                                        <asp:ListItem Value="16.5">16:30</asp:ListItem>
                                        <asp:ListItem Value="17">17:00</asp:ListItem>
                                        <asp:ListItem Value="17.5">17:30</asp:ListItem>
                                        <asp:ListItem Value="18">18:00</asp:ListItem>
                                        <asp:ListItem Value="18.5">18:30</asp:ListItem>
                                        <asp:ListItem Value="19">19:00</asp:ListItem>
                                        <asp:ListItem Value="19.5">19:30</asp:ListItem>
                                        <asp:ListItem Value="20">20:00</asp:ListItem>
                                        <asp:ListItem Value="20.5">20:30</asp:ListItem>
                                        <asp:ListItem Value="21">21:00</asp:ListItem>
                                        <asp:ListItem Value="21.5">21:30</asp:ListItem>
                                        <asp:ListItem Value="22">22:00</asp:ListItem>
                                        <asp:ListItem Value="22.5">22:30</asp:ListItem>
                                        <asp:ListItem Value="23">23:00</asp:ListItem>
                                        <asp:ListItem Value="23.5">23:30</asp:ListItem>
                                        <asp:ListItem Value="24">00:00</asp:ListItem>
                                    </asp:DropDownList>
                                    &nbsp;</h1>
                            </td>
                            
                            <td class="style119">
                                <asp:TextBox ID="TextBox20" runat="server" Visible="False"></asp:TextBox>
                            </td>
                            <td class="style119">
                                <asp:TextBox ID="TextBox21" runat="server" Width="50px" Visible="False"></asp:TextBox>
                                <asp:TextBox ID="TextBox22" runat="server" Width="50px" Visible="False"></asp:TextBox>
                                <asp:TextBox ID="TextBox5" runat="server" Width="50px" Visible="False" ></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                        <td class="style111" align="left">
                                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                                    font-variant: normal; text-transform: none; color: #102030; width: 95px;" class="style29">
                                    Department:
                                </h1>
                            </td>
                            <td class="style115" width="219px">
                                <asp:TextBox ID="TextBox18" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                    Width="200px" Style="text-align: center; font-size: small;" ToolTip="Employee's Department"
                                    Font-Size="Large" CssClass="style98" BackColor="Silver" ReadOnly="True" autocompelete="off"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*"
                                    ForeColor="#CC0000" BackColor="Silver" ControlToValidate="TextBox18"></asp:RequiredFieldValidator>
                            </td>
                            <td class="style122" align="left">
                                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                                    font-variant: normal; text-transform: none; color: #102030;" class="style29">
                                    Lunch Deduction:
                                </h1>
                            </td>
                            <td class="style125">
                                <asp:DropDownList ID="DropDownList9" runat="server" Width="200px" Style="text-align: center;
                                    margin-right: 0px; font-size: small;" ToolTip="Employee's Correct Lunch Deduction"
                                    Font-Size="Large" Font-Bold="False" Font-Names="Courier New" 
                                    CssClass="style28" TabIndex="13" AutoPostBack="True" 
                                    onselectedindexchanged="DropDownList9_SelectedIndexChanged">
                                    <asp:ListItem></asp:ListItem>
                                    <asp:ListItem>No</asp:ListItem>
                                    <asp:ListItem >Yes</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*"
                                    ForeColor="#CC0000" ControlToValidate="DropDownList9"></asp:RequiredFieldValidator>
                            </td>
                            <td colspan="2" rowspan="8">
                                <img class="style91" src="images/ts-1.png" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style111" align="left">
                                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                                    font-variant: normal; text-transform: none; color: #102030; width: 95px;" class="style29">
                                    Original Shift:
                                </h1>
                            </td>
                            <td class="style115" width="219px">
                                <asp:DropDownList ID="DropDownList11" runat="server" Width="200px" Style="text-align: center;
                                    margin-right: 0px; font-size: small;" ToolTip="Employee's Original Shift"
                                    Font-Size="Large" Font-Bold="False" Font-Names="Courier New" 
                                    CssClass="style28" TabIndex="13">
                                    <asp:ListItem></asp:ListItem>
                                     <asp:ListItem> A Shift</asp:ListItem>
                                     <asp:ListItem> B Shift</asp:ListItem>
                    <asp:ListItem> C Shift</asp:ListItem>
                    <asp:ListItem> General Shift</asp:ListItem>
                    <asp:ListItem> Weakly Off</asp:ListItem>
                    <asp:ListItem> Paid Holiday</asp:ListItem>
                    <asp:ListItem> Others</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*"
                                    ForeColor="#CC0000" ControlToValidate="DropDownList11"></asp:RequiredFieldValidator>
                            </td>
                           <td class="style27" align="left">
                                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                                    font-variant: normal; text-transform: none; color: #102030;" class="style29">
                                    Total Hours:
                                </h1>
                            </td>
                            <td class="style116">
                                <asp:TextBox ID="TextBox17" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                    Width="200px" Style="text-align: center; font-size: small;" ToolTip="Total Hours Employee Worked"
                                    Font-Size="Large" CssClass="style98" BackColor="Silver" ReadOnly="True" autocompelete="off"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="*"
                                    ForeColor="#CC0000" ControlToValidate="TextBox17"></asp:RequiredFieldValidator>
                            </td> 
                        </tr>
                        <tr>
                            <td class="style117" align="left">
                                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                                    font-variant: normal; text-transform: none; color: #102030; width: 95px;" class="style29">
                                    O.T Shift:
                                </h1>
                            </td>
                            <td class="style118" width="219px">
                                <asp:DropDownList ID="DropDownList12" runat="server" Width="200px" Style="text-align: center;
                                    margin-right: 0px; font-size: small; height: 22px;" ToolTip="Employee's O.T Shift"
                                    Font-Size="Large" Font-Bold="False" Font-Names="Courier New" 
                                    CssClass="style28" TabIndex="13" AutoPostBack="True" 
                                    onselectedindexchanged="DropDownList12_SelectedIndexChanged">
                                    <asp:ListItem></asp:ListItem>
                                     <asp:ListItem> A Shift</asp:ListItem>
                                     <asp:ListItem> B Shift</asp:ListItem>
                    <asp:ListItem> C Shift</asp:ListItem>
                    <asp:ListItem> General Shift</asp:ListItem>
                    <asp:ListItem> Weakly Off</asp:ListItem>
                    <asp:ListItem> Paid Holiday</asp:ListItem>
                    <asp:ListItem> Others</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"
                                    ForeColor="#CC0000" ControlToValidate="DropDownList12"></asp:RequiredFieldValidator>
                            </td>
                            <td class="style122" align="left">
                                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                                    font-variant: normal; text-transform: none; color: #102030;" class="style29">
                                    Work Assign:
                                </h1>
                            </td>
                            <td class="style125">
                                <asp:TextBox ID="TextBox11" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                    Width="200px" Style="text-align: center; font-size: small;" ToolTip="Work Assign To Employee"
                                    Font-Size="Large" CssClass="style28" TabIndex="14" TextMode="MultiLine" autocompelete="off"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="*"
                                    ForeColor="#CC0000" ControlToValidate="TextBox11"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style111" align="left">
                                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                                    font-variant: normal; text-transform: none; color: #102030; width: 95px;" class="style29">
                                    Cost Center Code:
                                </h1>
                            </td>
                            <td class="style115" width="219px">
                                                                <asp:TextBox ID="TextBox1" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                    Width="200px" Style="text-align: center; font-size: small;" ToolTip="Department's Cost Center Code"
                                    Font-Size="Large" CssClass="style98" BackColor="Silver" ReadOnly="True" ></asp:TextBox>
                                
                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*"
                                    ForeColor="#CC0000" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                            </td>
                            <td class="style27" align="left">
                                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                                    font-variant: normal; text-transform: none; color: #102030;" class="style29">
                                    Remark:
                                </h1>
                            </td>
                            <td class="style116">
                                <asp:TextBox ID="TextBox2" runat="server" BorderStyle="Inset" Font-Names="Bookman Old Style"
                                    Width="200px" Style="text-align: center; font-size: small;" ToolTip="Remark"
                                    Font-Size="Large" CssClass="style28" TabIndex="15" TextMode="MultiLine" autocompelete="off"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ErrorMessage="*"
                                    ForeColor="#CC0000" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                            </td>
                            
                        </tr>
                        <tr>
                            <td class="style126" align="left">
                                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                                    font-variant: normal; text-transform: none; color: #102030; width: 95px;" class="style29">
                                    Section:
                                </h1>
                            </td>
                            <td class="style127" width="219px">
                                <asp:DropDownList ID="DropDownList5" runat="server" Width="200px" Style="text-align: center;
                                    margin-right: 0px; font-size: small;" ToolTip="Section"
                                    Font-Size="Large" Font-Bold="False" Font-Names="Courier New" 
                                    CssClass="style28" TabIndex="13" DataSourceID="SqlDataSourceSecSel" 
                                    DataTextField="sec" DataValueField="sec" AppendDataBoundItems="true">
                                    <asp:ListItem></asp:ListItem>
                                    
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceSecSel" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                    SelectCommand="SELECT [sec] FROM [deptsec] WHERE ([dept] = @dept)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="TextBox18" Name="dept" PropertyName="Text" 
                                            Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*"
                                    ForeColor="#CC0000" ControlToValidate="DropDownList5"></asp:RequiredFieldValidator>
                            </td>
                            <td align="center" style="text-align: right" colspan="2" class="style128">
                                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;
                                <asp:Button ID="Button2" runat="server" Text="Submit" Font-Size="15px" Width="100px"
                                    Font-Names="Courier New" Font-Bold="True" ToolTip="Submit Record For OT" 
                                    TabIndex="16" onclick="Button2_Click12" />
                                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style117" align="left">
                                <h1 align="right" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                                    font-variant: normal; text-transform: none; color: #102030;" class="style29">
                                    Area:
                                </h1>
                            </td>
                            <td class="style118" width="219px">
                                <asp:DropDownList ID="DropDownList6" runat="server" Width="200px" Style="text-align: center;
                                    margin-right: 0px; font-size: small;" ToolTip="Employee's Area Worked"
                                    Font-Size="Large" Font-Bold="False" Font-Names="Courier New" 
                                    CssClass="style28" TabIndex="13" DataSourceID="SqlDataSourceAreaSel" 
                                    DataTextField="area" DataValueField="area" AppendDataBoundItems="true">
                                    <asp:ListItem></asp:ListItem>
                                    
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceAreaSel" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                    SelectCommand="SELECT [area] FROM [areamaster]"></asp:SqlDataSource>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*"
                                    ForeColor="#CC0000" ControlToValidate="DropDownList6"></asp:RequiredFieldValidator>
                            </td>
                            <td class="style119" colspan="2">
                                <h1 align="right" class="style29" 
                                    style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                                    font-variant: normal; text-transform: none; color: #102030; text-align: left;">
                                    <asp:Label ID="Label3" runat="server" Text="Label" 
                                        style="text-align: left; color: #CC0000" Visible="False"></asp:Label>
                                </h1>
                            </td>
                        </tr>
                        <tr>
                            <td class="style114">
                            </td>
                            <td class="style103" width="219px">
                                <asp:Label ID="Label1" runat="server" Width="242px" Visible = "false"></asp:Label>
                            </td>
                            <td class="style94">
                                <asp:Label ID="Label4" runat="server" Text="Yes" Visible="false"></asp:Label>
                                <asp:Label ID="Label7" runat="server" Text="Approved" Visible="false"></asp:Label>
                                <asp:Label ID="Label8" runat="server" Text="N" Visible="false"></asp:Label>
                            </td>
                            <td class="style95">
                                <asp:Label ID="Label2" runat="server" Width="242px" Visible = "false"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        </ContentTemplate>
            
        </asp:UpdatePanel>
        </td></tr></table>
                        </div>
            </div>
</asp:Content>


